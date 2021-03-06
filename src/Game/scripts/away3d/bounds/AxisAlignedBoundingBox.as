package away3d.bounds
{
   import flash.geom.Matrix3D;
   import away3d.core.math.Matrix3DUtils;
   import flash.geom.Vector3D;
   import away3d.primitives.WireframePrimitiveBase;
   import away3d.primitives.WireframeCube;
   import away3d.core.math.Plane3D;
   
   public class AxisAlignedBoundingBox extends BoundingVolumeBase
   {
       
      
      private var _centerX:Number = 0;
      
      private var _centerY:Number = 0;
      
      private var _centerZ:Number = 0;
      
      private var _halfExtentsX:Number = 0;
      
      private var _halfExtentsY:Number = 0;
      
      private var _halfExtentsZ:Number = 0;
      
      public function AxisAlignedBoundingBox()
      {
         super();
      }
      
      override public function nullify() : void
      {
         super.nullify();
         _centerZ = 0;
         _centerY = 0;
         _centerX = 0;
         _halfExtentsZ = 0;
         _halfExtentsY = 0;
         _halfExtentsX = 0;
      }
      
      override public function isInFrustum(param1:Matrix3D) : Boolean
      {
         var _loc11_:* = NaN;
         var _loc12_:* = NaN;
         var _loc7_:* = NaN;
         var _loc14_:* = NaN;
         var _loc16_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc3_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         param1.copyRawDataTo(_loc3_);
         var _loc19_:Number = _loc3_[0];
         var _loc21_:Number = _loc3_[4];
         var _loc20_:Number = _loc3_[8];
         var _loc23_:Number = _loc3_[12];
         var _loc18_:Number = _loc3_[1];
         var _loc17_:Number = _loc3_[5];
         var _loc24_:Number = _loc3_[9];
         var _loc22_:Number = _loc3_[13];
         var _loc10_:Number = _loc3_[2];
         var _loc4_:Number = _loc3_[6];
         var _loc6_:Number = _loc3_[10];
         var _loc13_:Number = _loc3_[14];
         var _loc2_:Number = _loc3_[3];
         var _loc5_:Number = _loc3_[7];
         var _loc8_:Number = _loc3_[11];
         var _loc9_:Number = _loc3_[15];
         _loc14_ = Number(_loc2_ + _loc19_);
         _loc11_ = Number(_loc5_ + _loc21_);
         _loc12_ = Number(_loc8_ + _loc20_);
         _loc7_ = Number(_loc9_ + _loc23_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ + _loc7_;
         if(_loc14_ < 0)
         {
            _loc14_ = Number(-_loc14_);
         }
         if(_loc11_ < 0)
         {
            _loc11_ = Number(-_loc11_);
         }
         if(_loc12_ < 0)
         {
            _loc12_ = Number(-_loc12_);
         }
         _loc16_ = _loc14_ * _halfExtentsX + _loc11_ * _halfExtentsY + _loc12_ * _halfExtentsZ;
         if(_loc15_ < -_loc16_)
         {
            return false;
         }
         _loc14_ = Number(_loc2_ - _loc19_);
         _loc11_ = Number(_loc5_ - _loc21_);
         _loc12_ = Number(_loc8_ - _loc20_);
         _loc7_ = Number(_loc9_ - _loc23_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ + _loc7_;
         if(_loc14_ < 0)
         {
            _loc14_ = Number(-_loc14_);
         }
         if(_loc11_ < 0)
         {
            _loc11_ = Number(-_loc11_);
         }
         if(_loc12_ < 0)
         {
            _loc12_ = Number(-_loc12_);
         }
         _loc16_ = _loc14_ * _halfExtentsX + _loc11_ * _halfExtentsY + _loc12_ * _halfExtentsZ;
         if(_loc15_ < -_loc16_)
         {
            return false;
         }
         _loc14_ = Number(_loc2_ + _loc18_);
         _loc11_ = Number(_loc5_ + _loc17_);
         _loc12_ = Number(_loc8_ + _loc24_);
         _loc7_ = Number(_loc9_ + _loc22_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ + _loc7_;
         if(_loc14_ < 0)
         {
            _loc14_ = Number(-_loc14_);
         }
         if(_loc11_ < 0)
         {
            _loc11_ = Number(-_loc11_);
         }
         if(_loc12_ < 0)
         {
            _loc12_ = Number(-_loc12_);
         }
         _loc16_ = _loc14_ * _halfExtentsX + _loc11_ * _halfExtentsY + _loc12_ * _halfExtentsZ;
         if(_loc15_ < -_loc16_)
         {
            return false;
         }
         _loc14_ = Number(_loc2_ - _loc18_);
         _loc11_ = Number(_loc5_ - _loc17_);
         _loc12_ = Number(_loc8_ - _loc24_);
         _loc7_ = Number(_loc9_ - _loc22_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ + _loc7_;
         if(_loc14_ < 0)
         {
            _loc14_ = Number(-_loc14_);
         }
         if(_loc11_ < 0)
         {
            _loc11_ = Number(-_loc11_);
         }
         if(_loc12_ < 0)
         {
            _loc12_ = Number(-_loc12_);
         }
         _loc16_ = _loc14_ * _halfExtentsX + _loc11_ * _halfExtentsY + _loc12_ * _halfExtentsZ;
         if(_loc15_ < -_loc16_)
         {
            return false;
         }
         _loc14_ = _loc10_;
         _loc11_ = _loc4_;
         _loc12_ = _loc6_;
         _loc7_ = _loc13_;
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ + _loc7_;
         if(_loc14_ < 0)
         {
            _loc14_ = Number(-_loc14_);
         }
         if(_loc11_ < 0)
         {
            _loc11_ = Number(-_loc11_);
         }
         if(_loc12_ < 0)
         {
            _loc12_ = Number(-_loc12_);
         }
         _loc16_ = _loc14_ * _halfExtentsX + _loc11_ * _halfExtentsY + _loc12_ * _halfExtentsZ;
         if(_loc15_ < -_loc16_)
         {
            return false;
         }
         _loc14_ = Number(_loc2_ - _loc10_);
         _loc11_ = Number(_loc5_ - _loc4_);
         _loc12_ = Number(_loc8_ - _loc6_);
         _loc7_ = Number(_loc9_ - _loc13_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ + _loc7_;
         if(_loc14_ < 0)
         {
            _loc14_ = Number(-_loc14_);
         }
         if(_loc11_ < 0)
         {
            _loc11_ = Number(-_loc11_);
         }
         if(_loc12_ < 0)
         {
            _loc12_ = Number(-_loc12_);
         }
         _loc16_ = _loc14_ * _halfExtentsX + _loc11_ * _halfExtentsY + _loc12_ * _halfExtentsZ;
         if(_loc15_ < -_loc16_)
         {
            return false;
         }
         return true;
      }
      
      override public function rayIntersection(param1:Vector3D, param2:Vector3D, param3:Vector3D) : Number
      {
         var _loc14_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc12_:Boolean = false;
         if(containsPoint(param1))
         {
            return 0;
         }
         var _loc8_:Number = param1.x - _centerX;
         var _loc9_:Number = param1.y - _centerY;
         var _loc11_:Number = param1.z - _centerZ;
         var _loc7_:Number = param2.x;
         var _loc6_:Number = param2.y;
         var _loc10_:Number = param2.z;
         if(_loc7_ < 0)
         {
            _loc5_ = (_halfExtentsX - _loc8_) / _loc7_;
            if(_loc5_ > 0)
            {
               _loc14_ = _loc9_ + _loc5_ * _loc6_;
               _loc13_ = _loc11_ + _loc5_ * _loc10_;
               if(_loc14_ > -_halfExtentsY && _loc14_ < _halfExtentsY && _loc13_ > -_halfExtentsZ && _loc13_ < _halfExtentsZ)
               {
                  param3.x = 1;
                  param3.y = 0;
                  param3.z = 0;
                  _loc12_ = true;
               }
            }
         }
         if(!_loc12_ && _loc7_ > 0)
         {
            _loc5_ = (-_halfExtentsX - _loc8_) / _loc7_;
            if(_loc5_ > 0)
            {
               _loc14_ = _loc9_ + _loc5_ * _loc6_;
               _loc13_ = _loc11_ + _loc5_ * _loc10_;
               if(_loc14_ > -_halfExtentsY && _loc14_ < _halfExtentsY && _loc13_ > -_halfExtentsZ && _loc13_ < _halfExtentsZ)
               {
                  param3.x = -1;
                  param3.y = 0;
                  param3.z = 0;
                  _loc12_ = true;
               }
            }
         }
         if(!_loc12_ && _loc6_ < 0)
         {
            _loc5_ = (_halfExtentsY - _loc9_) / _loc6_;
            if(_loc5_ > 0)
            {
               _loc4_ = _loc8_ + _loc5_ * _loc7_;
               _loc13_ = _loc11_ + _loc5_ * _loc10_;
               if(_loc4_ > -_halfExtentsX && _loc4_ < _halfExtentsX && _loc13_ > -_halfExtentsZ && _loc13_ < _halfExtentsZ)
               {
                  param3.x = 0;
                  param3.y = 1;
                  param3.z = 0;
                  _loc12_ = true;
               }
            }
         }
         if(!_loc12_ && _loc6_ > 0)
         {
            _loc5_ = (-_halfExtentsY - _loc9_) / _loc6_;
            if(_loc5_ > 0)
            {
               _loc4_ = _loc8_ + _loc5_ * _loc7_;
               _loc13_ = _loc11_ + _loc5_ * _loc10_;
               if(_loc4_ > -_halfExtentsX && _loc4_ < _halfExtentsX && _loc13_ > -_halfExtentsZ && _loc13_ < _halfExtentsZ)
               {
                  param3.x = 0;
                  param3.y = -1;
                  param3.z = 0;
                  _loc12_ = true;
               }
            }
         }
         if(!_loc12_ && _loc10_ < 0)
         {
            _loc5_ = (_halfExtentsZ - _loc11_) / _loc10_;
            if(_loc5_ > 0)
            {
               _loc4_ = _loc8_ + _loc5_ * _loc7_;
               _loc14_ = _loc9_ + _loc5_ * _loc6_;
               if(_loc14_ > -_halfExtentsY && _loc14_ < _halfExtentsY && _loc4_ > -_halfExtentsX && _loc4_ < _halfExtentsX)
               {
                  param3.x = 0;
                  param3.y = 0;
                  param3.z = 1;
                  _loc12_ = true;
               }
            }
         }
         if(!_loc12_ && _loc10_ > 0)
         {
            _loc5_ = (-_halfExtentsZ - _loc11_) / _loc10_;
            if(_loc5_ > 0)
            {
               _loc4_ = _loc8_ + _loc5_ * _loc7_;
               _loc14_ = _loc9_ + _loc5_ * _loc6_;
               if(_loc14_ > -_halfExtentsY && _loc14_ < _halfExtentsY && _loc4_ > -_halfExtentsX && _loc4_ < _halfExtentsX)
               {
                  param3.x = 0;
                  param3.y = 0;
                  param3.z = -1;
                  _loc12_ = true;
               }
            }
         }
         return !!_loc12_?_loc5_:-1;
      }
      
      override public function containsPoint(param1:Vector3D) : Boolean
      {
         var _loc2_:Number = param1.x - _centerX;
         var _loc3_:Number = param1.y - _centerY;
         var _loc4_:Number = param1.z - _centerZ;
         return _loc2_ <= _halfExtentsX && _loc2_ >= -_halfExtentsX && _loc3_ <= _halfExtentsY && _loc3_ >= -_halfExtentsY && _loc4_ <= _halfExtentsZ && _loc4_ >= -_halfExtentsZ;
      }
      
      override public function fromExtremes(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         _centerX = (param4 + param1) * 0.5;
         _centerY = (param5 + param2) * 0.5;
         _centerZ = (param6 + param3) * 0.5;
         _halfExtentsX = (param4 - param1) * 0.5;
         _halfExtentsY = (param5 - param2) * 0.5;
         _halfExtentsZ = (param6 - param3) * 0.5;
         super.fromExtremes(param1,param2,param3,param4,param5,param6);
      }
      
      override public function clone() : BoundingVolumeBase
      {
         var _loc1_:AxisAlignedBoundingBox = new AxisAlignedBoundingBox();
         _loc1_.fromExtremes(_min.x,_min.y,_min.z,_max.x,_max.y,_max.z);
         return _loc1_;
      }
      
      public function get halfExtentsX() : Number
      {
         return _halfExtentsX;
      }
      
      public function get halfExtentsY() : Number
      {
         return _halfExtentsY;
      }
      
      public function get halfExtentsZ() : Number
      {
         return _halfExtentsZ;
      }
      
      public function closestPointToPoint(param1:Vector3D, param2:Vector3D = null) : Vector3D
      {
         var _loc3_:Number = NaN;
         if(!param2)
         {
            param2 = new Vector3D();
         }
         _loc3_ = param1.x;
         if(_loc3_ < _min.x)
         {
            _loc3_ = _min.x;
         }
         if(_loc3_ > _max.x)
         {
            _loc3_ = _max.x;
         }
         param2.x = _loc3_;
         _loc3_ = param1.y;
         if(_loc3_ < _min.y)
         {
            _loc3_ = _min.y;
         }
         if(_loc3_ > _max.y)
         {
            _loc3_ = _max.y;
         }
         param2.y = _loc3_;
         _loc3_ = param1.z;
         if(_loc3_ < _min.z)
         {
            _loc3_ = _min.z;
         }
         if(_loc3_ > _max.z)
         {
            _loc3_ = _max.z;
         }
         param2.z = _loc3_;
         return param2;
      }
      
      override protected function updateBoundingRenderable() : void
      {
         _boundingRenderable.scaleX = Math.max(_halfExtentsX * 2,0.001);
         _boundingRenderable.scaleY = Math.max(_halfExtentsY * 2,0.001);
         _boundingRenderable.scaleZ = Math.max(_halfExtentsZ * 2,0.001);
         _boundingRenderable.x = _centerX;
         _boundingRenderable.y = _centerY;
         _boundingRenderable.z = _centerZ;
      }
      
      override protected function createBoundingRenderable() : WireframePrimitiveBase
      {
         return new WireframeCube(1,1,1,16776960);
      }
      
      override public function classifyToPlane(param1:Plane3D) : int
      {
         var _loc6_:Number = param1.a;
         var _loc4_:Number = param1.b;
         var _loc5_:Number = param1.c;
         var _loc2_:Number = _loc6_ * _centerX + _loc4_ * _centerY + _loc5_ * _centerZ - param1.d;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         if(_loc4_ < 0)
         {
            _loc4_ = -_loc4_;
         }
         if(_loc5_ < 0)
         {
            _loc5_ = -_loc5_;
         }
         var _loc3_:Number = _loc6_ * _halfExtentsX + _loc4_ * _halfExtentsY + _loc5_ * _halfExtentsZ;
         return _loc2_ > _loc3_?1:int(_loc2_ < -_loc3_?0:2);
      }
   }
}
