package away3d.core.managers
{
   import flash.events.EventDispatcher;
   import flash.display.Shape;
   import flash.display3D.Context3D;
   import flash.display.Stage3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Rectangle;
   import flash.events.Event;
   import §away3d:arcane§._context3D;
   import §away3d:arcane§._stage3DIndex;
   import flash.display3D.Context3DClearMask;
   import away3d.events.Stage3DEvent;
   import away3d.debug.Debug;
   import org.specter3d.context.AppGlobalContext;
   
   public class Stage3DProxy extends EventDispatcher
   {
      
      private static var _frameEventDriver:Shape = new Shape();
       
      
      var _context3D:Context3D;
      
      var _stage3DIndex:int = -1;
      
      private var _usesSoftwareRendering:Boolean;
      
      private var _stage3D:Stage3D;
      
      private var _activeProgram3D:Program3D;
      
      private var _stage3DManager:away3d.core.managers.Stage3DManager;
      
      private var _backBufferWidth:int;
      
      private var _backBufferHeight:int;
      
      private var _antiAlias:int;
      
      private var _enableDepthAndStencil:Boolean;
      
      private var _activeVertexBuffers:Vector.<VertexBuffer3D>;
      
      private var _activeTextures:Vector.<TextureBase>;
      
      private var _renderTarget:TextureBase;
      
      private var _renderSurfaceSelector:int;
      
      private var _scissorRect:Rectangle;
      
      private var _color:uint;
      
      private var _backBufferDirty:Boolean;
      
      private var _viewPort:Rectangle;
      
      private var _enterFrame:Event;
      
      private var _exitFrame:Event;
      
      public var drawCall:int = 0;
      
      private var checkBaseLine:Boolean = false;
      
      public function Stage3DProxy(param1:int, param2:Stage3D, param3:away3d.core.managers.Stage3DManager, param4:Boolean = false)
      {
         _activeVertexBuffers = new Vector.<VertexBuffer3D>(8,true);
         _activeTextures = new Vector.<TextureBase>(8,true);
         super();
         _stage3DIndex = param1;
         _stage3D = param2;
         _stage3D.x = 0;
         _stage3D.y = 0;
         _stage3D.visible = true;
         _stage3DManager = param3;
         _viewPort = new Rectangle();
         _enableDepthAndStencil = true;
         _stage3D.addEventListener("context3DCreate",onContext3DUpdate,false,1000,false);
         requestContext(param4);
      }
      
      private function notifyEnterFrame() : void
      {
         if(!hasEventListener("enterFrame"))
         {
            return;
         }
         if(!_enterFrame)
         {
            _enterFrame = new Event("enterFrame");
         }
         dispatchEvent(_enterFrame);
      }
      
      private function notifyExitFrame() : void
      {
         if(!hasEventListener("exitFrame"))
         {
            return;
         }
         if(!_exitFrame)
         {
            _exitFrame = new Event("exitFrame");
         }
         dispatchEvent(_exitFrame);
      }
      
      public final function setTextureAt(param1:int, param2:TextureBase) : void
      {
         if(_activeTextures[param1] == param2)
         {
            return;
         }
         _context3D.setTextureAt(param1,param2);
         _activeTextures[param1] = param2;
      }
      
      public final function setProgram(param1:Program3D) : void
      {
         if(_activeProgram3D == param1)
         {
            return;
         }
         _context3D.setProgram(param1);
         _activeProgram3D = param1;
      }
      
      public function dispose() : void
      {
         _stage3DManager.removeStage3DProxy(this);
         _stage3D.removeEventListener("context3DCreate",onContext3DUpdate);
         freeContext3D();
         _stage3D = null;
         _stage3DManager = null;
         _stage3DIndex = -1;
      }
      
      public function configureBackBuffer(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         _backBufferWidth = param1;
         _backBufferHeight = param2;
         _antiAlias = param3;
         _enableDepthAndStencil = param4;
         if(_context3D)
         {
            _context3D.configureBackBuffer(param1,param2,param3,param4);
         }
      }
      
      public function get enableDepthAndStencil() : Boolean
      {
         return _enableDepthAndStencil;
      }
      
      public function set enableDepthAndStencil(param1:Boolean) : void
      {
         _enableDepthAndStencil = param1;
         _backBufferDirty = true;
      }
      
      public function get renderTarget() : TextureBase
      {
         return _renderTarget;
      }
      
      public function get renderSurfaceSelector() : int
      {
         return _renderSurfaceSelector;
      }
      
      public function setRenderTarget(param1:TextureBase, param2:Boolean = false, param3:int = 0) : void
      {
         if(_renderTarget == param1 && param3 == _renderSurfaceSelector && _enableDepthAndStencil == param2)
         {
            return;
         }
         _renderTarget = param1;
         _renderSurfaceSelector = param3;
         _enableDepthAndStencil = param2;
         if(param1)
         {
            _context3D.setRenderToTexture(param1,param2,_antiAlias,param3);
         }
         else
         {
            _context3D.setRenderToBackBuffer();
         }
      }
      
      public function clear() : void
      {
         if(!_context3D)
         {
            return;
         }
         if(_backBufferDirty)
         {
            configureBackBuffer(_backBufferWidth,_backBufferHeight,_antiAlias,_enableDepthAndStencil);
            _backBufferDirty = false;
         }
         if(_context3D.driverInfo == "Disposed")
         {
            return;
         }
         _context3D.clear((_color >> 16 & 255) / 255,(_color >> 8 & 255) / 255,(_color & 255) / 255,(_color >> 24 & 255) / 255);
      }
      
      public function present() : void
      {
         if(!_context3D)
         {
            return;
         }
         _context3D.present();
         _activeProgram3D = null;
      }
      
      public function clearDepthBuffer() : void
      {
         if(!_context3D)
         {
            return;
         }
         _context3D.clear(0,0,0,1,1,0,Context3DClearMask.DEPTH);
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if((param1 == "enterFrame" || param1 == "exitFrame") && !_frameEventDriver.hasEventListener("enterFrame"))
         {
            _frameEventDriver.addEventListener("enterFrame",onEnterFrame,param3,param4,param5);
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(!hasEventListener("enterFrame") && !hasEventListener("exitFrame") && _frameEventDriver.hasEventListener("enterFrame"))
         {
            _frameEventDriver.removeEventListener("enterFrame",onEnterFrame,param3);
         }
      }
      
      public function get scissorRect() : Rectangle
      {
         return _scissorRect;
      }
      
      public function set scissorRect(param1:Rectangle) : void
      {
         _scissorRect = param1;
         _context3D.setScissorRectangle(_scissorRect);
      }
      
      public final function get stage3DIndex() : int
      {
         return _stage3DIndex;
      }
      
      public function get stage3D() : Stage3D
      {
         return _stage3D;
      }
      
      public final function get context3D() : Context3D
      {
         return _context3D;
      }
      
      public function get driverInfo() : String
      {
         return !!_context3D?_context3D.driverInfo:null;
      }
      
      public function get usesSoftwareRendering() : Boolean
      {
         return _usesSoftwareRendering;
      }
      
      public function get x() : Number
      {
         return _stage3D.x;
      }
      
      public function set x(param1:Number) : void
      {
         var _loc2_:* = param1;
         _viewPort.x = _loc2_;
         _stage3D.x = _loc2_;
      }
      
      public function get y() : Number
      {
         return _stage3D.y;
      }
      
      public function set y(param1:Number) : void
      {
         var _loc2_:* = param1;
         _viewPort.y = _loc2_;
         _stage3D.y = _loc2_;
      }
      
      public function get width() : int
      {
         return _backBufferWidth;
      }
      
      public function set width(param1:int) : void
      {
         var _loc2_:* = param1;
         _viewPort.width = _loc2_;
         _backBufferWidth = _loc2_;
         _backBufferDirty = true;
      }
      
      public function get height() : int
      {
         return _backBufferHeight;
      }
      
      public function set height(param1:int) : void
      {
         var _loc2_:* = param1;
         _viewPort.height = _loc2_;
         _backBufferHeight = _loc2_;
         _backBufferDirty = true;
      }
      
      public function get antiAlias() : int
      {
         return _antiAlias;
      }
      
      public function set antiAlias(param1:int) : void
      {
         _antiAlias = param1;
         _backBufferDirty = true;
      }
      
      public function get viewPort() : Rectangle
      {
         return _viewPort;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      public function get visible() : Boolean
      {
         return _stage3D.visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _stage3D.visible = param1;
      }
      
      private function freeContext3D() : void
      {
         if(_context3D)
         {
            _context3D.dispose();
            dispatchEvent(new Stage3DEvent("Context3DDisposed"));
         }
         _context3D = null;
      }
      
      private function onContext3DUpdate(param1:Event) : void
      {
         var _loc2_:* = false;
         if(_stage3D.context3D)
         {
            _loc2_ = _context3D != null;
            _context3D = _stage3D.context3D;
            _context3D.enableErrorChecking = Debug.active;
            if(_context3D.hasOwnProperty("profile") && _context3D.profile == null && checkBaseLine == false)
            {
               _context3D = null;
               checkBaseLine = true;
               param1.preventDefault();
               param1.stopImmediatePropagation();
               param1.stopPropagation();
               _stage3D.requestContext3D();
               return;
            }
            if(_context3D.hasOwnProperty("profile") && _context3D.profile && _context3D.profile.indexOf("standard") > -1)
            {
               AppGlobalContext.numJoint = 64;
            }
            else
            {
               AppGlobalContext.numJoint = 32;
            }
            _usesSoftwareRendering = _context3D.driverInfo.indexOf("Software") == 0;
            if(_backBufferWidth && int(_backBufferHeight))
            {
               _context3D.configureBackBuffer(_backBufferWidth,_backBufferHeight,_antiAlias,_enableDepthAndStencil);
            }
            dispatchEvent(new Stage3DEvent(!!_loc2_?"Context3DRecreated":"Context3DCreated"));
            return;
         }
         throw new Error("Rendering context lost!");
      }
      
      private function requestContext(param1:Boolean = false) : void
      {
         if(!_usesSoftwareRendering)
         {
            _usesSoftwareRendering = param1;
         }
         try
         {
            if(param1)
            {
               _stage3D.requestContext3D("software");
            }
            else
            {
               _stage3D.requestContext3DMatchingProfiles(new <String>["baseline","standard","standardConstrained"]);
            }
            return;
         }
         catch(e:Error)
         {
            _stage3D.requestContext3D();
            return;
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         if(!_context3D)
         {
            return;
         }
         clear();
         notifyEnterFrame();
         present();
         notifyExitFrame();
      }
      
      public function recoverFromDisposal() : Boolean
      {
         if(!_context3D)
         {
            return false;
         }
         if(_context3D.driverInfo == "Disposed")
         {
            _context3D = null;
            dispatchEvent(new Stage3DEvent("Context3DDisposed"));
            return false;
         }
         return true;
      }
   }
}
