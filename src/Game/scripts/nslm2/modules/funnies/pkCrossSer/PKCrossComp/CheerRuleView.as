package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.pkCrossSer.cheer.CheerRuleViewUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.utils.WealthUtil;
   
   public class CheerRuleView extends CheerRuleViewUI
   {
       
      
      public function CheerRuleView()
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = null;
         super();
         var _loc3_:int = StcMgr.ins.getFunctionVo(50600).level;
         this.txt_desc.text = LocaleMgr.ins.getStr(50600042,[_loc3_,DefindConsts.CROSS_ARENA_CHEER_REWARD_EXP]);
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",8);
         _loc2_.sortOn("id");
         _loc5_ = 0;
         while(_loc5_ < 4)
         {
            _loc4_ = _loc2_[_loc5_];
            _loc1_ = _loc4_.rank.split(":").join("-");
            this["tr" + _loc5_].text = LocaleMgr.ins.getStr(50400602,[_loc1_]);
            this["award" + _loc5_].array = WealthUtil.costStrToArr(_loc4_.jibenjiangli);
            _loc5_++;
         }
      }
   }
}
