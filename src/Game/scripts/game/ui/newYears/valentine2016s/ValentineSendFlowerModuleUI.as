package game.ui.newYears.valentine2016s
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import game.ui.commons.icons.WealthRenderS9UI;
   import morn.core.components.Button;
   
   public class ValentineSendFlowerModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="260">
			  <PanelBgS3 width="372" height="260" x="1" y="0"/>
			  <NumBarS1 x="109.5" y="152" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <WealthRenderS9 x="131" y="64" var="item_render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  <Button x="199" y="217" stateNum="1" style="按钮中绿" label="确定" var="btn_ok"/>
			  <Button x="95" y="217" stateNum="1" style="按钮中黄" label="取消" var="btn_cancel"/>
			</PopModuleView>;
       
      
      public var numBarUI:NumBarS1UI = null;
      
      public var item_render:WealthRenderS9UI = null;
      
      public var btn_ok:Button = null;
      
      public var btn_cancel:Button = null;
      
      public function ValentineSendFlowerModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
