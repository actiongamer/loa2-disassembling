package away3d.containers
{
   import away3d.cameras.Camera3D;
   import flash.events.Event;
   import flash.geom.Matrix3D;
   import away3d.core.math.Matrix3DUtils;
   import flash.geom.Vector3D;
   
   public class ObjectContainer3DIgnoreTransform extends ObjectContainer3D
   {
       
      
      private var _ignoreCamera:Camera3D;
      
      public var ignoreRotation:Boolean;
      
      public var ignoreScale:Boolean;
      
      public function ObjectContainer3DIgnoreTransform()
      {
         super();
      }
      
      public function get ignoreCamera() : Camera3D
      {
         return _ignoreCamera;
      }
      
      public function set ignoreCamera(param1:Camera3D) : void
      {
         if(_ignoreCamera != param1)
         {
            if(_ignoreCamera != null)
            {
               _ignoreCamera.removeEventListener("scenetransformChanged",camera_SceneTransformChanged);
            }
            if(param1)
            {
               param1.addEventListener("scenetransformChanged",camera_SceneTransformChanged);
            }
            _ignoreCamera = param1;
         }
      }
      
      private function camera_SceneTransformChanged(param1:Event) : void
      {
         this.invalidateTransform();
      }
      
      override public function get sceneTransform() : Matrix3D
      {
         if(_sceneTransformDirty || ignoreRotation || ignoreScale)
         {
            updateSceneTransform();
         }
         return _sceneTransform;
      }
      
      override protected function updateSceneTransform() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = undefined;
         var _loc1_:* = null;
         if(_parent && !_parent._isRoot)
         {
            if(ignoreRotation || ignoreScale)
            {
               _loc3_ = Matrix3DUtils.decompose(_parent.sceneTransform);
               if(ignoreRotation)
               {
                  _loc2_ = _loc3_[1];
                  var _loc4_:* = 0;
                  _loc2_.z = _loc4_;
                  _loc4_ = _loc4_;
                  _loc2_.y = _loc4_;
                  _loc2_.x = _loc4_;
               }
               if(ignoreScale)
               {
                  _loc2_ = _loc3_[2];
                  _loc4_ = 1;
                  _loc2_.z = _loc4_;
                  _loc4_ = _loc4_;
                  _loc2_.y = _loc4_;
                  _loc2_.x = _loc4_;
               }
               _sceneTransform.recompose(_loc3_);
               if(ignoreCamera != null)
               {
                  _loc1_ = this.ignoreCamera.sceneTransform.clone();
                  _loc3_ = Matrix3DUtils.decompose(_loc1_);
                  _loc2_ = _loc3_[0];
                  _loc4_ = 0;
                  _loc2_.z = _loc4_;
                  _loc4_ = _loc4_;
                  _loc2_.y = _loc4_;
                  _loc2_.x = _loc4_;
                  _loc1_.recompose(_loc3_);
                  _sceneTransform.append(_loc1_);
               }
            }
            else
            {
               _sceneTransform.copyFrom(_parent.sceneTransform);
            }
            _sceneTransform.prepend(transform);
         }
         else
         {
            _sceneTransform.copyFrom(transform);
         }
         _sceneTransformDirty = false;
      }
      
      override public function dispose() : void
      {
         this.ignoreCamera = null;
         super.dispose();
      }
   }
}
