package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.SkillRenderSmallUI;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class SkillRenderSmall extends SkillRenderSmallUI
   {
       
      
      private var _data:StcSkillVo;
      
      public function SkillRenderSmall()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as StcSkillVo;
         if(_data)
         {
            skillRender.dataSource = _data.id;
            txt_skillName.text = LocaleMgr.ins.getStr(_data.name);
            txt_skillLvl.text = _data.level + LocaleMgr.ins.getStr(999000510);
            this.visible = true;
         }
         else
         {
            this.visible = false;
         }
      }
   }
}
