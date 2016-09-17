package away3d.core.partition
{
   import away3d.primitives.WireframePrimitiveBase;
   import §away3d:arcane§._parent;
   import §away3d:arcane§._numEntities;
   import away3d.cameras.Camera3D;
   import away3d.entities.Entity;
   import away3d.core.traverse.PartitionTraverser;
   
   public class NodeBase
   {
       
      
      var _parent:away3d.core.partition.NodeBase;
      
      protected var _childNodes:Vector.<away3d.core.partition.NodeBase>;
      
      protected var _numChildNodes:uint;
      
      protected var _debugPrimitive:WireframePrimitiveBase;
      
      var _numEntities:int;
      
      var _collectionMark:uint;
      
      public function NodeBase()
      {
         super();
         _childNodes = new Vector.<away3d.core.partition.NodeBase>();
      }
      
      public function get showDebugBounds() : Boolean
      {
         return _debugPrimitive != null;
      }
      
      public function set showDebugBounds(param1:Boolean) : void
      {
         var _loc2_:* = 0;
         if(Boolean(_debugPrimitive) == param1)
         {
            return;
         }
         if(param1)
         {
            _debugPrimitive = createDebugBounds();
         }
         else
         {
            _debugPrimitive.dispose();
            _debugPrimitive = null;
         }
         _loc2_ = uint(0);
         while(_loc2_ < _numChildNodes)
         {
            _childNodes[_loc2_].showDebugBounds = param1;
            _loc2_++;
         }
      }
      
      public final function get parent() : away3d.core.partition.NodeBase
      {
         return _parent;
      }
      
      function addNode(param1:away3d.core.partition.NodeBase) : void
      {
         param1._parent = this;
         _numEntities = _numEntities + param1._numEntities;
         _numChildNodes = Number(_numChildNodes) + 1;
         _childNodes[Number(_numChildNodes)] = param1;
         param1.showDebugBounds = _debugPrimitive != null;
         var _loc2_:int = param1._numEntities;
         param1 = this;
         do
         {
            param1._numEntities = param1._numEntities + _loc2_;
            param1 = param1._parent;
         }
         while(param1._parent != null);
         
      }
      
      function removeNode(param1:away3d.core.partition.NodeBase) : void
      {
         var _loc2_:uint = _childNodes.indexOf(param1);
         _numChildNodes = _numChildNodes - 1;
         _childNodes[_loc2_] = _childNodes[_numChildNodes - 1];
         _childNodes.pop();
         var _loc3_:int = param1._numEntities;
         param1 = this;
         do
         {
            param1._numEntities = param1._numEntities - _loc3_;
            param1 = param1._parent;
         }
         while(param1._parent != null);
         
      }
      
      public function isInFrustum(param1:Camera3D) : Boolean
      {
         var _loc2_:Boolean = isInFrustumImpl(param1);
         if(_loc2_ && _debugPrimitive)
         {
            _debugPrimitive.pushModelViewProjection(param1);
         }
         return _loc2_;
      }
      
      protected function isInFrustumImpl(param1:Camera3D) : Boolean
      {
         return true;
      }
      
      public function findPartitionForEntity(param1:Entity) : away3d.core.partition.NodeBase
      {
         return this;
      }
      
      public function acceptTraverser(param1:PartitionTraverser) : void
      {
         var _loc2_:int = 0;
         if(_numEntities == 0 && !_debugPrimitive)
         {
            return;
         }
         if(param1.enterNode(this))
         {
            while(_loc2_ < _numChildNodes)
            {
               _childNodes[_loc2_++].acceptTraverser(param1);
            }
            if(_debugPrimitive)
            {
               param1.applyRenderable(_debugPrimitive);
            }
         }
      }
      
      protected function createDebugBounds() : WireframePrimitiveBase
      {
         return null;
      }
      
      protected function get numEntities() : int
      {
         return _numEntities;
      }
      
      protected function updateNumEntities(param1:int) : void
      {
         var _loc3_:int = param1 - _numEntities;
         var _loc2_:* = this;
         do
         {
            _loc2_._numEntities = _loc2_._numEntities + _loc3_;
            _loc2_ = _loc2_._parent;
         }
         while(_loc2_._parent != null);
         
      }
   }
}
