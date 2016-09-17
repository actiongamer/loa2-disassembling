package game.ui.roleInfos
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class RoleInfoCostRenderUI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender showMultipleSign="false" width="100" height="16">
			  <Label text="x9999" autoSize="left" x="19" y="0" color="0xffe0a3" var="txt_num" style="随品质变化"/>
			  <Box x="0" y="0">
			    <Image skin="png.comp.image" var="img_icon" width="16" height="16"/>
			  </Box>
			</LotteryRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function RoleInfoCostRenderUI()
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
