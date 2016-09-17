package game.ui.lotteryHeroModules.getRewards
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.customs.components.GRect;
   
   public class GetRewardProgressBarUI extends View
   {
      
      protected static var uiView:XML = <View width="100" height="400">
			  <Image skin="png.uiLottery.style7.进度条蓝条" x="17" y="2" var="progressBar_bg"/>
			  <Image skin="png.uiLottery.style7.进度条拖尾光" x="44" y="316" var="progressBar_eff"/>
			  <GRect fillAlpha="1" radius="0,0,0,0" lineAlpha="0" x="0" y="21" var="progressBar_mask" width="100" height="296"/>
			  <Image skin="png.uiLottery.style7.进度条边" x="17" y="2" var="progressBar_rim"/>
			  <GRect fillAlpha="1" radius="0,0,0,0" lineAlpha="0" y="21" var="progressBar_mask2" width="88" height="357" x="0" fillColor="0x00FFFF"/>
			</View>;
       
      
      public var progressBar_bg:Image = null;
      
      public var progressBar_eff:Image = null;
      
      public var progressBar_mask:GRect = null;
      
      public var progressBar_rim:Image = null;
      
      public var progressBar_mask2:GRect = null;
      
      public function GetRewardProgressBarUI()
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
