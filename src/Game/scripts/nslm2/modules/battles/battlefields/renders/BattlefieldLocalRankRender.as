package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldLocalRankRenderUI;
   import proto.BgRankInfo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   
   public class BattlefieldLocalRankRender extends BattlefieldLocalRankRenderUI
   {
       
      
      public function BattlefieldLocalRankRender()
      {
         super();
      }
      
      private function get vo() : BgRankInfo
      {
         return this.dataSource as BgRankInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
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
            if(this.vo.crossRank <= 3)
            {
               this.txt_crossRank.visible = false;
               this.img_crossRank.visible = true;
               this.img_crossRank.skin = SkinLib.getRankCrown(this.vo.crossRank);
            }
            else
            {
               this.txt_crossRank.visible = true;
               this.txt_crossRank.num = this.vo.crossRank;
               this.img_crossRank.visible = false;
            }
            this.txt_fightValue.text = LocaleConsts.getNumberAbbr2(Uint64Util.toString(this.vo.baseInfo.ability));
            this.txt_name.text = LinkUtils.playerNameSmart(this.vo.baseInfo.id,this.vo.baseInfo.name,this.vo.baseInfo.dist,ColorLib.getMilitaryColor(this.vo.baseInfo.militaryRank));
            this.txt_score.num = this.vo.score;
            this.txt_victoryCnt.num = this.vo.winTimes;
            this.txt_victoryPer.text = LocaleConsts.percentStr(this.vo.winTimes / this.vo.totalTimes);
         }
      }
   }
}
