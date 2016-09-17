package away3d.core.base
{
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.Context3D;
   import away3d.core.managers.Stage3DProxy;
   import flash.geom.Matrix3D;
   
   public class CompactSubGeometry extends SubGeometryBase implements ISubGeometry
   {
       
      
      protected var _vertexDataInvalid:Vector.<Boolean>;
      
      protected var _vertexBuffer:Vector.<VertexBuffer3D>;
      
      protected var _bufferContext:Vector.<Context3D>;
      
      protected var _numVertices:uint;
      
      protected var _contextIndex:int;
      
      protected var _activeBuffer:VertexBuffer3D;
      
      protected var _activeContext:Context3D;
      
      protected var _activeDataInvalid:Boolean;
      
      public function CompactSubGeometry()
      {
         _vertexDataInvalid = new Vector.<Boolean>(8,true);
         _vertexBuffer = new Vector.<VertexBuffer3D>(8);
         _bufferContext = new Vector.<Context3D>(8);
         super();
         _autoDeriveVertexNormals = false;
         _autoDeriveVertexTangents = false;
      }
      
      public function get numVertices() : uint
      {
         return _numVertices;
      }
      
      public function updateData(param1:Vector.<Number>) : void
      {
         if(_autoDeriveVertexNormals)
         {
            _vertexNormalsDirty = true;
         }
         if(_autoDeriveVertexTangents)
         {
            _vertexTangentsDirty = true;
         }
         _faceNormalsDirty = true;
         _faceTangentsDirty = true;
         _vertexData = param1;
         var _loc2_:int = _vertexData.length / 13;
         if(_loc2_ != _numVertices)
         {
            disposeVertexBuffers(_vertexBuffer);
         }
         _numVertices = _loc2_;
         invalidateBuffers(_vertexDataInvalid);
         invalidateBounds();
      }
      
      public function activateVertexBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_loc4_ != _contextIndex)
         {
            updateActiveBuffer(_loc4_);
         }
         if(!_activeBuffer || _activeContext != _loc3_)
         {
            createBuffer(_loc4_,_loc3_);
         }
         if(_activeDataInvalid)
         {
            uploadData(_loc4_);
         }
         _loc3_.setVertexBufferAt(param1,_activeBuffer,0,"float3");
      }
      
      public final function activateUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_uvsDirty && _autoGenerateUVs)
         {
            _vertexData = updateDummyUVs(_vertexData);
            invalidateBuffers(_vertexDataInvalid);
         }
         if(_loc4_ != _contextIndex)
         {
            updateActiveBuffer(_loc4_);
         }
         if(!_activeBuffer || _activeContext != _loc3_)
         {
            createBuffer(_loc4_,_loc3_);
         }
         if(_activeDataInvalid)
         {
            uploadData(_loc4_);
         }
         _loc3_.setVertexBufferAt(param1,_activeBuffer,9,"float2");
      }
      
      public function activateSecondaryUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_loc4_ != _contextIndex)
         {
            updateActiveBuffer(_loc4_);
         }
         if(!_activeBuffer || _activeContext != _loc3_)
         {
            createBuffer(_loc4_,_loc3_);
         }
         if(_activeDataInvalid)
         {
            uploadData(_loc4_);
         }
         _loc3_.setVertexBufferAt(param1,_activeBuffer,11,"float2");
      }
      
      protected function uploadData(param1:int) : void
      {
         _activeBuffer.uploadFromVector(_vertexData,0,_numVertices);
         _activeDataInvalid = false;
         _vertexDataInvalid[param1] = false;
      }
      
      public function activateVertexNormalBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_loc4_ != _contextIndex)
         {
            updateActiveBuffer(_loc4_);
         }
         if(!_activeBuffer || _activeContext != _loc3_)
         {
            createBuffer(_loc4_,_loc3_);
         }
         if(_activeDataInvalid)
         {
            uploadData(_loc4_);
         }
         _loc3_.setVertexBufferAt(param1,_activeBuffer,3,"float3");
      }
      
      public function activateVertexTangentBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_loc4_ != _contextIndex)
         {
            updateActiveBuffer(_loc4_);
         }
         if(!_activeBuffer || _activeContext != _loc3_)
         {
            createBuffer(_loc4_,_loc3_);
         }
         if(_activeDataInvalid)
         {
            uploadData(_loc4_);
         }
         _loc3_.setVertexBufferAt(param1,_activeBuffer,6,"float3");
      }
      
      protected function createBuffer(param1:int, param2:Context3D) : void
      {
         _activeBuffer = param2.createVertexBuffer(_numVertices,13);
         _vertexBuffer[param1] = param2.createVertexBuffer(_numVertices,13);
         _activeContext = param2;
         _bufferContext[param1] = param2;
         _activeDataInvalid = true;
         _vertexDataInvalid[param1] = true;
      }
      
      protected function updateActiveBuffer(param1:int) : void
      {
         _contextIndex = param1;
         _activeDataInvalid = _vertexDataInvalid[param1];
         _activeBuffer = _vertexBuffer[param1];
         _activeContext = _bufferContext[param1];
      }
      
      override public final function get vertexData() : Vector.<Number>
      {
         if(_autoDeriveVertexNormals && _vertexNormalsDirty)
         {
            _vertexData = updateVertexNormals(_vertexData);
         }
         if(_autoDeriveVertexTangents && _vertexTangentsDirty)
         {
            _vertexData = updateVertexTangents(_vertexData);
         }
         if(_uvsDirty && _autoGenerateUVs)
         {
            _vertexData = updateDummyUVs(_vertexData);
         }
         return _vertexData;
      }
      
      override protected function updateVertexNormals(param1:Vector.<Number>) : Vector.<Number>
      {
         invalidateBuffers(_vertexDataInvalid);
         return super.updateVertexNormals(param1);
      }
      
      override protected function updateVertexTangents(param1:Vector.<Number>) : Vector.<Number>
      {
         if(_vertexNormalsDirty)
         {
            _vertexData = updateVertexNormals(_vertexData);
         }
         invalidateBuffers(_vertexDataInvalid);
         return super.updateVertexTangents(param1);
      }
      
      override public function get vertexNormalData() : Vector.<Number>
      {
         if(_autoDeriveVertexNormals && _vertexNormalsDirty)
         {
            _vertexData = updateVertexNormals(_vertexData);
         }
         return _vertexData;
      }
      
      override public function get vertexTangentData() : Vector.<Number>
      {
         if(_autoDeriveVertexTangents && _vertexTangentsDirty)
         {
            _vertexData = updateVertexTangents(_vertexData);
         }
         return _vertexData;
      }
      
      override public function get UVData() : Vector.<Number>
      {
         if(_uvsDirty && _autoGenerateUVs)
         {
            _vertexData = updateDummyUVs(_vertexData);
            invalidateBuffers(_vertexDataInvalid);
         }
         return _vertexData;
      }
      
      override public function applyTransformation(param1:Matrix3D) : void
      {
         super.applyTransformation(param1);
         invalidateBuffers(_vertexDataInvalid);
      }
      
      override public function scale(param1:Number) : void
      {
         super.scale(param1);
         invalidateBuffers(_vertexDataInvalid);
      }
      
      public function clone() : ISubGeometry
      {
         var _loc1_:CompactSubGeometry = new CompactSubGeometry();
         _loc1_._autoDeriveVertexNormals = _autoDeriveVertexNormals;
         _loc1_._autoDeriveVertexTangents = _autoDeriveVertexTangents;
         _loc1_.updateData(_vertexData.concat());
         _loc1_.updateIndexData(_indices.concat());
         return _loc1_;
      }
      
      override public function scaleUV(param1:Number = 1, param2:Number = 1) : void
      {
         super.scaleUV(param1,param2);
         invalidateBuffers(_vertexDataInvalid);
      }
      
      override public function get vertexStride() : uint
      {
         return 13;
      }
      
      override public function get vertexNormalStride() : uint
      {
         return 13;
      }
      
      override public function get vertexTangentStride() : uint
      {
         return 13;
      }
      
      override public function get UVStride() : uint
      {
         return 13;
      }
      
      public function get secondaryUVStride() : uint
      {
         return 13;
      }
      
      override public function get vertexOffset() : int
      {
         return 0;
      }
      
      override public function get vertexNormalOffset() : int
      {
         return 3;
      }
      
      override public function get vertexTangentOffset() : int
      {
         return 6;
      }
      
      override public function get UVOffset() : int
      {
         return 9;
      }
      
      public function get secondaryUVOffset() : int
      {
         return 11;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         disposeVertexBuffers(_vertexBuffer);
         _vertexBuffer = null;
      }
      
      override protected function disposeVertexBuffers(param1:Vector.<VertexBuffer3D>) : void
      {
         super.disposeVertexBuffers(param1);
         _activeBuffer = null;
      }
      
      override protected function invalidateBuffers(param1:Vector.<Boolean>) : void
      {
         super.invalidateBuffers(param1);
         _activeDataInvalid = true;
      }
      
      public function cloneWithSeperateBuffers() : SubGeometry
      {
         var _loc1_:SubGeometry = new SubGeometry();
         _loc1_.updateVertexData(stripBuffer(0,3));
         _loc1_.autoDeriveVertexNormals = _autoDeriveVertexNormals;
         _loc1_.autoDeriveVertexTangents = _autoDeriveVertexTangents;
         if(!_autoDeriveVertexNormals)
         {
            _loc1_.updateVertexNormalData(stripBuffer(3,3));
         }
         if(!_autoDeriveVertexTangents)
         {
            _loc1_.updateVertexTangentData(stripBuffer(6,3));
         }
         _loc1_.updateUVData(stripBuffer(9,2));
         _loc1_.updateSecondaryUVData(stripBuffer(11,2));
         _loc1_.updateIndexData(indexData.concat());
         return _loc1_;
      }
      
      protected function stripBuffer(param1:int, param2:int) : Vector.<Number>
      {
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:Vector.<Number> = new Vector.<Number>(_numVertices * param2);
         var _loc8_:int = 0;
         var _loc6_:* = param1;
         var _loc5_:int = 13 - param2;
         _loc3_ = 0;
         while(_loc3_ < _numVertices)
         {
            _loc7_ = 0;
            while(_loc7_ < param2)
            {
               _loc8_++;
               _loc6_++;
               _loc4_[_loc8_] = _vertexData[_loc6_];
               _loc7_++;
            }
            _loc6_ = int(_loc6_ + _loc5_);
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function fromVectors(param1:Vector.<Number>, param2:Vector.<Number>, param3:Vector.<Number>, param4:Vector.<Number>) : void
      {
         var _loc5_:int = param1.length / 3 * 13;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc11_:int = 0;
         var _loc9_:int = 0;
         var _loc7_:int = 0;
         var _loc10_:Vector.<Number> = new Vector.<Number>(_loc5_,true);
         while(_loc8_ < _loc5_)
         {
            _loc8_++;
            _loc6_++;
            _loc10_[_loc8_] = param1[_loc6_];
            _loc8_++;
            _loc6_++;
            _loc10_[_loc8_] = param1[_loc6_];
            _loc8_++;
            _loc6_++;
            _loc10_[_loc8_] = param1[_loc6_];
            if(param3 && param3.length)
            {
               _loc8_++;
               _loc11_++;
               _loc10_[_loc8_] = param3[_loc11_];
               _loc8_++;
               _loc11_++;
               _loc10_[_loc8_] = param3[_loc11_];
               _loc8_++;
               _loc11_++;
               _loc10_[_loc8_] = param3[_loc11_];
            }
            else
            {
               _loc8_++;
               _loc10_[_loc8_] = 0;
               _loc8_++;
               _loc10_[_loc8_] = 0;
               _loc8_++;
               _loc10_[_loc8_] = 0;
            }
            if(param4 && param4.length)
            {
               _loc8_++;
               _loc9_++;
               _loc10_[_loc8_] = param4[_loc9_];
               _loc8_++;
               _loc9_++;
               _loc10_[_loc8_] = param4[_loc9_];
               _loc8_++;
               _loc9_++;
               _loc10_[_loc8_] = param4[_loc9_];
            }
            else
            {
               _loc8_++;
               _loc10_[_loc8_] = 0;
               _loc8_++;
               _loc10_[_loc8_] = 0;
               _loc8_++;
               _loc10_[_loc8_] = 0;
            }
            if(param2 && param2.length)
            {
               _loc8_++;
               _loc10_[_loc8_] = param2[_loc7_];
               _loc8_++;
               _loc10_[_loc8_] = param2[_loc7_ + 1];
               _loc8_++;
               _loc7_++;
               _loc10_[_loc8_] = param2[_loc7_];
               _loc8_++;
               _loc7_++;
               _loc10_[_loc8_] = param2[_loc7_];
            }
            else
            {
               _loc8_++;
               _loc10_[_loc8_] = 0;
               _loc8_++;
               _loc10_[_loc8_] = 0;
               _loc8_++;
               _loc10_[_loc8_] = 0;
               _loc8_++;
               _loc10_[_loc8_] = 0;
            }
         }
         updateData(_loc10_);
         autoDeriveVertexNormals = !(param3 && param3.length);
         autoDeriveVertexTangents = !(param4 && param4.length);
         autoGenerateDummyUVs = !(param2 && param2.length);
      }
   }
}
