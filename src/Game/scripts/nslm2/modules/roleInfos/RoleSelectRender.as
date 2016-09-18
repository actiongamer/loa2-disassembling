package nslm2.modules.roleInfos
{
   import game.ui.roleInfos.RoleSelectRenderUI;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.HeroModel;
   
   public class RoleSelectRender extends RoleSelectRenderUI
   {
       
      
      public function RoleSelectRender()
      {
         super();
      }
      
      public function get panelBaseInfo() : PanelBaseInfo
      {
         return dataSource as PanelBaseInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(panelBaseInfo)
         {
            _loc2_ = StcMgr.ins.getNpcVo(panelBaseInfo.baseId);
            this.txt_name.color = ColorLib.qualityColor(StcMgr.ins.getNpcVo(panelBaseInfo.baseId).quality);
            WealthUtil.changeQualitySkin(this.img_quality,StcMgr.ins.getNpcVo(panelBaseInfo.baseId).quality);
            this.txt_name.text = HeroInfoUtil.getNameHasTupoLevel(panelBaseInfo.baseId);
            if(panelBaseInfo.place != 0 || panelBaseInfo.baseId == HeroModel.ins.playerHero.baseInfo.baseId)
            {
               this.img_buzhenIcon.visible = true;
            }
            else
            {
               this.img_buzhenIcon.visible = false;
            }
            this.txt_lv.text = "Lv." + panelBaseInfo.level;
            this.img_icon.url = HeroInfoUtil.getHeadIconUrl(panelBaseInfo.id,panelBaseInfo.baseId);
            this.toolTip = this.panelBaseInfo;
         }
      }
   }
}
