package game.ui.quickUseModules
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS18UI;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.core.components.Button;
   
   public class QuickItemPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="285" height="163">
			  <WealthRenderS18 x="20" y="42" var="render_item" runtime="game.ui.commons.icons.WealthRenderS18UI"/>
			  <NumBarS1 x="97" y="90" var="numBarRef" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <Label text="使用数量：" autoSize="none" x="96" y="69" style="普通说明"/>
			  <Button label="立即使用" x="87" style="按钮大绿" y="121" var="btn_confirm"/>
			  <Label text="恭喜你获得新物品" autoSize="none" x="8" y="6" style="渐变1" width="270" height="22" align="center"/>
			</View>;
       
      
      public var render_item:WealthRenderS18UI = null;
      
      public var numBarRef:NumBarS1UI = null;
      
      public var btn_confirm:Button = null;
      
      public function QuickItemPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS18UI"] = WealthRenderS18UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
