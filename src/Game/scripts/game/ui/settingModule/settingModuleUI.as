package game.ui.settingModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Button;
   
   public class settingModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="703" height="504">
			  <PanelBg x="0" y="0" width="703" height="504" showTabLine="true" panelDragEnabled="true" btnCloseStyle="1"/>
			  <Tab labels="画面设置,音效设置,功能设置" x="24" y="40" selectedIndex="0" var="tabBar" style="TAB长"/>
			  <Button label="默认设置" y="440" style="按钮大红" x="193" var="defaultSetting"/>
			  <Button label="保存" x="390" style="按钮大绿" y="440" var="saveSetting"/>
			  <Image skin="png.a5.commonImgs.线" x="19" y="415" width="665"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var defaultSetting:Button = null;
      
      public var saveSetting:Button = null;
      
      public function settingModuleUI()
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
