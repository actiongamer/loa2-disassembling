package away3d.tools.helpers
{
   import away3d.core.base.ParticleGeometry;
   import away3d.core.base.Geometry;
   import away3d.tools.helpers.data.ParticleGeometryTransform;
   import away3d.core.base.data.ParticleData;
   import away3d.core.base.CompactSubGeometry;
   import flash.geom.Vector3D;
   import flash.geom.Point;
   import away3d.core.base.ISubGeometry;
   import flash.geom.Matrix3D;
   import flash.geom.Matrix;
   import away3d.core.base.SubGeometry;
   
   public class ParticleGeometryHelper
   {
      
      public static const MAX_VERTEX:int = 65535;
       
      
      public function ParticleGeometryHelper()
      {
         super();
      }
      
      public static function generateGeometryFromCompactSubGeometry(param1:Vector.<Geometry>, param2:Vector.<ParticleGeometryTransform> = null, param3:Boolean = false) : ParticleGeometry
      {
         var _loc12_:* = undefined;
         var _loc5_:* = null;
         var _loc21_:* = 0;
         var _loc6_:* = undefined;
         var _loc31_:* = undefined;
         var _loc8_:* = 0;
         var _loc30_:* = null;
         var _loc27_:int = 0;
         var _loc24_:int = 0;
         var _loc17_:int = 0;
         var _loc33_:* = null;
         var _loc25_:int = 0;
         var _loc16_:int = 0;
         var _loc11_:* = null;
         var _loc28_:* = 0;
         var _loc15_:* = undefined;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc14_:* = null;
         var _loc22_:* = null;
         var _loc26_:* = undefined;
         var _loc29_:Vector.<Vector.<Number>> = new Vector.<Vector.<Number>>();
         var _loc23_:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>();
         var _loc13_:Vector.<uint> = new Vector.<uint>();
         var _loc35_:Vector.<ParticleData> = new Vector.<ParticleData>();
         var _loc9_:Vector.<CompactSubGeometry> = new Vector.<CompactSubGeometry>();
         var _loc34_:uint = param1.length;
         var _loc18_:Vector.<int> = new Vector.<int>();
         var _loc36_:Vector3D = new Vector3D();
         var _loc37_:Vector3D = new Vector3D();
         var _loc32_:Vector3D = new Vector3D();
         var _loc10_:Point = new Point();
         _loc27_ = 0;
         while(_loc27_ < _loc34_)
         {
            _loc12_ = param1[_loc27_].subGeometries;
            _loc21_ = uint(_loc12_.length);
            _loc17_ = 0;
            while(_loc17_ < _loc21_)
            {
               if(_loc18_.length <= _loc17_)
               {
                  _loc18_.push(_loc9_.length);
                  _loc29_.push(new Vector.<Number>());
                  _loc23_.push(new Vector.<uint>());
                  _loc9_.push(new CompactSubGeometry());
                  _loc13_.push(0);
               }
               _loc5_ = _loc12_[_loc17_];
               if(_loc5_.numVertices + _loc13_[_loc18_[_loc17_]] > 65535)
               {
                  _loc18_[_loc17_] = _loc9_.length;
                  _loc29_.push(new Vector.<Number>());
                  _loc23_.push(new Vector.<uint>());
                  _loc9_.push(new CompactSubGeometry());
                  _loc13_.push(0);
               }
               _loc24_ = _loc18_[_loc17_];
               _loc6_ = _loc29_[_loc24_];
               _loc31_ = _loc23_[_loc24_];
               _loc8_ = uint(_loc13_[_loc24_]);
               _loc30_ = _loc9_[_loc24_];
               _loc33_ = new ParticleData();
               _loc33_.numVertices = _loc5_.numVertices;
               _loc33_.startVertexIndex = _loc8_;
               _loc33_.particleIndex = _loc27_;
               _loc33_.subGeometry = _loc30_;
               _loc35_.push(_loc33_);
               var _loc38_:* = _loc24_;
               var _loc39_:* = _loc13_[_loc38_] + _loc5_.numVertices;
               _loc13_[_loc38_] = _loc39_;
               _loc11_ = _loc5_ as CompactSubGeometry;
               if(_loc11_)
               {
                  _loc16_ = _loc11_.numVertices;
                  _loc11_.numTriangles;
                  _loc15_ = _loc11_.vertexData;
                  if(param2)
                  {
                     _loc7_ = param2[_loc27_];
                     _loc4_ = _loc7_.vertexTransform;
                     _loc14_ = _loc7_.invVertexTransform;
                     _loc22_ = _loc7_.UVTransform;
                     _loc25_ = 0;
                     while(_loc25_ < _loc16_)
                     {
                        _loc28_ = uint(_loc25_ * 13);
                        _loc36_.x = _loc15_[_loc28_];
                        _loc36_.y = _loc15_[_loc28_ + 1];
                        _loc36_.z = _loc15_[_loc28_ + 2];
                        _loc37_.x = _loc15_[_loc28_ + 3];
                        _loc37_.y = _loc15_[_loc28_ + 4];
                        _loc37_.z = _loc15_[_loc28_ + 5];
                        _loc32_.x = _loc15_[_loc28_ + 6];
                        _loc32_.y = _loc15_[_loc28_ + 7];
                        _loc32_.z = _loc15_[_loc28_ + 8];
                        _loc10_.x = _loc15_[_loc28_ + 9];
                        _loc10_.y = _loc15_[_loc28_ + 10];
                        if(param3)
                        {
                           _loc15_[_loc28_ + 11] = _loc10_.x;
                           _loc15_[_loc28_ + 12] = _loc10_.y;
                        }
                        if(_loc4_)
                        {
                           _loc36_ = _loc4_.transformVector(_loc36_);
                           _loc37_ = _loc14_.deltaTransformVector(_loc37_);
                           _loc32_ = _loc14_.deltaTransformVector(_loc37_);
                        }
                        if(_loc22_)
                        {
                           _loc10_ = _loc22_.transformPoint(_loc10_);
                        }
                        _loc6_.push(_loc36_.x,_loc36_.y,_loc36_.z,_loc37_.x,_loc37_.y,_loc37_.z,_loc32_.x,_loc32_.y,_loc32_.z,_loc10_.x,_loc10_.y,_loc15_[_loc28_ + 11],_loc15_[_loc28_ + 12]);
                        _loc25_++;
                     }
                  }
                  else
                  {
                     _loc25_ = 0;
                     while(_loc25_ < _loc16_)
                     {
                        _loc28_ = uint(_loc25_ * 13);
                        if(param3)
                        {
                           _loc15_[_loc28_ + 11] = _loc15_[_loc28_ + 9];
                           _loc15_[_loc28_ + 12] = _loc15_[_loc28_ + 10];
                        }
                        _loc6_.push(_loc15_[_loc28_],_loc15_[_loc28_ + 1],_loc15_[_loc28_ + 2],_loc15_[_loc28_ + 3],_loc15_[_loc28_ + 4],_loc15_[_loc28_ + 5],_loc15_[_loc28_ + 6],_loc15_[_loc28_ + 7],_loc15_[_loc28_ + 8],_loc15_[_loc28_ + 9],_loc15_[_loc28_ + 10],_loc15_[_loc28_ + 11],_loc15_[_loc28_ + 12]);
                        _loc25_++;
                     }
                  }
               }
               _loc26_ = _loc5_.indexData;
               _loc16_ = _loc5_.numTriangles;
               _loc25_ = 0;
               while(_loc25_ < _loc16_)
               {
                  _loc28_ = uint(_loc25_ * 3);
                  _loc31_.push(_loc26_[_loc28_] + _loc8_,_loc26_[_loc28_ + 1] + _loc8_,_loc26_[_loc28_ + 2] + _loc8_);
                  _loc25_++;
               }
               _loc17_++;
            }
            _loc27_++;
         }
         var _loc20_:ParticleGeometry = new ParticleGeometry();
         _loc20_.particles = _loc35_;
         _loc20_.numParticles = _loc34_;
         _loc34_ = _loc9_.length;
         _loc27_ = 0;
         while(_loc27_ < _loc34_)
         {
            _loc30_ = _loc9_[_loc27_];
            _loc30_.updateData(_loc29_[_loc27_]);
            _loc30_.updateIndexData(_loc23_[_loc27_]);
            _loc20_.addSubGeometry(_loc30_);
            _loc27_++;
         }
         var _loc41_:int = 0;
         var _loc40_:* = param1;
         for each(var _loc19_ in param1)
         {
            _loc19_.dispose();
         }
         param1.length = 0;
         return _loc20_;
      }
      
      public static function generateGeometry(param1:Vector.<Geometry>, param2:Vector.<ParticleGeometryTransform> = null, param3:Boolean = false) : ParticleGeometry
      {
         if(param1[0].subGeometries[0] is CompactSubGeometry)
         {
            return generateGeometryFromCompactSubGeometry(param1,param2,param3);
         }
         return generateGeometryFromSubGeometry(param1,param2,param3);
      }
      
      public static function generateGeometryFromSubGeometry(param1:Vector.<Geometry>, param2:Vector.<ParticleGeometryTransform> = null, param3:Boolean = false) : ParticleGeometry
      {
         var _loc13_:* = undefined;
         var _loc6_:* = null;
         var _loc22_:* = 0;
         var _loc7_:* = undefined;
         var _loc36_:* = undefined;
         var _loc34_:* = undefined;
         var _loc9_:* = 0;
         var _loc32_:* = null;
         var _loc28_:int = 0;
         var _loc25_:int = 0;
         var _loc16_:int = 0;
         var _loc35_:* = null;
         var _loc26_:int = 0;
         var _loc17_:int = 0;
         var _loc27_:* = null;
         var _loc30_:* = 0;
         var _loc18_:* = undefined;
         var _loc12_:* = undefined;
         var _loc29_:* = undefined;
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc15_:* = null;
         var _loc24_:* = null;
         var _loc31_:Vector.<Vector.<Number>> = new Vector.<Vector.<Number>>();
         var _loc4_:Vector.<Vector.<Number>> = new Vector.<Vector.<Number>>();
         var _loc23_:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>();
         var _loc14_:Vector.<uint> = new Vector.<uint>();
         var _loc39_:Vector.<ParticleData> = new Vector.<ParticleData>();
         var _loc11_:Vector.<SubGeometry> = new Vector.<SubGeometry>();
         var _loc38_:uint = param1.length;
         var _loc19_:Vector.<int> = new Vector.<int>();
         var _loc37_:Vector3D = new Vector3D();
         var _loc40_:Vector3D = new Vector3D();
         var _loc33_:Vector3D = new Vector3D();
         var _loc10_:Point = new Point();
         _loc28_ = 0;
         while(_loc28_ < _loc38_)
         {
            _loc13_ = param1[_loc28_].subGeometries;
            _loc22_ = uint(_loc13_.length);
            _loc16_ = 0;
            while(_loc16_ < _loc22_)
            {
               if(_loc19_.length <= _loc16_)
               {
                  _loc19_.push(_loc11_.length);
                  _loc31_.push(new Vector.<Number>());
                  _loc4_.push(new Vector.<Number>());
                  _loc23_.push(new Vector.<uint>());
                  _loc11_.push(new SubGeometry());
                  _loc14_.push(0);
               }
               _loc6_ = _loc13_[_loc16_] as SubGeometry;
               if(_loc6_.numVertices + _loc14_[_loc19_[_loc16_]] > 65535)
               {
                  _loc19_[_loc16_] = _loc11_.length;
                  _loc31_.push(new Vector.<Number>());
                  _loc4_.push(new Vector.<Number>());
                  _loc23_.push(new Vector.<uint>());
                  _loc11_.push(new SubGeometry());
                  _loc14_.push(0);
               }
               _loc25_ = _loc19_[_loc16_];
               _loc7_ = _loc31_[_loc25_];
               _loc36_ = _loc4_[_loc25_];
               _loc34_ = _loc23_[_loc25_];
               _loc9_ = uint(_loc14_[_loc25_]);
               _loc32_ = _loc11_[_loc25_];
               _loc35_ = new ParticleData();
               _loc35_.numVertices = _loc6_.numVertices;
               _loc35_.startVertexIndex = _loc9_;
               _loc35_.particleIndex = _loc28_;
               _loc35_.subGeometry = _loc32_;
               _loc39_.push(_loc35_);
               _loc14_[_loc25_] = _loc14_[_loc25_] + _loc6_.numVertices;
               _loc27_ = _loc6_ as SubGeometry;
               if(_loc27_)
               {
                  _loc17_ = _loc27_.numVertices;
                  _loc27_.numTriangles;
                  _loc18_ = _loc27_.vertexData;
                  _loc12_ = _loc27_.UVData;
                  _loc8_ = !!param2?param2[_loc28_]:null;
                  _loc5_ = !!_loc8_?_loc8_.vertexTransform:null;
                  _loc15_ = !!_loc8_?_loc8_.invVertexTransform:null;
                  _loc24_ = !!_loc8_?_loc8_.UVTransform:null;
                  _loc26_ = 0;
                  while(_loc26_ < _loc17_)
                  {
                     _loc30_ = uint(_loc26_ * 3);
                     _loc37_.x = _loc18_[_loc30_];
                     _loc37_.y = _loc18_[_loc30_ + 1];
                     _loc37_.z = _loc18_[_loc30_ + 2];
                     _loc10_.x = _loc12_[_loc26_ * 2];
                     _loc10_.y = _loc12_[_loc26_ * 2 + 1];
                     if(_loc5_)
                     {
                        _loc37_ = _loc5_.transformVector(_loc37_);
                        _loc40_ = _loc15_.deltaTransformVector(_loc40_);
                        _loc33_ = _loc15_.deltaTransformVector(_loc40_);
                     }
                     if(_loc24_)
                     {
                        _loc10_ = _loc24_.transformPoint(_loc10_);
                     }
                     _loc7_.push(_loc37_.x,_loc37_.y,_loc37_.z);
                     _loc36_.push(_loc10_.x,_loc10_.y);
                     _loc26_++;
                  }
               }
               _loc29_ = _loc6_.indexData;
               _loc17_ = _loc6_.numTriangles;
               _loc26_ = 0;
               while(_loc26_ < _loc17_)
               {
                  _loc30_ = uint(_loc26_ * 3);
                  _loc34_.push(_loc29_[_loc30_] + _loc9_,_loc29_[_loc30_ + 1] + _loc9_,_loc29_[_loc30_ + 2] + _loc9_);
                  _loc26_++;
               }
               _loc16_++;
            }
            _loc28_++;
         }
         var _loc21_:ParticleGeometry = new ParticleGeometry();
         _loc21_.particles = _loc39_;
         _loc21_.numParticles = _loc38_;
         _loc38_ = _loc11_.length;
         _loc28_ = 0;
         while(_loc28_ < _loc38_)
         {
            _loc32_ = _loc11_[_loc28_];
            _loc32_.updateVertexData(_loc31_[_loc28_]);
            _loc32_.updateUVData(_loc4_[_loc28_]);
            if(param3)
            {
               _loc32_.updateSecondaryUVData(_loc4_[_loc28_]);
            }
            _loc32_.updateIndexData(_loc23_[_loc28_]);
            _loc21_.addSubGeometry(_loc32_);
            _loc28_++;
         }
         var _loc42_:int = 0;
         var _loc41_:* = param1;
         for each(var _loc20_ in param1)
         {
            _loc20_.dispose();
         }
         param1.length = 0;
         return _loc21_;
      }
   }
}
