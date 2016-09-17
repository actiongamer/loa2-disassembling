package game.ui.groupon
{
   import morn.customs.components.PopModuleView;
   import morn.customs.components.WealthList;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS16UI;
   import morn.core.components.Box;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import game.ui.commons.icons.WealthRender60X60UI;
   
   public class BuyComfirmModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="260">
			  <PanelBgS3 width="374" height="260" x="0"/>
			  <WealthList x="33" y="75" repeatX="1" spaceX="2" var="list_items" centerX="0">
			    <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  </WealthList>
			  <Button style="按钮大绿" var="btn_ok" y="209" centerX="0"/>
			  <Label text="确认购买以下物品" autoSize="none" x="34.5" y="42" style="普通说明" width="305" height="20" align="center"/>
			  <Label text="确认购买以下物品" autoSize="none" x="34.5" y="176" style="普通说明" width="305" height="20" align="center" centerX="0" var="txt_buyLimit"/>
			  <WealthRenderS16 x="149" y="213" var="costDiamond" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			  <Box x="251" y="214" var="box_useCoupon">
			    <WealthRenderS16 x="22" var="costCoupon" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			    <Label text="+" autoSize="none" y="3" style="普通说明" width="20" height="20" align="center"/>
			  </Box>
			  <Label text="购买份数" autoSize="none" x="24" y="147" style="普通说明" width="108" height="20" size="12" align="right"/>
			  <NumBarS1 x="137" y="145" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			</PopModuleView>;
       
      
      public var list_items:WealthList = null;
      
      public var btn_ok:Button = null;
      
      public var txt_buyLimit:Label = null;
      
      public var costDiamond:WealthRenderS16UI = null;
      
      public var box_useCoupon:Box = null;
      
      public var costCoupon:WealthRenderS16UI = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public function BuyComfirmModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
