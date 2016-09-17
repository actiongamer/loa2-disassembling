package game.ui.lotteryHeroModules.selectPanels
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.lotteryHeroModules.kindPanels.LHKindQQLotteryRenderUI;
   import morn.core.components.Label;
   import game.ui.lotteryHeroModules.kindPanels.LHKindLotteryRenderUI;
   
   public class LHSelectCommonUI extends View
   {
      
      protected static var uiView:XML = <View width="280" height="69">
			  <Box x="149" y="1" var="box10" mouseChildren="true">
			    <Button label="" buttonMode="true" var="btn_10" style="按钮大黄" x="11" y="34"/>
			    <LHKindQQLotteryRender var="wealthNeed10" runtime="game.ui.lotteryHeroModules.kindPanels.LHKindQQLotteryRenderUI"/>
			  </Box>
			  <Box x="11" y="3" var="box1" mouseChildren="true">
			    <Button label="" buttonMode="true" y="33" var="btn_1" style="按钮大绿" x="4.5"/>
			    <Label text="免费次数" autoSize="left" style="普通说明" width="200" height="16" x="-36" align="center" var="txt_prompt1" y="12" mouseEnabled="false" mouseChildren="false"/>
			    <LHKindLotteryRender var="wealthNeed1" mouseChildren="false" runtime="game.ui.lotteryHeroModules.kindPanels.LHKindLotteryRenderUI"/>
			  </Box>
			</View>;
       
      
      public var box10:Box = null;
      
      public var btn_10:Button = null;
      
      public var wealthNeed10:LHKindQQLotteryRenderUI = null;
      
      public var box1:Box = null;
      
      public var btn_1:Button = null;
      
      public var txt_prompt1:Label = null;
      
      public var wealthNeed1:LHKindLotteryRenderUI = null;
      
      public function LHSelectCommonUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.lotteryHeroModules.kindPanels.LHKindLotteryRenderUI"] = LHKindLotteryRenderUI;
         viewClassMap["game.ui.lotteryHeroModules.kindPanels.LHKindQQLotteryRenderUI"] = LHKindQQLotteryRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
