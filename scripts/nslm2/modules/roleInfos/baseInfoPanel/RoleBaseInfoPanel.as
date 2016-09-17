package nslm2.modules.roleInfos.baseInfoPanel
{
   import game.ui.roleInfos.baseInfoPanel.RoleBaseInfoPanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import morn.core.components.View;
   import nslm2.modules.roleInfos.equipPanels.RoleDetailPropPanel;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.components.PlayerTitleRender;
   
   public class RoleBaseInfoPanel extends RoleBaseInfoPanelUI implements IRoleSubPanel, IViewStackPage
   {
       
      
      public var model:RoleInfoModel;
      
      public function RoleBaseInfoPanel()
      {
         model = RoleInfoModel.ins;
         super();
         (this.playerTitleRender as PlayerTitleRender).isShowTitleName = true;
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.show();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
         model = param1;
      }
      
      public function get subBarRef() : View
      {
         return null;
      }
      
      public function show(param1:Boolean = false) : void
      {
         this.playerTitleRender.dataSource = RoleInfoModel.ins.heroInfo;
         this.panel_baseInfoS1.show(RoleInfoModel.ins.heroInfo);
      }
      
      public function get panel_baseInfoS1() : RoleDetailPropPanel
      {
         return this.panel_baseInfo as RoleDetailPropPanel;
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         NGUtil.checkModuleShow(30100,ModuleMgr.ins.popLayer.getModule(30100));
      }
   }
}
