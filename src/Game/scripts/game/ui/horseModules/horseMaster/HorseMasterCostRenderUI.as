package game.ui.horseModules.horseMaster
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HorseMasterCostRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="75" height="20">
			  <Image skin="png.comp.image" var="img_icon" width="20" height="20" x="0" y="0"/>
			  <Label text="9999" x="20" y="2" width="55" var="txt_num" align="left" style="按钮文字" autoSize="none"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function HorseMasterCostRenderUI()
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
