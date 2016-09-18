package nslm2.modules.funnies.newYears.newYear2016s.bossPanels
{
   import game.ui.newYears.newYear2016s.bossPanels.BossPanelTimesAlertUI;
   import nslm2.modules.foundations.alerts.views.IAlertContent;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import morn.customs.expands.MornExpandUtil;
   
   public class NewYear2016_BossFightAlert extends BossPanelTimesAlertUI implements IAlertContent
   {
       
      
      private var vipHintBox:VipHintBox;
      
      private var vo:AlertMsgVo;
      
      public function NewYear2016_BossFightAlert()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.visible = false;
         service.server_bossNum(server_bossNum_cpl);
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      private function server_bossNum_cpl() : void
      {
         this.visible = true;
         refreshUI();
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_add === _loc4_)
         {
            if(TimePriceUtil.curTimes(12) < int(VipModel.ins.getVipValue(11270)))
            {
               _loc3_ = LocaleMgr.ins.getStr(50200012,[TimePriceUtil.curTimePriceVo(12).count]) + "\n" + LocaleMgr.ins.getStr(50200107,[TimePriceUtil.curTimes(12),int(VipModel.ins.getVipValue(11270))]);
               AlertUtil.comfirm(_loc3_,final_buyTimes_yes,buyTimes_cancel,null,null,null,0,false,11270);
            }
            else if(PlayerModel.ins.vip == 0)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(13310017));
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50200108));
            }
         }
      }
      
      private function refreshUI() : void
      {
         this.txt_times.text = service.bossNum + "/" + int(VipModel.ins.getVipValue(11260));
         if(vipHintBox)
         {
            vipHintBox.dispose();
            vipHintBox = null;
         }
         var _loc1_:String = LocaleMgr.ins.getStr(50200107,[TimePriceUtil.curTimes(12),int(VipModel.ins.getVipValue(11270))]);
         this.txt_tip.text = _loc1_;
         vipHintBox = new VipHintBox(11270,97,156);
         addChild(new VipHintBox(11270,97,156));
      }
      
      private function final_buyTimes_yes() : void
      {
         TimePriceUtil.buyTimes(12,1,addTimes,11270);
      }
      
      private function addTimes() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000433));
         service.bossNum++;
         buyTimes_cancel();
      }
      
      private function buyTimes_cancel() : void
      {
         AlertUtil.comfirm(new NewYear2016_BossFightAlert(),this.vo.handler);
      }
      
      public function setAlert(param1:SimpleAlert) : void
      {
         this.vo = param1.vo;
      }
   }
}
