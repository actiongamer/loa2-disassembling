package nslm2.modules.battles.PeakSports.utils
{
   import nslm2.modules.battles.PeakSports.type.PeakSportsConsts;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import proto.ScenePlayerInfo;
   import proto.BkStagePlayerInfo;
   import proto.BkSceneMoveNotify;
   import proto.BkPlayerStatusNotify;
   import proto.BkStageGetReportRes;
   import proto.BkStageEndNotify;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.battles.PeakSports.type.PeakSportsTempType;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.battles.PeakSports.view.renders.PeakSportsStartRender;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.PeakSports.service.PeakSportsService;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleEffMsg;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.TextFieldUtil;
   
   public class PeakSportsUtil
   {
       
      
      public function PeakSportsUtil()
      {
         super();
      }
      
      public static function getOpenDateStr(param1:int) : String
      {
         return PeakSportsConsts.openDate.getValue(param1);
      }
      
      public static function isFriend(param1:int) : Boolean
      {
         return PeakSportsModel.ins.currentBkStagePlayerInfo.side == param1;
      }
      
      public static function canClickTarget(param1:Point) : Boolean
      {
         return MathUtil.disWith2Point(new Point(PeakSportsModel.ins.curScene.playerHero.pos2d.x,PeakSportsModel.ins.curScene.playerHero.pos2d.y),param1) <= 255;
      }
      
      public static function bkStagePlayerInfoToScenePlayerInfo(param1:BkStagePlayerInfo) : ScenePlayerInfo
      {
         var _loc2_:ScenePlayerInfo = new ScenePlayerInfo();
         _loc2_.baseInfo = param1.playerInfo.baseInfo;
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         return _loc2_;
      }
      
      public static function bkStatusNotifyToCrossSceneMoveNotify(param1:BkPlayerStatusNotify) : BkSceneMoveNotify
      {
         var _loc2_:BkSceneMoveNotify = new BkSceneMoveNotify();
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         _loc2_.legal = false;
         _loc2_.id = param1.playerId;
         return _loc2_;
      }
      
      public static function bkStageEndNotifyToBgStageGetReportRes(param1:BkStageEndNotify) : BkStageGetReportRes
      {
         var _loc2_:BkStageGetReportRes = new BkStageGetReportRes();
         _loc2_.end = true;
         _loc2_.reportInfos = param1.reportInfos;
         return _loc2_;
      }
      
      public static function showEnterConfirm() : void
      {
         if(PeakSportsModel.ins.startStamp != 0)
         {
            TimerManager.ins.clearTimer(refusePeakSports);
            TimerManager.ins.doOnce((PeakSportsModel.ins.startStamp + int(PeakSportsTempType.BK_CONFIRM_TIME) - ServerTimer.ins.second) * 1000,refusePeakSports);
            AlertUtil.alert(new PeakSportsStartRender(enterPeakSports),enterPeakSports);
         }
      }
      
      public static function enterPeakSports() : void
      {
         if(GlobalRef.isInBattleModule == true)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999600135));
         }
         else if(ModuleMgr.ins.sceneLayer.curModuleId == 50527)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999600134));
         }
         else
         {
            clearTimer();
            PeakSportsService.ins.acceptPeakSports(true);
         }
      }
      
      public static function stopAutoAssistant() : void
      {
         AssistantModel.ins.removeNeedDoFuncId(50520);
         AssistantModel.ins.removeTask(50520);
      }
      
      public static function clearTimer() : void
      {
         TimerManager.ins.clearTimer(refusePeakSports);
         TimerManager.ins.clearTimer(showEnterConfirm);
      }
      
      public static function refusePeakSports() : void
      {
         PeakSportsService.ins.acceptPeakSports(false);
         PeakSportsModel.ins.clearData();
         clearTimer();
         ModuleMgr.ins.closeModule(50501);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50500,false));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MINIMAP_EFFECT_VISIBLE",new SwitchModuleEffMsg(50500,false));
      }
      
      public static function getMiniMapResSkin(param1:SceneNpc3D) : String
      {
         var _loc2_:* = null;
         switch(int(getNpcKind(param1.stcNpcId)) - 4)
         {
            case 0:
               _loc2_ = "png.uiMiniMap.img_yellowFlag1";
               break;
            case 1:
               _loc2_ = "png.uiMiniMap.img_yellowFlag2";
         }
         return _loc2_;
      }
      
      public static function checkIsMonster(param1:SceneNpc3D) : Boolean
      {
         return getNpcKind(param1.stcNpcId) == 10;
      }
      
      public static function getNpcKind(param1:int) : int
      {
         return param1 % 100;
      }
      
      public static function isInBattleProtect(param1:UInt64) : Boolean
      {
         var _loc3_:BkStagePlayerInfo = PeakSportsModel.ins.bkStagePlayers.getValue(Uint64Util.toString(param1));
         var _loc2_:int = ServerTimer.ins.second;
         if(_loc3_.defenseStamp > _loc2_)
         {
            if(_loc2_ > PeakSportsModel.ins.lastBattleProtectFloatStamp + 2)
            {
               PeakSportsModel.ins.lastBattleProtectFloatStamp = _loc2_;
               AlertUtil.float(PlayerModel.ins.getFullNameWithDistName(_loc3_.playerInfo.baseInfo) + LocaleMgr.ins.getStr(999000023) + TextFieldUtil.htmlText2(_loc3_.defenseStamp - _loc2_,16723968) + LocaleMgr.ins.getStr(999000019));
               return true;
            }
            return true;
         }
         return false;
      }
   }
}
