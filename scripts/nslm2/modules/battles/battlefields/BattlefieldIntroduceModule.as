package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldIntroduce.BattlefieldIntroduceModuleUI;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   
   public class BattlefieldIntroduceModule extends BattlefieldIntroduceModuleUI
   {
       
      
      public var battlefieldId:int = 1000;
      
      public function BattlefieldIntroduceModule()
      {
         super();
      }
      
      public function get vo() : StcBginfoVo
      {
         return StcMgr.ins.getBginfoVo(battlefieldId);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         battlefieldId = BattlefieldModel.ins.curBattlefieldId;
         this.panelBg.titleImgId = this.moduleId;
         this.img_miniMap.url = UrlLib.battlefieldMiniMap(this.vo.id);
         this.txt_openTime.text = LocaleMgr.ins.getStr(50500020,[BattlefieldUtil.getOpenDateStr(this.vo.bg_open_date)]);
         this.txt_introduce.text = LocaleMgr.ins.getStr(this.vo.language_id);
         this.txt_openLv.text = LocaleMgr.ins.getStr(50500019,[this.vo.bg_open_lv]);
         this.txt_battlefieldName.text = LocaleMgr.ins.getStr(this.vo.bg_name);
         this.txt_playerNums.text = LocaleMgr.ins.getStr(50500021,[this.vo.bg_player_num,this.vo.bg_player_num]);
         this.txt_playTime.text = LocaleMgr.ins.getStr(50500022,[this.vo.bg_max_time]);
         this.txt_winCondition.text = LocaleMgr.ins.getStr(this.vo.bg_vict_kind,[this.vo.bg_vict_num]);
         this.img_bg.skin = UrlLib.battlefieldUI("img_introduceBg");
         this.preShowCpl();
      }
   }
}
