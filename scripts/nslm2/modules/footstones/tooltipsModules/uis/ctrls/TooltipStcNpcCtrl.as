package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_hero;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.model.HeroModel;
   
   public class TooltipStcNpcCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipStcNpcCtrl(param1:TooltipUICommon, param2:StcNpcVo)
      {
         super(param1);
         ui.box.addChild(new TooltipIconAndName_hero(HeroInfoUtil.getHeadIconUrl(null,param2.id),param2.quality,HeroInfoUtil.getName(null,param2.id),LocaleMgr.ins.getStr(5000 + param2.career_id),0,UrlLib.npcGroupImg(param2.group),!!HeroModel.ins.isCurPlayerHeroByStcNpcId(param2.id)?"":param2.kind == 21?LocaleMgr.ins.getStr(9032000):LocaleMgr.ins.getStr(5100 + param2.group)));
         ui.parts.push(new TooltipNpcSkillCtrl(ui,param2));
         ui.parts.push(new TooltipNpcDescCtrl(ui,param2));
      }
   }
}
