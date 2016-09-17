package nslm2.common.ui.components.comps2d
{
   import game.ui.commons.icons.SkillRenderS8UI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   
   public class SkillRenderS8 extends SkillRenderS8UI
   {
       
      
      public function SkillRenderS8()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            this.img_icon.url = UrlLib.skillIcon(int(StcMgr.ins.getSkillVo(stcSkillId).skill_icon));
            _loc2_ = "【" + LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).name) + "】";
            _loc3_ = TextFieldUtil.htmlText(_loc2_,new TextFormat(null,null,16745472));
            this.txt_desc.isHtml = true;
            this.txt_desc.text = _loc3_ + LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).skill_description1);
         }
      }
   }
}
