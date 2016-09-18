package game.ui.assistantModules.renders
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderSize34UI;
   
   public class AssisMysShopRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="325" height="38">
			  <Label text="10/40" autoSize="none" x="169" y="11" style="普通说明" width="65" height="20" var="txt_has" align="center"/>
			  <Button label="添加" x="246" y="10" style="按钮小红" var="btn_change"/>
			  <WealthRenderSize34 x="29" y="1" var="render_item" runtime="game.ui.commons.icons.WealthRenderSize34UI"/>
			  <WealthRenderSize34 x="110" y="1" var="render_cost" runtime="game.ui.commons.icons.WealthRenderSize34UI"/>
			</View>;
       
      
      public var txt_has:Label = null;
      
      public var btn_change:Button = null;
      
      public var render_item:WealthRenderSize34UI = null;
      
      public var render_cost:WealthRenderSize34UI = null;
      
      public function AssisMysShopRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderSize34UI"] = WealthRenderSize34UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
