package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipNpcFuncTitle;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipNpcFuncDesc;
   
   public class TooltipNpcFuncCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipNpcFuncCtrl(param1:TooltipUICommon, param2:StcFunctionVo)
      {
         super(param1);
         ui.box.addChild(new TooltipNpcFuncTitle(41600021));
         ui.addVGap(10);
         ui.addLine();
         ui.addVGap(10);
         ui.box.addChild(new TooltipNpcFuncDesc(41600020,int(param2.play_desc)));
         ui.addLine();
         ui.addVGap(10);
         ui.box.addChild(new TooltipNpcFuncDesc(41600021,int(param2.rule_desc)));
         ui.addLine();
         ui.addVGap(10);
         ui.box.addChild(new TooltipNpcFuncDesc(41600022,int(param2.reward_desc)));
         ui.addVGap(10);
      }
   }
}
