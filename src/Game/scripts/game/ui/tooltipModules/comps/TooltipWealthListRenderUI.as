package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class TooltipWealthListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="56" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_5" sizeGrid="6,6,6,6" var="img_quality"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="3" width="50" height="50" var="img_icon"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function TooltipWealthListRenderUI()
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
