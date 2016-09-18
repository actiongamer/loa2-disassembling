package nslm2.modules.funnies.busyActivity.dragonBoats.donates
{
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonatePanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.utils.ServerTimer;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import morn.customs.expands.MornExpandUtil;
   
   public class DragonBoatDonatePanel extends DragonBoatDonatePanelUI implements IViewStackPage, IObserver
   {
       
      
      private var cdCtrl:TextCDCtrlS2;
      
      public function DragonBoatDonatePanel()
      {
         super();
         (this.pageBarLeftUI as IPageBar).bindList(this.list_donate);
         (this.pageBarRightUI as IPageBar).bindList(this.list_log);
         this.cdCtrl = new TextCDCtrlS2(this.txt_request_cd,textCDFormat,textCDCpl);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function get service() : DragonBoatService
      {
         return DragonBoatService.ins;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_request === _loc3_)
         {
            ModuleMgr.ins.showModule(13385,0,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      public function viewStackIn() : void
      {
         this.setVisibleList("GET_SERVER_ING",false);
         this.visible = true;
         this.service.protos.server_DRAGON_BOAT_DONATE_PANEL(server_panel_cpl);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function server_panel_cpl() : void
      {
         this.refreshUI();
      }
      
      private function refreshUI() : void
      {
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(DragonBoatService.ins.timeKind_funny);
         if(_loc1_)
         {
            this.txt_cd.text = LocaleMgr.ins.getStr(50600046) + TimeUtils.ymdhisCN(_loc1_.startTm) + " - " + TimeUtils.ymdhisCN(_loc1_.endTm);
         }
         this.setVisibleList("GET_SERVER_ING",true);
         this.refershList();
         this.refreshReqBtn();
      }
      
      private function refershList() : void
      {
         this.list_donate.array = this.service.donatePanelRes.info;
         this.list_log.array = this.service.donatePanelRes.log;
      }
      
      private function refreshReqBtn() : void
      {
         var _loc1_:* = this.service.getNextReqTime() <= ServerTimer.ins.second;
         this.btn_request.disabled = !_loc1_;
         if(_loc1_)
         {
            this.cdCtrl.stop();
            this.txt_request_cd.text = "";
         }
         else
         {
            this.cdCtrl.start(this.service.getNextReqTime());
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return TimeUtils.hisCN(param1);
      }
      
      private function textCDCpl() : void
      {
         this.txt_request_cd.text = "";
         this.btn_request.disabled = false;
      }
      
      public function getFocusNotices() : Array
      {
         return ["DragonBoatService.MSG_DONOTE_NEW"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("DragonBoatService.MSG_DONOTE_NEW" === _loc3_)
         {
            this.refershList();
         }
      }
   }
}
