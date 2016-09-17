package away3d.containers
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import away3d.cameras.Camera3D;
   import flash.display3D.textures.Texture;
   import away3d.core.traverse.EntityCollector;
   import away3d.core.render.Filter3DRenderer;
   import away3d.core.managers.Mouse3DManager;
   import away3d.core.render.RendererBase;
   import away3d.core.managers.RTTBufferManager;
   import away3d.core.managers.Stage3DProxy;
   import flash.geom.Rectangle;
   import flash.ui.ContextMenu;
   import away3d.textures.Texture2DBase;
   import away3d.core.render.DepthRenderer;
   import flash.geom.Point;
   import flash.ui.ContextMenuItem;
   import away3d.core.managers.Stage3DManager;
   import flash.geom.Vector3D;
   import away3d.core.pick.IPicker;
   import away3d.core.managers.Context3DProxy;
   import flash.utils.getTimer;
   import org.specter3d.display.particle.EffectManager;
   import org.specter3d.context.AppGlobalContext;
   import flash.geom.Transform;
   import com.mz.core.configs.EnvConfig;
   import flash.display3D.Context3D;
   import flash.events.Event;
   import away3d.events.Stage3DEvent;
   import flash.events.ContextMenuEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import away3d.core.render.DefaultRenderer;
   
   public class View3D extends Sprite
   {
      
      public static var walkTextField:TextField;
       
      
      protected var _aspectRatio:Number;
      
      protected var _backBufferInvalid:Boolean = true;
      
      protected var _camera:Camera3D;
      
      protected var _depthRender:Texture;
      
      protected var _entityCollector:EntityCollector;
      
      protected var _filter3DRenderer:Filter3DRenderer;
      
      protected var _mouse3DManager:Mouse3DManager;
      
      protected var _parentIsStage:Boolean;
      
      protected var _renderer:RendererBase;
      
      protected var _requireDepthRender:Boolean;
      
      protected var _rttBufferManager:RTTBufferManager;
      
      protected var _scene:away3d.containers.Scene3D;
      
      protected var _shareContext:Boolean = false;
      
      protected var _stage3DProxy:Stage3DProxy;
      
      protected var _scissorRect:Rectangle;
      
      protected var _scissorRectDirty:Boolean;
      
      private var _ViewContextMenu:ContextMenu;
      
      private var _addedToStage:Boolean;
      
      private var _antiAlias:uint;
      
      private var _background:Texture2DBase;
      
      private var _backgroundAlpha:Number = 1;
      
      private var _backgroundColor:uint = 0;
      
      private var _deltaTime:uint;
      
      private var _depthPrepass:Boolean;
      
      private var _depthRenderer:DepthRenderer;
      
      private var _depthTextureInvalid:Boolean = true;
      
      private var _forceSoftware:Boolean;
      
      private var _globalPos:Point;
      
      private var _height:Number = 0;
      
      private var _hitField:Sprite;
      
      private var _localPos:Point;
      
      private var _menu0:ContextMenuItem;
      
      private var _menu1:ContextMenuItem;
      
      private var _rightClickMenuEnabled:Boolean = true;
      
      private var _sourceURL:String;
      
      private var _stage3DManager:Stage3DManager;
      
      private var _time:Number = 0;
      
      private var _width:Number = 0;
      
      private var _globalPosDirty:Boolean;
      
      private var _layeredView:Boolean = false;
      
      private var totalTextField:TextField;
      
      private var collectTextField:TextField;
      
      private var renderTextField:TextField;
      
      private var drawTextField:TextField;
      
      private var activeMaterialTextField:TextField;
      
      private var renderPassTextField:TextField;
      
      private var constantsFromMatrixTextField:TextField;
      
      private var drawTrianglesTextField:TextField;
      
      private var updateAnimationTextField:TextField;
      
      private var skeletonRenderStateTextField:TextField;
      
      private var _fpsVec:Vector.<Number>;
      
      private var context3dLost:Boolean = false;
      
      public function View3D(param1:away3d.containers.Scene3D = null, param2:Camera3D = null, param3:RendererBase = null, param4:Boolean = false)
      {
         _globalPos = new Point();
         _localPos = new Point();
         _fpsVec = new Vector.<Number>();
         super();
         _scene = param1 || new away3d.containers.Scene3D();
         _camera = param2 || new Camera3D();
         _renderer = param3 || new DefaultRenderer(this);
         _depthRenderer = new DepthRenderer();
         _forceSoftware = param4;
         _entityCollector = _renderer.createEntityCollector();
         _scissorRect = new Rectangle();
         initHitField();
         _mouse3DManager = new Mouse3DManager();
         _mouse3DManager.enableMouseListeners(this);
         addEventListener("addedToStage",onAddedToStage,false,0,true);
         addEventListener("added",onAdded,false,0,true);
         _camera.partition = _scene.partition;
      }
      
      public function addSourceURL(param1:String) : void
      {
         _sourceURL = param1;
      }
      
      public function get antiAlias() : uint
      {
         return _antiAlias;
      }
      
      public function set antiAlias(param1:uint) : void
      {
         if(_antiAlias != param1)
         {
            _antiAlias = param1;
            if(this.shareContext)
            {
               if(this.stage3DProxy)
               {
                  this.stage3DProxy.antiAlias = param1;
               }
            }
            else
            {
               _renderer.antiAlias = param1;
               invalidateBackBuffer();
            }
         }
      }
      
      public function get background() : Texture2DBase
      {
         return _background;
      }
      
      public function set background(param1:Texture2DBase) : void
      {
         _background = param1;
         _renderer.background = _background;
      }
      
      public function get backgroundAlpha() : Number
      {
         return _backgroundAlpha;
      }
      
      public function set backgroundAlpha(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         _renderer.backgroundAlpha = param1;
         _backgroundAlpha = param1;
      }
      
      public function get backgroundColor() : uint
      {
         return _backgroundColor;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         _backgroundColor = param1;
         _renderer.backgroundR = (param1 >> 16 & 255) / 255;
         _renderer.backgroundG = (param1 >> 8 & 255) / 255;
         _renderer.backgroundB = (param1 & 255) / 255;
      }
      
      public function get camera() : Camera3D
      {
         return _camera;
      }
      
      public function set camera(param1:Camera3D) : void
      {
         _camera = param1;
         if(_scene)
         {
            _camera.partition = _scene.partition;
         }
      }
      
      public function get deltaTime() : uint
      {
         return _deltaTime;
      }
      
      public function get depthPrepass() : Boolean
      {
         return _depthPrepass;
      }
      
      public function set depthPrepass(param1:Boolean) : void
      {
         _depthPrepass = param1;
      }
      
      public function dispose() : void
      {
         _stage3DProxy.removeEventListener("Context3DRecreated",onContext3DRecreated);
         if(!shareContext)
         {
            _stage3DProxy.dispose();
         }
         _renderer.dispose();
         if(_depthRender)
         {
            _depthRender.dispose();
         }
         if(_rttBufferManager)
         {
            _rttBufferManager.dispose();
         }
         _mouse3DManager.disableMouseListeners(this);
         _rttBufferManager = null;
         _depthRender = null;
         _mouse3DManager = null;
         _depthRenderer = null;
         _stage3DProxy = null;
         _renderer = null;
         _entityCollector = null;
      }
      
      override public function get filters() : Array
      {
         throw new Error("filters is not supported in View3D. Use filters3d instead.");
      }
      
      override public function set filters(param1:Array) : void
      {
         throw new Error("filters is not supported in View3D. Use filters3d instead.");
      }
      
      public function get filters3d() : Array
      {
         return !!_filter3DRenderer?_filter3DRenderer.filters:null;
      }
      
      public function set filters3d(param1:Array) : void
      {
         if(context3dLost)
         {
            return;
         }
         if(param1 && param1.length == 0)
         {
            param1 = null;
         }
         if(_filter3DRenderer && !param1)
         {
            _filter3DRenderer.dispose();
            _filter3DRenderer = null;
         }
         else if(!_filter3DRenderer && param1)
         {
            _filter3DRenderer = new Filter3DRenderer(stage3DProxy);
            _filter3DRenderer.filters = param1;
         }
         if(_filter3DRenderer)
         {
            _filter3DRenderer.filters = param1;
            _requireDepthRender = _filter3DRenderer.requireDepthRender;
         }
         else
         {
            _requireDepthRender = false;
            if(_depthRender)
            {
               _depthRender.dispose();
               _depthRender = null;
            }
         }
      }
      
      public function get forceMouseMove() : Boolean
      {
         return _mouse3DManager.forceMouseMove;
      }
      
      public function set forceMouseMove(param1:Boolean) : void
      {
         _mouse3DManager.forceMouseMove = param1;
      }
      
      public function getRay(param1:Number, param2:Number, param3:Number = 0) : Vector3D
      {
         return _camera.getRay((param1 * 2 - _width) / _width,(param2 * 2 - _height) / _height,param3);
      }
      
      override public function get height() : Number
      {
         return _height;
      }
      
      override public function set height(param1:Number) : void
      {
         if(_stage3DProxy && _stage3DProxy.usesSoftwareRendering && param1 > 2048)
         {
            param1 = 2048;
         }
         if(_height == param1)
         {
            return;
         }
         if(_rttBufferManager)
         {
            _rttBufferManager.viewHeight = param1;
         }
         _hitField.height = param1;
         _height = param1;
         _aspectRatio = _width / _height;
         _depthTextureInvalid = true;
         _renderer.viewHeight = param1;
         _scissorRect.height = param1;
         invalidateBackBuffer();
      }
      
      public function get mouseLocalPostion() : Vector3D
      {
         _mouse3DManager.updateDirty = true;
         _mouse3DManager.updateCollider(this,0);
         return _mouse3DManager.mouseLocalPostion;
      }
      
      public function get mousePicker() : IPicker
      {
         return _mouse3DManager.mousePicker;
      }
      
      public function set mousePicker(param1:IPicker) : void
      {
         _mouse3DManager.mousePicker = param1;
      }
      
      public function project(param1:Vector3D) : Vector3D
      {
         var _loc2_:Vector3D = _camera.project(param1);
         _loc2_.x = (_loc2_.x + 1) * _width / 2;
         _loc2_.y = (_loc2_.y + 1) * _height / 2;
         return _loc2_;
      }
      
      public function render() : void
      {
         var _loc2_:* = null;
         Context3DProxy.drawCall = 0;
         var _loc1_:int = getTimer();
         if(!stage3DProxy.recoverFromDisposal())
         {
            _backBufferInvalid = true;
            EffectManager.disposeHeatFilter();
            AppGlobalContext.removeAllFillters();
            context3dLost = true;
            return;
         }
         if(_backBufferInvalid)
         {
            updateBackBuffer();
         }
         if(_shareContext && _layeredView)
         {
            stage3DProxy.clearDepthBuffer();
         }
         if(!_parentIsStage)
         {
            _loc2_ = parent.localToGlobal(_localPos);
            if(_globalPos.x != _loc2_.x || _globalPos.y != _loc2_.y)
            {
               _globalPos = _loc2_;
               _globalPosDirty = true;
            }
         }
         if(_globalPosDirty)
         {
            updateGlobalPos();
         }
         updateTime();
         updateViewSizeData();
         _entityCollector.clear();
         stage3DProxy.drawCall = 0;
         _scene.traversePartitions(_entityCollector);
         _mouse3DManager.updateCollider(this,_loc1_);
         if(_requireDepthRender)
         {
            renderSceneDepthToTexture(_entityCollector);
         }
         if(_depthPrepass)
         {
            renderDepthPrepass(_entityCollector);
         }
         _renderer.clearOnRender = !_depthPrepass;
         if(context3dLost && _rttBufferManager)
         {
            _rttBufferManager.dispose();
            _rttBufferManager = RTTBufferManager.getInstance(_stage3DProxy);
            _rttBufferManager.viewWidth = _width;
            _rttBufferManager.viewHeight = _height;
            _rttBufferManager.updateRTTBuffers();
            context3dLost = false;
         }
         if(_filter3DRenderer && _stage3DProxy._context3D)
         {
            _renderer.render(_entityCollector,_filter3DRenderer.getMainInputTexture(_stage3DProxy),_rttBufferManager.renderToTextureRect);
            _filter3DRenderer.render(_stage3DProxy,camera,_depthRender);
         }
         else
         {
            _renderer.shareContext = _shareContext;
            if(_shareContext)
            {
               _renderer.render(_entityCollector,null,_scissorRect);
            }
            else
            {
               _renderer.render(_entityCollector);
            }
         }
         if(!_shareContext)
         {
            stage3DProxy.present();
         }
         _entityCollector.cleanUp();
         _mouse3DManager.fireMouseEvents();
      }
      
      public function get renderedFacesCount() : uint
      {
         return _entityCollector.numTriangles;
      }
      
      public function get renderer() : RendererBase
      {
         return _renderer;
      }
      
      public function set renderer(param1:RendererBase) : void
      {
         _renderer.dispose();
         _renderer = param1;
         _entityCollector = _renderer.createEntityCollector();
         _renderer.stage3DProxy = _stage3DProxy;
         _renderer.antiAlias = _antiAlias;
         _renderer.backgroundR = (_backgroundColor >> 16 & 255) / 255;
         _renderer.backgroundG = (_backgroundColor >> 8 & 255) / 255;
         _renderer.backgroundB = (_backgroundColor & 255) / 255;
         _renderer.backgroundAlpha = _backgroundAlpha;
         _renderer.viewWidth = _width;
         _renderer.viewHeight = _height;
         invalidateBackBuffer();
      }
      
      public function get rightClickMenuEnabled() : Boolean
      {
         return _rightClickMenuEnabled;
      }
      
      public function set rightClickMenuEnabled(param1:Boolean) : void
      {
         _rightClickMenuEnabled = param1;
      }
      
      override public function set rotation(param1:Number) : void
      {
      }
      
      override public function set rotationX(param1:Number) : void
      {
      }
      
      override public function set rotationY(param1:Number) : void
      {
      }
      
      override public function set rotationZ(param1:Number) : void
      {
      }
      
      override public function set scaleX(param1:Number) : void
      {
      }
      
      override public function set scaleY(param1:Number) : void
      {
      }
      
      override public function set scaleZ(param1:Number) : void
      {
      }
      
      public function get scene() : away3d.containers.Scene3D
      {
         return _scene;
      }
      
      public function set scene(param1:away3d.containers.Scene3D) : void
      {
         _scene = param1;
         if(_camera)
         {
            _camera.partition = _scene.partition;
         }
      }
      
      public function get shareContext() : Boolean
      {
         return _shareContext;
      }
      
      public function set shareContext(param1:Boolean) : void
      {
         if(_shareContext == param1)
         {
            return;
         }
         _shareContext = param1;
         _globalPosDirty = true;
      }
      
      public function get stage3DProxy() : Stage3DProxy
      {
         return _stage3DProxy;
      }
      
      public function set stage3DProxy(param1:Stage3DProxy) : void
      {
         if(_stage3DProxy)
         {
            _stage3DProxy.removeEventListener("Context3DRecreated",onContext3DRecreated);
         }
         _stage3DProxy = param1;
         _stage3DProxy.addEventListener("Context3DRecreated",onContext3DRecreated);
         var _loc2_:* = _stage3DProxy;
         _depthRenderer.stage3DProxy = _loc2_;
         _renderer.stage3DProxy = _loc2_;
         _globalPosDirty = true;
         _backBufferInvalid = true;
      }
      
      override public function set transform(param1:Transform) : void
      {
      }
      
      public function unproject(param1:Number, param2:Number, param3:Number = 0) : Vector3D
      {
         return _camera.unproject((param1 * 2 - _width) / _width,(param2 * 2 - _height) / _height,param3);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         .super.visible = param1;
         if(_stage3DProxy && !_shareContext)
         {
            _stage3DProxy.visible = param1;
         }
      }
      
      override public function get width() : Number
      {
         return _width;
      }
      
      override public function set width(param1:Number) : void
      {
         if(_stage3DProxy && _stage3DProxy.usesSoftwareRendering && param1 > 2048)
         {
            param1 = 2048;
         }
         if(_width == param1)
         {
            return;
         }
         if(_rttBufferManager)
         {
            _rttBufferManager.viewWidth = param1;
         }
         _hitField.width = param1;
         _width = param1;
         _aspectRatio = _width / _height;
         _depthTextureInvalid = true;
         _renderer.viewWidth = param1;
         _scissorRect.width = param1;
         invalidateBackBuffer();
      }
      
      override public function set x(param1:Number) : void
      {
         if(x == param1)
         {
            return;
         }
         .super.x = param1;
         _localPos.x = param1;
         _globalPos.x = !!parent?parent.localToGlobal(_localPos).x:Number(param1);
         _globalPosDirty = true;
      }
      
      override public function set y(param1:Number) : void
      {
         if(y == param1)
         {
            return;
         }
         .super.y = param1;
         _localPos.y = param1;
         _globalPos.y = !!parent?parent.localToGlobal(_localPos).y:Number(param1);
         _globalPosDirty = true;
      }
      
      override public function set z(param1:Number) : void
      {
      }
      
      protected function renderDepthPrepass(param1:EntityCollector) : void
      {
         _depthRenderer.disableColor = true;
         if(_filter3DRenderer || _renderer.renderToTexture)
         {
            _depthRenderer.textureRatioX = _rttBufferManager.textureRatioX;
            _depthRenderer.textureRatioY = _rttBufferManager.textureRatioY;
            _depthRenderer.render(param1,_filter3DRenderer.getMainInputTexture(_stage3DProxy),_rttBufferManager.renderToTextureRect);
         }
         else
         {
            _depthRenderer.textureRatioX = 1;
            _depthRenderer.textureRatioY = 1;
            _depthRenderer.render(param1);
         }
         _depthRenderer.disableColor = false;
      }
      
      protected function renderSceneDepthToTexture(param1:EntityCollector) : void
      {
         if(_depthTextureInvalid || !_depthRender)
         {
            initDepthTexture(_stage3DProxy._context3D);
         }
         _depthRenderer.textureRatioX = _rttBufferManager.textureRatioX;
         _depthRenderer.textureRatioY = _rttBufferManager.textureRatioY;
         _depthRenderer.render(param1,_depthRender);
      }
      
      protected function updateBackBuffer() : void
      {
         if(_stage3DProxy.context3D && !_shareContext)
         {
            if(_width && Number(_height))
            {
               if(_stage3DProxy.usesSoftwareRendering)
               {
                  if(_width > 2048)
                  {
                     _width = 2048;
                  }
                  if(_height > 2048)
                  {
                     _height = 2048;
                  }
               }
               _stage3DProxy.configureBackBuffer(_width,_height,_antiAlias,true);
               _backBufferInvalid = false;
            }
            else
            {
               width = stage.stageWidth;
               height = stage.stageHeight - EnvConfig.ins.shellY;
            }
         }
      }
      
      protected function updateGlobalPos() : void
      {
         _globalPosDirty = false;
         if(!_stage3DProxy)
         {
            return;
         }
         if(_shareContext)
         {
            _scissorRect.x = _globalPos.x - _stage3DProxy.x;
            _scissorRect.y = _globalPos.y - _stage3DProxy.y;
         }
         else
         {
            _scissorRect.x = 0;
            _scissorRect.y = 0;
            _stage3DProxy.x = _globalPos.x;
            _stage3DProxy.y = _globalPos.y;
         }
         _scissorRectDirty = true;
      }
      
      protected function updateTime() : void
      {
         var _loc1_:Number = getTimer();
         if(_time == 0)
         {
            _time = _loc1_;
         }
         _deltaTime = _loc1_ - _time;
         _time = _loc1_;
      }
      
      protected function updateViewSizeData() : void
      {
         _camera.lens.aspectRatio = _aspectRatio;
         _entityCollector.camera = _camera;
         if(_filter3DRenderer || _renderer.renderToTexture)
         {
            _renderer.textureRatioX = _rttBufferManager.textureRatioX;
            _renderer.textureRatioY = _rttBufferManager.textureRatioY;
         }
         else
         {
            _renderer.textureRatioX = 1;
            _renderer.textureRatioY = 1;
         }
      }
      
      function get entityCollector() : EntityCollector
      {
         return _entityCollector;
      }
      
      private function initDepthTexture(param1:Context3D) : void
      {
         _depthTextureInvalid = false;
         if(_depthRender)
         {
            _depthRender.dispose();
         }
         _depthRender = param1.createTexture(_rttBufferManager.textureWidth,_rttBufferManager.textureHeight,"bgra",true);
      }
      
      public function get layeredView() : Boolean
      {
         return _layeredView;
      }
      
      public function set layeredView(param1:Boolean) : void
      {
         _layeredView = param1;
      }
      
      private function initHitField() : void
      {
         _hitField = new Sprite();
         _hitField.alpha = 0;
         _hitField.doubleClickEnabled = true;
         _hitField.graphics.beginFill(0);
         _hitField.graphics.drawRect(0,0,100,100);
         addChild(_hitField);
      }
      
      private function invalidateBackBuffer() : void
      {
         _backBufferInvalid = true;
      }
      
      private function onAdded(param1:Event) : void
      {
         removeEventListener("added",onAdded);
         _parentIsStage = parent == stage;
         _globalPos = parent.localToGlobal(new Point(x,y));
         if(_stage3DProxy)
         {
            _stage3DProxy.x = _globalPos.x;
            _stage3DProxy.y = _globalPos.y;
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         if(_addedToStage)
         {
            return;
         }
         _addedToStage = true;
         if(!_stage3DProxy)
         {
            _stage3DProxy = Stage3DManager.getInstance(stage).getFreeStage3DProxy(_forceSoftware);
            _stage3DProxy.addEventListener("Context3DRecreated",onContext3DRecreated);
         }
         _stage3DProxy.x = _globalPos.x;
         _rttBufferManager = RTTBufferManager.getInstance(_stage3DProxy);
         _stage3DProxy.y = _globalPos.y;
         if(_width == 0)
         {
            width = stage.stageWidth;
         }
         else
         {
            _rttBufferManager.viewWidth = _width;
         }
         if(_height == 0)
         {
            height = stage.stageHeight - EnvConfig.ins.shellY;
         }
         else
         {
            _rttBufferManager.viewHeight = _height;
         }
         var _loc2_:* = _stage3DProxy;
         _depthRenderer.stage3DProxy = _loc2_;
         _renderer.stage3DProxy = _loc2_;
      }
      
      private function onContext3DRecreated(param1:Stage3DEvent) : void
      {
         _depthTextureInvalid = true;
      }
      
      private function viewSource(param1:ContextMenuEvent) : void
      {
         var _loc2_:URLRequest = new URLRequest(_sourceURL);
         try
         {
            navigateToURL(_loc2_,"_blank");
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      private function visitWebsite(param1:ContextMenuEvent) : void
      {
         var _loc3_:String = "http://www.away3d.com";
         var _loc2_:URLRequest = new URLRequest(_loc3_);
         try
         {
            navigateToURL(_loc2_);
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      public function disposePool() : void
      {
         _entityCollector.disposePool();
      }
   }
}
