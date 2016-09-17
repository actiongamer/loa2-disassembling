package away3d.core.data
{
   import away3d.core.base.IRenderable;
   
   public final class RenderableListItem
   {
       
      
      public var next:away3d.core.data.RenderableListItem;
      
      public var renderable:IRenderable;
      
      public var materialId:int;
      
      public var renderOrderId:int;
      
      public var zIndex:Number;
      
      public var isXRay:Boolean;
      
      public var renderPriority:int;
      
      public function RenderableListItem()
      {
         super();
      }
   }
}
