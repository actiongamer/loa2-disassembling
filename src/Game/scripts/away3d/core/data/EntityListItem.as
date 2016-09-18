package away3d.core.data
{
   import away3d.entities.Entity;
   
   public class EntityListItem
   {
       
      
      public var entity:Entity;
      
      public var next:away3d.core.data.EntityListItem;
      
      public function EntityListItem()
      {
         super();
      }
   }
}
