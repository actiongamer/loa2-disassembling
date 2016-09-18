package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipTitleListPanelS6UI extends View
   {
      
      protected static var uiView:XML = <View width="210" height="109">
			  <Label text="标题文字" y="0" var="txt_title" align="left" x="21" style="重要提示黄" width="189" height="20"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="5" y="3"/>
			</View>;
       
      
      public var txt_title:Label = null;
      
      public function TooltipTitleListPanelS6UI()
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
