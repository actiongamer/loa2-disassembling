package away3d.core.math
{
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   
   public class Matrix3DUtils
   {
      
      public static const RAW_DATA_CONTAINER:Vector.<Number> = new Vector.<Number>(16);
      
      public static const CALCULATION_MATRIX:Matrix3D = new Matrix3D();
      
      public static const CALCULATION_VECTOR3D:Vector3D = new Vector3D();
      
      public static const CALCULATION_DECOMPOSE:Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D(),new Vector3D(),new Vector3D()]);
       
      
      public function Matrix3DUtils()
      {
         super();
      }
      
      public static function quaternion2matrix(param1:Quaternion, param2:Matrix3D = null) : Matrix3D
      {
         var _loc16_:Number = param1.x;
         var _loc15_:Number = param1.y;
         var _loc14_:Number = param1.z;
         var _loc12_:Number = param1.w;
         var _loc9_:Number = _loc16_ * _loc16_;
         var _loc10_:Number = _loc16_ * _loc15_;
         var _loc5_:Number = _loc16_ * _loc14_;
         var _loc7_:Number = _loc16_ * _loc12_;
         var _loc6_:Number = _loc15_ * _loc15_;
         var _loc8_:Number = _loc15_ * _loc14_;
         var _loc13_:Number = _loc15_ * _loc12_;
         var _loc4_:Number = _loc14_ * _loc14_;
         var _loc11_:Number = _loc14_ * _loc12_;
         var _loc3_:Vector.<Number> = RAW_DATA_CONTAINER;
         _loc3_[0] = 1 - 2 * (_loc6_ + _loc4_);
         _loc3_[1] = 2 * (_loc10_ + _loc11_);
         _loc3_[2] = 2 * (_loc5_ - _loc13_);
         _loc3_[4] = 2 * (_loc10_ - _loc11_);
         _loc3_[5] = 1 - 2 * (_loc9_ + _loc4_);
         _loc3_[6] = 2 * (_loc8_ + _loc7_);
         _loc3_[8] = 2 * (_loc5_ + _loc13_);
         _loc3_[9] = 2 * (_loc8_ - _loc7_);
         _loc3_[10] = 1 - 2 * (_loc9_ + _loc6_);
         var _loc17_:* = 0;
         _loc3_[14] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[13] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[12] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[11] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[7] = _loc17_;
         _loc3_[3] = _loc17_;
         _loc3_[15] = 1;
         if(param2)
         {
            param2.copyRawDataFrom(_loc3_);
            return param2;
         }
         return new Matrix3D(_loc3_);
      }
      
      public static function getForward(param1:Matrix3D, param2:Vector3D = null) : Vector3D
      {
         if(!param2)
         {
            param2 = new Vector3D();
         }
         param1.copyColumnTo(2,param2);
         param2.normalize();
         return param2;
      }
      
      public static function getUp(param1:Matrix3D, param2:Vector3D = null) : Vector3D
      {
         if(!param2)
         {
            param2 = new Vector3D();
         }
         param1.copyColumnTo(1,param2);
         param2.normalize();
         return param2;
      }
      
      public static function getRight(param1:Matrix3D, param2:Vector3D = null) : Vector3D
      {
         if(!param2)
         {
            param2 = new Vector3D();
         }
         param1.copyColumnTo(0,param2);
         param2.normalize();
         return param2;
      }
      
      public static function compare(param1:Matrix3D, param2:Matrix3D) : Boolean
      {
         var _loc5_:* = 0;
         var _loc3_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         var _loc4_:Vector.<Number> = param2.rawData;
         param1.copyRawDataTo(_loc3_);
         _loc5_ = uint(0);
         while(_loc5_ < 16)
         {
            if(_loc3_[_loc5_] != _loc4_[_loc5_])
            {
               return false;
            }
            _loc5_++;
         }
         return true;
      }
      
      public static function lookAt(param1:Matrix3D, param2:Vector3D, param3:Vector3D, param4:Vector3D) : void
      {
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc5_:Vector.<Number> = RAW_DATA_CONTAINER;
         _loc8_ = param3.crossProduct(param4);
         _loc8_.normalize();
         _loc6_ = _loc8_.crossProduct(param3);
         _loc6_.normalize();
         _loc7_ = param3.clone();
         _loc7_.normalize();
         _loc5_[0] = _loc8_.x;
         _loc5_[1] = _loc6_.x;
         _loc5_[2] = -_loc7_.x;
         _loc5_[3] = 0;
         _loc5_[4] = _loc8_.y;
         _loc5_[5] = _loc6_.y;
         _loc5_[6] = -_loc7_.y;
         _loc5_[7] = 0;
         _loc5_[8] = _loc8_.z;
         _loc5_[9] = _loc6_.z;
         _loc5_[10] = -_loc7_.z;
         _loc5_[11] = 0;
         _loc5_[12] = -_loc8_.dotProduct(param2);
         _loc5_[13] = -_loc6_.dotProduct(param2);
         _loc5_[14] = _loc7_.dotProduct(param2);
         _loc5_[15] = 1;
         param1.copyRawDataFrom(_loc5_);
      }
      
      public static function reflection(param1:Plane3D, param2:Matrix3D = null) : Matrix3D
      {
         if(!param2)
         {
            param2 = new Matrix3D();
         }
         var _loc9_:Number = param1.a;
         var _loc6_:Number = param1.b;
         var _loc7_:Number = param1.c;
         var _loc3_:Number = param1.d;
         var _loc8_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         var _loc5_:Number = -2 * _loc9_ * _loc6_;
         var _loc4_:Number = -2 * _loc9_ * _loc7_;
         var _loc10_:Number = -2 * _loc6_ * _loc7_;
         _loc8_[0] = 1 - 2 * _loc9_ * _loc9_;
         _loc8_[4] = _loc5_;
         _loc8_[8] = _loc4_;
         _loc8_[12] = -2 * _loc9_ * _loc3_;
         _loc8_[1] = _loc5_;
         _loc8_[5] = 1 - 2 * _loc6_ * _loc6_;
         _loc8_[9] = _loc10_;
         _loc8_[13] = -2 * _loc6_ * _loc3_;
         _loc8_[2] = _loc4_;
         _loc8_[6] = _loc10_;
         _loc8_[10] = 1 - 2 * _loc7_ * _loc7_;
         _loc8_[14] = -2 * _loc7_ * _loc3_;
         _loc8_[3] = 0;
         _loc8_[7] = 0;
         _loc8_[11] = 0;
         _loc8_[15] = 1;
         param2.copyRawDataFrom(_loc8_);
         return param2;
      }
      
      public static function decompose(param1:Matrix3D, param2:String = "eulerAngles") : Vector.<Vector3D>
      {
         var _loc11_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:Vector.<Number> = RAW_DATA_CONTAINER;
         param1.copyRawDataTo(_loc3_);
         var _loc14_:Number = _loc3_[0];
         var _loc10_:Number = _loc3_[1];
         var _loc18_:Number = _loc3_[2];
         var _loc12_:Number = _loc3_[4];
         var _loc8_:Number = _loc3_[5];
         var _loc16_:Number = _loc3_[6];
         var _loc13_:Number = _loc3_[8];
         var _loc9_:Number = _loc3_[9];
         var _loc17_:Number = _loc3_[10];
         var _loc27_:Number = _loc3_[12];
         var _loc26_:Number = _loc3_[13];
         var _loc25_:Number = _loc3_[14];
         var _loc21_:Number = Math.sqrt(_loc14_ * _loc14_ + _loc10_ * _loc10_ + _loc18_ * _loc18_);
         var _loc19_:Number = Math.sqrt(_loc12_ * _loc12_ + _loc8_ * _loc8_ + _loc16_ * _loc16_);
         var _loc22_:Number = Math.sqrt(_loc13_ * _loc13_ + _loc9_ * _loc9_ + _loc17_ * _loc17_);
         var _loc24_:* = 0;
         var _loc4_:* = _loc21_;
         var _loc5_:* = _loc19_;
         var _loc7_:* = _loc22_;
         if(_loc14_ * (_loc8_ * _loc17_ - _loc16_ * _loc9_) - _loc10_ * (_loc12_ * _loc17_ - _loc16_ * _loc13_) + _loc18_ * (_loc12_ * _loc9_ - _loc8_ * _loc13_) < 0)
         {
            _loc7_ = Number(-_loc7_);
         }
         _loc14_ = _loc14_ / _loc4_;
         _loc10_ = _loc10_ / _loc4_;
         _loc18_ = _loc18_ / _loc4_;
         _loc12_ = _loc12_ / _loc5_;
         _loc8_ = _loc8_ / _loc5_;
         _loc16_ = _loc16_ / _loc5_;
         _loc13_ = _loc13_ / _loc7_;
         _loc9_ = _loc9_ / _loc7_;
         _loc17_ = _loc17_ / _loc7_;
         if(param2 == "eulerAngles")
         {
            _loc21_ = Math.atan2(_loc16_,_loc17_);
            _loc19_ = Math.atan2(-_loc18_,Math.sqrt(_loc14_ * _loc14_ + _loc10_ * _loc10_));
            _loc11_ = Math.sin(_loc21_);
            _loc23_ = Math.cos(_loc21_);
            _loc22_ = Math.atan2(_loc11_ * _loc13_ - _loc23_ * _loc12_,_loc23_ * _loc8_ - _loc11_ * _loc9_);
         }
         else if(param2 == "axisAngle")
         {
            _loc24_ = Number(Math.acos((_loc14_ + _loc8_ + _loc17_ - 1) / 2));
            _loc15_ = Math.sqrt((_loc16_ - _loc9_) * (_loc16_ - _loc9_) + (_loc13_ - _loc18_) * (_loc13_ - _loc18_) + (_loc10_ - _loc12_) * (_loc10_ - _loc12_));
            _loc21_ = (_loc16_ - _loc9_) / _loc15_;
            _loc19_ = (_loc13_ - _loc18_) / _loc15_;
            _loc22_ = (_loc10_ - _loc12_) / _loc15_;
         }
         else
         {
            _loc6_ = _loc14_ + _loc8_ + _loc17_;
            if(_loc6_ > 0)
            {
               _loc24_ = Number(Math.sqrt(1 + _loc6_) / 2);
               _loc21_ = (_loc16_ - _loc9_) / (4 * _loc24_);
               _loc19_ = (_loc13_ - _loc18_) / (4 * _loc24_);
               _loc22_ = (_loc10_ - _loc12_) / (4 * _loc24_);
            }
            else if(_loc14_ > _loc8_ && _loc14_ > _loc17_)
            {
               _loc21_ = Math.sqrt(1 + _loc14_ - _loc8_ - _loc17_) / 2;
               _loc24_ = Number((_loc16_ - _loc9_) / (4 * _loc21_));
               _loc19_ = (_loc10_ + _loc12_) / (4 * _loc21_);
               _loc22_ = (_loc13_ + _loc18_) / (4 * _loc21_);
            }
            else if(_loc8_ > _loc17_)
            {
               _loc19_ = Math.sqrt(1 + _loc8_ - _loc14_ - _loc17_) / 2;
               _loc21_ = (_loc10_ + _loc12_) / (4 * _loc19_);
               _loc24_ = Number((_loc13_ - _loc18_) / (4 * _loc19_));
               _loc22_ = (_loc16_ + _loc9_) / (4 * _loc19_);
            }
            else
            {
               _loc22_ = Math.sqrt(1 + _loc17_ - _loc14_ - _loc8_) / 2;
               _loc21_ = (_loc13_ + _loc18_) / (4 * _loc22_);
               _loc19_ = (_loc16_ + _loc9_) / (4 * _loc22_);
               _loc24_ = Number((_loc10_ - _loc12_) / (4 * _loc22_));
            }
         }
         var _loc20_:Vector.<Vector3D> = CALCULATION_DECOMPOSE;
         _loc20_[0].x = _loc27_;
         _loc20_[0].y = _loc26_;
         _loc20_[0].z = _loc25_;
         _loc20_[1].x = _loc21_;
         _loc20_[1].y = _loc19_;
         _loc20_[1].z = _loc22_;
         _loc20_[1].w = _loc24_;
         _loc20_[2].x = _loc4_;
         _loc20_[2].y = _loc5_;
         _loc20_[2].z = _loc7_;
         return _loc20_;
      }
      
      public static function transformVector(param1:Matrix3D, param2:Vector3D, param3:Vector3D = null) : Vector3D
      {
         if(!param3)
         {
            param3 = new Vector3D();
         }
         var _loc4_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         param1.copyRawDataTo(_loc4_);
         var _loc11_:Number = _loc4_[0];
         var _loc8_:Number = _loc4_[1];
         var _loc19_:Number = _loc4_[2];
         var _loc15_:Number = _loc4_[3];
         var _loc9_:Number = _loc4_[4];
         var _loc5_:Number = _loc4_[5];
         var _loc16_:Number = _loc4_[6];
         var _loc12_:Number = _loc4_[7];
         var _loc10_:Number = _loc4_[8];
         var _loc6_:Number = _loc4_[9];
         var _loc17_:Number = _loc4_[10];
         var _loc13_:Number = _loc4_[11];
         var _loc7_:Number = _loc4_[12];
         var _loc18_:Number = _loc4_[13];
         var _loc14_:Number = _loc4_[14];
         var _loc20_:Number = _loc4_[15];
         var _loc23_:Number = param2.x;
         var _loc22_:Number = param2.y;
         var _loc21_:Number = param2.z;
         param3.x = _loc11_ * _loc23_ + _loc9_ * _loc22_ + _loc10_ * _loc21_ + _loc7_;
         param3.y = _loc8_ * _loc23_ + _loc5_ * _loc22_ + _loc6_ * _loc21_ + _loc18_;
         param3.z = _loc19_ * _loc23_ + _loc16_ * _loc22_ + _loc17_ * _loc21_ + _loc14_;
         param3.w = _loc15_ * _loc23_ + _loc12_ * _loc22_ + _loc13_ * _loc21_ + _loc20_;
         return param3;
      }
      
      public static function deltaTransformVector(param1:Matrix3D, param2:Vector3D, param3:Vector3D = null) : Vector3D
      {
         if(!param3)
         {
            param3 = new Vector3D();
         }
         var _loc4_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         param1.copyRawDataTo(_loc4_);
         var _loc10_:Number = _loc4_[0];
         var _loc7_:Number = _loc4_[1];
         var _loc16_:Number = _loc4_[2];
         var _loc13_:Number = _loc4_[3];
         var _loc8_:Number = _loc4_[4];
         var _loc5_:Number = _loc4_[5];
         var _loc14_:Number = _loc4_[6];
         var _loc11_:Number = _loc4_[7];
         var _loc9_:Number = _loc4_[8];
         var _loc6_:Number = _loc4_[9];
         var _loc15_:Number = _loc4_[10];
         var _loc12_:Number = _loc4_[11];
         var _loc19_:Number = param2.x;
         var _loc18_:Number = param2.y;
         var _loc17_:Number = param2.z;
         param3.x = _loc10_ * _loc19_ + _loc8_ * _loc18_ + _loc9_ * _loc17_;
         param3.y = _loc7_ * _loc19_ + _loc5_ * _loc18_ + _loc6_ * _loc17_;
         param3.z = _loc16_ * _loc19_ + _loc14_ * _loc18_ + _loc15_ * _loc17_;
         param3.w = _loc13_ * _loc19_ + _loc11_ * _loc18_ + _loc12_ * _loc17_;
         return param3;
      }
      
      public static function getTranslation(param1:Matrix3D, param2:Vector3D = null) : Vector3D
      {
         if(!param2)
         {
            param2 = new Vector3D();
         }
         param1.copyColumnTo(3,param2);
         return param2;
      }
      
      public static function deltaTransformVectors(param1:Matrix3D, param2:Vector.<Number>, param3:Vector.<Number>) : void
      {
         var _loc7_:* = 0;
         var _loc22_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc4_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         param1.copyRawDataTo(_loc4_);
         var _loc11_:Number = _loc4_[0];
         var _loc8_:Number = _loc4_[1];
         var _loc18_:Number = _loc4_[2];
         var _loc15_:Number = _loc4_[3];
         var _loc9_:Number = _loc4_[4];
         var _loc5_:Number = _loc4_[5];
         var _loc16_:Number = _loc4_[6];
         var _loc12_:Number = _loc4_[7];
         var _loc10_:Number = _loc4_[8];
         var _loc6_:Number = _loc4_[9];
         var _loc17_:Number = _loc4_[10];
         var _loc13_:Number = _loc4_[11];
         var _loc14_:uint = 0;
         var _loc19_:Number = param2.length;
         _loc7_ = uint(0);
         while(_loc7_ < _loc19_)
         {
            _loc22_ = param2[_loc7_];
            _loc21_ = param2[_loc7_ + 1];
            _loc20_ = param2[_loc7_ + 2];
            param3[_loc14_++] = _loc11_ * _loc22_ + _loc9_ * _loc21_ + _loc10_ * _loc20_;
            param3[_loc14_++] = _loc8_ * _loc22_ + _loc5_ * _loc21_ + _loc6_ * _loc20_;
            param3[_loc14_++] = _loc18_ * _loc22_ + _loc16_ * _loc21_ + _loc17_ * _loc20_;
            _loc7_ = uint(_loc7_ + 3);
         }
      }
   }
}
