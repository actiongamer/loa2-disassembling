package nslm2.modules.roleInfos.phaseUps.talents
{
   import proto.HeroInfo;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentInfoVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   
   public class PhaseUpTalentUtil
   {
       
      
      public function PhaseUpTalentUtil()
      {
         super();
      }
      
      public static function canUp(param1:HeroInfo) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(FuncOpenAutoCtrl.checkOpen(30113))
         {
            _loc5_ = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
            _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent",["node"],[_loc5_.node]);
            if(_loc4_)
            {
               if(_loc4_.talent_1 > 0 && param1.baseInfo.talent.length >= 1)
               {
                  _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc4_.talent_1,param1.baseInfo.talent[0]]) as StcHeroTalentInfoVo;
                  if(canUpOne(_loc2_,param1.baseInfo.sjLevel))
                  {
                     return true;
                  }
               }
               if(_loc4_.talent_2 > 0 && param1.baseInfo.talent.length >= 2)
               {
                  _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc4_.talent_2,param1.baseInfo.talent[1]]) as StcHeroTalentInfoVo;
                  if(canUpOne(_loc2_,param1.baseInfo.sjLevel))
                  {
                     return true;
                  }
               }
               if(_loc4_.talent_3 > 0 && param1.baseInfo.talent.length >= 3)
               {
                  _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc4_.talent_3,param1.baseInfo.talent[2]]) as StcHeroTalentInfoVo;
                  if(canUpOne(_loc2_,param1.baseInfo.sjLevel))
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public static function canUpOne(param1:StcHeroTalentInfoVo, param2:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:StcHeroTalentInfoVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[param1.node,param1.lv + 1]) as StcHeroTalentInfoVo;
         if(_loc4_)
         {
            _loc3_ = WealthVo.parseCostStr(param1.cost);
            if(param2 >= param1.cond)
            {
               if(PlayerModel.ins.getCountByWealthVo(_loc3_) >= _loc3_.count)
               {
                  return true;
               }
            }
         }
         return false;
      }
   }
}
