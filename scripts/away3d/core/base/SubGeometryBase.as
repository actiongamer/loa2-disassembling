package away3d.core.base
{
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Context3D;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.VertexBuffer3D;
   import away3d.errors.AbstractMethodError;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   
   public class SubGeometryBase
   {
       
      
      private var _parentGeometry:away3d.core.base.Geometry;
      
      protected var _vertexData:Vector.<Number>;
      
      protected var _faceNormalsDirty:Boolean = true;
      
      protected var _faceTangentsDirty:Boolean = true;
      
      protected var _faceTangents:Vector.<Number>;
      
      protected var _indices:Vector.<uint>;
      
      protected var _indexBuffer:Vector.<IndexBuffer3D>;
      
      protected var _numIndices:uint;
      
      protected var _indexBufferContext:Vector.<Context3D>;
      
      protected var _indicesInvalid:Vector.<Boolean>;
      
      protected var _numTriangles:uint;
      
      protected var _autoDeriveVertexNormals:Boolean = true;
      
      protected var _autoDeriveVertexTangents:Boolean = true;
      
      protected var _autoGenerateUVs:Boolean = false;
      
      private var _useFaceWeights:Boolean = false;
      
      protected var _vertexNormalsDirty:Boolean = true;
      
      protected var _vertexTangentsDirty:Boolean = true;
      
      protected var _faceNormals:Vector.<Number>;
      
      protected var _faceWeights:Vector.<Number>;
      
      private var _scaleU:Number = 1;
      
      private var _scaleV:Number = 1;
      
      protected var _uvsDirty:Boolean = true;
      
      public function SubGeometryBase()
      {
         _indexBuffer = new Vector.<IndexBuffer3D>(8);
         _indexBufferContext = new Vector.<Context3D>(8);
         _indicesInvalid = new Vector.<Boolean>(8,true);
         super();
      }
      
      public function get autoGenerateDummyUVs() : Boolean
      {
         return _autoGenerateUVs;
      }
      
      public function set autoGenerateDummyUVs(param1:Boolean) : void
      {
         _autoGenerateUVs = param1;
         _uvsDirty = param1;
      }
      
      public function get autoDeriveVertexNormals() : Boolean
      {
         return _autoDeriveVertexNormals;
      }
      
      public function set autoDeriveVertexNormals(param1:Boolean) : void
      {
         _autoDeriveVertexNormals = param1;
         _vertexNormalsDirty = param1;
      }
      
      public function get useFaceWeights() : Boolean
      {
         return _useFaceWeights;
      }
      
      public function set useFaceWeights(param1:Boolean) : void
      {
         _useFaceWeights = param1;
         if(_autoDeriveVertexNormals)
         {
            _vertexNormalsDirty = true;
         }
         if(_autoDeriveVertexTangents)
         {
            _vertexTangentsDirty = true;
         }
         _faceNormalsDirty = true;
      }
      
      public function get numTriangles() : uint
      {
         return _numTriangles;
      }
      
      public function getIndexBuffer(param1:Stage3DProxy) : IndexBuffer3D
      {
         var _loc3_:int = param1._stage3DIndex;
         var _loc2_:Context3D = param1._context3D;
         if(!_indexBuffer[_loc3_] || _indexBufferContext[_loc3_] != _loc2_)
         {
            _indexBuffer[_loc3_] = _loc2_.createIndexBuffer(_numIndices);
            _indexBufferContext[_loc3_] = _loc2_;
            _indicesInvalid[_loc3_] = true;
         }
         if(_indicesInvalid[_loc3_])
         {
            _indexBuffer[_loc3_].uploadFromVector(_indices,0,_numIndices);
            _indicesInvalid[_loc3_] = false;
         }
         return _indexBuffer[_loc3_];
      }
      
      protected function updateFaceTangents() : void
      {
         var _loc24_:int = 0;
         var _loc27_:* = 0;
         var _loc28_:* = 0;
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         var _loc12_:* = 0;
         var _loc1_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:uint = _indices.length;
         var _loc5_:Vector.<Number> = _vertexData;
         var _loc29_:Vector.<Number> = UVData;
         var _loc11_:int = vertexStride;
         var _loc23_:int = vertexOffset;
         var _loc26_:int = UVStride;
         var _loc25_:int = UVOffset;
         if(!_faceTangents)
         {
            _faceTangents = new Vector.<Number>(_indices.length,true);
         }
         while(_loc24_ < _loc19_)
         {
            _loc4_ = uint(_indices[_loc24_]);
            _loc27_ = uint(_indices[_loc24_ + 1]);
            _loc28_ = uint(_indices[_loc24_ + 2]);
            _loc12_ = uint(_loc25_ + _loc4_ * _loc26_ + 1);
            _loc1_ = _loc29_[_loc12_];
            _loc12_ = uint(_loc25_ + _loc27_ * _loc26_ + 1);
            _loc10_ = _loc29_[_loc12_] - _loc1_;
            _loc12_ = uint(_loc25_ + _loc28_ * _loc26_ + 1);
            _loc21_ = _loc29_[_loc12_] - _loc1_;
            _loc3_ = uint(_loc23_ + _loc4_ * _loc11_);
            _loc8_ = _loc5_[_loc3_];
            _loc13_ = _loc5_[uint(_loc3_ + 1)];
            _loc2_ = _loc5_[uint(_loc3_ + 2)];
            _loc3_ = uint(_loc23_ + _loc27_ * _loc11_);
            _loc15_ = _loc5_[uint(_loc3_)] - _loc8_;
            _loc6_ = _loc5_[uint(_loc3_ + 1)] - _loc13_;
            _loc20_ = _loc5_[uint(_loc3_ + 2)] - _loc2_;
            _loc3_ = uint(_loc23_ + _loc28_ * _loc11_);
            _loc17_ = _loc5_[uint(_loc3_)] - _loc8_;
            _loc7_ = _loc5_[uint(_loc3_ + 1)] - _loc13_;
            _loc22_ = _loc5_[uint(_loc3_ + 2)] - _loc2_;
            _loc18_ = _loc21_ * _loc15_ - _loc10_ * _loc17_;
            _loc16_ = _loc21_ * _loc6_ - _loc10_ * _loc7_;
            _loc14_ = _loc21_ * _loc20_ - _loc10_ * _loc22_;
            _loc9_ = 1 / Math.sqrt(_loc18_ * _loc18_ + _loc16_ * _loc16_ + _loc14_ * _loc14_);
            _faceTangents[_loc24_++] = _loc9_ * _loc18_;
            _faceTangents[_loc24_++] = _loc9_ * _loc16_;
            _faceTangents[_loc24_++] = _loc9_ * _loc14_;
         }
         _faceTangentsDirty = false;
      }
      
      private function updateFaceNormals() : void
      {
         var _loc23_:int = 0;
         var _loc25_:int = 0;
         var _loc27_:int = 0;
         var _loc11_:* = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc28_:* = NaN;
         var _loc21_:uint = _indices.length;
         var _loc2_:Vector.<Number> = _vertexData;
         var _loc10_:int = vertexStride;
         var _loc26_:int = vertexOffset;
         if(!_faceNormals)
         {
            _faceNormals = new Vector.<Number>(_loc21_,true);
         }
         if(_useFaceWeights)
         {
            if(!_faceWeights)
            {
               _faceWeights = new Vector.<Number>(_loc21_ / 3,true);
            }
         }
         while(_loc27_ < _loc21_)
         {
            _loc11_ = uint(_loc26_ + _indices[_loc27_++] * _loc10_);
            _loc9_ = _loc2_[_loc11_];
            _loc13_ = _loc2_[_loc11_ + 1];
            _loc1_ = _loc2_[_loc11_ + 2];
            _loc11_ = uint(_loc26_ + _indices[_loc27_++] * _loc10_);
            _loc7_ = _loc2_[_loc11_];
            _loc15_ = _loc2_[_loc11_ + 1];
            _loc3_ = _loc2_[_loc11_ + 2];
            _loc11_ = uint(_loc26_ + _indices[_loc27_++] * _loc10_);
            _loc8_ = _loc2_[_loc11_];
            _loc18_ = _loc2_[_loc11_ + 1];
            _loc5_ = _loc2_[_loc11_ + 2];
            _loc16_ = _loc8_ - _loc9_;
            _loc4_ = _loc18_ - _loc13_;
            _loc22_ = _loc5_ - _loc1_;
            _loc19_ = _loc7_ - _loc9_;
            _loc6_ = _loc15_ - _loc13_;
            _loc24_ = _loc3_ - _loc1_;
            _loc20_ = _loc22_ * _loc6_ - _loc4_ * _loc24_;
            _loc17_ = _loc16_ * _loc24_ - _loc22_ * _loc19_;
            _loc14_ = _loc4_ * _loc19_ - _loc16_ * _loc6_;
            _loc12_ = Math.sqrt(_loc20_ * _loc20_ + _loc17_ * _loc17_ + _loc14_ * _loc14_);
            if(_useFaceWeights)
            {
               _loc28_ = Number(_loc12_ * 10000);
               if(_loc28_ < 1)
               {
                  _loc28_ = 1;
               }
               _faceWeights[_loc25_++] = _loc28_;
            }
            _loc12_ = 1 / _loc12_;
            _faceNormals[_loc23_++] = _loc20_ * _loc12_;
            _faceNormals[_loc23_++] = _loc17_ * _loc12_;
            _faceNormals[_loc23_++] = _loc14_ * _loc12_;
         }
         _faceNormalsDirty = false;
      }
      
      protected function updateVertexNormals(param1:Vector.<Number>) : Vector.<Number>
      {
         var _loc2_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:Number = NaN;
         if(_faceNormalsDirty)
         {
            updateFaceNormals();
         }
         var _loc14_:uint = 0;
         var _loc17_:uint = 1;
         var _loc16_:uint = 2;
         var _loc12_:uint = _vertexData.length;
         var _loc15_:int = vertexNormalStride;
         var _loc9_:int = vertexNormalOffset;
         if(!param1)
         {
            param1 = new Vector.<Number>(_loc12_,true);
         }
         _loc2_ = uint(_loc9_);
         while(_loc2_ < _loc12_)
         {
            param1[_loc2_] = 0;
            param1[_loc2_ + 1] = 0;
            param1[_loc2_ + 2] = 0;
            _loc2_ = uint(_loc2_ + _loc15_);
         }
         var _loc6_:uint = _indices.length;
         while(_loc8_ < _loc6_)
         {
            _loc5_ = !!_useFaceWeights?_faceWeights[_loc7_++]:1;
            _loc4_ = uint(_loc9_ + _indices[_loc8_++] * _loc15_);
            var _loc18_:* = _loc4_++;
            var _loc19_:* = param1[_loc18_] + _faceNormals[_loc14_] * _loc5_;
            param1[_loc18_] = _loc19_;
            _loc19_ = _loc4_++;
            _loc18_ = param1[_loc19_] + _faceNormals[_loc17_] * _loc5_;
            param1[_loc19_] = _loc18_;
            _loc18_ = _loc4_;
            _loc19_ = param1[_loc18_] + _faceNormals[_loc16_] * _loc5_;
            param1[_loc18_] = _loc19_;
            _loc4_ = uint(_loc9_ + _indices[_loc8_++] * _loc15_);
            _loc19_ = _loc4_++;
            _loc18_ = param1[_loc19_] + _faceNormals[_loc14_] * _loc5_;
            param1[_loc19_] = _loc18_;
            _loc18_ = _loc4_++;
            _loc19_ = param1[_loc18_] + _faceNormals[_loc17_] * _loc5_;
            param1[_loc18_] = _loc19_;
            _loc19_ = _loc4_;
            _loc18_ = param1[_loc19_] + _faceNormals[_loc16_] * _loc5_;
            param1[_loc19_] = _loc18_;
            _loc4_ = uint(_loc9_ + _indices[_loc8_++] * _loc15_);
            _loc18_ = _loc4_++;
            _loc19_ = param1[_loc18_] + _faceNormals[_loc14_] * _loc5_;
            param1[_loc18_] = _loc19_;
            _loc19_ = _loc4_++;
            _loc18_ = param1[_loc19_] + _faceNormals[_loc17_] * _loc5_;
            param1[_loc19_] = _loc18_;
            _loc18_ = _loc4_;
            _loc19_ = param1[_loc18_] + _faceNormals[_loc16_] * _loc5_;
            param1[_loc18_] = _loc19_;
            _loc14_ = _loc14_ + 3;
            _loc17_ = _loc17_ + 3;
            _loc16_ = _loc16_ + 3;
         }
         _loc2_ = uint(_loc9_);
         while(_loc2_ < _loc12_)
         {
            _loc11_ = param1[_loc2_];
            _loc10_ = param1[_loc2_ + 1];
            _loc13_ = param1[_loc2_ + 2];
            _loc3_ = 1 / Math.sqrt(_loc11_ * _loc11_ + _loc10_ * _loc10_ + _loc13_ * _loc13_);
            param1[_loc2_] = _loc11_ * _loc3_;
            param1[_loc2_ + 1] = _loc10_ * _loc3_;
            param1[_loc2_ + 2] = _loc13_ * _loc3_;
            _loc2_ = uint(_loc2_ + _loc15_);
         }
         _vertexNormalsDirty = false;
         return param1;
      }
      
      protected function updateVertexTangents(param1:Vector.<Number>) : Vector.<Number>
      {
         var _loc7_:* = 0;
         var _loc6_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:Number = NaN;
         if(_faceTangentsDirty)
         {
            updateFaceTangents();
         }
         var _loc9_:uint = _vertexData.length;
         var _loc12_:int = vertexTangentStride;
         var _loc16_:int = vertexTangentOffset;
         if(!param1)
         {
            param1 = new Vector.<Number>(_loc9_,true);
         }
         _loc7_ = uint(_loc16_);
         while(_loc7_ < _loc9_)
         {
            param1[_loc7_] = 0;
            param1[_loc7_ + 1] = 0;
            param1[_loc7_ + 2] = 0;
            _loc7_ = uint(_loc7_ + _loc12_);
         }
         var _loc5_:uint = _indices.length;
         var _loc13_:uint = 0;
         var _loc15_:uint = 1;
         var _loc14_:uint = 2;
         _loc7_ = uint(0);
         while(_loc7_ < _loc5_)
         {
            _loc4_ = !!_useFaceWeights?_faceWeights[_loc6_++]:1;
            _loc3_ = uint(_loc16_ + _indices[_loc7_++] * _loc12_);
            var _loc17_:* = _loc3_++;
            var _loc18_:* = param1[_loc17_] + _faceTangents[_loc13_] * _loc4_;
            param1[_loc17_] = _loc18_;
            _loc18_ = _loc3_++;
            _loc17_ = param1[_loc18_] + _faceTangents[_loc15_] * _loc4_;
            param1[_loc18_] = _loc17_;
            _loc17_ = _loc3_;
            _loc18_ = param1[_loc17_] + _faceTangents[_loc14_] * _loc4_;
            param1[_loc17_] = _loc18_;
            _loc3_ = uint(_loc16_ + _indices[_loc7_++] * _loc12_);
            _loc18_ = _loc3_++;
            _loc17_ = param1[_loc18_] + _faceTangents[_loc13_] * _loc4_;
            param1[_loc18_] = _loc17_;
            _loc17_ = _loc3_++;
            _loc18_ = param1[_loc17_] + _faceTangents[_loc15_] * _loc4_;
            param1[_loc17_] = _loc18_;
            _loc18_ = _loc3_;
            _loc17_ = param1[_loc18_] + _faceTangents[_loc14_] * _loc4_;
            param1[_loc18_] = _loc17_;
            _loc3_ = uint(_loc16_ + _indices[_loc7_++] * _loc12_);
            _loc17_ = _loc3_++;
            _loc18_ = param1[_loc17_] + _faceTangents[_loc13_] * _loc4_;
            param1[_loc17_] = _loc18_;
            _loc18_ = _loc3_++;
            _loc17_ = param1[_loc18_] + _faceTangents[_loc15_] * _loc4_;
            param1[_loc18_] = _loc17_;
            _loc17_ = _loc3_;
            _loc18_ = param1[_loc17_] + _faceTangents[_loc14_] * _loc4_;
            param1[_loc17_] = _loc18_;
            _loc13_ = _loc13_ + 3;
            _loc15_ = _loc15_ + 3;
            _loc14_ = _loc14_ + 3;
         }
         _loc7_ = uint(_loc16_);
         while(_loc7_ < _loc9_)
         {
            _loc10_ = param1[_loc7_];
            _loc8_ = param1[_loc7_ + 1];
            _loc11_ = param1[_loc7_ + 2];
            _loc2_ = 1 / Math.sqrt(_loc10_ * _loc10_ + _loc8_ * _loc8_ + _loc11_ * _loc11_);
            param1[_loc7_] = _loc10_ * _loc2_;
            param1[_loc7_ + 1] = _loc8_ * _loc2_;
            param1[_loc7_ + 2] = _loc11_ * _loc2_;
            _loc7_ = uint(_loc7_ + _loc12_);
         }
         _vertexTangentsDirty = false;
         return param1;
      }
      
      public function dispose() : void
      {
         disposeIndexBuffers(_indexBuffer);
         _indices = null;
         _indexBufferContext = null;
         _faceNormals = null;
         _faceWeights = null;
         _faceTangents = null;
         _vertexData = null;
      }
      
      public function get indexData() : Vector.<uint>
      {
         return _indices;
      }
      
      public function updateIndexData(param1:Vector.<uint>) : void
      {
         _indices = param1;
         _numIndices = param1.length;
         var _loc2_:int = _numIndices / 3;
         if(_numTriangles != _loc2_)
         {
            disposeIndexBuffers(_indexBuffer);
         }
         _numTriangles = _loc2_;
         invalidateBuffers(_indicesInvalid);
         _faceNormalsDirty = true;
         if(_autoDeriveVertexNormals)
         {
            _vertexNormalsDirty = true;
         }
         if(_autoDeriveVertexTangents)
         {
            _vertexTangentsDirty = true;
         }
      }
      
      protected function disposeIndexBuffers(param1:Vector.<IndexBuffer3D>) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            if(param1[_loc2_])
            {
               param1[_loc2_].dispose();
               param1[_loc2_] = null;
            }
            _loc2_++;
         }
      }
      
      protected function disposeVertexBuffers(param1:Vector.<VertexBuffer3D>) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            if(param1[_loc2_])
            {
               param1[_loc2_].dispose();
               param1[_loc2_] = null;
            }
            _loc2_++;
         }
      }
      
      public function get autoDeriveVertexTangents() : Boolean
      {
         return _autoDeriveVertexTangents;
      }
      
      public function set autoDeriveVertexTangents(param1:Boolean) : void
      {
         _autoDeriveVertexTangents = param1;
         _vertexTangentsDirty = param1;
      }
      
      public function get faceNormals() : Vector.<Number>
      {
         if(_faceNormalsDirty)
         {
            updateFaceNormals();
         }
         return _faceNormals;
      }
      
      protected function invalidateBuffers(param1:Vector.<Boolean>) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            param1[_loc2_] = true;
            _loc2_++;
         }
      }
      
      public function get UVStride() : uint
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexData() : Vector.<Number>
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexPositionData() : Vector.<Number>
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexNormalData() : Vector.<Number>
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexTangentData() : Vector.<Number>
      {
         throw new AbstractMethodError();
      }
      
      public function get UVData() : Vector.<Number>
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexStride() : uint
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexNormalStride() : uint
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexTangentStride() : uint
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexOffset() : int
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexNormalOffset() : int
      {
         throw new AbstractMethodError();
      }
      
      public function get vertexTangentOffset() : int
      {
         throw new AbstractMethodError();
      }
      
      public function get UVOffset() : int
      {
         throw new AbstractMethodError();
      }
      
      protected function invalidateBounds() : void
      {
         if(_parentGeometry)
         {
            _parentGeometry.invalidateBounds(ISubGeometry(this));
         }
      }
      
      public function get parentGeometry() : away3d.core.base.Geometry
      {
         return _parentGeometry;
      }
      
      public function set parentGeometry(param1:away3d.core.base.Geometry) : void
      {
         _parentGeometry = param1;
      }
      
      public function get scaleU() : Number
      {
         return _scaleU;
      }
      
      public function get scaleV() : Number
      {
         return _scaleV;
      }
      
      public function scaleUV(param1:Number = 1, param2:Number = 1) : void
      {
         var _loc8_:* = 0;
         var _loc5_:int = UVOffset;
         var _loc6_:int = UVStride;
         var _loc4_:Vector.<Number> = UVData;
         var _loc3_:int = _loc4_.length;
         var _loc9_:Number = param1 / _scaleU;
         var _loc7_:Number = param2 / _scaleV;
         _loc8_ = uint(_loc5_);
         while(_loc8_ < _loc3_)
         {
            var _loc10_:* = _loc8_;
            var _loc11_:* = _loc4_[_loc10_] * _loc9_;
            _loc4_[_loc10_] = _loc11_;
            _loc11_ = _loc8_ + 1;
            _loc10_ = _loc4_[_loc11_] * _loc7_;
            _loc4_[_loc11_] = _loc10_;
            _loc8_ = uint(_loc8_ + _loc6_);
         }
         _scaleU = param1;
         _scaleV = param2;
      }
      
      public function scale(param1:Number) : void
      {
         var _loc6_:* = 0;
         var _loc2_:Vector.<Number> = UVData;
         var _loc3_:uint = _loc2_.length;
         var _loc4_:int = vertexOffset;
         var _loc5_:int = vertexStride;
         _loc6_ = uint(_loc4_);
         while(_loc6_ < _loc3_)
         {
            var _loc7_:* = _loc6_;
            var _loc8_:* = _loc2_[_loc7_] * param1;
            _loc2_[_loc7_] = _loc8_;
            _loc8_ = _loc6_ + 1;
            _loc7_ = _loc2_[_loc8_] * param1;
            _loc2_[_loc8_] = _loc7_;
            _loc7_ = _loc6_ + 2;
            _loc8_ = _loc2_[_loc7_] * param1;
            _loc2_[_loc7_] = _loc8_;
            _loc6_ = uint(_loc6_ + _loc5_);
         }
      }
      
      public function applyTransformation(param1:Matrix3D) : void
      {
         var _loc21_:* = 0;
         var _loc19_:* = 0;
         var _loc9_:* = 0;
         var _loc13_:* = null;
         var _loc4_:Vector.<Number> = _vertexData;
         var _loc12_:Vector.<Number> = vertexNormalData;
         var _loc5_:Vector.<Number> = vertexTangentData;
         var _loc18_:int = vertexStride;
         var _loc17_:int = vertexNormalStride;
         var _loc16_:int = vertexTangentStride;
         var _loc8_:int = vertexOffset;
         var _loc10_:int = vertexNormalOffset;
         var _loc20_:int = vertexTangentOffset;
         var _loc7_:uint = _loc4_.length / _loc18_;
         var _loc15_:Vector3D = new Vector3D();
         var _loc14_:* = _loc12_ != null;
         var _loc6_:* = _loc5_ != null;
         if(_loc14_ || _loc6_)
         {
            _loc13_ = param1.clone();
            _loc13_.invert();
            _loc13_.transpose();
         }
         var _loc11_:* = _loc8_;
         var _loc2_:* = _loc10_;
         var _loc3_:* = _loc20_;
         _loc9_ = uint(0);
         while(_loc9_ < _loc7_)
         {
            _loc21_ = uint(_loc11_ + 1);
            _loc19_ = uint(_loc11_ + 2);
            _loc15_.x = _loc4_[_loc11_];
            _loc15_.y = _loc4_[_loc21_];
            _loc15_.z = _loc4_[_loc19_];
            _loc15_ = param1.transformVector(_loc15_);
            _loc4_[_loc11_] = _loc15_.x;
            _loc4_[_loc21_] = _loc15_.y;
            _loc4_[_loc19_] = _loc15_.z;
            _loc11_ = int(_loc11_ + _loc18_);
            if(_loc14_)
            {
               _loc21_ = uint(_loc2_ + 1);
               _loc19_ = uint(_loc2_ + 2);
               _loc15_.x = _loc12_[_loc2_];
               _loc15_.y = _loc12_[_loc21_];
               _loc15_.z = _loc12_[_loc19_];
               _loc15_ = _loc13_.deltaTransformVector(_loc15_);
               _loc15_.normalize();
               _loc12_[_loc2_] = _loc15_.x;
               _loc12_[_loc21_] = _loc15_.y;
               _loc12_[_loc19_] = _loc15_.z;
               _loc2_ = int(_loc2_ + _loc17_);
            }
            if(_loc6_)
            {
               _loc21_ = uint(_loc3_ + 1);
               _loc19_ = uint(_loc3_ + 2);
               _loc15_.x = _loc5_[_loc3_];
               _loc15_.y = _loc5_[_loc21_];
               _loc15_.z = _loc5_[_loc19_];
               _loc15_ = _loc13_.deltaTransformVector(_loc15_);
               _loc15_.normalize();
               _loc5_[_loc3_] = _loc15_.x;
               _loc5_[_loc21_] = _loc15_.y;
               _loc5_[_loc19_] = _loc15_.z;
               _loc3_ = int(_loc3_ + _loc16_);
            }
            _loc9_++;
         }
      }
      
      protected function updateDummyUVs(param1:Vector.<Number>) : Vector.<Number>
      {
         var _loc6_:* = 0;
         var _loc2_:* = 0;
         _uvsDirty = false;
         var _loc5_:int = UVStride;
         var _loc4_:int = _loc5_ - 2;
         var _loc3_:uint = _vertexData.length / vertexStride * _loc5_;
         if(!param1)
         {
            param1 = new Vector.<Number>();
         }
         param1.fixed = false;
         param1.length = _loc3_;
         param1.fixed = true;
         _loc2_ = uint(UVOffset);
         _loc6_ = uint(0);
         while(_loc2_ < _loc3_)
         {
            param1[_loc2_++] = _loc6_ * 0.5;
            param1[_loc2_++] = 1 - (_loc6_ & 1);
            _loc2_ = uint(_loc2_ + _loc4_);
            if(++_loc6_ == 3)
            {
               _loc6_ = uint(0);
            }
         }
         return param1;
      }
   }
}
