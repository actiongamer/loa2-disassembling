package nslm2.modules.battles.PeakSports.service
{
   import com.mz.core.interFace.IObserver;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import proto.BkStageEnterNotify;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleEffMsg;
   import proto.BkStagePlayerInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.BkRegNotify;
   import nslm2.utils.ServerTimer;
   import proto.BkStartNotify;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleTimerMsg;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.battles.PeakSports.utils.PeakSportsUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import proto.ProtocolStatusRes;
   import proto.BkCheckRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.BkEnterReq;
   import proto.BkInfoRes;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.assistantModules.AssistantTimerManager;
   import nslm2.modules.footstones.assistantModules.vos.AssistantTimerVo;
   
   public class PeakSportsService implements IObserver
   {
      
      private static var _ins:nslm2.modules.battles.PeakSports.service.PeakSportsService;
       
      
      public function PeakSportsService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.PeakSports.service.PeakSportsService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.PeakSports.service.PeakSportsService();
         }
         return _ins;
      }
      
      public function init() : void
      {
         ServerEngine.ins.addAlwayHandler(4262,serverCpl_bkStageEnterNotify);
         ServerEngine.ins.addAlwayHandler(4252,serverCpl_bkRegNotify);
         ServerEngine.ins.addAlwayHandler(4256,serverCpl_bkStartNotify);
         ServerEngine.ins.addAlwayHandler(4259,serverCpl_bkTimeoutLeaveNotify);
         needEventListeners(true);
         if(FuncOpenAutoCtrl.checkOpen(50520))
         {
            battlefieldCheck();
         }
      }
      
      private function serverCpl_bkStageEnterNotify(param1:BkStageEnterNotify) : void
      {
         PeakSportsModel.ins.clearLastFightData();
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50520,false));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MINIMAP_EFFECT_VISIBLE",new SwitchModuleEffMsg(50520,false));
         var _loc4_:int = 0;
         var _loc3_:* = param1.playerInfos;
         for each(var _loc2_ in param1.playerInfos)
         {
            PeakSportsModel.ins.bkStagePlayers.put(Uint64Util.toString(_loc2_.playerInfo.baseInfo.id),_loc2_);
         }
         PeakSportsModel.ins.clearData();
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgPeakSportsEnterScene"));
         ModuleMgr.ins.showModule(50527,PeakSportsModel.ins.curPeakSportsId);
      }
      
      public function serverCpl_bkRegNotify(param1:BkRegNotify) : void
      {
         PeakSportsModel.ins.regStamp = param1.regStamp;
         trace("当前时间：" + ServerTimer.ins.second + " 开始时间：" + param1.regStamp + " 相差秒数：" + (ServerTimer.ins.second - param1.regStamp));
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgPeakSportsApplyCpl"));
      }
      
      public function serverCpl_bkStartNotify(param1:BkStartNotify) : void
      {
         PeakSportsModel.ins.startStamp = param1.startStamp;
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50520,true));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MINIMAP_EFFECT_VISIBLE",new SwitchModuleEffMsg(50520,true));
         ObserverMgr.ins.sendNotice("msgSwitchMinimapCountDown",new SwitchModuleTimerMsg(50520,0,PeakSportsModel.ins.startStamp + int(DefindConsts.BG_CONFIRM_TIME)));
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgPeakSportsStart"));
         PeakSportsUtil.showEnterConfirm();
         TimerManager.ins.doOnce((PeakSportsModel.ins.startStamp + int(DefindConsts.BG_CONFIRM_TIME) - ServerTimer.ins.second - 20) * 1000,PeakSportsUtil.showEnterConfirm);
      }
      
      public function serverCpl_bkTimeoutLeaveNotify(param1:ProtocolStatusRes) : void
      {
         PeakSportsModel.ins.clearData();
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgPeakSportsExitCpl"));
      }
      
      public function needEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      public function battlefieldCheck() : void
      {
         ServerEngine.ins.send(4258,null,serverCpl_bkCheck);
      }
      
      private function serverCpl_bkCheck(param1:BkCheckRes) : void
      {
         $res = param1;
         if($res.inBk)
         {
            App.timer.doOnce(2000,function():*
            {
               var /*UnknownSlot*/:* = function():void
               {
                  AlertUtil.comfirm(LocaleMgr.ins.getStr(999600119),confirmBack,refuseBack);
               };
               return function():void
               {
                  AlertUtil.comfirm(LocaleMgr.ins.getStr(999600119),confirmBack,refuseBack);
               };
            }());
         }
      }
      
      private function confirmBack() : void
      {
         acceptPeakSports(true);
      }
      
      private function refuseBack() : void
      {
         acceptPeakSports(false);
      }
      
      public function acceptPeakSports(param1:Boolean) : void
      {
         PeakSportsBattleService.ins.switchEventListeners(param1);
         var _loc2_:BkEnterReq = new BkEnterReq();
         _loc2_.accept = param1;
         ServerEngine.ins.send(4257,_loc2_);
      }
      
      public function getFocusNotices() : Array
      {
         return [];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      public function getPeakSportsInfo() : void
      {
         ServerEngine.ins.send(4250,null,serverCpl_battlefieldInfo);
      }
      
      public function serverCpl_battlefieldInfo(param1:BkInfoRes) : void
      {
         PeakSportsModel.ins.bkInfoRes = param1;
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgPeakSportsInfoCpl"));
      }
      
      public function applySingle() : void
      {
         ServerEngine.ins.send(4251,null,null,serverErr_applySingle);
      }
      
      private function serverErr_applySingle(param1:ProtocolStatusRes) : void
      {
         AssistantModel.ins.removeTask(50520);
         if(param1.errCode == 300004205)
         {
            AssistantTimerManager.ins.addTimer(new AssistantTimerVo(ServerTimer.ins.second + 300,50520));
         }
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      public function exitPeakSports() : void
      {
         ServerEngine.ins.send(4253,null,serverCpl_bgLeave);
      }
      
      public function serverCpl_bgLeave(param1:ProtocolStatusRes) : void
      {
         PeakSportsModel.ins.clearData();
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgPeakSportsExitCpl"));
      }
   }
}
