package away3d.core.math
{
   import flash.geom.Vector3D;
   import flash.geom.Matrix3D;
   
   public class Vector3DUtils
   {
      
      private static const MathPI:Number = 3.141592653589793;
       
      
      public function Vector3DUtils()
      {
         super();
      }
      
      public static function getAngle(param1:Vector3D, param2:Vector3D) : Number
      {
         return Math.acos(param1.dotProduct(param2) / (param1.length * param2.length));
      }
      
      public static function matrix2euler(param1:Matrix3D) : Vector3D
      {
         var _loc5_:Matrix3D = new Matrix3D();
         var _loc3_:Vector3D = new Vector3D();
         var _loc2_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         param1.copyRawDataTo(_loc2_);
         _loc3_.x = -Math.atan2(_loc2_[6],_loc2_[10]);
         _loc5_.appendRotation(_loc3_.x * 180 / 3.14159265358979,new Vector3D(1,0,0));
         _loc5_.append(param1);
         _loc5_.copyRawDataTo(_loc2_);
         var _loc4_:Number = Math.sqrt(_loc2_[0] * _loc2_[0] + _loc2_[1] * _loc2_[1]);
         _loc3_.y = Math.atan2(-_loc2_[2],_loc4_);
         _loc3_.z = Math.atan2(-_loc2_[4],_loc2_[5]);
         if(Math.round(_loc3_.z / 3.14159265358979) == 1)
         {
            if(_loc3_.y > 0)
            {
               _loc3_.y = -(_loc3_.y - 3.14159265358979);
            }
            else
            {
               _loc3_.y = -(_loc3_.y + 3.14159265358979);
            }
            _loc3_.z = _loc3_.z - 3.14159265358979;
            if(_loc3_.x > 0)
            {
               _loc3_.x = _loc3_.x - 3.14159265358979;
            }
            else
            {
               _loc3_.x = _loc3_.x + 3.14159265358979;
            }
         }
         else if(Math.round(_loc3_.z / 3.14159265358979) == -1)
         {
            if(_loc3_.y > 0)
            {
               _loc3_.y = -(_loc3_.y - 3.14159265358979);
            }
            else
            {
               _loc3_.y = -(_loc3_.y + 3.14159265358979);
            }
            _loc3_.z = _loc3_.z + 3.14159265358979;
            if(_loc3_.x > 0)
            {
               _loc3_.x = _loc3_.x - 3.14159265358979;
            }
            else
            {
               _loc3_.x = _loc3_.x + 3.14159265358979;
            }
         }
         else if(Math.round(_loc3_.x / 3.14159265358979) == 1)
         {
            if(_loc3_.y > 0)
            {
               _loc3_.y = -(_loc3_.y - 3.14159265358979);
            }
            else
            {
               _loc3_.y = -(_loc3_.y + 3.14159265358979);
            }
            _loc3_.x = _loc3_.x - 3.14159265358979;
            if(_loc3_.z > 0)
            {
               _loc3_.z = _loc3_.z - 3.14159265358979;
            }
            else
            {
               _loc3_.z = _loc3_.z + 3.14159265358979;
            }
         }
         else if(Math.round(_loc3_.x / 3.14159265358979) == -1)
         {
            if(_loc3_.y > 0)
            {
               _loc3_.y = -(_loc3_.y - 3.14159265358979);
            }
            else
            {
               _loc3_.y = -(_loc3_.y + 3.14159265358979);
            }
            _loc3_.x = _loc3_.x + 3.14159265358979;
            if(_loc3_.z > 0)
            {
               _loc3_.z = _loc3_.z - 3.14159265358979;
            }
            else
            {
               _loc3_.z = _loc3_.z + 3.14159265358979;
            }
         }
         return _loc3_;
      }
      
      public static function quaternion2euler(param1:Quaternion) : Vector3D
      {
         var _loc3_:Vector3D = new Vector3D();
         var _loc4_:Number = param1.x * param1.y + param1.z * param1.w;
         if(_loc4_ > 0.499)
         {
            _loc3_.x = 2 * Math.atan2(param1.x,param1.w);
            _loc3_.y = 3.14159265358979 / 2;
            _loc3_.z = 0;
            return _loc3_;
         }
         if(_loc4_ < -0.499)
         {
            _loc3_.x = -2 * Math.atan2(param1.x,param1.w);
            _loc3_.y = -1.5707963267949;
            _loc3_.z = 0;
            return _loc3_;
         }
         var _loc5_:Number = param1.x * param1.x;
         var _loc6_:Number = param1.y * param1.y;
         var _loc2_:Number = param1.z * param1.z;
         _loc3_.x = Math.atan2(2 * param1.y * param1.w - 2 * param1.x * param1.z,1 - 2 * _loc6_ - 2 * _loc2_);
         _loc3_.y = Math.asin(2 * _loc4_);
         _loc3_.z = Math.atan2(2 * param1.x * param1.w - 2 * param1.y * param1.z,1 - 2 * _loc5_ - 2 * _loc2_);
         return _loc3_;
      }
      
      public static function matrix2scale(param1:Matrix3D) : Vector3D
      {
         var _loc3_:Vector3D = new Vector3D();
         var _loc2_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         param1.copyRawDataTo(_loc2_);
         _loc3_.x = Math.sqrt(_loc2_[0] * _loc2_[0] + _loc2_[1] * _loc2_[1] + _loc2_[2] * _loc2_[2]);
         _loc3_.y = Math.sqrt(_loc2_[4] * _loc2_[4] + _loc2_[5] * _loc2_[5] + _loc2_[6] * _loc2_[6]);
         _loc3_.z = Math.sqrt(_loc2_[8] * _loc2_[8] + _loc2_[9] * _loc2_[9] + _loc2_[10] * _loc2_[10]);
         return _loc3_;
      }
      
      public static function rotatePoint(param1:Vector3D, param2:Vector3D) : Vector3D
      {
         var _loc4_:* = NaN;
         var _loc3_:* = NaN;
         var _loc16_:* = NaN;
         var _loc9_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc14_:Number = NaN;
         if(param2.x != 0 || param2.y != 0 || param2.z != 0)
         {
            _loc16_ = 0.0174532925199433;
            _loc9_ = param2.x * _loc16_;
            _loc7_ = param2.y * _loc16_;
            _loc5_ = param2.z * _loc16_;
            _loc12_ = Math.sin(_loc9_);
            _loc6_ = Math.cos(_loc9_);
            _loc13_ = Math.sin(_loc7_);
            _loc10_ = Math.cos(_loc7_);
            _loc11_ = Math.sin(_loc5_);
            _loc8_ = Math.cos(_loc5_);
            _loc17_ = param1.x;
            _loc15_ = param1.y;
            _loc14_ = param1.z;
            _loc3_ = _loc15_;
            _loc15_ = _loc3_ * _loc6_ + _loc14_ * -_loc12_;
            _loc14_ = _loc3_ * _loc12_ + _loc14_ * _loc6_;
            _loc4_ = _loc17_;
            _loc17_ = _loc4_ * _loc10_ + _loc14_ * _loc13_;
            _loc14_ = _loc4_ * -_loc13_ + _loc14_ * _loc10_;
            _loc4_ = _loc17_;
            _loc17_ = _loc4_ * _loc8_ + _loc15_ * -_loc11_;
            _loc15_ = _loc4_ * _loc11_ + _loc15_ * _loc8_;
            param1.x = _loc17_;
            param1.y = _loc15_;
            param1.z = _loc14_;
         }
         return param1;
      }
      
      public static function subdivide(param1:Vector3D, param2:Vector3D, param3:int) : Vector.<Vector3D>
      {
         var _loc8_:* = null;
         var _loc9_:Vector.<Vector3D> = new Vector.<Vector3D>();
         var _loc5_:int = 0;
         var _loc4_:Number = (param2.x - param1.x) / param3;
         var _loc6_:Number = (param2.y - param1.y) / param3;
         var _loc7_:Number = (param2.z - param1.z) / param3;
         var _loc10_:int = 1;
         while(_loc10_ < param3)
         {
            _loc8_ = new Vector3D();
            _loc8_.x = param1.x + _loc4_ * _loc10_;
            _loc8_.y = param1.y + _loc6_ * _loc10_;
            _loc8_.z = param1.z + _loc7_ * _loc10_;
            _loc5_++;
            _loc9_[_loc5_] = _loc8_;
            _loc10_++;
         }
         _loc9_[_loc5_] = param2;
         return _loc9_;
      }
      
      public static function divide(param1:Vector3D, param2:Vector3D, param3:int) : Vector.<Vector3D>
      {
         var _loc9_:* = null;
         var _loc6_:Vector.<Vector3D> = new Vector.<Vector3D>();
         var _loc4_:Number = (param2.x - param1.x) / param3;
         var _loc5_:Number = (param2.y - param1.y) / param3;
         var _loc8_:Number = (param2.z - param1.z) / param3;
         var _loc10_:int = 1;
         var _loc7_:int = 1;
         _loc6_[0] = param1;
         while(_loc10_ < param3)
         {
            _loc9_ = new Vector3D();
            _loc9_.x = param1.x + _loc4_ * _loc10_;
            _loc9_.y = param1.y + _loc5_ * _loc10_;
            _loc9_.z = param1.z + _loc8_ * _loc10_;
            _loc6_[_loc10_] = _loc9_;
            _loc10_++;
         }
         _loc6_[_loc10_] = param2;
         return _loc6_;
      }
   }
}
