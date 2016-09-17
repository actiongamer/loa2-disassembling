package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   
   public class ProgressLine1UI extends View
   {
      
      protected static var uiView:XML = <View width="68" height="30">
			  <GRect fillAlpha="1" radius="0,0,0,0" lineAlpha="0" x="0" y="0" width="60" height="2" fillColor="0xd5aa1f" lineColor="0" var="line1"/>
			  <GRect fillAlpha="1" lineAlpha="0" x="59" y="1" width="2" height="14" fillColor="0xd5aa1f" lineColor="0" var="line2"/>
			</View>;
       
      
      public var line1:GRect = null;
      
      public var line2:GRect = null;
      
      public function ProgressLine1UI()
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
