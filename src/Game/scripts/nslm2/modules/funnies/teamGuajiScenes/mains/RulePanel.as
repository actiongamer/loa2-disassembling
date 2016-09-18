package nslm2.modules.funnies.teamGuajiScenes.mains
{
   import game.ui.teamGuajiScenes.mains.RulePanelUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class RulePanel extends RulePanelUI
   {
       
      
      public function RulePanel()
      {
         super();
         this.txt_tip1.text = LocaleMgr.ins.getStr(41210005);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_rule === _loc3_)
         {
            ModuleMgr.ins.showModule(12201,new HelpAndRuleParam(LocaleMgr.ins.getStr(41210006),LocaleMgr.ins.getStr(41210014)),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
   }
}
