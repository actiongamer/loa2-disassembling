package game.ui.mallModule
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.customs.components.WealthList;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import game.ui.mallModule.render.MallBuyConfirmItemRenderUI;
   
   public class MallBuyComfirmModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="260">
			  <PanelBgS3 width="374" height="260" x="0"/>
			  <NumBarS1 x="125.5" y="146" var="numBar" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <WealthList x="33" y="75" repeatX="5" spaceX="2" var="list_items" centerX="0">
			    <MallBuyConfirmItemRender name="render" runtime="game.ui.mallModule.render.MallBuyConfirmItemRenderUI"/>
			  </WealthList>
			  <Button style="按钮大绿" var="btn_ok" y="209" centerX="0"/>
			  <LotteryRenderS4 x="154" y="215" var="render_totalPrize" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Label text="确认购买以下物品" autoSize="none" x="17.5" y="42" style="普通说明" width="339" height="20" align="center" var="txt_tip1"/>
			  <Box x="38.5" y="172" var="box_qqAlert">
			    <Label text="\l41300830" autoSize="none" y="3" style="渐变1" width="209" height="23" align="center" font="Microsoft YaHei" size="14" x="0"/>
			    <Button label="立即前往" x="215" style="按钮中绿" var="btn_gotoMall"/>
			  </Box>
			</PopModuleView>;
       
      
      public var numBar:NumBarS1UI = null;
      
      public var list_items:WealthList = null;
      
      public var btn_ok:Button = null;
      
      public var render_totalPrize:LotteryRenderS4UI = null;
      
      public var txt_tip1:Label = null;
      
      public var box_qqAlert:Box = null;
      
      public var btn_gotoMall:Button = null;
      
      public function MallBuyComfirmModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.mallModule.render.MallBuyConfirmItemRenderUI"] = MallBuyConfirmItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
