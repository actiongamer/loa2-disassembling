package away3d.core.render
{
   import flash.display3D.Context3D;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.textures.TextureBase;
   import away3d.core.sort.IEntitySorter;
   import away3d.textures.Texture2DBase;
   import flash.display.BitmapData;
   import away3d.core.traverse.EntityCollector;
   import §away3d:arcane§.stage3DProxy;
   import flash.geom.Rectangle;
   import away3d.errors.AbstractMethodError;
   import flash.events.Event;
   import away3d.core.sort.RenderableMergeSort;
   
   public class RendererBase
   {
       
      
      protected var _context:Context3D;
      
      protected var _stage3DProxy:Stage3DProxy;
      
      protected var _backgroundR:Number = 0;
      
      protected var _backgroundG:Number = 0;
      
      protected var _backgroundB:Number = 0;
      
      protected var _backgroundAlpha:Number = 1;
      
      protected var _shareContext:Boolean = false;
      
      protected var _renderTarget:TextureBase;
      
      protected var _renderTargetSurface:int;
      
      protected var _viewWidth:Number;
      
      protected var _viewHeight:Number;
      
      protected var _renderableSorter:IEntitySorter;
      
      private var _backgroundImageRenderer:away3d.core.render.BackgroundImageRenderer;
      
      private var _background:Texture2DBase;
      
      protected var _renderToTexture:Boolean;
      
      protected var _antiAlias:uint;
      
      protected var _textureRatioX:Number = 1;
      
      protected var _textureRatioY:Number = 1;
      
      private var _snapshotBitmapData:BitmapData;
      
      private var _snapshotRequired:Boolean;
      
      private var _clearOnRender:Boolean = true;
      
      private var _sortStartTime:int = 0;
      
      public function RendererBase(param1:Boolean = false)
      {
         super();
         _renderableSorter = new RenderableMergeSort();
         _renderToTexture = param1;
      }
      
      function createEntityCollector() : EntityCollector
      {
         return new EntityCollector();
      }
      
      function get viewWidth() : Number
      {
         return _viewWidth;
      }
      
      function set viewWidth(param1:Number) : void
      {
         _viewWidth = param1;
      }
      
      function get viewHeight() : Number
      {
         return _viewHeight;
      }
      
      function set viewHeight(param1:Number) : void
      {
         _viewHeight = param1;
      }
      
      function get renderToTexture() : Boolean
      {
         return _renderToTexture;
      }
      
      public function get renderableSorter() : IEntitySorter
      {
         return _renderableSorter;
      }
      
      public function set renderableSorter(param1:IEntitySorter) : void
      {
         _renderableSorter = param1;
      }
      
      function get clearOnRender() : Boolean
      {
         return _clearOnRender;
      }
      
      function set clearOnRender(param1:Boolean) : void
      {
         _clearOnRender = param1;
      }
      
      function get backgroundR() : Number
      {
         return _backgroundR;
      }
      
      function set backgroundR(param1:Number) : void
      {
         _backgroundR = param1;
      }
      
      function get backgroundG() : Number
      {
         return _backgroundG;
      }
      
      function set backgroundG(param1:Number) : void
      {
         _backgroundG = param1;
      }
      
      function get backgroundB() : Number
      {
         return _backgroundB;
      }
      
      function set backgroundB(param1:Number) : void
      {
         _backgroundB = param1;
      }
      
      function get stage3DProxy() : Stage3DProxy
      {
         return _stage3DProxy;
      }
      
      function set stage3DProxy(param1:Stage3DProxy) : void
      {
         if(param1 == _stage3DProxy)
         {
            return;
         }
         if(!param1)
         {
            if(_stage3DProxy)
            {
               _stage3DProxy.removeEventListener("Context3DCreated",onContextUpdate);
               _stage3DProxy.removeEventListener("Context3DRecreated",onContextUpdate);
            }
            _stage3DProxy = null;
            _context = null;
            return;
         }
         _stage3DProxy = param1;
         _stage3DProxy.addEventListener("Context3DCreated",onContextUpdate);
         _stage3DProxy.addEventListener("Context3DRecreated",onContextUpdate);
         if(_backgroundImageRenderer)
         {
            _backgroundImageRenderer.stage3DProxy = param1;
         }
         if(param1.context3D)
         {
            _context = param1.context3D;
         }
      }
      
      function get shareContext() : Boolean
      {
         return _shareContext;
      }
      
      function set shareContext(param1:Boolean) : void
      {
         _shareContext = param1;
      }
      
      function dispose() : void
      {
         stage3DProxy = null;
         if(_backgroundImageRenderer)
         {
            _backgroundImageRenderer.dispose();
            _backgroundImageRenderer = null;
         }
      }
      
      function render(param1:EntityCollector, param2:TextureBase = null, param3:Rectangle = null, param4:int = 0) : void
      {
         var _loc5_:* = 0;
         if(!_stage3DProxy || !_context)
         {
            return;
         }
         executeRender(param1,param2,param3,param4);
         _loc5_ = uint(0);
         while(_loc5_ < 8)
         {
            _context.setVertexBufferAt(_loc5_,null);
            _stage3DProxy.setTextureAt(_loc5_,null);
            _loc5_++;
         }
      }
      
      protected function executeRender(param1:EntityCollector, param2:TextureBase = null, param3:Rectangle = null, param4:int = 0) : void
      {
         _renderTarget = param2;
         _renderTargetSurface = param4;
         if(_renderableSorter)
         {
            _renderableSorter.sort(param1);
         }
         if(_renderToTexture)
         {
            executeRenderToTexturePass(param1);
         }
         _stage3DProxy.setRenderTarget(param2,true,param4);
         if((param2 || !_shareContext) && _clearOnRender)
         {
            _context.clear(_backgroundR,_backgroundG,_backgroundB,_backgroundAlpha,1,0);
         }
         _context.setDepthTest(false,"always");
         _stage3DProxy.scissorRect = param3;
         if(_backgroundImageRenderer)
         {
            _backgroundImageRenderer.render();
         }
         draw(param1,param2);
         _context.setDepthTest(false,"lessEqual");
         if(!_shareContext)
         {
            if(_snapshotRequired && _snapshotBitmapData)
            {
               _context.drawToBitmapData(_snapshotBitmapData);
               _snapshotRequired = false;
            }
         }
         _stage3DProxy.scissorRect = null;
      }
      
      public function queueSnapshot(param1:BitmapData) : void
      {
         _snapshotRequired = true;
         _snapshotBitmapData = param1;
      }
      
      protected function executeRenderToTexturePass(param1:EntityCollector) : void
      {
         throw new AbstractMethodError();
      }
      
      protected function draw(param1:EntityCollector, param2:TextureBase) : void
      {
         throw new AbstractMethodError();
      }
      
      private function onContextUpdate(param1:Event) : void
      {
         _context = _stage3DProxy.context3D;
      }
      
      function get backgroundAlpha() : Number
      {
         return _backgroundAlpha;
      }
      
      function set backgroundAlpha(param1:Number) : void
      {
         _backgroundAlpha = param1;
      }
      
      function get background() : Texture2DBase
      {
         return _background;
      }
      
      function set background(param1:Texture2DBase) : void
      {
         if(_backgroundImageRenderer && !param1)
         {
            _backgroundImageRenderer.dispose();
            _backgroundImageRenderer = null;
         }
         if(!_backgroundImageRenderer && param1)
         {
            _backgroundImageRenderer = new away3d.core.render.BackgroundImageRenderer(_stage3DProxy);
         }
         _background = param1;
         if(_backgroundImageRenderer)
         {
            _backgroundImageRenderer.texture = param1;
         }
      }
      
      public function get backgroundImageRenderer() : away3d.core.render.BackgroundImageRenderer
      {
         return _backgroundImageRenderer;
      }
      
      public function get antiAlias() : uint
      {
         return _antiAlias;
      }
      
      public function set antiAlias(param1:uint) : void
      {
         _antiAlias = param1;
      }
      
      function get textureRatioX() : Number
      {
         return _textureRatioX;
      }
      
      function set textureRatioX(param1:Number) : void
      {
         _textureRatioX = param1;
      }
      
      function get textureRatioY() : Number
      {
         return _textureRatioY;
      }
      
      function set textureRatioY(param1:Number) : void
      {
         _textureRatioY = param1;
      }
   }
}
