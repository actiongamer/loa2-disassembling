package nslm2.modules.funnies.teamPKCS.rank
{
   import game.ui.teamPKCS.rank.TPKCRankRenderUI;
   import proto.CTeamRankInfo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TPKCRankRender extends TPKCRankRenderUI
   {
       
      
      public function TPKCRankRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:CTeamRankInfo = param1 as CTeamRankInfo;
         if(_loc2_)
         {
            if(_loc2_.rank <= 3)
            {
               this.t0.visible = false;
               this.img0.visible = true;
               this.img0.skin = SkinLib.getRankCrown(_loc2_.rank);
            }
            else
            {
               this.t0.visible = true;
               this.t0.num = _loc2_.rank;
               this.img0.visible = false;
            }
            t1.text = TPKConst.getDistName(_loc2_.op,_loc2_.dist,_loc2_.name);
            t2.text = _loc2_.leader;
            t3.text = GPKConst.powerToW(_loc2_.ability);
            t5.text = _loc2_.score + "";
            t4.text = _loc2_.win + LocaleMgr.ins.getStr(50800042);
         }
      }
   }
}
