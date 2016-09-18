package game.ui.lotteryHeroModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ClickToNextButtonTimeUI extends View
   {
      
      protected static var uiView:XML = <View width="204" height="46">
			  <Image skin="png.a5.commonImgs.img_guideBg" x="0" y="0"/>
			  <Label width="103" x="50.5" text="\l30100016" y="3" style="小标题" autoSize="none" align="center" var="txt_alert" height="20"/>
			  <Label width="103" x="50.5" y="25" style="小标题" autoSize="none" align="center" var="timeCdTxt" height="20" text="10秒" size="14"/>
			</View>;
       
      
      public var txt_alert:Label = null;
      
      public var timeCdTxt:Label = null;
      
      public function ClickToNextButtonTimeUI()
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
