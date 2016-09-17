package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldMapInfoRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class BattlefieldMapInfoRender extends BattlefieldMapInfoRenderUI
   {
       
      
      public function BattlefieldMapInfoRender()
      {
         super();
      }
      
      public function get vo() : StcBginfoVo
      {
         return this.dataSource as StcBginfoVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.img_miniMap.url = UrlLib.battlefieldMiniMap(vo.id);
         this.txt_battlefieldName.text = LocaleMgr.ins.getStr(vo.bg_name);
         this.txt_playerNums.text = LocaleMgr.ins.getStr(50500021,[vo.bg_player_num,vo.bg_player_num]);
         this.txt_playTime.text = LocaleMgr.ins.getStr(50500022,[vo.bg_max_time]);
         this.txt_winCondition.text = LocaleMgr.ins.getStr(vo.bg_vict_kind,[vo.bg_vict_num]);
         this.img_bg.skin = UrlLib.battlefieldUI("img_introduceBg");
      }
   }
}
