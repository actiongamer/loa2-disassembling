package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipHorseNeedRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="90" height="16">
			  <Label text="需要xxx:" bold="false" var="txt_name" style="普通说明" autoSize="left" align="left" x="0" y="0"/>
			  <Label text="需要的内容" autoSize="left" bold="false" var="txt_value" style="普通说明" align="left" x="56" y="0"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function TooltipHorseNeedRenderUI()
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
