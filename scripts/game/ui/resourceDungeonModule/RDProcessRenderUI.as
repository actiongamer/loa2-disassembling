package game.ui.resourceDungeonModule
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class RDProcessRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="51" height="9">
			  <Image skin="png.uiResourceDungeons.img_process_bg" x="0" y="0" var="img_bg"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public function RDProcessRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
