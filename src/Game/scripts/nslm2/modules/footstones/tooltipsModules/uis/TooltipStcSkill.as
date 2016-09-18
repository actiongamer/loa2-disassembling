package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_skill;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   
   public class TooltipStcSkill extends TooltipUICommon
   {
       
      
      public function TooltipStcSkill()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc6_:* = null;
         var _loc8_:int = 0;
         var _loc11_:int = 0;
         var _loc4_:* = null;
         var _loc9_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc5_:int = 0;
         if(param1 is SkillRenderVo)
         {
            _loc4_ = param1 as SkillRenderVo;
            _loc9_ = StcMgr.ins.getSkillVo(_loc4_.stcSkillId);
         }
         else if(param1 is StcSkillVo)
         {
            _loc9_ = param1 as StcSkillVo;
         }
         this.img_bg.skin = SkinLib.changeSkinNum_underline(this.img_bg.skin,_loc9_.quality);
         this.box.addChild(new TooltipIconAndName_skill(UrlLib.skillIcon(int(_loc9_.skill_icon)),_loc9_.quality,LocaleMgr.ins.getStr(_loc9_.name),LocaleMgr.ins.getStr(4300 + _loc9_.show_type),_loc9_.level));
         this.addVGap(10);
         this.addLine();
         this.addVGap(10);
         var _loc10_:StcFashionExtraSkillVo = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",_loc9_.id);
         if(_loc10_)
         {
            _loc7_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","skill",_loc10_.id);
            if(_loc7_)
            {
               if(_loc4_)
               {
                  _loc3_ = LocaleMgr.ins.getStr(_loc9_.skill_description1,[_loc4_.getFashionRandomNum() * (Math.abs(_loc10_.intRange) != 1?100:1) / Math.abs(_loc10_.intRange) + (Math.abs(_loc10_.intRange) != 1?"%":"")]);
               }
               else
               {
                  _loc3_ = LocaleMgr.ins.getStr(_loc9_.skill_description1,[int(FashionModel.ins.fashionAccSkillDict.getValue(_loc7_.id)) * (Math.abs(_loc10_.intRange) != 1?100:1) / Math.abs(_loc10_.intRange) + (Math.abs(_loc10_.intRange) != 1?"%":"")]);
               }
            }
         }
         else
         {
            _loc3_ = LocaleMgr.ins.getStr(_loc9_.skill_description1);
         }
         this.addTxt(_loc3_);
         if(_loc4_ && HeroInfoUtil.hasUnlockedSkill(_loc4_.stcSkillId,_loc4_.stcNpcId) == false)
         {
            _loc5_ = HeroInfoUtil.getSkillUnlockTupoLevel(_loc4_.stcSkillId,_loc4_.stcNpcId);
            if(_loc5_ != 0)
            {
               this.addLine();
               this.addVGap(10);
               this.addTxt(HeroInfoUtil.getSkillUnlockTupoStr(_loc4_.stcSkillId,_loc4_.stcNpcId));
            }
         }
         this.validateSize();
      }
   }
}
