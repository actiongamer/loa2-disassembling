package game.ui.BagModules
{
   import morn.customs.components.FadeView;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS8UI;
   import morn.core.components.Label;
   
   public class UseSingleCostAlertUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="382" height="250">
			  <Box x="7.5" y="121" var="boxCost">
			    <Image skin="png.uiBag.红色底" alpha="1"/>
			    <Label text="需要消耗:" autoSize="none" x="35" y="5" style="普通说明" size="14" width="141" height="24" align="right"/>
			    <WealthRenderS8 x="181" y="4" var="renderCost" runtime="game.ui.commons.icons.WealthRenderS8UI"/>
			  </Box>
			  <Label text="需要消耗:" autoSize="none" x="38" y="72" style="普通说明" size="15" width="306" height="26" align="center" var="txt_content1"/>
			</FadeView>;
       
      
      public var boxCost:Box = null;
      
      public var renderCost:WealthRenderS8UI = null;
      
      public var txt_content1:Label = null;
      
      public function UseSingleCostAlertUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS8UI"] = WealthRenderS8UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
