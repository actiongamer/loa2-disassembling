package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipSkillRenderS2UI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   
   public class TooltipSkillRenderS2 extends TooltipSkillRenderS2UI
   {
       
      
      public var skillNum:Number = NaN;
      
      public function TooltipSkillRenderS2()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(stcSkillId)
         {
            _loc6_ = StcMgr.ins.getSkillVo(stcSkillId);
            _loc2_ = "【" + LocaleMgr.ins.getStr(_loc6_.name) + " Lv." + _loc6_.level + "】";
            _loc5_ = TextFieldUtil.htmlText(_loc2_,new TextFormat(null,null,ColorLib.qualityColor(_loc6_.quality)));
            this.txt_desc.isHtml = true;
            _loc7_ = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",stcSkillId);
            if(_loc7_)
            {
               _loc4_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","skill",_loc7_.id);
               if(_loc4_)
               {
                  if(isNaN(skillNum))
                  {
                     skillNum = FashionModel.ins.fashionAccSkillDict.getValue(_loc4_.id);
                  }
                  this.txt_desc.text = _loc5_ + LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).skill_description1,[int(skillNum) * (Math.abs(_loc7_.intRange) != 1?100:1) / Math.abs(_loc7_.intRange) + (Math.abs(_loc7_.intRange) != 1?"%":"")]);
               }
            }
            else
            {
               this.txt_desc.text = _loc5_ + LocaleMgr.ins.getStr(_loc6_.skill_description1);
            }
         }
         if(skillRenderVo)
         {
            _loc3_ = HeroInfoUtil.getSkillUnlockTupoStr(skillRenderVo.stcSkillId,skillRenderVo.stcNpcId);
            if(_loc3_ != "")
            {
               _loc7_ = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",stcSkillId);
               if(_loc7_)
               {
                  _loc4_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","skill",_loc7_.id);
                  if(_loc4_)
                  {
                     this.txt_desc.text = _loc5_ + LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).skill_description1,[skillRenderVo.getFashionRandomNum() * (Math.abs(_loc7_.intRange) != 1?100:1) / Math.abs(_loc7_.intRange) + (Math.abs(_loc7_.intRange) != 1?"%":"")]) + TextFieldUtil.htmlText2("(" + _loc3_ + ")",16723968);
                  }
               }
               else
               {
                  this.txt_desc.text = _loc5_ + LocaleMgr.ins.getStr(_loc6_.skill_description1) + TextFieldUtil.htmlText2("(" + _loc3_ + ")",16723968);
               }
            }
         }
      }
   }
}
