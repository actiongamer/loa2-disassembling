package away3d.core.managers
{
   import away3d.events.MouseEvent3D;
   import away3d.containers.View3D;
   import flash.geom.Vector3D;
   import away3d.core.pick.PickingCollisionVO;
   import flash.events.MouseEvent;
   import away3d.core.pick.IPicker;
   import away3d.containers.ObjectContainer3D;
   import away3d.core.pick.PickingType;
   
   public class Mouse3DManager
   {
      
      private static var _mouseUp:MouseEvent3D = new MouseEvent3D("mouseUp3d");
      
      private static var _rightMouseUp:MouseEvent3D = new MouseEvent3D("rightMouseUp3d");
      
      private static var _mouseClick:MouseEvent3D = new MouseEvent3D("click3d");
      
      private static var _mouseRightClick:MouseEvent3D = new MouseEvent3D("rightClick3d");
      
      private static var _mouseOut:MouseEvent3D = new MouseEvent3D("mouseOut3d");
      
      private static var _mouseDown:MouseEvent3D = new MouseEvent3D("mouseDown3d");
      
      private static var _rightMouseDown:MouseEvent3D = new MouseEvent3D("rightMouseDown3d");
      
      private static var _mouseMove:MouseEvent3D = new MouseEvent3D("mouseMove3d");
      
      private static var _mouseOver:MouseEvent3D = new MouseEvent3D("mouseOver3d");
      
      private static var _mouseWheel:MouseEvent3D = new MouseEvent3D("mouseWheel3d");
      
      private static var _mouseDoubleClick:MouseEvent3D = new MouseEvent3D("doubleClick3d");
       
      
      private var _activeView:View3D;
      
      private var _updateDirty:Boolean;
      
      private var _nullVector:Vector3D;
      
      protected var _collidingObject:PickingCollisionVO;
      
      private var _previousCollidingObject:PickingCollisionVO;
      
      private var _queuedEvents:Vector.<MouseEvent3D>;
      
      private var _mouseMoveEvent:MouseEvent;
      
      private var _forceMouseMove:Boolean;
      
      private var _mousePicker:IPicker;
      
      public var _lastUpdateTime:int = 0;
      
      public function Mouse3DManager()
      {
         _nullVector = new Vector3D();
         _queuedEvents = new Vector.<MouseEvent3D>();
         _mouseMoveEvent = new MouseEvent("mouseMove");
         _mousePicker = PickingType.RAYCAST_BEST_HIT;
         super();
      }
      
      public function get mouseLocalPostion() : Vector3D
      {
         return !!_collidingObject?_collidingObject.localPosition:null;
      }
      
      public function updateCollider(param1:View3D, param2:int) : void
      {
         if(param2 > 0 && param2 - _lastUpdateTime < 50)
         {
            return;
         }
         _previousCollidingObject = _collidingObject;
         if(param1 == _activeView && (_forceMouseMove || _updateDirty))
         {
            _collidingObject = _mousePicker.getViewCollision(param1.mouseX,param1.mouseY,param1);
         }
         if(param2 > 0)
         {
            _lastUpdateTime = param2;
         }
      }
      
      public function fireMouseEvents() : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         if(_collidingObject != _previousCollidingObject)
         {
            if(_previousCollidingObject)
            {
               queueDispatch(_mouseOut,_mouseMoveEvent,_previousCollidingObject);
            }
            if(_collidingObject)
            {
               queueDispatch(_mouseOver,_mouseMoveEvent,_collidingObject);
            }
         }
         if(_forceMouseMove && _collidingObject)
         {
            queueDispatch(_mouseMove,_mouseMoveEvent,_collidingObject);
         }
         _loc2_ = uint(_queuedEvents.length);
         _loc4_ = uint(0);
         while(_loc4_ < _loc2_)
         {
            _loc1_ = _queuedEvents[_loc4_];
            _loc3_ = _loc1_.object;
            while(_loc3_ && !_loc3_._ancestorsAllowMouseEnabled)
            {
               _loc3_ = _loc3_.parent;
            }
            if(_loc3_)
            {
               _loc3_.dispatchEvent(_loc1_);
            }
            _loc4_++;
         }
         _queuedEvents.length = 0;
         _updateDirty = false;
         _previousCollidingObject = _collidingObject;
      }
      
      private function queueDispatch(param1:MouseEvent3D, param2:MouseEvent, param3:PickingCollisionVO = null) : void
      {
         param1.ctrlKey = param2.ctrlKey;
         param1.altKey = param2.altKey;
         param1.shiftKey = param2.shiftKey;
         param1.delta = param2.delta;
         param1.screenX = param2.localX;
         param1.screenY = param2.localY;
         if(!param3)
         {
            param3 = _collidingObject;
         }
         if(param3 && param3.localPosition)
         {
            param1.object = param3.entity;
            param1.renderable = param3.renderable;
            param1.uv = param3.uv;
            param1.localPosition = param3.localPosition.clone();
            param1.localNormal = param3.localNormal.clone();
         }
         else
         {
            param1.uv = null;
            param1.object = null;
            param1.localPosition = _nullVector;
            param1.localNormal = _nullVector;
         }
         _queuedEvents.push(param1);
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            _mouseMoveEvent = param1;
            queueDispatch(_mouseMove,param1);
         }
         _updateDirty = true;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         _activeView = null;
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         _activeView = param1.currentTarget as View3D;
      }
      
      private function onRightClick(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseRightClick,param1);
         }
         _updateDirty = true;
      }
      
      private function onRightDown(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_rightMouseDown,param1);
         }
         _updateDirty = true;
      }
      
      private function onRightUp(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_rightMouseUp,param1);
         }
         _updateDirty = true;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseClick,param1);
         }
         _updateDirty = true;
      }
      
      private function onDoubleClick(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseDoubleClick,param1);
         }
         _updateDirty = true;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseDown,param1);
         }
         _updateDirty = true;
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseUp,param1);
         }
         _updateDirty = true;
      }
      
      private function onMouseWheel(param1:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseWheel,param1);
         }
         _updateDirty = true;
      }
      
      public function enableMouseListeners(param1:View3D) : void
      {
         param1.addEventListener("click",onClick);
         param1.addEventListener("doubleClick",onDoubleClick);
         param1.addEventListener("mouseDown",onMouseDown);
         param1.addEventListener("mouseMove",onMouseMove);
         param1.addEventListener("mouseUp",onMouseUp);
         param1.addEventListener("mouseWheel",onMouseWheel);
         param1.addEventListener("mouseOver",onMouseOver);
         param1.addEventListener("mouseOut",onMouseOut);
         param1.addEventListener("rightClick",onRightClick);
         param1.addEventListener("rightMouseDown",onRightDown);
         param1.addEventListener("rightMouseUp",onRightUp);
      }
      
      public function disableMouseListeners(param1:View3D) : void
      {
         param1.removeEventListener("click",onClick);
         param1.removeEventListener("doubleClick",onDoubleClick);
         param1.removeEventListener("mouseDown",onMouseDown);
         param1.removeEventListener("mouseMove",onMouseMove);
         param1.removeEventListener("mouseUp",onMouseUp);
         param1.removeEventListener("mouseWheel",onMouseWheel);
         param1.removeEventListener("mouseOver",onMouseOver);
         param1.removeEventListener("mouseOut",onMouseOut);
         param1.removeEventListener("rightClick",onRightClick);
         param1.removeEventListener("rightMouseDown",onRightDown);
         param1.removeEventListener("rightMouseUp",onRightUp);
      }
      
      public function set updateDirty(param1:Boolean) : void
      {
         _updateDirty = param1;
      }
      
      public function get forceMouseMove() : Boolean
      {
         return _forceMouseMove;
      }
      
      public function set forceMouseMove(param1:Boolean) : void
      {
         _forceMouseMove = param1;
      }
      
      public function get mousePicker() : IPicker
      {
         return _mousePicker;
      }
      
      public function set mousePicker(param1:IPicker) : void
      {
         _mousePicker = param1;
      }
   }
}
