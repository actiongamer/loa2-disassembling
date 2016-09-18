package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.RolePhaseUpSkillRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class RolePhaseUpSkillRender extends RolePhaseUpSkillRenderUI
   {
       
      
      public function RolePhaseUpSkillRender()
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.img_up,this.img_up.y,2,2));
      }
      
      override public function set stcSkillId(param1:int) : void
      {
         .super.stcSkillId = param1;
         if(stcSkillId)
         {
            this.txt_nextLevel.text = LocaleConsts.lvStr(StcMgr.ins.getSkillVo(stcSkillId).level + 1);
         }
      }
      
      override public function set skillRenderVo(param1:SkillRenderVo) : void
      {
         .super.skillRenderVo = param1;
         this.ref_img_icon.filters = null;
      }
   }
}
