package game.ui.lotteryHeroModules.getRewards
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GetRewardKindRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="138" height="198">
			  <GRect fillAlpha="1" radius="0,0,0,0" lineAlpha="0" fillColor="0x38281b" left="0" right="0" top="0" bottom="0"/>
			  <Image skin="png.uiLuckyReward.style7_2.宝箱底部1" var="img_bg"/>
			  <Image skin="png.a5.commonImgs.btn_reward2" x="70.5" y="74" var="img_icon" anchorX="0.5" anchorY="0.5"/>
			  <Label text="普通说明" autoSize="none" x="6" y="150" style="随品质变化" var="txt_name" align="center" width="126" height="43" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public function GetRewardKindRenderUI()
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
