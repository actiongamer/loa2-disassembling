package away3d.core.base
{
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.Context3D;
   import away3d.core.managers.Stage3DProxy;
   import flash.geom.Matrix3D;
   
   public class SubGeometry extends SubGeometryBase implements ISubGeometry
   {
       
      
      protected var _uvs:Vector.<Number>;
      
      protected var _secondaryUvs:Vector.<Number>;
      
      protected var _vertexNormals:Vector.<Number>;
      
      protected var _vertexTangents:Vector.<Number>;
      
      protected var _verticesInvalid:Vector.<Boolean>;
      
      protected var _uvsInvalid:Vector.<Boolean>;
      
      protected var _secondaryUvsInvalid:Vector.<Boolean>;
      
      protected var _normalsInvalid:Vector.<Boolean>;
      
      protected var _tangentsInvalid:Vector.<Boolean>;
      
      protected var _vertexBuffer:Vector.<VertexBuffer3D>;
      
      protected var _uvBuffer:Vector.<VertexBuffer3D>;
      
      protected var _secondaryUvBuffer:Vector.<VertexBuffer3D>;
      
      protected var _vertexNormalBuffer:Vector.<VertexBuffer3D>;
      
      protected var _vertexTangentBuffer:Vector.<VertexBuffer3D>;
      
      protected var _vertexBufferContext:Vector.<Context3D>;
      
      protected var _uvBufferContext:Vector.<Context3D>;
      
      protected var _secondaryUvBufferContext:Vector.<Context3D>;
      
      protected var _vertexNormalBufferContext:Vector.<Context3D>;
      
      protected var _vertexTangentBufferContext:Vector.<Context3D>;
      
      protected var _numVertices:uint;
      
      private var _stage3DProxy:Stage3DProxy;
      
      public function SubGeometry()
      {
         _verticesInvalid = new Vector.<Boolean>(8,true);
         _uvsInvalid = new Vector.<Boolean>(8,true);
         _secondaryUvsInvalid = new Vector.<Boolean>(8,true);
         _normalsInvalid = new Vector.<Boolean>(8,true);
         _tangentsInvalid = new Vector.<Boolean>(8,true);
         _vertexBuffer = new Vector.<VertexBuffer3D>(8);
         _uvBuffer = new Vector.<VertexBuffer3D>(8);
         _secondaryUvBuffer = new Vector.<VertexBuffer3D>(8);
         _vertexNormalBuffer = new Vector.<VertexBuffer3D>(8);
         _vertexTangentBuffer = new Vector.<VertexBuffer3D>(8);
         _vertexBufferContext = new Vector.<Context3D>(8);
         _uvBufferContext = new Vector.<Context3D>(8);
         _secondaryUvBufferContext = new Vector.<Context3D>(8);
         _vertexNormalBufferContext = new Vector.<Context3D>(8);
         _vertexTangentBufferContext = new Vector.<Context3D>(8);
         super();
      }
      
      public function get numVertices() : uint
      {
         return _numVertices;
      }
      
      public function activateVertexBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _stage3DProxy = param2;
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(!_vertexBuffer[_loc4_] || _vertexBufferContext[_loc4_] != _loc3_)
         {
            _vertexBuffer[_loc4_] = _loc3_.createVertexBuffer(_numVertices,3);
            _vertexBufferContext[_loc4_] = _loc3_;
            _verticesInvalid[_loc4_] = true;
         }
         if(_verticesInvalid[_loc4_])
         {
            _vertexBuffer[_loc4_].uploadFromVector(_vertexData,0,_numVertices);
            _verticesInvalid[_loc4_] = false;
         }
         _loc3_.setVertexBufferAt(param1,_vertexBuffer[_loc4_],0,"float3");
      }
      
      public function getSecondaryUVBuffer(param1:Stage3DProxy) : VertexBuffer3D
      {
         var _loc3_:int = param1._stage3DIndex;
         var _loc2_:Context3D = param1._context3D;
         if(_secondaryUvBufferContext[_loc3_] != _loc2_ || !_secondaryUvBuffer[_loc3_])
         {
            if(_secondaryUvBuffer[_loc3_])
            {
               _secondaryUvBuffer[_loc3_].dispose();
            }
            _secondaryUvBuffer[_loc3_] = _loc2_.createVertexBuffer(_numVertices,2);
            _secondaryUvBufferContext[_loc3_] = _loc2_;
            _uvsInvalid[_loc3_] = true;
         }
         if(_verticesInvalid[_loc3_])
         {
            _secondaryUvBuffer[_loc3_].uploadFromVector(_secondaryUvs,0,_numVertices);
            _uvsInvalid[_loc3_] = false;
         }
         return _secondaryUvBuffer[_loc3_];
      }
      
      public function activateUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_autoGenerateUVs && _uvsDirty)
         {
            _uvs = updateDummyUVs(_uvs);
         }
         if(!_uvBuffer[_loc4_] || _uvBufferContext[_loc4_] != _loc3_)
         {
            _uvBuffer[_loc4_] = _loc3_.createVertexBuffer(_numVertices,2);
            _uvBufferContext[_loc4_] = _loc3_;
            _uvsInvalid[_loc4_] = true;
         }
         if(_uvsInvalid[_loc4_])
         {
            _uvBuffer[_loc4_].uploadFromVector(_uvs,0,_numVertices);
            _uvsInvalid[_loc4_] = false;
         }
         _loc3_.setVertexBufferAt(param1,_uvBuffer[_loc4_],0,"float2");
      }
      
      public function activateSecondaryUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(!_secondaryUvBuffer[_loc4_] || _secondaryUvBufferContext[_loc4_] != _loc3_)
         {
            _secondaryUvBuffer[_loc4_] = _loc3_.createVertexBuffer(_numVertices,2);
            _secondaryUvBufferContext[_loc4_] = _loc3_;
            _secondaryUvsInvalid[_loc4_] = true;
         }
         if(_secondaryUvsInvalid[_loc4_])
         {
            _secondaryUvBuffer[_loc4_].uploadFromVector(_secondaryUvs,0,_numVertices);
            _secondaryUvsInvalid[_loc4_] = false;
         }
         _loc3_.setVertexBufferAt(param1,_secondaryUvBuffer[_loc4_],0,"float2");
      }
      
      public function activateVertexNormalBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_autoDeriveVertexNormals && _vertexNormalsDirty)
         {
            _vertexNormals = updateVertexNormals(_vertexNormals);
         }
         if(!_vertexNormalBuffer[_loc4_] || _vertexNormalBufferContext[_loc4_] != _loc3_)
         {
            _vertexNormalBuffer[_loc4_] = _loc3_.createVertexBuffer(_numVertices,3);
            _vertexNormalBufferContext[_loc4_] = _loc3_;
            _normalsInvalid[_loc4_] = true;
         }
         if(_normalsInvalid[_loc4_])
         {
            _vertexNormalBuffer[_loc4_].uploadFromVector(_vertexNormals,0,_numVertices);
            _normalsInvalid[_loc4_] = false;
         }
         _loc3_.setVertexBufferAt(param1,_vertexNormalBuffer[_loc4_],0,"float3");
      }
      
      public function activateVertexTangentBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_vertexTangentsDirty)
         {
            _vertexTangents = updateVertexTangents(_vertexTangents);
         }
         if(!_vertexTangentBuffer[_loc4_] || _vertexTangentBufferContext[_loc4_] != _loc3_)
         {
            _vertexTangentBuffer[_loc4_] = _loc3_.createVertexBuffer(_numVertices,3);
            _vertexTangentBufferContext[_loc4_] = _loc3_;
            _tangentsInvalid[_loc4_] = true;
         }
         if(_tangentsInvalid[_loc4_])
         {
            _vertexTangentBuffer[_loc4_].uploadFromVector(_vertexTangents,0,_numVertices);
            _tangentsInvalid[_loc4_] = false;
         }
         _loc3_.setVertexBufferAt(param1,_vertexTangentBuffer[_loc4_],0,"float3");
      }
      
      override public function applyTransformation(param1:Matrix3D) : void
      {
         super.applyTransformation(param1);
         invalidateBuffers(_verticesInvalid);
         invalidateBuffers(_normalsInvalid);
         invalidateBuffers(_tangentsInvalid);
      }
      
      public function clone() : ISubGeometry
      {
         var _loc1_:SubGeometry = new SubGeometry();
         _loc1_.updateVertexData(_vertexData.concat());
         _loc1_.updateUVData(_uvs.concat());
         _loc1_.updateIndexData(_indices.concat());
         if(_secondaryUvs)
         {
            _loc1_.updateSecondaryUVData(_secondaryUvs.concat());
         }
         if(!_autoDeriveVertexNormals)
         {
            _loc1_.updateVertexNormalData(_vertexNormals.concat());
         }
         if(!_autoDeriveVertexTangents)
         {
            _loc1_.updateVertexTangentData(_vertexTangents.concat());
         }
         return _loc1_;
      }
      
      override public function scale(param1:Number) : void
      {
         super.scale(param1);
         invalidateBuffers(_verticesInvalid);
      }
      
      override public function scaleUV(param1:Number = 1, param2:Number = 1) : void
      {
         super.scaleUV(param1,param2);
         invalidateBuffers(_uvsInvalid);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_stage3DProxy)
         {
            disposeForStage3D(_stage3DProxy);
         }
         disposeAllVertexBuffers();
         _vertexBuffer = null;
         _vertexNormalBuffer = null;
         _uvBuffer = null;
         _secondaryUvBuffer = null;
         _vertexTangentBuffer = null;
         _indexBuffer = null;
         _uvs = null;
         _secondaryUvs = null;
         _vertexNormals = null;
         _vertexTangents = null;
         _vertexBufferContext = null;
         _uvBufferContext = null;
         _secondaryUvBufferContext = null;
         _vertexNormalBufferContext = null;
         _vertexTangentBufferContext = null;
      }
      
      protected function disposeAllVertexBuffers() : void
      {
         disposeVertexBuffers(_vertexBuffer);
         disposeVertexBuffers(_vertexNormalBuffer);
         disposeVertexBuffers(_uvBuffer);
         disposeVertexBuffers(_secondaryUvBuffer);
         disposeVertexBuffers(_vertexTangentBuffer);
      }
      
      override public function get vertexData() : Vector.<Number>
      {
         return _vertexData;
      }
      
      public function updateVertexData(param1:Vector.<Number>) : void
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
         _vertexData = param1;
         var _loc2_:int = param1.length / 3;
         if(_loc2_ != _numVertices)
         {
            disposeAllVertexBuffers();
         }
         _numVertices = _loc2_;
         invalidateBuffers(_verticesInvalid);
         invalidateBounds();
      }
      
      override public function get UVData() : Vector.<Number>
      {
         if(_uvsDirty && _autoGenerateUVs)
         {
            _uvs = updateDummyUVs(_uvs);
         }
         return _uvs;
      }
      
      public function get secondaryUVData() : Vector.<Number>
      {
         return _secondaryUvs;
      }
      
      public function updateUVData(param1:Vector.<Number>) : void
      {
         if(_autoDeriveVertexTangents)
         {
            _vertexTangentsDirty = true;
         }
         _faceTangentsDirty = true;
         _uvs = param1;
         invalidateBuffers(_uvsInvalid);
      }
      
      public function updateSecondaryUVData(param1:Vector.<Number>) : void
      {
         _secondaryUvs = param1;
         invalidateBuffers(_secondaryUvsInvalid);
      }
      
      override public function get vertexNormalData() : Vector.<Number>
      {
         if(_autoDeriveVertexNormals && _vertexNormalsDirty)
         {
            _vertexNormals = updateVertexNormals(_vertexNormals);
         }
         return _vertexNormals;
      }
      
      public function updateVertexNormalData(param1:Vector.<Number>) : void
      {
         _vertexNormalsDirty = false;
         _autoDeriveVertexNormals = param1 == null;
         _vertexNormals = param1;
         invalidateBuffers(_normalsInvalid);
      }
      
      override public function get vertexTangentData() : Vector.<Number>
      {
         if(_autoDeriveVertexTangents && _vertexTangentsDirty)
         {
            _vertexTangents = updateVertexTangents(_vertexTangents);
         }
         return _vertexTangents;
      }
      
      public function updateVertexTangentData(param1:Vector.<Number>) : void
      {
         _vertexTangentsDirty = false;
         _autoDeriveVertexTangents = param1 == null;
         _vertexTangents = param1;
         invalidateBuffers(_tangentsInvalid);
      }
      
      public function fromVectors(param1:Vector.<Number>, param2:Vector.<Number>, param3:Vector.<Number>, param4:Vector.<Number>) : void
      {
         updateVertexData(param1);
         updateUVData(param2);
         if(param3)
         {
            updateVertexNormalData(param3);
         }
         if(param4)
         {
            updateVertexTangentData(param4);
         }
      }
      
      override protected function updateVertexNormals(param1:Vector.<Number>) : Vector.<Number>
      {
         invalidateBuffers(_normalsInvalid);
         return super.updateVertexNormals(param1);
      }
      
      override protected function updateVertexTangents(param1:Vector.<Number>) : Vector.<Number>
      {
         if(_vertexNormalsDirty)
         {
            _vertexNormals = updateVertexNormals(_vertexNormals);
         }
         invalidateBuffers(_tangentsInvalid);
         return super.updateVertexTangents(param1);
      }
      
      override protected function updateDummyUVs(param1:Vector.<Number>) : Vector.<Number>
      {
         invalidateBuffers(_uvsInvalid);
         return super.updateDummyUVs(param1);
      }
      
      protected function disposeForStage3D(param1:Stage3DProxy) : void
      {
         var _loc2_:int = param1._stage3DIndex;
         if(_vertexBuffer[_loc2_])
         {
            _vertexBuffer[_loc2_].dispose();
            _vertexBuffer[_loc2_] = null;
         }
         if(_uvBuffer[_loc2_])
         {
            _uvBuffer[_loc2_].dispose();
            _uvBuffer[_loc2_] = null;
         }
         if(_secondaryUvBuffer[_loc2_])
         {
            _secondaryUvBuffer[_loc2_].dispose();
            _secondaryUvBuffer[_loc2_] = null;
         }
         if(_vertexNormalBuffer[_loc2_])
         {
            _vertexNormalBuffer[_loc2_].dispose();
            _vertexNormalBuffer[_loc2_] = null;
         }
         if(_vertexTangentBuffer[_loc2_])
         {
            _vertexTangentBuffer[_loc2_].dispose();
            _vertexTangentBuffer[_loc2_] = null;
         }
         if(_indexBuffer[_loc2_])
         {
            _indexBuffer[_loc2_].dispose();
            _indexBuffer[_loc2_] = null;
         }
      }
      
      override public function get vertexStride() : uint
      {
         return 3;
      }
      
      override public function get vertexTangentStride() : uint
      {
         return 3;
      }
      
      override public function get vertexNormalStride() : uint
      {
         return 3;
      }
      
      override public function get UVStride() : uint
      {
         return 2;
      }
      
      public function get secondaryUVStride() : uint
      {
         return 2;
      }
      
      override public function get vertexOffset() : int
      {
         return 0;
      }
      
      override public function get vertexNormalOffset() : int
      {
         return 0;
      }
      
      override public function get vertexTangentOffset() : int
      {
         return 0;
      }
      
      override public function get UVOffset() : int
      {
         return 0;
      }
      
      public function get secondaryUVOffset() : int
      {
         return 0;
      }
      
      public function cloneWithSeperateBuffers() : SubGeometry
      {
         return SubGeometry(clone());
      }
   }
}
