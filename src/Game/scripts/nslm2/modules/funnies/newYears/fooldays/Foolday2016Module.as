package nslm2.modules.funnies.newYears.fooldays
{
   import game.ui.newYears.fooldays.Foolday2016ModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class Foolday2016Module extends Foolday2016ModuleUI
   {
       
      
      public function Foolday2016Module()
      {
         super();
         this.btn_close.addEventListener("click",this.btnCloseHandler);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         this.txt_title.text = LocaleMgr.ins.getStr(9900500);
         if(checkClose() == false)
         {
            return;
         }
         ShopModel.ins.addEventListener("evtShopGetListOver",getShopList);
         getShopList(null);
      }
      
      private function checkClose() : Boolean
      {
         if(NpcFuncService.ins.isOpenTime(this.moduleId) == false && false)
         {
            AlertUtil.floadFuncTimeIsExpire(this.moduleId);
            ObserverMgr.ins.sendNotice("updateIconBar");
            ModuleMgr.ins.closeModule(this.moduleId);
            return false;
         }
         return true;
      }
      
      private function getShopList(param1:Event) : void
      {
         ShopModel.ins.removeEventListener("evtShopGetListOver",getShopList);
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.txt_title.text = LocaleMgr.ins.getStr(9900500);
         (this.shopPanel as Foolday2016ShopPanel).init(this.moduleId);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            TimerManager.ins.doFrameLoop(1,checkClose);
         }
         else
         {
            TimerManager.ins.clearTimer(this.checkClose);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
   }
}
