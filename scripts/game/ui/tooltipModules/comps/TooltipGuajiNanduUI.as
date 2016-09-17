package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class TooltipGuajiNanduUI extends View
   {
      
      protected static var uiView:XML = <View width="150" height="100">
			  <List x="0" y="32" repeatX="3" name="list" var="render_list">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="关卡难度" autoSize="none" x="2" y="-14" style="渐变1" width="148" height="34" align="center" name="nandu" var="txt_nandu"/>
			  <Label text="可能掉落:" autoSize="none" x="0" y="12" style="加底标题"/>
			</View>;
       
      
      public var render_list:List = null;
      
      public var txt_nandu:Label = null;
      
      public function TooltipGuajiNanduUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
