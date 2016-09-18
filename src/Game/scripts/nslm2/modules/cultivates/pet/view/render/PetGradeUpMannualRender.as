package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.roleInfos.phaseUps.ShenjieTujianListRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   
   public class PetGradeUpMannualRender extends ShenjieTujianListRenderUI
   {
       
      
      private var _data:StcHeroShengjieVo;
      
      private var skillDataArr:Array;
      
      public function PetGradeUpMannualRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         _data = param1 as StcHeroShengjieVo;
         if(_data)
         {
            skillDataArr = [];
            if(_data.level == 1)
            {
               _loc4_ = NpcPropVo.getEmptyPopArr(11,15,0.00001,"+");
            }
            else
            {
               _loc4_ = NpcPropVo.parseArrStr(_data.add_attr,"+",null,0,true,true);
            }
            _loc4_.push(new NpcPropVo(99,_data.glory_rating,"+",null,0,true));
            list_prop.dataSource = _loc4_;
            txt_phaseName.text = LocaleMgr.ins.getStr(int(_data.name));
            _loc3_ = StcMgr.ins.getNpcVo(PetModel.ins.crtPetInfo.id);
            var _loc6_:int = 0;
            var _loc5_:* = _loc3_.skillIdArr;
            for each(var _loc2_ in _loc3_.skillIdArr)
            {
               addSkillData(_loc2_);
            }
            list_skill.spaceY = 40;
            list_skill.dataSource = skillDataArr;
         }
      }
      
      private function addSkillData(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:StcSkillVo = StcMgr.ins.getSkillVo(param1);
         if(_loc3_)
         {
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc3_.node_id,_data.skill_level]);
            skillDataArr.push(_loc2_);
         }
      }
   }
}
