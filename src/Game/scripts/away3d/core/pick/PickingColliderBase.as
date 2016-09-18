package away3d.core.pick
{
   import flash.geom.Vector3D;
   import flash.geom.Point;
   
   public class PickingColliderBase
   {
       
      
      protected var rayPosition:Vector3D;
      
      protected var rayDirection:Vector3D;
      
      public function PickingColliderBase()
      {
         super();
      }
      
      protected function getCollisionNormal(param1:Vector.<uint>, param2:Vector.<Number>, param3:uint) : Vector3D
      {
         var _loc8_:Vector3D = new Vector3D();
         var _loc4_:uint = param1[param3] * 3;
         var _loc12_:uint = param1[param3 + 1] * 3;
         var _loc11_:uint = param1[param3 + 2] * 3;
         var _loc7_:Vector3D = new Vector3D(param2[_loc4_],param2[_loc4_ + 1],param2[_loc4_ + 2]);
         var _loc6_:Vector3D = new Vector3D(param2[_loc12_],param2[_loc12_ + 1],param2[_loc12_ + 2]);
         var _loc5_:Vector3D = new Vector3D(param2[_loc11_],param2[_loc11_ + 1],param2[_loc11_ + 2]);
         var _loc10_:Vector3D = _loc6_.subtract(_loc7_);
         var _loc9_:Vector3D = _loc5_.subtract(_loc7_);
         _loc8_ = _loc10_.crossProduct(_loc9_);
         _loc8_.normalize();
         return _loc8_;
      }
      
      protected function getCollisionUV(param1:Vector.<uint>, param2:Vector.<Number>, param3:uint, param4:Number, param5:Number, param6:Number, param7:uint, param8:uint) : Point
      {
         var _loc12_:Point = new Point();
         var _loc9_:uint = param1[param3] * param8 + param7;
         var _loc11_:uint = _loc9_ + 1;
         var _loc10_:Vector3D = new Vector3D(param2[_loc9_],param2[_loc11_]);
         _loc9_ = param1[param3 + 1] * param8 + param7;
         var _loc14_:Vector3D = new Vector3D(param2[_loc9_],param2[_loc11_]);
         _loc9_ = param1[param3 + 2] * param8 + param7;
         var _loc13_:Vector3D = new Vector3D(param2[_loc9_],param2[_loc11_]);
         _loc12_.x = param6 * _loc10_.x + param4 * _loc14_.x + param5 * _loc13_.x;
         _loc12_.y = param6 * _loc10_.y + param4 * _loc14_.y + param5 * _loc13_.y;
         return _loc12_;
      }
      
      public function setLocalRay(param1:Vector3D, param2:Vector3D) : void
      {
         rayPosition = param1;
         rayDirection = param2;
      }
   }
}
