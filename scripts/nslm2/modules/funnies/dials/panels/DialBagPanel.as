package nslm2.modules.funnies.dials.panels
{
   import game.ui.dialModule.panels.DialBagPanelUI;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class DialBagPanel extends DialBagPanelUI
   {
       
      
      private var _isVipDial:Boolean;
      
      public function DialBagPanel()
      {
         super();
         switchEventListeners(true);
         this.pageBar.bindList(this.list_bag);
         this.list_bag.dataSource = DialModel.ins.getTempBagData(_isVipDial);
         initLanguage();
      }
      
      public function set isVipDial(param1:Boolean) : void
      {
         _isVipDial = param1;
         this.list_bag.dataSource = DialModel.ins.getTempBagData(_isVipDial);
      }
      
      private function initLanguage() : void
      {
         this.txt_60800024.text = LocaleMgr.ins.getStr(60800024);
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            DialMsgs.ins.addEventListener("effect_cpl",onEffectCpl);
         }
         else
         {
            DialMsgs.ins.removeEventListener("effect_cpl",onEffectCpl);
         }
      }
      
      private function onEffectCpl(param1:MzEvent) : void
      {
         this.list_bag.dataSource = DialModel.ins.getTempBagData(_isVipDial);
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
