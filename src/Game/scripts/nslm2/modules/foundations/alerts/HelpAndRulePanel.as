package nslm2.modules.foundations.alerts
{
   import game.ui.alerts.HelpAndRulePanelUI;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.HelpAndRuleParam;
   
   public class HelpAndRulePanel extends HelpAndRulePanelUI
   {
       
      
      public function HelpAndRulePanel()
      {
         super();
         btnOK.btn_ok.clickHandler = btn_handler;
      }
      
      private function btn_handler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.contentPanel.visible = false;
         this.contentPanel.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         var _loc2_:HelpAndRuleParam = param1 as HelpAndRuleParam;
         this.panelBg.txt_titleName.text = _loc2_.title;
         this.txt_rule.text = _loc2_.content;
         this.txt_rule.commitMeasure();
         this.contentPanel.commitMeasure();
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         this.contentPanel.visible = true;
      }
   }
}
