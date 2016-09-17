package game.ui.alerts
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Panel;
   import morn.core.components.Label;
   import game.ui.commons.comps.btns.BtnOkUI;
   
   public class HelpAndRulePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="371" height="450">
			  <PanelBgS3 x="0" y="-2" width="376" height="449"/>
			  <Panel x="31" y="49" width="320" height="319" var="contentPanel">
			    <Label text="重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄重要提示橘黄" autoSize="left" style="普通说明" width="297" var="txt_rule" x="7" y="14" wordWrap="true" multiline="true" leading="12"/>
			  </Panel>
			  <BtnOk x="138" y="399" var="btnOK" centerX="0" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			</PopModuleView>;
       
      
      public var contentPanel:Panel = null;
      
      public var txt_rule:Label = null;
      
      public var btnOK:BtnOkUI = null;
      
      public function HelpAndRulePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
