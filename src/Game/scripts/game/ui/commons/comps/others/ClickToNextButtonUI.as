package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ClickToNextButtonUI extends View
   {
      
      protected static var uiView:XML = <View width="204" height="23">
			  <Image skin="png.a5.commonImgs.img_guideBg" x="0" y="0"/>
			  <Label width="103" x="50.5" text="\l30100016" y="3" style="小标题" autoSize="none" align="center" var="txt_alert" height="20"/>
			</View>;
       
      
      public var txt_alert:Label = null;
      
      public function ClickToNextButtonUI()
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
