package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipHeroLevelUI extends View
   {
      
      protected static var uiView:XML = <View width="306" height="18">
			  <Label text="等级" autoSize="none" y="0" bold="false" var="txt_name" align="right" style="重要提示橘黄" x="29" width="55" height="20"/>
			  <Label text="VALUE" autoSize="left" x="87" bold="false" var="txt_value" align="left" style="重要提示橘黄" y="0"/>
			  <Label text="阶数" autoSize="none" y="0" bold="false" var="txt_name2" align="right" style="重要提示橘黄" x="153" width="55" height="20"/>
			  <Label text="VALUE" autoSize="left" x="212" bold="false" var="txt_value2" align="left" style="重要提示橘黄" y="0"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var txt_name2:Label = null;
      
      public var txt_value2:Label = null;
      
      public function TooltipHeroLevelUI()
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
