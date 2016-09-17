package away3d.bounds
{
   import flash.geom.Vector3D;
   import away3d.primitives.WireframePrimitiveBase;
   import away3d.core.base.Geometry;
   import away3d.core.base.ISubGeometry;
   import flash.geom.Matrix3D;
   import away3d.errors.AbstractMethodError;
   import away3d.core.math.Plane3D;
   
   public class BoundingVolumeBase
   {
       
      
      protected var _min:Vector3D;
      
      protected var _max:Vector3D;
      
      protected var _aabbPoints:Vector.<Number>;
      
      protected var _aabbPointsDirty:Boolean = true;
      
      protected var _boundingRenderable:WireframePrimitiveBase;
      
      public function BoundingVolumeBase()
      {
         _aabbPoints = new Vector.<Number>();
         super();
         _min = new Vector3D();
         _max = new Vector3D();
      }
      
      public function get max() : Vector3D
      {
         return _max;
      }
      
      public function get min() : Vector3D
      {
         return _min;
      }
      
      public function get aabbPoints() : Vector.<Number>
      {
         if(_aabbPointsDirty)
         {
            updateAABBPoints();
         }
         return _aabbPoints;
      }
      
      public function get boundingRenderable() : WireframePrimitiveBase
      {
         if(!_boundingRenderable)
         {
            _boundingRenderable = createBoundingRenderable();
            updateBoundingRenderable();
         }
         return _boundingRenderable;
      }
      
      public function nullify() : void
      {
         var _loc1_:* = 0;
         _min.z = _loc1_;
         _loc1_ = _loc1_;
         _min.y = _loc1_;
         _min.x = _loc1_;
         _loc1_ = 0;
         _max.z = _loc1_;
         _loc1_ = _loc1_;
         _max.y = _loc1_;
         _max.x = _loc1_;
         _aabbPointsDirty = true;
         if(_boundingRenderable)
         {
            updateBoundingRenderable();
         }
      }
      
      public function disposeRenderable() : void
      {
         if(_boundingRenderable)
         {
            _boundingRenderable.dispose();
         }
         _boundingRenderable = null;
      }
      
      public function fromVertices(param1:Vector.<Number>) : void
      {
         var _loc10_:int = 0;
         var _loc9_:* = NaN;
         var _loc2_:* = NaN;
         var _loc8_:* = NaN;
         var _loc5_:* = NaN;
         var _loc4_:* = NaN;
         var _loc6_:* = NaN;
         var _loc3_:Number = NaN;
         var _loc7_:uint = param1.length;
         if(_loc7_ == 0)
         {
            nullify();
            return;
         }
         _loc6_ = Number(param1[uint(_loc10_++)]);
         _loc8_ = Number(param1[uint(_loc10_++)]);
         _loc5_ = Number(param1[uint(_loc10_++)]);
         _loc9_ = Number(param1[uint(_loc10_++)]);
         _loc4_ = Number(param1[uint(_loc10_++)]);
         _loc2_ = Number(param1[uint(_loc10_++)]);
         while(_loc10_ < _loc7_)
         {
            _loc3_ = param1[_loc10_++];
            if(_loc3_ < _loc8_)
            {
               _loc8_ = _loc3_;
            }
            else if(_loc3_ > _loc6_)
            {
               _loc6_ = _loc3_;
            }
            _loc3_ = param1[_loc10_++];
            if(_loc3_ < _loc9_)
            {
               _loc9_ = _loc3_;
            }
            else if(_loc3_ > _loc5_)
            {
               _loc5_ = _loc3_;
            }
            _loc3_ = param1[_loc10_++];
            if(_loc3_ < _loc2_)
            {
               _loc2_ = _loc3_;
            }
            else if(_loc3_ > _loc4_)
            {
               _loc4_ = _loc3_;
            }
         }
         fromExtremes(_loc8_,_loc9_,_loc2_,_loc6_,_loc5_,_loc4_);
      }
      
      public function fromGeometry(param1:Geometry) : void
      {
         var _loc11_:* = NaN;
         var _loc2_:* = NaN;
         var _loc10_:* = NaN;
         var _loc5_:* = NaN;
         var _loc4_:* = NaN;
         var _loc6_:* = NaN;
         var _loc16_:* = null;
         var _loc3_:* = undefined;
         var _loc12_:* = 0;
         var _loc7_:* = 0;
         var _loc9_:* = 0;
         var _loc8_:* = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Vector.<ISubGeometry> = param1.subGeometries;
         var _loc15_:uint = _loc14_.length;
         if(_loc15_ > 0)
         {
            _loc16_ = _loc14_[0];
            _loc3_ = _loc16_.vertexData;
            _loc12_ = uint(_loc16_.vertexOffset);
            _loc6_ = Number(_loc3_[_loc12_]);
            _loc10_ = Number(_loc3_[_loc12_]);
            _loc5_ = Number(_loc3_[_loc12_ + 1]);
            _loc11_ = Number(_loc3_[_loc12_ + 1]);
            _loc4_ = Number(_loc3_[_loc12_ + 2]);
            _loc2_ = Number(_loc3_[_loc12_ + 2]);
            _loc7_ = uint(0);
            while(_loc7_ < _loc15_)
            {
               _loc16_ = _loc14_[_loc7_++];
               _loc3_ = _loc16_.vertexData;
               _loc9_ = uint(_loc3_.length);
               _loc12_ = uint(_loc16_.vertexOffset);
               _loc8_ = uint(_loc16_.vertexStride);
               while(_loc12_ < _loc9_)
               {
                  _loc13_ = _loc3_[_loc12_];
                  if(_loc13_ < _loc10_)
                  {
                     _loc10_ = _loc13_;
                  }
                  else if(_loc13_ > _loc6_)
                  {
                     _loc6_ = _loc13_;
                  }
                  _loc13_ = _loc3_[_loc12_ + 1];
                  if(_loc13_ < _loc11_)
                  {
                     _loc11_ = _loc13_;
                  }
                  else if(_loc13_ > _loc5_)
                  {
                     _loc5_ = _loc13_;
                  }
                  _loc13_ = _loc3_[_loc12_ + 2];
                  if(_loc13_ < _loc2_)
                  {
                     _loc2_ = _loc13_;
                  }
                  else if(_loc13_ > _loc4_)
                  {
                     _loc4_ = _loc13_;
                  }
                  _loc12_ = uint(_loc12_ + _loc8_);
               }
            }
            fromExtremes(_loc10_,_loc11_,_loc2_,_loc6_,_loc5_,_loc4_);
         }
         else
         {
            fromExtremes(0,0,0,0,0,0);
         }
      }
      
      public function fromSphere(param1:Vector3D, param2:Number) : void
      {
         fromExtremes(param1.x - param2,param1.y - param2,param1.z - param2,param1.x + param2,param1.y + param2,param1.z + param2);
      }
      
      public function fromExtremes(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         _min.x = param1;
         _min.y = param2;
         _min.z = param3;
         _max.x = param4;
         _max.y = param5;
         _max.z = param6;
         _aabbPointsDirty = true;
         if(_boundingRenderable)
         {
            updateBoundingRenderable();
         }
      }
      
      public function isInFrustum(param1:Matrix3D) : Boolean
      {
         throw new AbstractMethodError();
      }
      
      public function clone() : BoundingVolumeBase
      {
         throw new AbstractMethodError();
      }
      
      public function rayIntersection(param1:Vector3D, param2:Vector3D, param3:Vector3D) : Number
      {
         return -1;
      }
      
      public function containsPoint(param1:Vector3D) : Boolean
      {
         return false;
      }
      
      protected function updateAABBPoints() : void
      {
         var _loc4_:Number = _max.x;
         var _loc3_:Number = _max.y;
         var _loc2_:Number = _max.z;
         var _loc5_:Number = _min.x;
         var _loc6_:Number = _min.y;
         var _loc1_:Number = _min.z;
         _aabbPoints[0] = _loc5_;
         _aabbPoints[1] = _loc6_;
         _aabbPoints[2] = _loc1_;
         _aabbPoints[3] = _loc4_;
         _aabbPoints[4] = _loc6_;
         _aabbPoints[5] = _loc1_;
         _aabbPoints[6] = _loc5_;
         _aabbPoints[7] = _loc3_;
         _aabbPoints[8] = _loc1_;
         _aabbPoints[9] = _loc4_;
         _aabbPoints[10] = _loc3_;
         _aabbPoints[11] = _loc1_;
         _aabbPoints[12] = _loc5_;
         _aabbPoints[13] = _loc6_;
         _aabbPoints[14] = _loc2_;
         _aabbPoints[15] = _loc4_;
         _aabbPoints[16] = _loc6_;
         _aabbPoints[17] = _loc2_;
         _aabbPoints[18] = _loc5_;
         _aabbPoints[19] = _loc3_;
         _aabbPoints[20] = _loc2_;
         _aabbPoints[21] = _loc4_;
         _aabbPoints[22] = _loc3_;
         _aabbPoints[23] = _loc2_;
         _aabbPointsDirty = false;
      }
      
      protected function updateBoundingRenderable() : void
      {
         throw new AbstractMethodError();
      }
      
      protected function createBoundingRenderable() : WireframePrimitiveBase
      {
         throw new AbstractMethodError();
      }
      
      public function classifyToPlane(param1:Plane3D) : int
      {
         throw new AbstractMethodError();
      }
   }
}
