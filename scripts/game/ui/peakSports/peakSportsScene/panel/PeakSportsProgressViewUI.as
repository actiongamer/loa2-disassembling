package game.ui.peakSports.peakSportsScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class PeakSportsProgressViewUI extends View
   {
      
      protected static var uiView:XML = <View width="211" height="27">
			  <Image skin="png.uiPeakSports.bar2" x="16" y="5.5" width="179" height="16" var="greenBar"/>
			  <Image skin="png.uiPeakSports.bar1" x="16" y="5" var="blueBar"/>
			  <Image skin="png.uiPeakSports.bar1" x="16" y="5" var="maskBar"/>
			  <Image skin="png.uiPeakSports.进度条框" x="0" y="0"/>
			  <Image skin="png.uiPeakSports.进度条框指针" x="103" y="0" var="bar"/>
			</View>;
       
      
      public var greenBar:Image = null;
      
      public var blueBar:Image = null;
      
      public var maskBar:Image = null;
      
      public var bar:Image = null;
      
      public function PeakSportsProgressViewUI()
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
