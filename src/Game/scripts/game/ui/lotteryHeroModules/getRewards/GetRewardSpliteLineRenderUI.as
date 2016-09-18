package game.ui.lotteryHeroModules.getRewards
{
   import morn.core.components.View;
   
   public class GetRewardSpliteLineRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="2" height="198">
			  <Image skin="png.uiLuckyReward.style7_2.分割线"/>
			</View>;
       
      
      public function GetRewardSpliteLineRenderUI()
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
