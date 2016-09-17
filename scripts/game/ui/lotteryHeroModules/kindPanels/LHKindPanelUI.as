package game.ui.lotteryHeroModules.kindPanels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.core.components.HBox;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   import morn.customs.components.Placeholder;
   import game.ui.lotteryHeroModules.getRewards.GetRewardProgressBoxUI;
   
   public class LHKindPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="1500" height="900">
			  <LHKindNormal x="329" y="211" centerY="0" centerX="-270" var="renderKindNormal" runtime="game.ui.lotteryHeroModules.kindPanels.LHKindNormalUI"/>
			  <LHKindAdvan x="975" y="748" centerY="0" centerX="270" var="renderKindAdvan" runtime="game.ui.lotteryHeroModules.kindPanels.LHKindAdvanUI"/>
			  <Box x="863" var="box_discount" y="175" width="316" top="177">
			    <Image skin="png.uiLottery.style7.今日定向" x="0" y="0" width="316" height="39"/>
			    <HBox y="9" align="middle" var="box_discountH">
			      <Label text="折扣" y="2" stroke="0x0" var="txt_discount1" align="left" isHtml="true" style="二级框标题" autoSize="left"/>
			      <ClipList value="73" align="left" url="png.a5.comps.clipList.clipList_S12" x="41" clipWidth="16" var="clip_discount"/>
			      <Label text="折, 倒计时XXX" x="68" y="1" stroke="0x0" var="txt_discount2" align="left" isHtml="true" style="二级框标题" autoSize="left"/>
			    </HBox>
			  </Box>
			  <Placeholder width="460" height="63" x="279" var="txt_prompt_place" bottom="0" left="0" y="10"/>
			  <GetRewardProgressBox x="314" var="getRewardProgressBoxUI" centerX="0" y="468" centerY="50" runtime="game.ui.lotteryHeroModules.getRewards.GetRewardProgressBoxUI"/>
			</PanelView>;
       
      
      public var renderKindNormal:game.ui.lotteryHeroModules.kindPanels.LHKindNormalUI = null;
      
      public var renderKindAdvan:game.ui.lotteryHeroModules.kindPanels.LHKindAdvanUI = null;
      
      public var box_discount:Box = null;
      
      public var box_discountH:HBox = null;
      
      public var txt_discount1:Label = null;
      
      public var clip_discount:ClipList = null;
      
      public var txt_discount2:Label = null;
      
      public var txt_prompt_place:Placeholder = null;
      
      public var getRewardProgressBoxUI:GetRewardProgressBoxUI = null;
      
      public function LHKindPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.lotteryHeroModules.getRewards.GetRewardProgressBoxUI"] = GetRewardProgressBoxUI;
         viewClassMap["game.ui.lotteryHeroModules.kindPanels.LHKindAdvanUI"] = game.ui.lotteryHeroModules.kindPanels.LHKindAdvanUI;
         viewClassMap["game.ui.lotteryHeroModules.kindPanels.LHKindNormalUI"] = game.ui.lotteryHeroModules.kindPanels.LHKindNormalUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
