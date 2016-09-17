package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import proto.HeroBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSkillRenderS2;
   
   public class TooltipNpcSkillCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipNpcSkillCtrl(param1:TooltipUICommon, param2:StcNpcVo, param3:int = 1, param4:HeroBaseInfo = null)
      {
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc9_:* = null;
         super(param1);
         var _loc8_:Array = [];
         if(param4 == null)
         {
            if(param2.skill_id1 > 0)
            {
               ui.addVGap(10);
               ui.addLine();
               ui.addVGap(10);
               _loc5_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[param2.skill_id1,param3]);
               _loc8_.push(new SkillRenderVo(!!_loc5_?_loc5_.id:int(param2.skill_id1),param2.id,true,param4));
            }
            if(param2.skill_id2 > 0)
            {
               _loc7_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[param2.skill_id2,param3]);
               _loc8_.push(new SkillRenderVo(!!_loc7_?_loc7_.id:int(param2.skill_id2),param2.id,true,param4));
            }
            if(param2.skill_id3 > 0)
            {
               _loc6_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[param2.skill_id3,param3]);
               _loc8_.push(new SkillRenderVo(!!_loc6_?_loc6_.id:int(param2.skill_id3),param2.id,true,param4));
            }
            if(param2.skill_id4 > 0)
            {
               _loc9_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[param2.skill_id4,param3]);
               _loc8_.push(new SkillRenderVo(!!_loc9_?_loc9_.id:int(param2.skill_id4),param2.id,true,param4));
            }
         }
         else
         {
            _loc8_ = HeroInfoUtil.getHeroAllSkillVoArr(param4);
         }
         if(_loc8_.length > 0)
         {
            ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.parseText("\\l9030701\\l\\l10220004"),16046112,_loc8_,TooltipSkillRenderS2,15));
         }
      }
   }
}
