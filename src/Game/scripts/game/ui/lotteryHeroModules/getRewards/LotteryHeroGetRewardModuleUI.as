package game.ui.lotteryHeroModules.getRewards
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS13UI;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   
   public class LotteryHeroGetRewardModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="548" height="400">
			  <PanelBg x="0" y="0" width="548" height="400"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="12.5" y="37" width="523" height="306" sizeGrid="20,20,20,20" var="img_bgInner1"/>
			  <Image skin="png.a5.bgs.panelBgs.底框01" sizeGrid="16,16,16,16" width="494" height="222" x="27" y="78" var="img_bg"/>
			  <Button label="\l11900045" style="按钮大绿" y="351" var="btn_getReward" labelMargin="54" x="121"/>
			  <List x="43" y="92" repeatX="4" spaceX="26" var="list_reward" centerX="0">
			    <GetRewardRender name="render" runtime="game.ui.lotteryHeroModules.getRewards.GetRewardRenderUI"/>
			  </List>
			  <List x="67" y="92" var="list_kind" repeatX="3" centerX="0" spaceX="22">
			    <GetRewardKindRender name="render" runtime="game.ui.lotteryHeroModules.getRewards.GetRewardKindRenderUI"/>
			  </List>
			  <List x="231" y="91" repeatX="2" spaceX="160" centerX="0" var="list_spliteLine">
			    <GetRewardSpliteLineRender name="render" runtime="game.ui.lotteryHeroModules.getRewards.GetRewardSpliteLineRenderUI"/>
			  </List>
			  <Label text="普通说明\n普通说明" autoSize="none" style="普通说明" width="475" align="center" var="txt_prompt" multiline="true" wordWrap="true" x="36" y="44"/>
			  <Button label="\l11900016" x="293.5" style="按钮大红" y="351" var="btn_return"/>
			  <WealthRenderS13 x="128" y="358" var="render_cost" runtime="game.ui.commons.icons.WealthRenderS13UI"/>
			  <PageBarS1 x="227" y="307" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			</PopModuleView>;
       
      
      public var img_bgInner1:Image = null;
      
      public var img_bg:Image = null;
      
      public var btn_getReward:Button = null;
      
      public var list_reward:List = null;
      
      public var list_kind:List = null;
      
      public var list_spliteLine:List = null;
      
      public var txt_prompt:Label = null;
      
      public var btn_return:Button = null;
      
      public var render_cost:WealthRenderS13UI = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public function LotteryHeroGetRewardModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS13UI"] = WealthRenderS13UI;
         viewClassMap["game.ui.lotteryHeroModules.getRewards.GetRewardKindRenderUI"] = GetRewardKindRenderUI;
         viewClassMap["game.ui.lotteryHeroModules.getRewards.GetRewardRenderUI"] = GetRewardRenderUI;
         viewClassMap["game.ui.lotteryHeroModules.getRewards.GetRewardSpliteLineRenderUI"] = GetRewardSpliteLineRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
