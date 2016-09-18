package nslm2.modules.funnies.guildPKCrossSer.comp
{
   import game.ui.guildPKCrossSer.GPKRankRenderUI;
   import proto.FamilyExpeConRankInfo;
   import nslm2.modules.funnies.pkCrossSer.PKCrossConst;
   import nslm2.common.vo.PlayerVo;
   
   public class GPKRankRender extends GPKRankRenderUI
   {
      
      public static var type:int = 0;
       
      
      public function GPKRankRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc3_:FamilyExpeConRankInfo = param1 as FamilyExpeConRankInfo;
         var _loc2_:PlayerVo = PKCrossConst.RankInfoToPlayerVo(_loc3_.baseInfo);
         _loc2_.militaryRank = 0;
         this.txt_rank.text = _loc3_.rank + "";
         txt_times.text = _loc3_.fightTimes + "";
         txt_gx.text = _loc3_.con + "";
         txt_win.text = _loc3_.winTimes + "";
         .super.dataSource = _loc2_;
      }
   }
}
