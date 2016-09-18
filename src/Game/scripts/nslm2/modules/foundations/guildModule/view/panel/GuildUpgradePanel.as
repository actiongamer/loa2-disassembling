package nslm2.modules.foundations.guildModule.view.panel
{
   import game.ui.guildModules.GuildUpgradePanelUI;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiZhiweiVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class GuildUpgradePanel extends GuildUpgradePanelUI
   {
       
      
      private var gModel:GuildModel;
      
      public function GuildUpgradePanel()
      {
         super();
         gModel = GuildModel.ins;
         btn_upgrade.clickHandler = doUpgrade;
         txt_con.x = txt_conLbl.textWidth + 2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         update();
         this.panelBg.titleImgId = this.moduleId;
         super.preShow();
      }
      
      private function doUpgrade(param1:Object) : void
      {
         GuildServiceHandler.ins.upGrade(upgradeSuccess);
      }
      
      private function upgradeSuccess(param1:Object) : void
      {
         gModel.pos++;
         gModel.updateMyPos(gModel.pos);
         update();
      }
      
      private function update() : void
      {
         var _loc4_:* = null;
         var _loc3_:* = 0;
         var _loc2_:StcGonghuiZhiweiVo = StcMgr.ins.getGonghuiZhiweiVo(gModel.pos);
         var _loc1_:int = _loc2_.next;
         if(_loc1_ > 0)
         {
            _loc4_ = StcMgr.ins.getGonghuiZhiweiVo(_loc1_);
         }
         txt_con.text = gModel.con + "";
         txt_postName.text = LocaleMgr.ins.getStr(_loc2_.name);
         txt_salary.text = StcMgr.ins.getDropBaseVo(_loc2_.reward).number + "";
         box_nextSa.visible = true;
         txt_top.visible = false;
         txt_need.visible = true;
         if(_loc4_)
         {
            _loc3_ = uint(_loc4_.exp <= gModel.con?458496:16723968);
            btn_upgrade.disabled = _loc4_.exp > gModel.con;
            txt_nextPostName.text = LocaleMgr.ins.getStr(_loc4_.name);
            txt_need.text = LocaleMgr.ins.getStr(40700001) + TextFieldUtil.htmlText2(_loc4_.exp,_loc3_);
            txt_salaryNext.text = StcMgr.ins.getDropBaseVo(_loc4_.reward).number + "";
         }
         else
         {
            txt_need.visible = false;
            box_nextSa.visible = false;
            txt_nextPostName.visible = false;
            txt_top.visible = true;
            txt_need.visible = false;
            txt_salaryNext.visible = false;
            txt_need.visible = false;
            btn_upgrade.visible = false;
         }
      }
   }
}
