package org.specter3d.display
{
   import flash.events.EventDispatcher;
   import away3d.cameras.lenses.OrthographicLens;
   import away3d.cameras.lenses.PerspectiveLens;
   import away3d.debug.AwayStats;
   import away3d.cameras.Camera3D;
   import away3d.controllers.HoverController;
   import org.specter3d.debug.SpecterDebugAxesGrid;
   import away3d.containers.ObjectContainer3D;
   import away3d.containers.Scene3D;
   import away3d.containers.View3D;
   import org.specter3d.context.AppGlobalContext;
   import away3d.events.MouseEvent3D;
   import org.specter3d.events.Specter3DMouseEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.mz.core.configs.ClientConfig;
   import flash.geom.Vector3D;
   import org.specter3d.camera.Specter3DCameraController;
   
   public class Specter3DStage extends EventDispatcher
   {
      
      public static var DEAFULT_TITLE_ANGLE:Number = 12;
       
      
      private var _antiAlias:int;
      
      private var _orthographicLens:OrthographicLens;
      
      private var _perspectiveLens:PerspectiveLens;
      
      private const DEAFULT_MIN_DISTANCE:int = 400;
      
      private const DEAFULT_MAX_DISTANCE:int = 1250;
      
      protected var step_title_angle:int = 0;
      
      protected var step_distance:int = 0;
      
      public var maxX:Number = 0;
      
      public var maxZ:Number = 0;
      
      public var minX:Number = 0;
      
      public var minZ:Number = 0;
      
      private var _awayStats:AwayStats;
      
      private var _camera3d:Camera3D;
      
      private var _cameraController:HoverController;
      
      private var _debugAxesVisible:Boolean;
      
      private var _debugGrid:SpecterDebugAxesGrid;
      
      protected var _lastMouseX:Number;
      
      protected var _lastMouseY:Number;
      
      protected var _lastPanAngle:Number;
      
      protected var _lastTiltAngle:Number;
      
      private var _move:Boolean = false;
      
      private var _objectLayer:ObjectContainer3D;
      
      private var _scene3d:Scene3D;
      
      private var _terrainLayer:ObjectContainer3D;
      
      protected var _view3d:View3D;
      
      protected var _view3d2:View3D;
      
      public var view3d2Layer3D:ObjectContainer3D;
      
      private var _isMouseWheel:Boolean = true;
      
      private var _grade:Number = 1;
      
      private var _frameRates:int = 0;
      
      private var _currentFrame:int = 0;
      
      private var _fps:int = 60;
      
      public function Specter3DStage()
      {
         super();
         _view3d = new View3D();
         _view3d.shareContext = true;
         _view3d.antiAlias = 0;
         _view3d.mouseChildren = false;
         AppGlobalContext.rootApp.addChildAt(_view3d,0);
         _view3d.width = ClientConfig.SCENE_FIXED_W;
         _view3d.height = ClientConfig.SCENE_FIXED_H;
         _view3d.stage3DProxy.width = ClientConfig.SCENE_FIXED_W;
         _view3d.stage3DProxy.height = ClientConfig.SCENE_FIXED_H;
         _view3d2 = new View3D();
         _view3d2.width = ClientConfig.SCENE_FIXED_W;
         _view3d2.height = ClientConfig.SCENE_FIXED_H;
         if(_view3d.shareContext)
         {
            _view3d2.shareContext = true;
            _view3d2.stage3DProxy = _view3d.stage3DProxy;
         }
         _view3d2.mouseEnabled = false;
         _view3d2.mouseChildren = false;
         AppGlobalContext.rootApp.addChildAt(_view3d2,1);
         _view3d2.camera.lens = orthographicLens;
         _view3d2.camera.lens.far = 15000;
         _view3d2.camera.lens.near = 0.1;
         _view3d2.camera.x = 0;
         _view3d2.camera.y = 0;
         _view3d2.camera.z = -22000;
         _view3d2.camera.lookAt(new Vector3D(0,0,0));
         view3d2Layer3D = new ObjectContainer3D();
         _view3d2.scene.addChild(new ObjectContainer3D());
         view3d2Layer3D.z = -20000;
         _scene3d = _view3d.scene;
         _terrainLayer = new ObjectContainer3D();
         addChild(_terrainLayer);
         _objectLayer = new ObjectContainer3D();
         addChild(_objectLayer);
         _camera3d = _view3d.camera;
         _camera3d.lens = orthographicLens;
         _camera3d.lens.far = 15000;
         _camera3d.lens.near = 0.1;
         cameraController = new Specter3DCameraController(_camera3d,null,DEAFULT_TITLE_ANGLE,800);
         initListeners();
      }
      
      public function set isMouseWheel(param1:Boolean) : void
      {
         _isMouseWheel = param1;
         if(!_isMouseWheel)
         {
            if(camera3d.lens as OrthographicLens)
            {
               (camera3d.lens as OrthographicLens).projectionHeight = view3d.height;
            }
         }
      }
      
      protected function get move() : Boolean
      {
         return _move;
      }
      
      public function addChild(param1:ObjectContainer3D) : ObjectContainer3D
      {
         if(param1 is Specter3D)
         {
            switch(int((param1 as Specter3D).elementType) - -1)
            {
               case 0:
                  if(!_scene3d.contains(param1))
                  {
                     _scene3d.addChild(param1);
                     break;
                  }
                  break;
               case 1:
                  if(!_terrainLayer.contains(param1))
                  {
                     _terrainLayer.addChild(param1);
                  }
                  break;
               default:
                  if(!_terrainLayer.contains(param1))
                  {
                     _terrainLayer.addChild(param1);
                  }
                  break;
               case 3:
               case 4:
                  if(!_objectLayer.contains(param1))
                  {
                     _objectLayer.addChild(param1);
                  }
               default:
               case 6:
               case 7:
               case 8:
                  if(!_objectLayer.contains(param1))
                  {
                     _objectLayer.addChild(param1);
                  }
            }
            return param1;
         }
         if(!_scene3d.contains(param1))
         {
            _scene3d.addChild(param1);
         }
         return param1;
      }
      
      public function get childNumber() : uint
      {
         return _terrainLayer.numChildren;
      }
      
      public function get terrainLayer() : ObjectContainer3D
      {
         return _terrainLayer;
      }
      
      public function get backgroundColor() : uint
      {
         return _view3d.backgroundColor;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         _view3d.backgroundColor = param1;
      }
      
      public function get camera3d() : Camera3D
      {
         return _camera3d;
      }
      
      public function get cameraController() : HoverController
      {
         return _cameraController;
      }
      
      public function set cameraController(param1:HoverController) : void
      {
         _cameraController = param1;
      }
      
      public function contains(param1:ObjectContainer3D) : Boolean
      {
         return _scene3d.contains(param1);
      }
      
      public function get debugAxesVisible() : Boolean
      {
         return _debugAxesVisible;
      }
      
      public function set debugAxesVisible(param1:Boolean) : void
      {
         _debugAxesVisible = param1;
         if(!_debugGrid)
         {
            _debugGrid = new SpecterDebugAxesGrid(10,10,64);
            _scene3d.addChild(_debugGrid);
            cameraController.lookAtObject = _debugGrid.tridentObject;
         }
         _debugGrid.visible = _debugAxesVisible;
      }
      
      public function get debugStats() : Boolean
      {
         return _awayStats && _awayStats.parent?true:false;
      }
      
      public function set debugStats(param1:Boolean) : void
      {
         if(param1)
         {
            if(_awayStats == null)
            {
               _awayStats = new AwayStats(_view3d);
            }
            AppGlobalContext.rootApp.addChild(_awayStats);
            _awayStats.x = this.x + 400;
            _awayStats.y = this.y + 100;
            return;
         }
         if(_awayStats && _awayStats.parent)
         {
            _awayStats.parent.removeChild(_awayStats);
         }
      }
      
      public function get awayStats() : AwayStats
      {
         return _awayStats;
      }
      
      public function get orthographicLens() : OrthographicLens
      {
         if(_orthographicLens == null)
         {
            _orthographicLens = new OrthographicLens(_view3d.height);
         }
         return _orthographicLens;
      }
      
      public function get perspectiveLens() : PerspectiveLens
      {
         if(_perspectiveLens == null)
         {
            _perspectiveLens = new PerspectiveLens(60);
         }
         return _perspectiveLens;
      }
      
      public function getChildAt(param1:uint) : ObjectContainer3D
      {
         return _scene3d.getChildAt(param1);
      }
      
      public function get height() : Number
      {
         return _view3d.height;
      }
      
      public function set height(param1:Number) : void
      {
         _view3d.height = param1;
         if(_view3d.shareContext)
         {
            _view3d2.height = param1;
            _view3d.stage3DProxy.height = param1;
            resetProjectionHeight();
         }
      }
      
      public function resetProjectionHeight() : void
      {
         if(camera3d.lens is OrthographicLens)
         {
            (camera3d.lens as OrthographicLens).projectionHeight = _view3d.height;
         }
      }
      
      public function removeChild(param1:ObjectContainer3D) : void
      {
         _scene3d.removeChild(param1);
      }
      
      public function removeChildAt(param1:uint) : void
      {
         _scene3d.removeChildAt(param1);
      }
      
      public function get scene3d() : Scene3D
      {
         return _scene3d;
      }
      
      public function startRendering() : void
      {
         onEnterFrame();
      }
      
      public function get view3d() : View3D
      {
         return _view3d;
      }
      
      public function get view3d2() : View3D
      {
         return _view3d2;
      }
      
      public function get width() : Number
      {
         return _view3d.width;
      }
      
      public function set width(param1:Number) : void
      {
         _view3d.width = param1;
         if(_view3d.shareContext)
         {
            _view3d2.width = param1;
            _view3d.stage3DProxy.width = param1;
         }
      }
      
      public function get x() : Number
      {
         return _view3d.x;
      }
      
      public function set x(param1:Number) : void
      {
         _view3d.x = param1;
      }
      
      public function get y() : Number
      {
         return _view3d.y;
      }
      
      public function set y(param1:Number) : void
      {
         _view3d.y = param1;
      }
      
      protected function on3DMouseEventHandler(param1:MouseEvent3D) : void
      {
         var _loc2_:* = null;
         var _loc3_:String = param1.type;
         var _loc4_:* = _loc3_;
         if("click3d" !== _loc4_)
         {
            if("doubleClick3d" !== _loc4_)
            {
               if("mouseDown3d" !== _loc4_)
               {
                  if("mouseMove3d" !== _loc4_)
                  {
                     if("mouseOut3d" !== _loc4_)
                     {
                        if("mouseOver3d" !== _loc4_)
                        {
                           if("mouseUp3d" !== _loc4_)
                           {
                              if("mouseWheel3d" !== _loc4_)
                              {
                                 if("rightClick3d" === _loc4_)
                                 {
                                    _loc3_ = "specter3d_mouse_right_click";
                                 }
                              }
                              else
                              {
                                 _loc3_ = "specter3d_mouse_wheel";
                              }
                           }
                           else
                           {
                              _loc3_ = "specter3d_mouse_up";
                           }
                        }
                        else
                        {
                           _loc3_ = "specter3d_mouse_over";
                        }
                     }
                     else
                     {
                        _loc3_ = "specter3d_mouse_out";
                     }
                  }
                  else
                  {
                     _loc3_ = "specter3d_mouse_move";
                  }
               }
               else
               {
                  _loc3_ = "specter3d_mouse_down";
               }
            }
            else
            {
               _loc3_ = "specter3d_mouse_double_click";
            }
         }
         else
         {
            _loc3_ = "specter3d_mouse_click";
         }
         if(hasEventListener(_loc3_))
         {
            _loc2_ = new Specter3DMouseEvent(_loc3_,param1.scenePosition);
            dispatchEvent(_loc2_);
         }
      }
      
      protected function onEnterFrame(param1:Event = null) : void
      {
         var _loc4_:* = NaN;
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         if(!AppGlobalContext.cameraPlaying && !AppGlobalContext.gameAngle)
         {
            if(_move)
            {
               cameraController.panAngle = 0.3 * (AppGlobalContext.stage2d.mouseX - _lastMouseX) + _lastPanAngle;
               cameraController.tiltAngle = 0.3 * (AppGlobalContext.stage2d.mouseY - _lastMouseY) + _lastTiltAngle;
            }
         }
         if(AppGlobalContext.gameAngle)
         {
            if(step_title_angle != 0)
            {
               _loc4_ = Number(cameraController.tiltAngle - step_title_angle);
               if(_loc4_ <= 10)
               {
                  _loc4_ = 10;
                  step_title_angle = 0;
               }
               else if(_loc4_ >= DEAFULT_TITLE_ANGLE)
               {
                  _loc4_ = Number(DEAFULT_TITLE_ANGLE);
                  step_title_angle = 0;
               }
               cameraController.tiltAngle = _loc4_;
            }
            if(_isMouseWheel && step_distance != 0)
            {
               _loc3_ = (camera3d.lens as OrthographicLens).projectionHeight;
               if(step_distance > 0)
               {
                  _loc2_ = Math.pow(step_distance,0.5);
                  step_distance = step_distance - (1 + int(Math.pow(step_distance,0.5) * 0.5));
                  if(_loc3_ > 360)
                  {
                     _loc3_ = _loc3_ - (1 + int(Math.pow(step_distance,0.5) * 0.5));
                  }
                  else
                  {
                     _loc3_ = 360;
                     step_distance = 0;
                  }
                  if(step_distance <= 0)
                  {
                     step_distance = 0;
                  }
               }
               else if(step_distance < 0)
               {
                  step_distance = step_distance + (1 + int(Math.pow(Math.abs(step_distance),0.5) * 0.5));
                  if(_loc3_ < view3d.height)
                  {
                     _loc3_ = _loc3_ + (1 + int(Math.pow(Math.abs(step_distance),0.5) * 0.5));
                  }
                  else
                  {
                     _loc3_ = view3d.height;
                     step_distance = 0;
                  }
                  if(step_distance >= 0)
                  {
                     step_distance = 0;
                  }
               }
               (camera3d.lens as OrthographicLens).projectionHeight = _loc3_;
            }
         }
         else
         {
            step_distance = 0;
         }
         if(_view3d.shareContext)
         {
            _view3d.stage3DProxy.clear();
            _view3d.render();
            _view3d2.render();
            _view3d.stage3DProxy.present();
         }
         else
         {
            _view3d.render();
         }
      }
      
      private function initListeners() : void
      {
         _view3d.contextMenu = null;
         _view3d.addEventListener("mouseWheel",onStageMouseWheel);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         _move = true;
         _lastPanAngle = cameraController.panAngle;
         _lastMouseY = AppGlobalContext.stage2d.mouseY;
         _lastMouseX = AppGlobalContext.stage2d.mouseX;
         _lastTiltAngle = cameraController.tiltAngle;
         _view3d.addEventListener("mouseLeave",onStageMouseLeave);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         _move = false;
         _view3d.removeEventListener("mouseLeave",onStageMouseLeave);
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         _move = false;
         _view3d.removeEventListener("mouseLeave",onStageMouseLeave);
      }
      
      private function onStageMouseLeave(param1:Event) : void
      {
         _move = false;
         _view3d.removeEventListener("mouseLeave",onStageMouseLeave);
      }
      
      private function onStageMouseWheel(param1:MouseEvent) : void
      {
         if(AppGlobalContext.cameraPlaying || !_isMouseWheel)
         {
            return;
         }
         if(camera3d.lens is OrthographicLens)
         {
            step_distance = step_distance + 30 * param1.delta;
         }
      }
      
      public function get isEditor() : Boolean
      {
         return false;
      }
   }
}
