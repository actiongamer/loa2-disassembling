package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.SkillShowRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   
   public class PhaseUpSkillShowRender extends SkillShowRenderUI
   {
       
      
      private var _data:StcSkillVo;
      
      public function PhaseUpSkillShowRender()
      {
         super();
         txt_skillName.isHtml = true;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         _data = param1 as StcSkillVo;
         if(_data)
         {
            skillRender.dataSource = _data.id;
            _loc3_ = LocaleMgr.ins.getStr(_data.name) + " Lv." + _data.level + ": ";
            _loc2_ = StcMgr.ins.getNpcVo(_data.node_id);
            if(_loc2_ && _loc2_.kind == 21)
            {
               txt_skillName.height = 100;
            }
            txt_skillName.text = TextFieldUtil.htmlText(_loc3_,new TextFormat(null,12,16745472,true)) + LocaleMgr.ins.getStr(_data.skill_description1);
         }
      }
   }
}
