package nslm2.modules.funnies.teamPKCS.preMatch
{
   import game.ui.teamPKCS.pre.TPKCRankRenderUI;
   import proto.CTeamRankInfo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import nslm2.common.model.PlayerModel;
   
   public class TPKCRankRender extends TPKCRankRenderUI
   {
       
      
      public function TPKCRankRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:CTeamRankInfo = param1 as CTeamRankInfo;
         if(_loc3_)
         {
            if(_loc3_.rank <= 3)
            {
               this.t0.visible = false;
               this.crown.visible = true;
               this.crown.skin = SkinLib.getRankCrown(_loc3_.rank);
            }
            else
            {
               this.t0.visible = true;
               this.t0.num = _loc3_.rank;
               this.crown.visible = false;
            }
            t1.text = TPKConst.getDistName(_loc3_.op,_loc3_.dist,_loc3_.name);
            t2.text = GPKConst.powerToW(_loc3_.ability);
            t3.text = _loc3_.score + "";
         }
         else
         {
            _loc2_ = param1 as CTeamMemberVo;
            if(_loc2_)
            {
               this.crown.visible = false;
               this.t0.visible = true;
               this.t0.text = _loc2_.rank + "";
               this.t1.text = PlayerModel.ins.getFullNameWithDistName(_loc2_.info.info,false);
               this.t2.text = _loc2_.info.win + "";
               this.t3.text = _loc2_.info.score + "";
            }
         }
      }
   }
}
