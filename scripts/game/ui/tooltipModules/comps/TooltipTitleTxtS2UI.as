package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipTitleTxtS2UI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="18">
			  <Image skin="png.a5.commonImgs.img_yellow" x="72" y="-7"/>
			  <Label text="标题标题标题标题" autoSize="none" size="12" var="txt_title" align="center" width="300" multiline="true" wordWrap="true" isHtml="true" x="0" y="0" style="加底标题" height="17"/>
			</View>;
       
      
      public var txt_title:Label = null;
      
      public function TooltipTitleTxtS2UI()
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
