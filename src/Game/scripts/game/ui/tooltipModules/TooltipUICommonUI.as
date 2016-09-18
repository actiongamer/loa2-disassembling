package game.ui.tooltipModules
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import morn.core.components.VBox;
   
   public class TooltipUICommonUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="336" height="400">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tooltipBgS1_3" sizeGrid="260,220,20,20" var="img_bg" top="0" bottom="0" width="336"/>
			  <VBox x="0" y="0" var="box" align="none" space="0" width="336"/>
			</FadeView>;
       
      
      public var img_bg:Image = null;
      
      public var box:VBox = null;
      
      public function TooltipUICommonUI()
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
