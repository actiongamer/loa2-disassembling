package nslm2.modules.funnies.dials.panels
{
   import game.ui.dialModule.panels.DialAwardInfoPanelUI;
   import nslm2.common.ui.components.comps2d.HorseLampVMultiLine;
   import nslm2.modules.funnies.dials.service.DialService;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.funnies.dials.model.DialModel;
   
   public class DialAwardInfoPanel extends DialAwardInfoPanelUI
   {
       
      
      private var _horseLamp:HorseLampVMultiLine;
      
      private var _isVipDial:Boolean;
      
      public function DialAwardInfoPanel()
      {
         super();
      }
      
      public function set isVipDial(param1:Boolean) : void
      {
         _isVipDial = param1;
         onRecordCpl(null);
      }
      
      public function init() : void
      {
         switchEventListeners(true);
         DialService.ins.requestRecord();
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            DialMsgs.ins.addEventListener("record_cpl",onRecordCpl);
         }
         else
         {
            DialMsgs.ins.removeEventListener("record_cpl",onRecordCpl);
         }
      }
      
      private function onRecordCpl(param1:MzEvent) : void
      {
         if(_horseLamp == null)
         {
            _horseLamp = new HorseLampVMultiLine("center");
            _horseLamp.mouseEnabled = false;
            this.txt_horseLamp.replaceWith(_horseLamp);
            _horseLamp.init(4);
            _horseLamp.speed = 1;
         }
         _horseLamp.show(!!_isVipDial?DialModel.ins.superRecord:DialModel.ins.record);
      }
   }
}
