package away3d.core.partition
{
   import away3d.core.traverse.PartitionTraverser;
   import away3d.entities.Entity;
   
   public class Partition3D
   {
       
      
      protected var _rootNode:away3d.core.partition.NodeBase;
      
      private var _updatesMade:Boolean;
      
      private var _updateQueue:away3d.core.partition.EntityNode;
      
      private var updateEntity:Entity;
      
      public function Partition3D(param1:away3d.core.partition.NodeBase)
      {
         super();
         _rootNode = param1 || new NullNode();
      }
      
      public function get rootNode() : away3d.core.partition.NodeBase
      {
         return _rootNode;
      }
      
      public function get showDebugBounds() : Boolean
      {
         return _rootNode.showDebugBounds;
      }
      
      public function set showDebugBounds(param1:Boolean) : void
      {
         _rootNode.showDebugBounds = param1;
      }
      
      public function traverse(param1:PartitionTraverser) : void
      {
         if(_updatesMade)
         {
            updateEntities();
         }
         PartitionTraverser._collectionMark++;
         _rootNode.acceptTraverser(param1);
      }
      
      function markForUpdate(param1:Entity) : void
      {
         var _loc2_:away3d.core.partition.EntityNode = param1.getEntityPartitionNode();
         var _loc3_:away3d.core.partition.EntityNode = _updateQueue;
         while(_loc3_)
         {
            if(_loc2_ == _loc3_)
            {
               return;
            }
            _loc3_ = _loc3_._updateQueueNext;
         }
         _loc2_._updateQueueNext = _updateQueue;
         _updateQueue = _loc2_;
         _updatesMade = true;
      }
      
      function removeEntity(param1:Entity) : void
      {
         var _loc3_:* = null;
         var _loc2_:away3d.core.partition.EntityNode = param1.getEntityPartitionNode();
         _loc2_.removeFromParent();
         if(_loc2_ == _updateQueue)
         {
            _updateQueue = _loc2_._updateQueueNext;
         }
         else
         {
            _loc3_ = _updateQueue;
            while(_loc3_ && _loc3_._updateQueueNext != _loc2_)
            {
               _loc3_ = _loc3_._updateQueueNext;
            }
            if(_loc3_)
            {
               _loc3_._updateQueueNext = _loc2_._updateQueueNext;
            }
         }
         _loc2_._updateQueueNext = null;
         if(!_updateQueue)
         {
            _updatesMade = false;
         }
      }
      
      private function updateEntities() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = _updateQueue;
         _updateQueue = null;
         _updatesMade = false;
         do
         {
            _loc1_ = _rootNode.findPartitionForEntity(_loc2_.entity);
            if(_loc2_.parent != _loc1_)
            {
               if(_loc2_)
               {
                  _loc2_.removeFromParent();
               }
               _loc1_.addNode(_loc2_);
            }
            _loc3_ = _loc2_._updateQueueNext;
            _loc2_._updateQueueNext = null;
            if(_loc2_.entity)
            {
               _loc2_.entity.internalUpdate();
            }
            _loc2_ = _loc3_;
         }
         while(_loc2_ != null);
         
      }
      
      public function removeReference(param1:Entity) : void
      {
         var _loc3_:* = null;
         var _loc2_:away3d.core.partition.EntityNode = param1.getEntityPartitionNode();
         _loc2_.removeFromParent();
         if(_loc2_ == _updateQueue)
         {
            _updateQueue = _loc2_._updateQueueNext;
         }
         else
         {
            _loc3_ = _updateQueue;
            while(_loc3_ && _loc3_._updateQueueNext != _loc2_)
            {
               _loc3_ = _loc3_._updateQueueNext;
            }
            if(_loc3_)
            {
               _loc3_._updateQueueNext = _loc2_._updateQueueNext;
            }
         }
         _loc2_._updateQueueNext = null;
         if(!_updateQueue)
         {
            _updatesMade = false;
         }
         _loc2_.disopse();
      }
   }
}
