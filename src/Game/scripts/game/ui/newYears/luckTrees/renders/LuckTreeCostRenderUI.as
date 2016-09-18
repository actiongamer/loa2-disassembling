package game.ui.newYears.luckTrees.renders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class LuckTreeCostRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="165" height="21">
			  <Label text="havmu:999" autoSize="none" x="0" y="2" style="渐变绿" width="165" height="21" align="left" var="txt_num" size="14"/>
			  <Image skin="png.comp.image" var="img_icon" width="24" height="24" x="0" y="0"/>
			</WealthRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function LuckTreeCostRenderUI()
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
