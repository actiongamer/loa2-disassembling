package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldLocalRankRenderUI;
   import proto.CrossArenaRankInfo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   
   public class PKCRankListRener extends BattlefieldLocalRankRenderUI
   {
       
      
      public function PKCRankListRener()
      {
         super();
         txt_score.x = txt_score.x + 30;
         this.height = 30;
      }
      
      private function get vo() : CrossArenaRankInfo
      {
         return this.dataSource as CrossArenaRankInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         .super.dataSource = param1;
         if(param1)
         {
            if(this.vo.rank <= 3)
            {
               this.txt_rank.visible = false;
               this.img_rank.visible = true;
               this.img_rank.skin = SkinLib.getRankCrown(this.vo.rank);
            }
            else
            {
               this.txt_rank.visible = true;
               this.txt_rank.num = this.vo.rank;
               this.img_rank.visible = false;
            }
            if(PKCrossRankModule.type == 0)
            {
               this.txt_fightValue.text = PlayerModel.ins.getDistName(vo.info);
               this.txt_score.text = vo.massFightTimes + "";
               this.txt_victoryCnt.text = vo.info.lv + "";
               this.txt_victoryPer.text = LocaleConsts.getNumberAbbr2(Uint64Util.toString(this.vo.info.ability));
               this.txt_crossRank.text = vo.score + "";
               this.txt_name.text = LinkUtils.playerNameSmart(this.vo.info.id,this.vo.info.name,this.vo.info.dist,ColorLib.getMilitaryColor(this.vo.info.militaryRank));
            }
            else
            {
               this.txt_fightValue.text = PlayerModel.ins.getDistName(vo.info);
               this.txt_name.text = LinkUtils.playerNameSmart(this.vo.info.id,this.vo.info.name,this.vo.info.dist,ColorLib.getMilitaryColor(this.vo.info.militaryRank));
               this.txt_victoryCnt.text = vo.info.lv + "";
               this.txt_victoryPer.text = LocaleConsts.getNumberAbbr2(Uint64Util.toString(this.vo.info.ability));
               _loc2_ = this.vo.failTimes + this.vo.winTimes;
               this.txt_crossRank.text = this.vo.winTimes + "";
               this.txt_score.text = _loc2_ + "";
            }
         }
      }
   }
}
