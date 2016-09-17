package away3d.core.base
{
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.Context3D;
   import away3d.core.managers.Stage3DProxy;
   import flash.utils.Dictionary;
   
   public class SkinnedSubGeometry extends CompactSubGeometry
   {
       
      
      private var _bufferFormat:String;
      
      private var _jointWeightsData:Vector.<Number>;
      
      private var _jointIndexData:Vector.<Number>;
      
      private var _animatedData:Vector.<Number>;
      
      private var _jointWeightsBuffer:Vector.<VertexBuffer3D>;
      
      private var _jointIndexBuffer:Vector.<VertexBuffer3D>;
      
      private var _jointWeightsInvalid:Vector.<Boolean>;
      
      private var _jointIndicesInvalid:Vector.<Boolean>;
      
      private var _jointWeightContext:Vector.<Context3D>;
      
      private var _jointIndexContext:Vector.<Context3D>;
      
      private var _jointsPerVertex:int;
      
      private var _condensedNumJoints:uint;
      
      private var _condensedJointIndexData:Vector.<Number>;
      
      private var _condensedIndexLookUp:Vector.<uint>;
      
      public function SkinnedSubGeometry(param1:int)
      {
         _jointWeightsBuffer = new Vector.<VertexBuffer3D>(8);
         _jointIndexBuffer = new Vector.<VertexBuffer3D>(8);
         _jointWeightsInvalid = new Vector.<Boolean>(8,true);
         _jointIndicesInvalid = new Vector.<Boolean>(8,true);
         _jointWeightContext = new Vector.<Context3D>(8);
         _jointIndexContext = new Vector.<Context3D>(8);
         super();
         _jointsPerVertex = param1;
         _bufferFormat = "float" + _jointsPerVertex;
      }
      
      public function get condensedIndexLookUp() : Vector.<uint>
      {
         return _condensedIndexLookUp;
      }
      
      public function get condensedNumJoints() : uint
      {
         return _condensedNumJoints;
      }
      
      public function get condensedJointIndexData() : Vector.<Number>
      {
         return _condensedJointIndexData;
      }
      
      public function get jointsPerVertex() : uint
      {
         return _jointsPerVertex;
      }
      
      public function get animatedData() : Vector.<Number>
      {
         return _animatedData || _vertexData.concat();
      }
      
      public function updateAnimatedData(param1:Vector.<Number>) : void
      {
         _animatedData = param1;
         invalidateBuffers(_vertexDataInvalid);
      }
      
      public function activateJointWeightsBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_jointWeightContext[_loc4_] != _loc3_ || !_jointWeightsBuffer[_loc4_])
         {
            _jointWeightsBuffer[_loc4_] = _loc3_.createVertexBuffer(_numVertices,_jointsPerVertex);
            _jointWeightContext[_loc4_] = _loc3_;
            _jointWeightsInvalid[_loc4_] = true;
         }
         if(_jointWeightsInvalid[_loc4_])
         {
            _jointWeightsBuffer[_loc4_].uploadFromVector(_jointWeightsData,0,_jointWeightsData.length / _jointsPerVertex);
            _jointWeightsInvalid[_loc4_] = false;
         }
         _loc3_.setVertexBufferAt(param1,_jointWeightsBuffer[_loc4_],0,_bufferFormat);
      }
      
      public function activateJointIndexBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:int = param2._stage3DIndex;
         var _loc3_:Context3D = param2._context3D;
         if(_jointIndexContext[_loc4_] != _loc3_ || !_jointIndexBuffer[_loc4_])
         {
            _jointIndexBuffer[_loc4_] = _loc3_.createVertexBuffer(_numVertices,_jointsPerVertex);
            _jointIndexBuffer[_loc4_].uploadFromVector(_condensedNumJoints > 0?_condensedJointIndexData:_jointIndexData,0,_jointIndexData.length / _jointsPerVertex);
            _jointIndexContext[_loc4_] = _loc3_;
            _jointIndicesInvalid[_loc4_] = true;
         }
         if(_jointIndicesInvalid[_loc4_])
         {
            _jointIndexBuffer[_loc4_].uploadFromVector(_condensedNumJoints > 0?_condensedJointIndexData:_jointIndexData,0,_jointIndexData.length / _jointsPerVertex);
            _jointIndicesInvalid[_loc4_] = false;
         }
         _loc3_.setVertexBufferAt(param1,_jointIndexBuffer[_loc4_],0,_bufferFormat);
      }
      
      override protected function uploadData(param1:int) : void
      {
         if(_animatedData)
         {
            _activeBuffer.uploadFromVector(_animatedData,0,_numVertices);
            _activeDataInvalid = false;
            _vertexDataInvalid[param1] = false;
         }
         else
         {
            super.uploadData(param1);
         }
      }
      
      override public function clone() : ISubGeometry
      {
         var _loc1_:SkinnedSubGeometry = new SkinnedSubGeometry(_jointsPerVertex);
         _loc1_.updateData(_vertexData.concat());
         _loc1_.updateIndexData(_indices.concat());
         _loc1_.updateJointIndexData(_jointIndexData.concat());
         _loc1_.updateJointWeightsData(_jointWeightsData.concat());
         _loc1_._autoDeriveVertexNormals = _autoDeriveVertexNormals;
         _loc1_._autoDeriveVertexTangents = _autoDeriveVertexTangents;
         _loc1_._condensedNumJoints = _condensedNumJoints;
         _loc1_._condensedIndexLookUp = _condensedIndexLookUp;
         _loc1_._condensedJointIndexData = _condensedJointIndexData;
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         disposeVertexBuffers(_jointWeightsBuffer);
         disposeVertexBuffers(_jointIndexBuffer);
      }
      
      function condenseIndexData() : void
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = _jointIndexData.length;
         var _loc5_:int = 0;
         var _loc2_:Dictionary = new Dictionary();
         _condensedJointIndexData = new Vector.<Number>(_loc3_,true);
         _condensedIndexLookUp = new Vector.<uint>();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = _jointIndexData[_loc4_];
            if(_loc2_[_loc1_] == undefined)
            {
               _loc2_[_loc1_] = _loc5_;
               _loc5_++;
               _condensedIndexLookUp[_loc5_] = _loc1_;
               _loc5_++;
               _condensedIndexLookUp[_loc5_] = _loc1_ + 1;
               _loc5_++;
               _condensedIndexLookUp[_loc5_] = _loc1_ + 2;
            }
            _condensedJointIndexData[_loc4_] = _loc2_[_loc1_];
            _loc4_++;
         }
         _condensedNumJoints = _loc5_ / 3;
         invalidateBuffers(_jointIndicesInvalid);
      }
      
      function get jointWeightsData() : Vector.<Number>
      {
         return _jointWeightsData;
      }
      
      function updateJointWeightsData(param1:Vector.<Number>) : void
      {
         _condensedNumJoints = 0;
         _condensedIndexLookUp = null;
         _condensedJointIndexData = null;
         _jointWeightsData = param1;
         invalidateBuffers(_jointWeightsInvalid);
      }
      
      function get jointIndexData() : Vector.<Number>
      {
         return _jointIndexData;
      }
      
      function updateJointIndexData(param1:Vector.<Number>) : void
      {
         _jointIndexData = param1;
         invalidateBuffers(_jointIndicesInvalid);
      }
   }
}
