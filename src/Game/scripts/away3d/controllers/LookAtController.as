package away3d.controllers
{
   import flash.geom.Vector3D;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.utils.Tools;
   import away3d.events.Object3DEvent;
   import away3d.entities.Entity;
   
   public class LookAtController extends ControllerBase
   {
       
      
      protected var _lookAtPosition:Vector3D;
      
      protected var _lookAtObject:ObjectContainer3D;
      
      protected var _origin:Vector3D;
      
      private var _offsetY:Number = 0;
      
      public function LookAtController(param1:Entity = null, param2:ObjectContainer3D = null)
      {
         _origin = new Vector3D(0,0,0);
         super(param1);
         if(param2)
         {
            this.lookAtObject = param2;
         }
         else
         {
            this.lookAtPosition = new Vector3D();
         }
      }
      
      public function get offsetY() : Number
      {
         return _offsetY;
      }
      
      public function set offsetY(param1:Number) : void
      {
         _offsetY = param1;
      }
      
      public function get lookAtPosition() : Vector3D
      {
         return _lookAtPosition;
      }
      
      public function set lookAtPosition(param1:Vector3D) : void
      {
         Tools.vector3DRounding(param1);
         if(_lookAtObject)
         {
            _lookAtObject.removeEventListener("scenetransformChanged",onLookAtObjectChanged);
            _lookAtObject = null;
         }
         if(!param1)
         {
            return;
         }
         _lookAtPosition = param1;
         notifyUpdate();
      }
      
      public function get lookAtObject() : ObjectContainer3D
      {
         return _lookAtObject;
      }
      
      public function set lookAtObject(param1:ObjectContainer3D) : void
      {
         if(_lookAtPosition)
         {
            _lookAtPosition = null;
         }
         if(_lookAtObject == param1)
         {
            notifyUpdate();
            return;
         }
         if(_lookAtObject)
         {
            _lookAtObject.removeEventListener("scenetransformChanged",onLookAtObjectChanged);
         }
         _lookAtObject = param1;
         if(_lookAtObject)
         {
            _lookAtObject.addEventListener("scenetransformChanged",onLookAtObjectChanged);
         }
         notifyUpdate();
      }
      
      override public function update() : void
      {
         var _loc1_:* = null;
         if(_targetObject)
         {
            if(_lookAtPosition)
            {
               if(_offsetY != 0)
               {
                  _loc1_ = _lookAtPosition.clone();
                  _loc1_.y = _loc1_.y + _offsetY;
                  _targetObject.lookAt(_loc1_);
               }
               else
               {
                  _targetObject.lookAt(_lookAtPosition);
               }
            }
            else if(_lookAtObject)
            {
               if(_offsetY != 0)
               {
                  _loc1_ = !!_lookAtObject.scene?_lookAtObject.scenePosition.clone():_lookAtObject.position.clone();
                  _loc1_.y = _loc1_.y + _offsetY;
                  _targetObject.lookAt(_loc1_);
               }
               else
               {
                  _targetObject.lookAt(!!_lookAtObject.scene?_lookAtObject.scenePosition:_lookAtObject.position);
               }
            }
         }
      }
      
      private function onLookAtObjectChanged(param1:Object3DEvent) : void
      {
         notifyUpdate();
      }
   }
}
