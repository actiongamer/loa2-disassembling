package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.pkCrossSer.cheer.CheerSkillViewUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.CrossArenaCheerReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CrossArenaCheerRes;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.funnies.pkCrossSer.AdvanceBuyBox;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import nslm2.utils.LabelUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class CheerSkillView extends CheerSkillViewUI implements IObserver
   {
       
      
      public function CheerSkillView()
      {
         super();
         model.reqCheerInfo(onInfoRet);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.list.itemRender = CheerSkillRender;
         ObserverMgr.ins.regObserver(this);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["OPT_FINAL_CHEER","OPT_FINAL_CHEER_CHG_TIMES"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("OPT_FINAL_CHEER" !== _loc4_)
         {
            if("OPT_FINAL_CHEER_CHG_TIMES" === _loc4_)
            {
               updateTimes();
            }
         }
         else
         {
            if(model.cheerInfo.residualTimes <= 0)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50600017));
               return;
            }
            _loc3_ = new CrossArenaCheerReq();
            _loc3_.cheerId = param2 as int;
            ServerEngine.ins.send(4319,_loc3_,onCheerRet);
         }
      }
      
      private function onCheerRet(param1:CrossArenaCheerRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(50600018));
         model.cheerInfo.cheerInfos = param1.cheerInfos;
         model.cheerInfo.residualTimes = param1.residualTimes;
         model.cheerInfo.myCheerExp = param1.myCheerExp;
         onInfoRet();
         NpcFuncService.ins.changeCount(50600,param1.residualTimes);
         updateCheerRedPointTime(param1.residualTimes);
         ObserverMgr.ins.sendNotice("OPT_FINAL_CHEER_SWAPACTION");
      }
      
      private function updateCheerRedPointTime(param1:int) : void
      {
         if(param1 <= 0)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50246,false));
            ObserverMgr.ins.sendNotice("OPT_FINAL_CHEER_CHG_TIMES",false);
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50246,true,param1));
            ObserverMgr.ins.sendNotice("OPT_FINAL_CHEER_CHG_TIMES",true);
         }
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_addTimes === _loc3_)
         {
            if(TimePriceUtil.curTimes(11) < int(VipModel.ins.getVipValue(11250)))
            {
               AlertUtil.comfirm(new AdvanceBuyBox(11,11250,50600048,30121013,50600049,addTimes));
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50200108));
            }
         }
      }
      
      private function addTimes() : void
      {
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41300250)));
      }
      
      private function get model() : PKCrossModel
      {
         return PKCrossModel.ins;
      }
      
      private function onInfoRet() : void
      {
         updateTimes();
         model.cheerInfo.cheerInfos.sortOn("cheerId");
         this.list.dataSource = model.cheerInfo.cheerInfos;
         if(model.cheerInfo.residualTimes > 0)
         {
            PKCrossCheerModule.img_red0.visible = true;
         }
      }
      
      private function updateTimes() : void
      {
         this.txt_times.text = LocaleMgr.ins.getStr(50600045) + " " + LabelUtils.leaveMaxStrGR(model.cheerInfo.residualTimes,int(VipModel.ins.getVipValue(11240)));
      }
   }
}
