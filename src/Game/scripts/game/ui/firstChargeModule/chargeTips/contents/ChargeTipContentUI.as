package game.ui.firstChargeModule.chargeTips.contents
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class ChargeTipContentUI extends View
   {
      
      protected static var uiView:XML = <View width="218" height="340">
			  <Image skin="png.uiChargeTips.img_bg6" x="-1" y="-17" var="img_bg"/>
			  <Image skin="png.uiChargeTips.img_char1" x="-44" y="-34" var="img_char" visible="false"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_char:Image = null;
      
      public function ChargeTipContentUI()
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
