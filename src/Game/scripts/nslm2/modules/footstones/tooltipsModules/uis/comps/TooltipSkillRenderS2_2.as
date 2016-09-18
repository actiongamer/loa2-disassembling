package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipSkillRenderS2UI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.mgrs.skins.ColorLib;
   
   public class TooltipSkillRenderS2_2 extends TooltipSkillRenderS2UI
   {
       
      
      public function TooltipSkillRenderS2_2()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            _loc4_ = StcMgr.ins.getSkillVo(stcSkillId);
            this.img_icon.url = UrlLib.skillIcon(int(_loc4_.skill_icon));
            _loc2_ = "【" + LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).name) + "】";
            _loc3_ = TextFieldUtil.htmlText(_loc2_,new TextFormat(null,null,ColorLib.qualityColor(_loc4_.quality)));
            this.txt_desc.isHtml = true;
            this.txt_desc.text = _loc3_ + LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).skill_description1);
         }
      }
   }
}
