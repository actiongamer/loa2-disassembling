package away3d.entities
{
   import away3d.core.base.IRenderable;
   import away3d.materials.MaterialBase;
   import away3d.animators.IAnimator;
   import flash.utils.Dictionary;
   import away3d.primitives.data.Segment;
   import §away3d:arcane§.updateSegment;
   import flash.geom.Vector3D;
   import flash.display3D.IndexBuffer3D;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.Context3D;
   import away3d.bounds.BoundingVolumeBase;
   import away3d.bounds.BoundingSphere;
   import away3d.core.partition.EntityNode;
   import away3d.core.partition.RenderableNode;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import away3d.cameras.Camera3D;
   import away3d.core.base.data.PostEffectData;
   import away3d.materials.SegmentMaterial;
   
   public class SegmentSet extends Entity implements IRenderable
   {
       
      
      private const LIMIT:uint = 196605;
      
      private var _activeSubSet:SubSet;
      
      private var _subSets:Vector.<SubSet>;
      
      private var _subSetCount:uint;
      
      private var _numIndices:uint;
      
      private var _material:MaterialBase;
      
      private var _animator:IAnimator;
      
      private var _hasData:Boolean;
      
      protected var _segments:Dictionary;
      
      private var _indexSegments:uint;
      
      public function SegmentSet()
      {
         super();
         _subSetCount = 0;
         _subSets = new Vector.<SubSet>();
         addSubSet();
         _segments = new Dictionary();
         material = new SegmentMaterial();
      }
      
      public function addSegment(param1:Segment) : void
      {
         param1.segmentsBase = this;
         _hasData = true;
         var _loc4_:uint = _subSets.length - 1;
         var _loc5_:SubSet = _subSets[_loc4_];
         if(_loc5_.vertices.length + 44 > 196605)
         {
            _loc5_ = addSubSet();
            _loc4_++;
         }
         param1.index = _loc5_.vertices.length;
         param1.subSetIndex = _loc4_;
         updateSegment(param1);
         var _loc2_:uint = _loc5_.lineCount << 2;
         _loc5_.indices.push(_loc2_,_loc2_ + 1,_loc2_ + 2,_loc2_ + 3,_loc2_ + 2,_loc2_ + 1);
         _loc5_.numVertices = _loc5_.vertices.length / 11;
         _loc5_.numIndices = _loc5_.indices.length;
         _loc5_.lineCount = Number(_loc5_.lineCount) + 1;
         var _loc3_:SegRef = new SegRef();
         _loc3_.index = _loc2_;
         _loc3_.subSetIndex = _loc4_;
         _loc3_.segment = param1;
         _segments[_indexSegments] = _loc3_;
         _indexSegments = Number(_indexSegments) + 1;
      }
      
      public function removeSegmentByIndex(param1:uint, param2:Boolean = false) : void
      {
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = 0;
         if(param1 >= _indexSegments)
         {
            return;
         }
         if(_segments[param1])
         {
            _loc5_ = _segments[param1];
            if(!_subSets[_loc5_.subSetIndex])
            {
               return;
            }
            var _loc7_:int = _loc5_.subSetIndex;
            _loc8_ = _subSets[_loc5_.subSetIndex];
            var _loc4_:Segment = _loc5_.segment;
            var _loc6_:Vector.<uint> = _loc8_.indices;
            var _loc3_:uint = param1 * 6;
            _loc9_ = _loc3_;
            while(_loc9_ < _loc6_.length)
            {
               var _loc10_:* = _loc9_;
               var _loc11_:* = _loc6_[_loc10_] - 4;
               _loc6_[_loc10_] = _loc11_;
               _loc9_++;
            }
            _loc8_.indices.splice(param1 * 6,6);
            _loc8_.vertices.splice(param1 * 44,44);
            _loc8_.numVertices = _loc8_.vertices.length / 11;
            _loc8_.numIndices = _loc6_.length;
            _loc8_.vertexBufferDirty = true;
            _loc8_.indexBufferDirty = true;
            _loc8_.lineCount = Number(_loc8_.lineCount) - 1;
            if(param2)
            {
               _loc4_.dispose();
               _loc4_ = null;
            }
            else
            {
               _loc4_.index = -1;
               _loc4_.segmentsBase = null;
            }
            if(_loc8_.lineCount == 0)
            {
               if(_loc7_ == 0)
               {
                  _hasData = false;
               }
               else
               {
                  _loc8_.dispose();
                  _subSets[_loc7_] = null;
                  _subSets.splice(_loc7_,1);
               }
            }
            reOrderIndices(_loc7_,param1);
            _loc5_ = null;
            _segments[_indexSegments] = null;
            _indexSegments = Number(_indexSegments) - 1;
            return;
         }
      }
      
      public function removeSegment(param1:Segment, param2:Boolean = false) : void
      {
         if(param1.index == -1)
         {
            return;
         }
         removeSegmentByIndex(param1.index / 44);
      }
      
      public function removeAllSegments() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         _loc3_ = uint(0);
         while(_loc3_ < _subSetCount)
         {
            _loc2_ = _subSets[_loc3_];
            _loc2_.vertices = null;
            _loc2_.indices = null;
            if(_loc2_.vertexBuffer)
            {
               _loc2_.vertexBuffer.dispose();
            }
            if(_loc2_.indexBuffer)
            {
               _loc2_.indexBuffer.dispose();
            }
            _loc2_ = null;
            _loc3_++;
         }
         var _loc5_:int = 0;
         var _loc4_:* = _segments;
         for each(var _loc1_ in _segments)
         {
            _loc1_ = null;
         }
         _segments = null;
         _subSetCount = 0;
         _activeSubSet = null;
         _indexSegments = 0;
         _subSets = new Vector.<SubSet>();
         _segments = new Dictionary();
         addSubSet();
         _hasData = false;
      }
      
      public function getSegment(param1:uint) : Segment
      {
         if(param1 > _indexSegments - 1)
         {
            return null;
         }
         return _segments[param1].segment;
      }
      
      public function get segmentCount() : uint
      {
         return _indexSegments;
      }
      
      function get subSetCount() : uint
      {
         return _subSetCount;
      }
      
      function updateSegment(param1:Segment) : void
      {
         var _loc15_:Vector3D = param1._start;
         var _loc18_:Vector3D = param1._end;
         var _loc10_:Number = _loc15_.x;
         var _loc12_:Number = _loc15_.y;
         var _loc16_:Number = _loc15_.z;
         var _loc4_:Number = _loc18_.x;
         var _loc8_:Number = _loc18_.y;
         var _loc6_:Number = _loc18_.z;
         var _loc13_:Number = param1._startR;
         var _loc2_:Number = param1._startG;
         var _loc5_:Number = param1._startB;
         var _loc9_:Number = param1._endR;
         var _loc14_:Number = param1._endG;
         var _loc19_:Number = param1._endB;
         var _loc3_:uint = param1.index;
         var _loc11_:Number = param1.thickness;
         var _loc17_:SubSet = _subSets[param1.subSetIndex];
         var _loc7_:Vector.<Number> = _loc17_.vertices;
         _loc7_[_loc3_++] = _loc10_;
         _loc7_[_loc3_++] = _loc12_;
         _loc7_[_loc3_++] = _loc16_;
         _loc7_[_loc3_++] = _loc4_;
         _loc7_[_loc3_++] = _loc8_;
         _loc7_[_loc3_++] = _loc6_;
         _loc7_[_loc3_++] = _loc11_;
         _loc7_[_loc3_++] = _loc13_;
         _loc7_[_loc3_++] = _loc2_;
         _loc7_[_loc3_++] = _loc5_;
         _loc7_[_loc3_++] = 1;
         _loc7_[_loc3_++] = _loc4_;
         _loc7_[_loc3_++] = _loc8_;
         _loc7_[_loc3_++] = _loc6_;
         _loc7_[_loc3_++] = _loc10_;
         _loc7_[_loc3_++] = _loc12_;
         _loc7_[_loc3_++] = _loc16_;
         _loc7_[_loc3_++] = -_loc11_;
         _loc7_[_loc3_++] = _loc9_;
         _loc7_[_loc3_++] = _loc14_;
         _loc7_[_loc3_++] = _loc19_;
         _loc7_[_loc3_++] = 1;
         _loc7_[_loc3_++] = _loc10_;
         _loc7_[_loc3_++] = _loc12_;
         _loc7_[_loc3_++] = _loc16_;
         _loc7_[_loc3_++] = _loc4_;
         _loc7_[_loc3_++] = _loc8_;
         _loc7_[_loc3_++] = _loc6_;
         _loc7_[_loc3_++] = -_loc11_;
         _loc7_[_loc3_++] = _loc13_;
         _loc7_[_loc3_++] = _loc2_;
         _loc7_[_loc3_++] = _loc5_;
         _loc7_[_loc3_++] = 1;
         _loc7_[_loc3_++] = _loc4_;
         _loc7_[_loc3_++] = _loc8_;
         _loc7_[_loc3_++] = _loc6_;
         _loc7_[_loc3_++] = _loc10_;
         _loc7_[_loc3_++] = _loc12_;
         _loc7_[_loc3_++] = _loc16_;
         _loc7_[_loc3_++] = _loc11_;
         _loc7_[_loc3_++] = _loc9_;
         _loc7_[_loc3_++] = _loc14_;
         _loc7_[_loc3_++] = _loc19_;
         _loc7_[_loc3_++] = 1;
         _loc17_.vertexBufferDirty = true;
         invalidateBounds();
      }
      
      function get hasData() : Boolean
      {
         return _hasData;
      }
      
      public function getIndexBuffer(param1:Stage3DProxy) : IndexBuffer3D
      {
         if(_activeSubSet.indexContext3D != param1.context3D || _activeSubSet.indexBufferDirty)
         {
            _activeSubSet.indexBuffer = param1._context3D.createIndexBuffer(_activeSubSet.numIndices);
            _activeSubSet.indexBuffer.uploadFromVector(_activeSubSet.indices,0,_activeSubSet.numIndices);
            _activeSubSet.indexBufferDirty = false;
            _activeSubSet.indexContext3D = param1.context3D;
         }
         return _activeSubSet.indexBuffer;
      }
      
      public function activateVertexBuffer(param1:int, param2:Stage3DProxy) : void
      {
         var _loc4_:* = null;
         var _loc5_:SubSet = _subSets[param1];
         _activeSubSet = _loc5_;
         _numIndices = _loc5_.numIndices;
         if(_loc5_.vertexContext3D != param2.context3D || _loc5_.vertexBufferDirty)
         {
            _loc5_.vertexBuffer = param2._context3D.createVertexBuffer(_loc5_.numVertices,11);
            _loc5_.vertexBuffer.uploadFromVector(_loc5_.vertices,0,_loc5_.numVertices);
            _loc4_ = _loc5_.vertexBuffer;
            _loc5_.vertexBufferDirty = false;
            _loc5_.vertexContext3D = param2.context3D;
         }
         _loc4_ = _loc5_.vertexBuffer;
         var _loc3_:Context3D = param2._context3D;
         _loc3_.setVertexBufferAt(0,_loc4_,0,"float3");
         _loc3_.setVertexBufferAt(1,_loc4_,3,"float3");
         _loc3_.setVertexBufferAt(2,_loc4_,6,"float1");
         _loc3_.setVertexBufferAt(3,_loc4_,7,"float4");
      }
      
      public function activateUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
      }
      
      public function activateVertexNormalBuffer(param1:int, param2:Stage3DProxy) : void
      {
      }
      
      public function activateVertexTangentBuffer(param1:int, param2:Stage3DProxy) : void
      {
      }
      
      public function activateSecondaryUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
      }
      
      private function reOrderIndices(param1:uint, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         _loc4_ = uint(param2);
         while(_loc4_ < _indexSegments - 1)
         {
            _loc3_ = _segments[_loc4_ + 1];
            _loc3_.index = _loc4_;
            if(_loc3_.subSetIndex == param1)
            {
               _loc3_.segment.index = _loc3_.segment.index - 44;
            }
            _segments[_loc4_] = _loc3_;
            _loc4_++;
         }
      }
      
      private function addSubSet() : SubSet
      {
         var _loc1_:SubSet = new SubSet();
         _subSets.push(_loc1_);
         _loc1_.vertices = new Vector.<Number>();
         _loc1_.numVertices = 0;
         _loc1_.indices = new Vector.<uint>();
         _loc1_.numIndices = 0;
         _loc1_.vertexBufferDirty = true;
         _loc1_.indexBufferDirty = true;
         _loc1_.lineCount = 0;
         _subSetCount = Number(_subSetCount) + 1;
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         removeAllSegments();
         _segments = null;
         _material = null;
         var _loc1_:SubSet = _subSets[0];
         _loc1_.vertices = null;
         _loc1_.indices = null;
         _subSets = null;
      }
      
      override public function get mouseEnabled() : Boolean
      {
         return false;
      }
      
      override protected function getDefaultBoundingVolume() : BoundingVolumeBase
      {
         return new BoundingSphere();
      }
      
      override protected function updateBounds() : void
      {
         var _loc13_:* = null;
         var _loc7_:* = 0;
         var _loc12_:Number = NaN;
         var _loc3_:* = 0;
         var _loc4_:* = undefined;
         var _loc11_:* = 0;
         var _loc2_:* = NaN;
         var _loc9_:* = Infinity;
         var _loc10_:* = Infinity;
         var _loc1_:* = Infinity;
         var _loc8_:* = -Infinity;
         var _loc6_:* = -Infinity;
         var _loc5_:* = -Infinity;
         _loc11_ = uint(0);
         while(_loc11_ < _subSetCount)
         {
            _loc13_ = _subSets[_loc11_];
            _loc3_ = uint(0);
            _loc4_ = _loc13_.vertices;
            _loc7_ = uint(_loc4_.length);
            if(_loc7_ != 0)
            {
               while(_loc3_ < _loc7_)
               {
                  _loc12_ = _loc4_[_loc3_++];
                  if(_loc12_ < _loc9_)
                  {
                     _loc9_ = _loc12_;
                  }
                  else if(_loc12_ > _loc8_)
                  {
                     _loc8_ = _loc12_;
                  }
                  _loc12_ = _loc4_[_loc3_++];
                  if(_loc12_ < _loc10_)
                  {
                     _loc10_ = _loc12_;
                  }
                  else if(_loc12_ > _loc6_)
                  {
                     _loc6_ = _loc12_;
                  }
                  _loc12_ = _loc4_[_loc3_++];
                  if(_loc12_ < _loc1_)
                  {
                     _loc1_ = _loc12_;
                  }
                  else if(_loc12_ > _loc5_)
                  {
                     _loc5_ = _loc12_;
                  }
                  _loc3_ = uint(_loc3_ + 8);
               }
            }
            _loc11_++;
         }
         if(_loc9_ != Infinity)
         {
            _bounds.fromExtremes(_loc9_,_loc10_,_loc1_,_loc8_,_loc6_,_loc5_);
         }
         else
         {
            _loc2_ = 0.5;
            _bounds.fromExtremes(-_loc2_,-_loc2_,-_loc2_,_loc2_,_loc2_,_loc2_);
         }
         _boundsInvalid = false;
      }
      
      override protected function createEntityPartitionNode() : EntityNode
      {
         return new RenderableNode(this);
      }
      
      public function get numTriangles() : uint
      {
         return _numIndices / 3;
      }
      
      public function get sourceEntity() : Entity
      {
         return this;
      }
      
      public function get castsShadows() : Boolean
      {
         return false;
      }
      
      public function get material() : MaterialBase
      {
         return _material;
      }
      
      public function get animator() : IAnimator
      {
         return _animator;
      }
      
      public function set material(param1:MaterialBase) : void
      {
         if(param1 == _material)
         {
            return;
         }
         if(_material)
         {
            _material.removeOwner(this);
         }
         _material = param1;
         if(_material)
         {
            _material.addOwner(this);
         }
      }
      
      public function get uvTransform() : Matrix
      {
         return null;
      }
      
      public function get vertexData() : Vector.<Number>
      {
         return null;
      }
      
      public function get indexData() : Vector.<uint>
      {
         return null;
      }
      
      public function get UVData() : Vector.<Number>
      {
         return null;
      }
      
      public function get numVertices() : uint
      {
         return null;
      }
      
      public function get vertexStride() : uint
      {
         return 11;
      }
      
      public function get vertexNormalData() : Vector.<Number>
      {
         return null;
      }
      
      public function get vertexTangentData() : Vector.<Number>
      {
         return null;
      }
      
      public function get vertexOffset() : int
      {
         return 0;
      }
      
      public function get vertexNormalOffset() : int
      {
         return 0;
      }
      
      public function get vertexTangentOffset() : int
      {
         return 0;
      }
      
      override public function get assetType() : String
      {
         return "segmentSet";
      }
      
      public function getRenderSceneTransform(param1:Camera3D) : Matrix3D
      {
         return _sceneTransform;
      }
      
      public function get postEffectData() : PostEffectData
      {
         return null;
      }
   }
}

import away3d.primitives.data.Segment;

final class SegRef
{
    
   
   public var index:uint;
   
   public var subSetIndex:uint;
   
   public var segment:Segment;
   
   function SegRef()
   {
      super();
   }
}

import flash.display3D.Context3D;
import flash.display3D.VertexBuffer3D;
import flash.display3D.IndexBuffer3D;

final class SubSet
{
    
   
   public var vertices:Vector.<Number>;
   
   public var numVertices:uint;
   
   public var indices:Vector.<uint>;
   
   public var numIndices:uint;
   
   public var vertexBufferDirty:Boolean;
   
   public var indexBufferDirty:Boolean;
   
   public var vertexContext3D:Context3D;
   
   public var indexContext3D:Context3D;
   
   public var vertexBuffer:VertexBuffer3D;
   
   public var indexBuffer:IndexBuffer3D;
   
   public var lineCount:uint;
   
   function SubSet()
   {
      super();
   }
   
   public function dispose() : void
   {
      vertices = null;
      if(vertexBuffer)
      {
         vertexBuffer.dispose();
      }
      if(indexBuffer)
      {
         indexBuffer.dispose();
      }
   }
}
