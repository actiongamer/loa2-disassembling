package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.RoleTupoSuccessPanelUI;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.vo.SkillRenderVo;
   import com.mz.core.utils.ListUtil;
   
   public class RoleTupoSuccessPanel extends RoleTupoSuccessPanelUI
   {
       
      
      public function RoleTupoSuccessPanel(param1:int, param2:int)
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.list_up,this.list_up.y,2,2));
         var _loc9_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         var _loc8_:int = _loc9_.tupo;
         var _loc5_:StcTupoVo = getStcTupoVo(_loc9_.node,_loc8_);
         var _loc6_:StcTupoVo = getStcTupoVo(_loc9_.node,_loc8_ - 1);
         var _loc4_:Array = NpcPropVo.calNpcBaseProp(_loc6_.id,param2);
         var _loc3_:Array = NpcPropVo.calNpcBaseProp(_loc9_.id,param2);
         this.list_propNext.dataSource = NpcPropVo.minusStr(_loc3_,_loc4_);
         this.txt_npcName.text = HeroInfoUtil.getNameHasTupoLevel(param1);
         this.txt_desc2.text = LocaleMgr.ins.getStr(int(_loc5_.name)) + _loc5_.tupo_level + ":(" + HeroInfoUtil.getTupoDesc(_loc5_.attr) + ")";
         var _loc7_:StcSkillVo = StcMgr.ins.getSkillVo(RoleTupoUtil.getUnlockSkillId(param1));
         if(_loc7_)
         {
            this.txt_desc3.visible = false;
            this.render_unlockSkill.dataSource = new SkillRenderVo(_loc7_.id,param1);
         }
         else
         {
            this.box_title3.visible = false;
            this.txt_desc3.visible = false;
            this.render_unlockSkill.visible = false;
         }
         this.list_propNext.commitMeasure();
         this.list_up.x = this.list_propNext.x + ListUtil.getLongestTextLength(this.list_propNext,"txt_value") + 55;
      }
      
      private function getStcTupoVo(param1:int, param2:int) : StcTupoVo
      {
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_tupo","hero_node",param1);
         return ArrayUtil.findByAttr(_loc3_,"tupo_level",param2);
      }
   }
}
