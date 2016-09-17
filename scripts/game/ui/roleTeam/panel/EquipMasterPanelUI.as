package game.ui.roleTeam.panel
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   
   public class EquipMasterPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="538" height="460" style="普通绿色">
			  <PanelBgS3 width="538" height="460" x="0" y="0" frameVisible="false"/>
			  <Image skin="png.a5.commonImgs.二级框底部光" x="54" y="409"/>
			  <Tab labels="装备强化,装备精炼,宝物强化" x="21" y="42" style="TAB暗红色" var="tabBar" selectedIndex="0"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public function EquipMasterPanelUI()
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
