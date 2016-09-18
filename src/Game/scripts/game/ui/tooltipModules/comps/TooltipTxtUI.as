package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipTxtUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="18">
			  <Label autoSize="none" color="0xcb9351" bold="false" size="12" var="txt_desc" align="left" width="290" multiline="true" wordWrap="true" isHtml="true" letterSpacing="1" x="0" y="0" text="wezi" leading="6"/>
			</View>;
       
      
      public var txt_desc:Label = null;
      
      public function TooltipTxtUI()
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
