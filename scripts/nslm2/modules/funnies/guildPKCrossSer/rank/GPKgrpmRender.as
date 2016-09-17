package nslm2.modules.funnies.guildPKCrossSer.rank
{
   import game.ui.guildPKCrossSer.GPKRank.GPKgrpmRenderUI;
   import proto.FamilyExpeSingleRankInfo;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   
   public class GPKgrpmRender extends GPKgrpmRenderUI
   {
       
      
      public function GPKgrpmRender()
      {
         super();
      }
      
      private function get vo() : FamilyExpeSingleRankInfo
      {
         return this.dataSource as FamilyExpeSingleRankInfo;
      }
      
      private function getDistStr(param1:String, param2:uint, param3:String) : String
      {
         var _loc4_:* = null;
         if(!StringUtils.isNull(param3))
         {
            _loc4_ = param3;
         }
         else
         {
            _loc4_ = "S" + param2 % 10000;
         }
         return [param1,_loc4_].join(".");
      }
      
      override public function set dataSource(param1:Object) : void
      {
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
            t1.text = LinkUtils.playerNameSmart(this.vo.info.id,this.vo.info.name,this.vo.info.dist,ColorLib.getMilitaryColor(this.vo.info.militaryRank));
            t2.text = vo.info.lv + "";
            t3.text = GPKConst.powerToW(vo.info.ability);
            t4.text = vo.con + "";
            t5.text = vo.info.familyName;
            t6.text = vo.familyRank + "";
         }
      }
   }
}
