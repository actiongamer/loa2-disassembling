package nslm2.modules.roleInfos.phaseUps.talents
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentInfoVo;
   import com.netease.protobuf.UInt64;
   
   public class PhaseUpTalentVo
   {
       
      
      public var heroId:UInt64;
      
      public var heroPhaseLv:int;
      
      public var index:int;
      
      public var stcTablentId:int;
      
      public var talentNodeId:int;
      
      public var lv:int;
      
      public function PhaseUpTalentVo()
      {
         super();
      }
      
      public static function initByNode(param1:int, param2:int) : PhaseUpTalentVo
      {
         var _loc3_:PhaseUpTalentVo = new PhaseUpTalentVo();
         _loc3_.talentNodeId = param1;
         _loc3_.lv = param2;
         _loc3_.stcTablentId = (StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[param1,param2]) as StcHeroTalentInfoVo).id;
         return _loc3_;
      }
      
      public static function initByStcId(param1:int) : PhaseUpTalentVo
      {
         var _loc3_:PhaseUpTalentVo = new PhaseUpTalentVo();
         _loc3_.stcTablentId = param1;
         var _loc2_:StcHeroTalentInfoVo = StcMgr.ins.getHeroTalentInfoVo(param1);
         _loc3_.talentNodeId = _loc2_.node;
         _loc3_.lv = _loc2_.lv;
         return _loc3_;
      }
   }
}
