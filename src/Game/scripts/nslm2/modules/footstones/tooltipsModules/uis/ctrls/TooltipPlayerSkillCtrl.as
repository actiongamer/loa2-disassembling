package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.TooltipPlayerSkillVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleTxtS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.tooltipModules.comps.TooltipSkillRenderS3UI;
   
   public class TooltipPlayerSkillCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipPlayerSkillCtrl(param1:TooltipUICommon, param2:TooltipPlayerSkillVo)
      {
         var _loc3_:* = null;
         super(param1);
         var _loc4_:TooltipTitleTxtS2 = new TooltipTitleTxtS2();
         _loc4_.dataSource = LocaleMgr.ins.getStr(30300002);
         _loc4_.x = (this.ui.width - _loc4_.width) / 2;
         ui.box.addChild(_loc4_);
         if(param2.usingNorSkillId)
         {
            ui.addVGap(20);
            ui.addLine();
            ui.addVGap();
            _loc3_ = new TooltipSkillRenderS3UI();
            _loc3_.x = 25;
            _loc3_.dataSource = param2.usingNorSkillId;
            ui.box.addChild(_loc3_);
         }
         if(param2.usingSpeSkillId)
         {
            ui.addVGap(20);
            ui.addLine();
            ui.addVGap();
            _loc3_ = new TooltipSkillRenderS3UI();
            _loc3_.x = 25;
            _loc3_.dataSource = param2.usingSpeSkillId;
            ui.box.addChild(_loc3_);
         }
         if(param2.usingAuraSkillId)
         {
            ui.addVGap(20);
            ui.addLine();
            ui.addVGap();
            _loc3_ = new TooltipSkillRenderS3UI();
            _loc3_.x = 25;
            _loc3_.dataSource = param2.usingAuraSkillId;
            ui.box.addChild(_loc3_);
         }
      }
   }
}
