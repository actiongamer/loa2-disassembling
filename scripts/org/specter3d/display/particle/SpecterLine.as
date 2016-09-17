package org.specter3d.display.particle
{
   import flash.geom.Vector3D;
   import org.specter3d.utils.SpecterUtils;
   
   public class SpecterLine
   {
       
      
      public var startPoint:Vector3D;
      
      public var endPoint:Vector3D;
      
      public function SpecterLine(param1:Vector3D = null, param2:Vector3D = null)
      {
         super();
         if(param1 == null)
         {
            param1 = new Vector3D();
         }
         if(param2 == null)
         {
            param2 = new Vector3D();
         }
         startPoint = param1;
         endPoint = param2;
      }
      
      public function get randomPt() : Vector3D
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc1_:* = 0;
         if(endPoint.x != startPoint.x)
         {
            _loc2_ = Number(SpecterUtils.randomRange(endPoint.x,startPoint.x));
            _loc3_ = Number((_loc2_ - startPoint.x) / (endPoint.x - startPoint.x) * (endPoint.y - startPoint.y) + startPoint.y);
            _loc1_ = Number((_loc2_ - startPoint.x) / (endPoint.x - startPoint.x) * (endPoint.z - startPoint.z) + startPoint.z);
         }
         else if(endPoint.y != startPoint.y)
         {
            _loc3_ = Number(SpecterUtils.randomRange(endPoint.y,startPoint.y));
            _loc2_ = Number((_loc3_ - startPoint.y) / (endPoint.y - startPoint.y) * (endPoint.x - startPoint.x) + startPoint.x);
            _loc1_ = Number((_loc3_ - startPoint.y) / (endPoint.y - startPoint.y) * (endPoint.z - startPoint.z) + startPoint.z);
         }
         else if(endPoint.z != startPoint.z)
         {
            _loc1_ = Number(SpecterUtils.randomRange(endPoint.z,startPoint.z));
            _loc2_ = Number((_loc1_ - startPoint.z) / (endPoint.z - startPoint.z) * (endPoint.x - startPoint.x) + startPoint.x);
            _loc3_ = Number((_loc1_ - startPoint.z) / (endPoint.z - startPoint.z) * (endPoint.y - startPoint.y) + startPoint.y);
         }
         return new Vector3D(_loc2_,_loc3_,_loc1_);
      }
   }
}
