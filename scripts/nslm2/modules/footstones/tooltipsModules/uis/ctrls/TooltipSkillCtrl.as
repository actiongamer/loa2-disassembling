package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.TooltipNpcSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import game.ui.tooltipModules.comps.TooltipTitleTxtUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS4;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSkillRenderS2;
   import morn.core.components.Label;
   
   public class TooltipSkillCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipSkillCtrl(param1:TooltipUICommon, param2:TooltipNpcSkillVo)
      {
         var _loc10_:int = 0;
         var _loc3_:int = 0;
         super(param1);
         var _loc9_:StcNpcVo = param2.npcVO;
         var _loc5_:Array = param2.skillID;
         var _loc6_:Array = [];
         var _loc4_:TooltipTitleTxtUI = new TooltipTitleTxtUI();
         var _loc8_:int = _loc5_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc3_ = _loc5_[_loc10_];
            _loc6_.push(StcMgr.ins.getSkillVo(_loc3_));
            _loc10_++;
         }
         if(_loc6_.length > 0)
         {
            param1.box.addChild(new TooltipTitleListPanelS4(LocaleMgr.ins.getStr(10220004),16046112,_loc6_,TooltipSkillRenderS2,15));
         }
         param1.addVGap(10);
         param1.addLine();
         var _loc7_:Label = new Label(LocaleMgr.ins.getStr(999000181));
         _loc7_.color = 13341521;
         _loc7_.x = 15 + 6;
         param1.addVGap(10);
         param1.box.addChild(_loc7_);
      }
   }
}
