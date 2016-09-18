package away3d.core.math
{
   import flash.geom.Vector3D;
   import flash.geom.Matrix3D;
   
   public final class Quaternion
   {
       
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public var w:Number = 1;
      
      public function Quaternion(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 1)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.z = param3;
         this.w = param4;
      }
      
      public function get magnitude() : Number
      {
         return Math.sqrt(w * w + x * x + y * y + z * z);
      }
      
      public function multiply(param1:Quaternion, param2:Quaternion) : void
      {
         var _loc8_:Number = param1.w;
         var _loc10_:Number = param1.x;
         var _loc4_:Number = param1.y;
         var _loc3_:Number = param1.z;
         var _loc9_:Number = param2.w;
         var _loc7_:Number = param2.x;
         var _loc5_:Number = param2.y;
         var _loc6_:Number = param2.z;
         w = _loc8_ * _loc9_ - _loc10_ * _loc7_ - _loc4_ * _loc5_ - _loc3_ * _loc6_;
         x = _loc8_ * _loc7_ + _loc10_ * _loc9_ + _loc4_ * _loc6_ - _loc3_ * _loc5_;
         y = _loc8_ * _loc5_ - _loc10_ * _loc6_ + _loc4_ * _loc9_ + _loc3_ * _loc7_;
         z = _loc8_ * _loc6_ + _loc10_ * _loc5_ - _loc4_ * _loc7_ + _loc3_ * _loc9_;
      }
      
      public function multiplyVector(param1:Vector3D, param2:Quaternion = null) : Quaternion
      {
         if(!param2)
         {
            param2 = new Quaternion();
         }
         var _loc5_:Number = param1.x;
         var _loc3_:Number = param1.y;
         var _loc4_:Number = param1.z;
         param2.w = -x * _loc5_ - y * _loc3_ - z * _loc4_;
         param2.x = w * _loc5_ + y * _loc4_ - z * _loc3_;
         param2.y = w * _loc3_ - x * _loc4_ + z * _loc5_;
         param2.z = w * _loc4_ + x * _loc3_ - y * _loc5_;
         return param2;
      }
      
      public function fromAxisAngle(param1:Vector3D, param2:Number) : void
      {
         var _loc3_:Number = Math.sin(param2 / 2);
         var _loc4_:Number = Math.cos(param2 / 2);
         x = param1.x * _loc3_;
         y = param1.y * _loc3_;
         z = param1.z * _loc3_;
         w = _loc4_;
         normalize();
      }
      
      public final function slerp(param1:Quaternion, param2:Quaternion, param3:Number) : void
      {
         var _loc14_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc12_:Number = param1.w;
         var _loc15_:Number = param1.x;
         var _loc7_:Number = param1.y;
         var _loc6_:Number = param1.z;
         var _loc16_:Number = param2.w;
         var _loc11_:Number = param2.x;
         var _loc8_:Number = param2.y;
         var _loc9_:Number = param2.z;
         var _loc13_:Number = _loc12_ * _loc16_ + _loc15_ * _loc11_ + _loc7_ * _loc8_ + _loc6_ * _loc9_;
         if(_loc13_ < 0)
         {
            _loc13_ = -_loc13_;
            _loc16_ = -_loc16_;
            _loc11_ = -_loc11_;
            _loc8_ = -_loc8_;
            _loc9_ = -_loc9_;
         }
         if(_loc13_ < 0.95)
         {
            _loc14_ = Math.acos(_loc13_);
            _loc17_ = 1 / Math.sin(_loc14_);
            _loc5_ = Math.sin(_loc14_ * (1 - param3)) * _loc17_;
            _loc4_ = Math.sin(_loc14_ * param3) * _loc17_;
            w = _loc12_ * _loc5_ + _loc16_ * _loc4_;
            x = _loc15_ * _loc5_ + _loc11_ * _loc4_;
            y = _loc7_ * _loc5_ + _loc8_ * _loc4_;
            z = _loc6_ * _loc5_ + _loc9_ * _loc4_;
         }
         else
         {
            w = _loc12_ + param3 * (_loc16_ - _loc12_);
            x = _loc15_ + param3 * (_loc11_ - _loc15_);
            y = _loc7_ + param3 * (_loc8_ - _loc7_);
            z = _loc6_ + param3 * (_loc9_ - _loc6_);
            _loc10_ = 1 / Math.sqrt(w * w + x * x + y * y + z * z);
            w = w * _loc10_;
            x = x * _loc10_;
            y = y * _loc10_;
            z = z * _loc10_;
         }
      }
      
      public function lerp(param1:Quaternion, param2:Quaternion, param3:Number) : void
      {
         var _loc8_:Number = NaN;
         var _loc10_:Number = param1.w;
         var _loc12_:Number = param1.x;
         var _loc5_:Number = param1.y;
         var _loc4_:Number = param1.z;
         var _loc11_:Number = param2.w;
         var _loc9_:Number = param2.x;
         var _loc6_:Number = param2.y;
         var _loc7_:Number = param2.z;
         if(_loc10_ * _loc11_ + _loc12_ * _loc9_ + _loc5_ * _loc6_ + _loc4_ * _loc7_ < 0)
         {
            _loc11_ = -_loc11_;
            _loc9_ = -_loc9_;
            _loc6_ = -_loc6_;
            _loc7_ = -_loc7_;
         }
         w = _loc10_ + param3 * (_loc11_ - _loc10_);
         x = _loc12_ + param3 * (_loc9_ - _loc12_);
         y = _loc5_ + param3 * (_loc6_ - _loc5_);
         z = _loc4_ + param3 * (_loc7_ - _loc4_);
         _loc8_ = 1 / Math.sqrt(w * w + x * x + y * y + z * z);
         w = w * _loc8_;
         x = x * _loc8_;
         y = y * _loc8_;
         z = z * _loc8_;
      }
      
      public function fromEulerAngles(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc5_:Number = param1 * 0.5;
         var _loc9_:Number = param2 * 0.5;
         var _loc8_:Number = param3 * 0.5;
         var _loc7_:Number = Math.cos(_loc5_);
         var _loc10_:Number = Math.sin(_loc5_);
         var _loc6_:Number = Math.cos(_loc9_);
         var _loc11_:Number = Math.sin(_loc9_);
         var _loc4_:Number = Math.cos(_loc8_);
         var _loc12_:Number = Math.sin(_loc8_);
         w = _loc7_ * _loc6_ * _loc4_ + _loc10_ * _loc11_ * _loc12_;
         x = _loc10_ * _loc6_ * _loc4_ - _loc7_ * _loc11_ * _loc12_;
         y = _loc7_ * _loc11_ * _loc4_ + _loc10_ * _loc6_ * _loc12_;
         z = _loc7_ * _loc6_ * _loc12_ - _loc10_ * _loc11_ * _loc4_;
      }
      
      public function toEulerAngles(param1:Vector3D = null) : Vector3D
      {
         if(!param1)
         {
            param1 = new Vector3D();
         }
         param1.x = Math.atan2(2 * (w * x + y * z),1 - 2 * (x * x + y * y));
         param1.y = Math.asin(2 * (w * y - z * x));
         param1.z = Math.atan2(2 * (w * z + x * y),1 - 2 * (y * y + z * z));
         return param1;
      }
      
      public function normalize(param1:Number = 1) : void
      {
         var _loc2_:Number = param1 / Math.sqrt(x * x + y * y + z * z + w * w);
         x = x * _loc2_;
         y = y * _loc2_;
         z = z * _loc2_;
         w = w * _loc2_;
      }
      
      public function toString() : String
      {
         return "{x:" + x + " y:" + y + " z:" + z + " w:" + w + "}";
      }
      
      public function toMatrix3D(param1:Matrix3D = null) : Matrix3D
      {
         var _loc5_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         var _loc8_:Number = 2 * x * y;
         var _loc6_:Number = 2 * x * z;
         var _loc11_:Number = 2 * x * w;
         var _loc4_:Number = 2 * y * z;
         var _loc10_:Number = 2 * y * w;
         var _loc2_:Number = 2 * z * w;
         var _loc12_:Number = x * x;
         var _loc9_:Number = y * y;
         var _loc7_:Number = z * z;
         var _loc3_:Number = w * w;
         _loc5_[0] = _loc12_ - _loc9_ - _loc7_ + _loc3_;
         _loc5_[4] = _loc8_ - _loc2_;
         _loc5_[8] = _loc6_ + _loc10_;
         _loc5_[12] = 0;
         _loc5_[1] = _loc8_ + _loc2_;
         _loc5_[5] = -_loc12_ + _loc9_ - _loc7_ + _loc3_;
         _loc5_[9] = _loc4_ - _loc11_;
         _loc5_[13] = 0;
         _loc5_[2] = _loc6_ - _loc10_;
         _loc5_[6] = _loc4_ + _loc11_;
         _loc5_[10] = -_loc12_ - _loc9_ + _loc7_ + _loc3_;
         _loc5_[14] = 0;
         _loc5_[3] = 0;
         _loc5_[7] = 0;
         _loc5_[11] = 0;
         _loc5_[15] = 1;
         if(!param1)
         {
            return new Matrix3D(_loc5_);
         }
         param1.copyRawDataFrom(_loc5_);
         return param1;
      }
      
      public function fromMatrix(param1:Matrix3D) : void
      {
         var _loc3_:Vector.<Number> = param1.rawData;
         setFromVector(_loc3_);
      }
      
      public function setFromVector(param1:Vector.<Number>) : void
      {
         var _loc12_:Number = NaN;
         var _loc10_:Number = param1[0];
         var _loc7_:Number = param1[1];
         var _loc8_:Number = param1[2];
         var _loc9_:Number = param1[4];
         var _loc4_:Number = param1[5];
         var _loc5_:Number = param1[6];
         var _loc6_:Number = param1[8];
         var _loc2_:Number = param1[9];
         var _loc13_:Number = param1[10];
         var _loc3_:Number = param1[15];
         var _loc11_:Number = _loc10_ + _loc4_ + _loc13_;
         if(_loc11_ > 0)
         {
            _loc12_ = 0.5 / Math.sqrt(_loc11_ + _loc3_);
            w = 0.25 / _loc12_;
            x = (_loc5_ - _loc2_) * _loc12_;
            y = (_loc6_ - _loc8_) * _loc12_;
            z = (_loc7_ - _loc9_) * _loc12_;
         }
         else if(_loc10_ > _loc4_ && _loc10_ > _loc13_)
         {
            _loc12_ = 0.5 / Math.sqrt(1 + _loc10_ - _loc4_ - _loc13_);
            w = (_loc5_ - _loc2_) * _loc12_;
            x = 0.25 / _loc12_;
            y = (_loc9_ + _loc7_) * _loc12_;
            z = (_loc6_ + _loc8_) * _loc12_;
         }
         else if(_loc4_ > _loc13_)
         {
            _loc12_ = 0.5 / Math.sqrt(1 + _loc4_ - _loc10_ - _loc13_);
            w = (_loc6_ - _loc8_) * _loc12_;
            x = (_loc9_ + _loc7_) * _loc12_;
            y = 0.25 / _loc12_;
            z = (_loc2_ + _loc5_) * _loc12_;
         }
         else
         {
            _loc12_ = 0.5 / Math.sqrt(1 + _loc13_ - _loc10_ - _loc4_);
            w = (_loc7_ - _loc9_) * _loc12_;
            x = (_loc6_ + _loc8_) * _loc12_;
            y = (_loc2_ + _loc5_) * _loc12_;
            z = 0.25 / _loc12_;
         }
      }
      
      public function toRawData(param1:Vector.<Number>, param2:Boolean = false) : void
      {
         var _loc8_:Number = 2 * x * y;
         var _loc6_:Number = 2 * x * z;
         var _loc11_:Number = 2 * x * w;
         var _loc5_:Number = 2 * y * z;
         var _loc10_:Number = 2 * y * w;
         var _loc3_:Number = 2 * z * w;
         var _loc12_:Number = x * x;
         var _loc9_:Number = y * y;
         var _loc7_:Number = z * z;
         var _loc4_:Number = w * w;
         param1[0] = _loc12_ - _loc9_ - _loc7_ + _loc4_;
         param1[1] = _loc8_ - _loc3_;
         param1[2] = _loc6_ + _loc10_;
         param1[4] = _loc8_ + _loc3_;
         param1[5] = -_loc12_ + _loc9_ - _loc7_ + _loc4_;
         param1[6] = _loc5_ - _loc11_;
         param1[8] = _loc6_ - _loc10_;
         param1[9] = _loc5_ + _loc11_;
         param1[10] = -_loc12_ - _loc9_ + _loc7_ + _loc4_;
         var _loc13_:* = 0;
         param1[11] = _loc13_;
         _loc13_ = _loc13_;
         param1[7] = _loc13_;
         param1[3] = _loc13_;
         if(!param2)
         {
            _loc13_ = 0;
            param1[14] = _loc13_;
            _loc13_ = _loc13_;
            param1[13] = _loc13_;
            param1[12] = _loc13_;
            param1[15] = 1;
         }
      }
      
      public function clone() : Quaternion
      {
         var _loc1_:Quaternion = new Quaternion(x,y,z,w);
         return _loc1_;
      }
      
      public function rotatePoint(param1:Vector3D, param2:Vector3D = null) : Vector3D
      {
         var _loc4_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc7_:Number = param1.x;
         var _loc5_:Number = param1.y;
         var _loc6_:Number = param1.z;
         if(!param2)
         {
            param2 = new Vector3D();
         }
         _loc8_ = -x * _loc7_ - y * _loc5_ - z * _loc6_;
         _loc9_ = w * _loc7_ + y * _loc6_ - z * _loc5_;
         _loc4_ = w * _loc5_ - x * _loc6_ + z * _loc7_;
         _loc3_ = w * _loc6_ + x * _loc5_ - y * _loc7_;
         param2.x = -_loc8_ * x + _loc9_ * w - _loc4_ * z + _loc3_ * y;
         param2.y = -_loc8_ * y + _loc9_ * z + _loc4_ * w - _loc3_ * x;
         param2.z = -_loc8_ * z - _loc9_ * y + _loc4_ * x + _loc3_ * w;
         return param2;
      }
      
      public final function copyFrom(param1:Quaternion) : void
      {
         x = param1.x;
         y = param1.y;
         z = param1.z;
         w = param1.w;
      }
   }
}
