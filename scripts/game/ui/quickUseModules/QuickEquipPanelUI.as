package game.ui.quickUseModules
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS18UI;
   import morn.core.components.Label;
   
   public class QuickEquipPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="285" height="163">
			  <Button label="前往装备" x="87" style="按钮大绿" y="121" var="btn_confirm"/>
			  <WealthRenderS18 x="20" y="42" var="render_item" runtime="game.ui.commons.icons.WealthRenderS18UI"/>
			  <Label text="恭喜你获得新装备" autoSize="none" x="8" y="6" style="渐变1" width="270" height="30" align="center" var="txt_title"/>
			</View>;
       
      
      public var btn_confirm:Button = null;
      
      public var render_item:WealthRenderS18UI = null;
      
      public var txt_title:Label = null;
      
      public function QuickEquipPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS18UI"] = WealthRenderS18UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
