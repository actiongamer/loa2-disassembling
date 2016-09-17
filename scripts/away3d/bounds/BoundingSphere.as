package away3d.bounds
{
   import flash.geom.Matrix3D;
   import away3d.core.math.Matrix3DUtils;
   import flash.geom.Vector3D;
   import away3d.primitives.WireframePrimitiveBase;
   import away3d.primitives.WireframeSphere;
   import away3d.core.math.Plane3D;
   
   public class BoundingSphere extends BoundingVolumeBase
   {
       
      
      private var _radius:Number = 0;
      
      private var _centerX:Number = 0;
      
      private var _centerY:Number = 0;
      
      private var _centerZ:Number = 0;
      
      public function BoundingSphere()
      {
         super();
      }
      
      public function get radius() : Number
      {
         return _radius;
      }
      
      override public function nullify() : void
      {
         super.nullify();
         _centerZ = 0;
         _centerY = 0;
         _centerX = 0;
         _radius = 0;
      }
      
      override public function isInFrustum(param1:Matrix3D) : Boolean
      {
         var _loc11_:* = NaN;
         var _loc12_:* = NaN;
         var _loc7_:* = NaN;
         var _loc14_:* = NaN;
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
         var _loc16_:Number = _radius;
         _loc14_ = Number(_loc2_ + _loc19_);
         _loc11_ = Number(_loc5_ + _loc21_);
         _loc12_ = Number(_loc8_ + _loc20_);
         _loc7_ = Number(_loc9_ + _loc23_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ;
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
         _loc16_ = (_loc14_ + _loc11_ + _loc12_) * _radius;
         if(_loc15_ + _loc16_ < -_loc7_)
         {
            return false;
         }
         _loc14_ = Number(_loc2_ - _loc19_);
         _loc11_ = Number(_loc5_ - _loc21_);
         _loc12_ = Number(_loc8_ - _loc20_);
         _loc7_ = Number(_loc9_ - _loc23_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ;
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
         _loc16_ = (_loc14_ + _loc11_ + _loc12_) * _radius;
         if(_loc15_ + _loc16_ < -_loc7_)
         {
            return false;
         }
         _loc14_ = Number(_loc2_ + _loc18_);
         _loc11_ = Number(_loc5_ + _loc17_);
         _loc12_ = Number(_loc8_ + _loc24_);
         _loc7_ = Number(_loc9_ + _loc22_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ;
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
         _loc16_ = (_loc14_ + _loc11_ + _loc12_) * _radius;
         if(_loc15_ + _loc16_ < -_loc7_)
         {
            return false;
         }
         _loc14_ = Number(_loc2_ - _loc18_);
         _loc11_ = Number(_loc5_ - _loc17_);
         _loc12_ = Number(_loc8_ - _loc24_);
         _loc7_ = Number(_loc9_ - _loc22_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ;
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
         _loc16_ = (_loc14_ + _loc11_ + _loc12_) * _radius;
         if(_loc15_ + _loc16_ < -_loc7_)
         {
            return false;
         }
         _loc14_ = _loc10_;
         _loc11_ = _loc4_;
         _loc12_ = _loc6_;
         _loc7_ = _loc13_;
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ;
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
         _loc16_ = (_loc14_ + _loc11_ + _loc12_) * _radius;
         if(_loc15_ + _loc16_ < -_loc7_)
         {
            return false;
         }
         _loc14_ = Number(_loc2_ - _loc10_);
         _loc11_ = Number(_loc5_ - _loc4_);
         _loc12_ = Number(_loc8_ - _loc6_);
         _loc7_ = Number(_loc9_ - _loc13_);
         _loc15_ = _loc14_ * _centerX + _loc11_ * _centerY + _loc12_ * _centerZ;
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
         _loc16_ = (_loc14_ + _loc11_ + _loc12_) * _radius;
         if(_loc15_ + _loc16_ < -_loc7_)
         {
            return false;
         }
         return true;
      }
      
      override public function fromSphere(param1:Vector3D, param2:Number) : void
      {
         _centerX = param1.x;
         _centerY = param1.y;
         _centerZ = param1.z;
         _radius = param2;
         _max.x = _centerX + param2;
         _max.y = _centerY + param2;
         _max.z = _centerZ + param2;
         _min.x = _centerX - param2;
         _min.y = _centerY - param2;
         _min.z = _centerZ - param2;
         _aabbPointsDirty = true;
         if(_boundingRenderable)
         {
            updateBoundingRenderable();
         }
      }
      
      override public function fromExtremes(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         _centerX = (param4 + param1) * 0.5;
         _centerY = (param5 + param2) * 0.5;
         _centerZ = (param6 + param3) * 0.5;
         var _loc7_:* = Number(param4 - param1);
         var _loc9_:Number = param5 - param2;
         var _loc8_:Number = param6 - param3;
         if(_loc9_ > _loc7_)
         {
            _loc7_ = _loc9_;
         }
         if(_loc8_ > _loc7_)
         {
            _loc7_ = _loc8_;
         }
         _radius = _loc7_ * Math.sqrt(0.5);
         super.fromExtremes(param1,param2,param3,param4,param5,param6);
      }
      
      override public function clone() : BoundingVolumeBase
      {
         var _loc1_:BoundingSphere = new BoundingSphere();
         _loc1_.fromSphere(new Vector3D(_centerX,_centerY,_centerZ),_radius);
         return _loc1_;
      }
      
      override public function rayIntersection(param1:Vector3D, param2:Vector3D, param3:Vector3D) : Number
      {
         var _loc8_:Number = NaN;
         var _loc15_:Number = NaN;
         if(containsPoint(param1))
         {
            return 0;
         }
         var _loc11_:Number = param1.x - _centerX;
         var _loc12_:Number = param1.y - _centerY;
         var _loc14_:Number = param1.z - _centerZ;
         var _loc10_:Number = param2.x;
         var _loc9_:Number = param2.y;
         var _loc13_:Number = param2.z;
         var _loc7_:Number = _loc10_ * _loc10_ + _loc9_ * _loc9_ + _loc13_ * _loc13_;
         var _loc5_:Number = 2 * (_loc11_ * _loc10_ + _loc12_ * _loc9_ + _loc14_ * _loc13_);
         var _loc6_:Number = _loc11_ * _loc11_ + _loc12_ * _loc12_ + _loc14_ * _loc14_ - _radius * _radius;
         var _loc4_:Number = _loc5_ * _loc5_ - 4 * _loc7_ * _loc6_;
         if(_loc4_ >= 0)
         {
            _loc15_ = Math.sqrt(_loc4_);
            _loc8_ = (-_loc5_ - _loc15_) / (2 * _loc7_);
            if(_loc8_ >= 0)
            {
               param3.x = _loc11_ + _loc8_ * _loc10_;
               param3.y = _loc12_ + _loc8_ * _loc9_;
               param3.z = _loc14_ + _loc8_ * _loc13_;
               param3.normalize();
               return _loc8_;
            }
         }
         return -1;
      }
      
      override public function containsPoint(param1:Vector3D) : Boolean
      {
         var _loc3_:Number = param1.x - _centerX;
         var _loc4_:Number = param1.y - _centerY;
         var _loc5_:Number = param1.z - _centerZ;
         var _loc2_:Number = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
         return _loc2_ <= _radius;
      }
      
      override protected function updateBoundingRenderable() : void
      {
         var _loc1_:* = Number(_radius);
         if(_loc1_ == 0)
         {
            _loc1_ = 0.001;
         }
         _boundingRenderable.scaleX = _loc1_;
         _boundingRenderable.scaleY = _loc1_;
         _boundingRenderable.scaleZ = _loc1_;
         _boundingRenderable.x = _centerX;
         _boundingRenderable.y = _centerY;
         _boundingRenderable.z = _centerZ;
      }
      
      override protected function createBoundingRenderable() : WireframePrimitiveBase
      {
         return new WireframeSphere(1,16,12,16711680);
      }
      
      override public function classifyToPlane(param1:Plane3D) : int
      {
         var _loc5_:Number = param1.a;
         var _loc3_:Number = param1.b;
         var _loc4_:Number = param1.c;
         var _loc2_:Number = _loc5_ * _centerX + _loc3_ * _centerY + _loc4_ * _centerZ - param1.d;
         if(_loc5_ < 0)
         {
            _loc5_ = -_loc5_;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = -_loc3_;
         }
         if(_loc4_ < 0)
         {
            _loc4_ = -_loc4_;
         }
         var _loc6_:Number = (_loc5_ + _loc3_ + _loc4_) * _radius;
         return _loc2_ > _loc6_?1:int(_loc2_ < -_loc6_?0:2);
      }
   }
}
