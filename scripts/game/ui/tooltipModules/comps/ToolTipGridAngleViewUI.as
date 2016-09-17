package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.props.RolePropBaseRenderS2UI;
   
   public class ToolTipGridAngleViewUI extends View
   {
      
      protected static var uiView:XML = <View width="119" height="19">
			  <List x="0" y="0" width="94" height="19" var="list_prop">
			    <RolePropBaseRenderS2 x="0" y="0" name="render" runtime="game.ui.commons.props.RolePropBaseRenderS2UI"/>
			  </List>
			  <Label text="（已激活）" autoSize="none" x="110" y="0" style="普通绿色" var="label_active"/>
			</View>;
       
      
      public var list_prop:List = null;
      
      public var label_active:Label = null;
      
      public function ToolTipGridAngleViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.RolePropBaseRenderS2UI"] = RolePropBaseRenderS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
