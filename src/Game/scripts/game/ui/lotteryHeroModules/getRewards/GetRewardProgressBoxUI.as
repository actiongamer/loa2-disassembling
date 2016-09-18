package game.ui.lotteryHeroModules.getRewards
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS16UI;
   
   public class GetRewardProgressBoxUI extends View
   {
      
      protected static var uiView:XML = <View width="871" height="77">
			  <GetRewardProgressBar x="387" y="-219" var="progressBar_magicUI" runtime="game.ui.lotteryHeroModules.getRewards.GetRewardProgressBarUI"/>
			  <Image skin="png.uiLottery.style7.道具小黑底" x="-58" y="229"/>
			  <Label text="40/100" autoSize="none" x="379" y="191" style="重要提示黄" var="progressBar_value" align="center" width="120" height="20" size="13"/>
			  <Label text="魔力值" autoSize="none" x="398" y="170" style="重要提示黄" var="txt_prompt" align="center" width="80" height="22" size="13"/>
			  <Image skin="png.a5.commonImgs.btn_reward2" var="img_icon" x="408" y="106"/>
			  <Image skin="png.uiLottery.style7.道具小黑底" x="496" y="229"/>
			  <WealthRenderS16 var="wealth0" x="117" y="235" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			  <WealthRenderS16 var="wealth1" y="235" x="619" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			  <WealthRenderS16 var="wealth2" y="235" x="723" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			  <Label text="0" autoSize="none" x="377" y="81" style="重要提示黄" align="center" width="120" height="21" size="14"/>
			  <Label text="200" autoSize="none" x="376.5" y="-22" style="重要提示黄" align="center" width="120" height="18" size="14"/>
			  <Label text="500" autoSize="none" x="377" y="-120" style="重要提示黄" align="center" width="120" height="18" size="14"/>
			  <Label text="1000" autoSize="none" x="377" y="-221" style="重要提示黄" align="center" width="120" height="18" size="14"/>
			  <Label text="\l11900051" autoSize="none" x="379" y="212" style="重要提示黄" align="center" width="120" height="20" size="13"/>
			</View>;
       
      
      public var progressBar_magicUI:game.ui.lotteryHeroModules.getRewards.GetRewardProgressBarUI = null;
      
      public var progressBar_value:Label = null;
      
      public var txt_prompt:Label = null;
      
      public var img_icon:Image = null;
      
      public var wealth0:WealthRenderS16UI = null;
      
      public var wealth1:WealthRenderS16UI = null;
      
      public var wealth2:WealthRenderS16UI = null;
      
      public function GetRewardProgressBoxUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         viewClassMap["game.ui.lotteryHeroModules.getRewards.GetRewardProgressBarUI"] = game.ui.lotteryHeroModules.getRewards.GetRewardProgressBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
