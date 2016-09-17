package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipNpcFuncTitleUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="20">
			  <Label text="\l10220005\l" autoSize="none" x="52" y="0" var="txt_name" align="center" width="196" height="18" style="二级框标题"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public function TooltipNpcFuncTitleUI()
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
