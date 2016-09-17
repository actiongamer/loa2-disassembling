package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_skill;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipBuffCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipBuffCtrl(param1:TooltipUICommon, param2:StcBuffVo)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         super(param1);
         this.ui.img_bg.skin = SkinLib.changeSkinNum_underline(this.ui.img_bg.skin,param2.quality);
         this.ui.box.addChild(new TooltipIconAndName_skill(UrlLib.buffIcon(int(param2.icon_id)),param2.quality,LocaleMgr.ins.getStr(param2.name),"",param2.level));
         this.ui.addVGap(10);
         this.ui.addLine();
         this.ui.addVGap(10);
         this.ui.addTxt(LocaleMgr.ins.getStr(param2.desc));
      }
   }
}
