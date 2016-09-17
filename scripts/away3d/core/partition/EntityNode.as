package away3d.core.partition
{
   import away3d.entities.Entity;
   import §away3d:arcane§._parent;
   import away3d.core.traverse.PartitionTraverser;
   import away3d.cameras.Camera3D;
   import §away3d:arcane§._numEntities;
   
   public class EntityNode extends NodeBase
   {
       
      
      private var _entity:Entity;
      
      var _updateQueueNext:away3d.core.partition.EntityNode;
      
      public function EntityNode(param1:Entity)
      {
         super();
         _entity = param1;
         _numEntities = 1;
      }
      
      public final function get entity() : Entity
      {
         return _entity;
      }
      
      public function disopse() : void
      {
         if(_entity)
         {
            _entity = null;
         }
         _parent = null;
         _childNodes.length = 0;
      }
      
      override public function acceptTraverser(param1:PartitionTraverser) : void
      {
         param1.applyEntity(_entity);
      }
      
      public function removeFromParent() : void
      {
         if(_parent)
         {
            _parent.removeNode(this);
         }
         _parent = null;
      }
      
      override protected function isInFrustumImpl(param1:Camera3D) : Boolean
      {
         if(!_entity)
         {
            return false;
         }
         if(_entity.isVisible == false)
         {
            return false;
         }
         _entity.pushModelViewProjection(param1);
         if(_entity.forceRenderWithoutFrustum)
         {
            return true;
         }
         if(_entity.bounds && _entity.bounds.isInFrustum(_entity.getModelViewProjectionUnsafe()))
         {
            return true;
         }
         _entity.popModelViewProjection();
         return false;
      }
   }
}
