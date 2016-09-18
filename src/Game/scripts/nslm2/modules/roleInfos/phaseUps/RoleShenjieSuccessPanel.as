package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.RoleShenjieSuccessPanelUI;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import morn.core.utils.StringUtils;
   import game.ui.roleInfos.NpcPropVo;
   import game.ui.roleInfos.NpcProp2Vo;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   
   public class RoleShenjieSuccessPanel extends RoleShenjieSuccessPanelUI
   {
       
      
      public function RoleShenjieSuccessPanel()
      {
         super();
         this.txt_npcName.text = HeroInfoUtil.getNameHasTupoLevel(RoleInfoModel.ins.heroInfo.baseInfo.baseId);
         var _loc3_:int = RoleInfoModel.ins.heroInfo.baseInfo.sjLevel - 1;
         _loc3_ = _loc3_ < 0?0:_loc3_;
         var _loc1_:StcHeroShengjieVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[1,_loc3_]) as StcHeroShengjieVo;
         var _loc2_:StcHeroShengjieVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[1,_loc3_ + 1]) as StcHeroShengjieVo;
         showPropPanel(_loc1_,_loc2_);
      }
      
      private function getStcTupoVo(param1:int, param2:int) : StcTupoVo
      {
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_tupo","hero_node",param1);
         return ArrayUtil.findByAttr(_loc3_,"tupo_level",param2);
      }
      
      private function showPropPanel(param1:StcHeroShengjieVo, param2:StcHeroShengjieVo) : void
      {
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         if(param2)
         {
            if(StringUtils.isNull(param1.add_attr))
            {
               _loc3_ = NpcPropVo.getEmptyPopArr(11,15,0.00001,"+");
            }
            else
            {
               _loc3_ = NpcPropVo.parseArrStr(param1.add_attr,"+");
            }
            _loc6_ = NpcPropVo.parseArrStr(param2.add_attr,"+");
         }
         else
         {
            _loc3_ = NpcPropVo.parseArrStr(param1.add_attr);
            _loc6_ = [];
         }
         this.list_propNext.dataSource = NpcProp2Vo.parseTwoPropArr(_loc3_,_loc6_);
         var _loc4_:Array = [];
         var _loc8_:StcNpcVo = StcMgr.ins.getNpcVo(RoleInfoModel.ins.heroInfo.baseInfo.baseId);
         var _loc10_:int = 0;
         var _loc9_:* = _loc8_.skillIdArr;
         for each(var _loc7_ in _loc8_.skillIdArr)
         {
            _loc5_ = StcMgr.ins.getSkillVo(_loc7_);
            if(_loc5_ && _loc5_.show_type != 3)
            {
               _loc4_.push(getSkillData(_loc7_,param1.skill_level));
            }
         }
         list_skill.dataSource = SkillRenderVo.skillVoArrToVoArr(_loc4_,RoleInfoModel.ins.heroInfo.baseInfo.baseId);
      }
      
      private function getSkillData(param1:int, param2:int) : StcSkillVo
      {
         var _loc3_:StcSkillVo = StcMgr.ins.getSkillVo(param1);
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:StcSkillVo = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc3_.node_id,param2]);
         return _loc4_;
      }
   }
}
