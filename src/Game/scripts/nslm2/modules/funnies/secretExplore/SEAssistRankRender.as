package nslm2.modules.funnies.secretExplore
{
   import game.ui.secretExplore.SEAssistRankRenderUI;
   import proto.MjtxRankInfo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   
   public class SEAssistRankRender extends SEAssistRankRenderUI
   {
       
      
      public function SEAssistRankRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         .super.dataSource = param1;
         var _loc2_:MjtxRankInfo = param1.info as MjtxRankInfo;
         if(param1.rank <= 3)
         {
            this.txt_rank.visible = false;
            this.img_rank.visible = true;
            this.img_rank.skin = SkinLib.getRankCrown(param1.rank);
         }
         else
         {
            this.txt_rank.visible = true;
            this.txt_rank.num = param1.rank;
            this.img_rank.visible = false;
         }
         if(_loc2_)
         {
            this.txt_times.text = _loc2_.num + "";
            txt_name.text = LinkUtils.playerNameSmart(_loc2_.baseInfo.id,_loc2_.baseInfo.name,_loc2_.baseInfo.dist,ColorLib.getMilitaryColor(_loc2_.baseInfo.militaryRank));
         }
         else
         {
            this.txt_times.text = "--";
            txt_name.text = "--";
         }
         this.item0.dataSource = WealthUtil.costStrToArr(StcRankVo(param1.reward).jibenjiangli);
      }
   }
}
