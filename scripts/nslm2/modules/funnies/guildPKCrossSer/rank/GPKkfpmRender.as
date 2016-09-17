package nslm2.modules.funnies.guildPKCrossSer.rank
{
   import game.ui.guildPKCrossSer.GPKRank.GPKkfpmRenderUI;
   import proto.FamilyExpeCrossRankInfo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   
   public class GPKkfpmRender extends GPKkfpmRenderUI
   {
       
      
      public function GPKkfpmRender()
      {
         super();
      }
      
      private function get vo() : FamilyExpeCrossRankInfo
      {
         return this.dataSource as FamilyExpeCrossRankInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            if(this.vo.rank <= 3)
            {
               this.t0.visible = false;
               this.img0.visible = true;
               this.img0.skin = SkinLib.getRankCrown(this.vo.rank);
            }
            else
            {
               this.t0.visible = true;
               this.t0.num = this.vo.rank;
               this.img0.visible = false;
            }
            t1.text = vo.familyName;
            _loc2_ = "S" + vo.familyDist % 10000;
            _loc2_ = [_loc2_].join(".");
            t2.text = _loc2_;
            t3.text = LinkUtils.playerNameSmart(this.vo.leader.id,this.vo.leader.name,this.vo.leader.dist,ColorLib.getMilitaryColor(this.vo.leader.militaryRank));
            t4.text = GPKConst.powerToW(vo.familyAbility);
            t5.text = vo.winTimes + "";
            t6.text = vo.reputation + "";
         }
      }
   }
}
