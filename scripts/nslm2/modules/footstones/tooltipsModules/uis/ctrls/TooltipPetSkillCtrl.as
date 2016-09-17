package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSkillRenderS2;
   
   public class TooltipPetSkillCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipPetSkillCtrl(param1:TooltipUICommon, param2:StcNpcVo, param3:int = 1)
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         super(param1);
         var _loc7_:Array = [];
         if(param2.skill_id1 > 0)
         {
            ui.addVGap(10);
            ui.addLine();
            ui.addVGap(10);
            _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[param2.skill_id1,param3]);
            _loc7_.push(new SkillRenderVo(!!_loc4_?_loc4_.id:int(param2.skill_id1),param2.id,false));
         }
         if(param2.skill_id2 > 0)
         {
            _loc6_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[param2.skill_id2,param3]);
            _loc7_.push(new SkillRenderVo(!!_loc6_?_loc6_.id:int(param2.skill_id2),param2.id,false));
         }
         if(param2.skill_id3 > 0)
         {
            _loc5_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[param2.skill_id3,param3]);
            _loc7_.push(new SkillRenderVo(!!_loc5_?_loc5_.id:int(param2.skill_id3),param2.id,false));
         }
         if(param2.skill_id4 > 0)
         {
            _loc8_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[param2.skill_id4,param3]);
            _loc7_.push(new SkillRenderVo(!!_loc8_?_loc8_.id:int(param2.skill_id4),param2.id,false));
         }
         if(_loc7_.length > 0)
         {
            ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(32000010),16046112,_loc7_,TooltipSkillRenderS2,15));
         }
      }
   }
}
