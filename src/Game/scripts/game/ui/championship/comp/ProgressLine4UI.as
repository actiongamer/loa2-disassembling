package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   
   public class ProgressLine4UI extends View
   {
      
      protected static var uiView:XML = <View width="68" height="30">
			  <GRect fillAlpha="1" radius="0,0,0,0" lineAlpha="0" x="0" y="0" width="136" height="2" fillColor="0xd5aa1f" lineColor="0" var="line1"/>
			</View>;
       
      
      public var line1:GRect = null;
      
      public function ProgressLine4UI()
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
