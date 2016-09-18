package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.ShenjieTujianListRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   
   public class RoleShenjieTujianRender extends ShenjieTujianListRenderUI
   {
       
      
      private var _data:StcHeroShengjieVo;
      
      private var skillDataArr:Array;
      
      public function RoleShenjieTujianRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         .super.dataSource = param1;
         _data = param1 as StcHeroShengjieVo;
         if(_data)
         {
            skillDataArr = [];
            if(_data.level == 1)
            {
               list_prop.dataSource = NpcPropVo.getEmptyPopArr(11,15,0.00001,"+");
            }
            else
            {
               list_prop.dataSource = NpcPropVo.parseArrStr(_data.add_attr,"+");
            }
            txt_phaseName.text = LocaleMgr.ins.getStr(int(_data.name));
            RoleInfoModel.ins.heroInfo.baseInfo.id;
            _loc3_ = StcMgr.ins.getNpcVo(RoleInfoModel.ins.heroInfo.baseInfo.baseId);
            var _loc5_:int = 0;
            var _loc4_:* = _loc3_.skillIdArr;
            for each(var _loc2_ in _loc3_.skillIdArr)
            {
               addSkillData(_loc2_);
            }
            list_skill.dataSource = skillDataArr;
         }
      }
      
      private function addSkillData(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:StcSkillVo = StcMgr.ins.getSkillVo(param1);
         if(_loc3_)
         {
            if(skillDataArr.length == 2)
            {
               _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc3_.node_id,1]);
            }
            else
            {
               _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc3_.node_id,_data.skill_level]);
            }
            skillDataArr.push(_loc2_);
         }
      }
   }
}
