package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.PlayerRenderS2UI;
   
   public class TooltipBuzhenPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="290" height="80">
			  <List x="14" y="29" repeatX="5" spaceX="6" var="list_buzhen">
			    <PlayerRenderS2 name="render" runtime="game.ui.commons.icons.PlayerRenderS2UI"/>
			  </List>
			  <Label text="阵容" autoSize="none" x="-43" y="1" bold="false" var="txt_kind" align="center" width="182" height="25" style="人名1不随品质变化"/>
			  <Image skin="png.a5.prefabs.img_titlePoint" x="14" y="4"/>
			</View>;
       
      
      public var list_buzhen:List = null;
      
      public var txt_kind:Label = null;
      
      public function TooltipBuzhenPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PlayerRenderS2UI"] = PlayerRenderS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
