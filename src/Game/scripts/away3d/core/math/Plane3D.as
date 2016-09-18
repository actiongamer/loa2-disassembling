package away3d.core.math
{
   import flash.geom.Vector3D;
   import §away3d:arcane§._alignment;
   
   public class Plane3D
   {
      
      public static const ALIGN_ANY:int = 0;
      
      public static const ALIGN_XY_AXIS:int = 1;
      
      public static const ALIGN_YZ_AXIS:int = 2;
      
      public static const ALIGN_XZ_AXIS:int = 3;
       
      
      public var a:Number;
      
      public var b:Number;
      
      public var c:Number;
      
      public var d:Number;
      
      var _alignment:int;
      
      public function Plane3D(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.a = param1;
         this.b = param2;
         this.c = param3;
         this.d = param4;
         if(param1 == 0 && param2 == 0)
         {
            _alignment = 1;
         }
         else if(param2 == 0 && param3 == 0)
         {
            _alignment = 2;
         }
         else if(param1 == 0 && param3 == 0)
         {
            _alignment = 3;
         }
         else
         {
            _alignment = 0;
         }
      }
      
      public function fromPoints(param1:Vector3D, param2:Vector3D, param3:Vector3D) : void
      {
         var _loc6_:Number = param2.x - param1.x;
         var _loc8_:Number = param2.y - param1.y;
         var _loc7_:Number = param2.z - param1.z;
         var _loc5_:Number = param3.x - param1.x;
         var _loc4_:Number = param3.y - param1.y;
         var _loc9_:Number = param3.z - param1.z;
         a = _loc8_ * _loc9_ - _loc7_ * _loc4_;
         b = _loc7_ * _loc5_ - _loc6_ * _loc9_;
         c = _loc6_ * _loc4_ - _loc8_ * _loc5_;
         d = a * param1.x + b * param1.y + c * param1.z;
         if(a == 0 && b == 0)
         {
            _alignment = 1;
         }
         else if(b == 0 && c == 0)
         {
            _alignment = 2;
         }
         else if(a == 0 && c == 0)
         {
            _alignment = 3;
         }
         else
         {
            _alignment = 0;
         }
      }
      
      public function fromNormalAndPoint(param1:Vector3D, param2:Vector3D) : void
      {
         a = param1.x;
         b = param1.y;
         c = param1.z;
         d = a * param2.x + b * param2.y + c * param2.z;
         if(a == 0 && b == 0)
         {
            _alignment = 1;
         }
         else if(b == 0 && c == 0)
         {
            _alignment = 2;
         }
         else if(a == 0 && c == 0)
         {
            _alignment = 3;
         }
         else
         {
            _alignment = 0;
         }
      }
      
      public function normalize() : Plane3D
      {
         var _loc1_:Number = 1 / Math.sqrt(a * a + b * b + c * c);
         a = a * _loc1_;
         b = b * _loc1_;
         c = c * _loc1_;
         d = d * _loc1_;
         return this;
      }
      
      public function distance(param1:Vector3D) : Number
      {
         if(_alignment == 2)
         {
            return a * param1.x - d;
         }
         if(_alignment == 3)
         {
            return b * param1.y - d;
         }
         if(_alignment == 1)
         {
            return c * param1.z - d;
         }
         return a * param1.x + b * param1.y + c * param1.z - d;
      }
      
      public function classifyPoint(param1:Vector3D, param2:Number = 0.01) : int
      {
         var _loc3_:Number = NaN;
         if(d != d)
         {
            return 1;
         }
         if(_alignment == 2)
         {
            _loc3_ = a * param1.x - d;
         }
         else if(_alignment == 3)
         {
            _loc3_ = b * param1.y - d;
         }
         else if(_alignment == 1)
         {
            _loc3_ = c * param1.z - d;
         }
         else
         {
            _loc3_ = a * param1.x + b * param1.y + c * param1.z - d;
         }
         if(_loc3_ < -param2)
         {
            return 0;
         }
         if(_loc3_ > param2)
         {
            return 1;
         }
         return 2;
      }
      
      public function toString() : String
      {
         return "Plane3D [a:" + a + ", b:" + b + ", c:" + c + ", d:" + d + "].";
      }
   }
}
