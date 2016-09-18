package away3d.containers
{
   import flash.events.EventDispatcher;
   import away3d.core.partition.Partition3D;
   import away3d.core.traverse.PartitionTraverser;
   import §away3d:arcane§._sceneGraphRoot;
   import away3d.entities.Entity;
   import away3d.core.partition.NodeBase;
   
   public class Scene3D extends EventDispatcher
   {
       
      
      var _sceneGraphRoot:away3d.containers.ObjectContainer3D;
      
      private var _partitions:Vector.<Partition3D>;
      
      public function Scene3D()
      {
         super();
         _partitions = new Vector.<Partition3D>();
         _sceneGraphRoot = new away3d.containers.ObjectContainer3D();
         _sceneGraphRoot.scene = this;
         _sceneGraphRoot._isRoot = true;
         _sceneGraphRoot.partition = new Partition3D(new NodeBase());
      }
      
      public function traversePartitions(param1:PartitionTraverser) : void
      {
         var _loc3_:int = 0;
         var _loc2_:uint = _partitions.length;
         param1.scene = this;
         while(_loc3_ < _loc2_)
         {
            _partitions[_loc3_++].traverse(param1);
         }
      }
      
      public function get partition() : Partition3D
      {
         return _sceneGraphRoot.partition;
      }
      
      public function set partition(param1:Partition3D) : void
      {
         _sceneGraphRoot.partition = param1;
      }
      
      public function contains(param1:away3d.containers.ObjectContainer3D) : Boolean
      {
         return _sceneGraphRoot.contains(param1);
      }
      
      public function addChild(param1:away3d.containers.ObjectContainer3D) : away3d.containers.ObjectContainer3D
      {
         return _sceneGraphRoot.addChild(param1);
      }
      
      public function removeChild(param1:away3d.containers.ObjectContainer3D) : void
      {
         _sceneGraphRoot.removeChild(param1);
      }
      
      public function removeChildAt(param1:uint) : void
      {
         _sceneGraphRoot.removeChildAt(param1);
      }
      
      public function getChildAt(param1:uint) : away3d.containers.ObjectContainer3D
      {
         return _sceneGraphRoot.getChildAt(param1);
      }
      
      public function get numChildren() : uint
      {
         return _sceneGraphRoot.numChildren;
      }
      
      function registerEntity(param1:Entity) : void
      {
         var _loc2_:Partition3D = param1.implicitPartition;
         addPartitionUnique(_loc2_);
         _loc2_.markForUpdate(param1);
      }
      
      function unregisterEntity(param1:Entity) : void
      {
         param1.implicitPartition.removeEntity(param1);
      }
      
      function invalidateEntityBounds(param1:Entity) : void
      {
         param1.implicitPartition.markForUpdate(param1);
      }
      
      function registerPartition(param1:Entity) : void
      {
         addPartitionUnique(param1.implicitPartition);
      }
      
      function unregisterPartition(param1:Entity) : void
      {
         param1.implicitPartition.removeEntity(param1);
      }
      
      protected function addPartitionUnique(param1:Partition3D) : void
      {
         if(_partitions.indexOf(param1) == -1)
         {
            _partitions.push(param1);
         }
      }
      
      public function removeReference(param1:Entity) : void
      {
         param1.implicitPartition.removeReference(param1);
      }
   }
}
