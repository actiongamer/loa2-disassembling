package away3d.core.pick
{
   import away3d.entities.Entity;
   import away3d.containers.View3D;
   import away3d.core.traverse.EntityCollector;
   import flash.geom.Vector3D;
   import away3d.core.data.EntityListItem;
   import flash.geom.Matrix3D;
   import away3d.bounds.BoundingVolumeBase;
   import away3d.containers.Scene3D;
   
   public class RaycastPicker implements IPicker
   {
       
      
      private var _findClosestCollision:Boolean;
      
      protected var _entities:Vector.<Entity>;
      
      protected var _numEntities:uint;
      
      protected var _hasCollisions:Boolean;
      
      public function RaycastPicker(param1:Boolean)
      {
         super();
         _findClosestCollision = param1;
         _entities = new Vector.<Entity>();
      }
      
      public function getViewCollision(param1:Number, param2:Number, param3:View3D) : PickingCollisionVO
      {
         var _loc9_:* = null;
         var _loc11_:* = 0;
         var _loc16_:* = null;
         var _loc4_:* = null;
         var _loc10_:Number = NaN;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:EntityCollector = param3.entityCollector;
         if(_loc14_.numMouseEnableds == 0)
         {
            return null;
         }
         var _loc6_:Vector3D = param3.unproject(param1,param2,0);
         var _loc17_:Vector3D = param3.unproject(param1,param2,1);
         _loc17_ = _loc17_.subtract(_loc6_);
         _hasCollisions = false;
         _numEntities = 0;
         var _loc15_:EntityListItem = _loc14_.entityHead;
         while(_loc15_)
         {
            _loc9_ = _loc15_.entity;
            if(_loc9_.visible && _loc9_._ancestorsAllowMouseEnabled && _loc9_.mouseEnabled)
            {
               _loc8_ = _loc9_.pickingCollisionVO;
               _loc7_ = _loc9_.inverseSceneTransform;
               _loc12_ = _loc9_.bounds;
               _loc16_ = _loc7_.transformVector(_loc6_);
               _loc4_ = _loc7_.deltaTransformVector(_loc17_);
               var _loc18_:* = _loc8_.localNormal || new Vector3D();
               _loc8_.localNormal = _loc18_;
               _loc10_ = _loc12_.rayIntersection(_loc16_,_loc4_,_loc18_);
               if(_loc10_ >= 0)
               {
                  _hasCollisions = true;
                  _loc8_.rayEntryDistance = _loc10_;
                  _loc8_.localRayPosition = _loc16_;
                  _loc8_.localRayDirection = _loc4_;
                  _loc8_.rayOriginIsInsideBounds = _loc10_ == 0;
                  _numEntities = Number(_numEntities) + 1;
                  _entities[Number(_numEntities)] = _loc9_;
               }
            }
            _loc15_ = _loc15_.next;
         }
         _entities.length = _numEntities;
         _entities = _entities.sort(sortOnNearT);
         if(!_hasCollisions)
         {
            return null;
         }
         var _loc5_:* = 1.79769313486232e308;
         _loc11_ = uint(0);
         while(_loc11_ < _numEntities)
         {
            _loc9_ = _entities[_loc11_];
            _loc8_ = _loc9_._pickingCollisionVO;
            if(_loc9_.pickingCollider)
            {
               if((_loc13_ == null || _loc8_.rayEntryDistance < _loc13_.rayEntryDistance) && _loc9_.collidesBefore(_loc5_,_findClosestCollision))
               {
                  _loc5_ = Number(_loc8_.rayEntryDistance);
                  _loc13_ = _loc8_;
                  if(!_findClosestCollision)
                  {
                     updateLocalPosition(_loc8_);
                     return _loc8_;
                  }
               }
            }
            else if(_loc13_ == null || _loc8_.rayEntryDistance < _loc13_.rayEntryDistance)
            {
               updateLocalPosition(_loc8_);
               return _loc8_;
            }
            _loc11_++;
         }
         return _loc13_;
      }
      
      private function updateLocalPosition(param1:PickingCollisionVO) : void
      {
         var _loc6_:* = param1.localPosition || new Vector3D();
         param1.localPosition = _loc6_;
         var _loc2_:* = _loc6_;
         var _loc4_:Vector3D = param1.localRayDirection;
         var _loc5_:Vector3D = param1.localRayPosition;
         var _loc3_:Number = param1.rayEntryDistance;
         _loc2_.x = _loc5_.x + _loc3_ * _loc4_.x;
         _loc2_.y = _loc5_.y + _loc3_ * _loc4_.y;
         _loc2_.z = _loc5_.z + _loc3_ * _loc4_.z;
      }
      
      public function getSceneCollision(param1:Vector3D, param2:Vector3D, param3:Scene3D) : PickingCollisionVO
      {
         return null;
      }
      
      private function sortOnNearT(param1:Entity, param2:Entity) : Number
      {
         if(param1.mousePriority == param2.mousePriority)
         {
            return param1.pickingCollisionVO.rayEntryDistance > param2.pickingCollisionVO.rayEntryDistance?1:-1;
         }
         if(param1.mousePriority > param2.mousePriority)
         {
            return -1;
         }
         return 1;
      }
   }
}
