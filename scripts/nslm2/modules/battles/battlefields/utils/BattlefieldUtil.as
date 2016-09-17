package nslm2.modules.battles.battlefields.utils
{
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.battles.battlefields.consts.BattlefieldConsts;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import proto.ScenePlayerInfo;
   import proto.BgStagePlayerInfo;
   import proto.BgSceneMoveNotify;
   import proto.BgPlayerStatusNotify;
   import proto.BgStageGetReportRes;
   import proto.BgStageEndNotify;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.battles.battlefields.renders.BattlefieldStartRender;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleEffMsg;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBgtitleIntvlVo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.vos.StcBgresGatherVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   
   public class BattlefieldUtil
   {
       
      
      public function BattlefieldUtil()
      {
         super();
      }
      
      public static function canEnter(param1:Boolean = true) : Boolean
      {
         var _loc2_:int = 0;
         if(EnvConfig.ins.showDebugModule)
         {
            return true;
         }
         if(BattlefieldModel.ins.bgInfoRes.openDay == 1)
         {
            if(param1)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50500118));
            }
            return false;
         }
         if(BattlefieldModel.ins.bgInfoRes.residualDay == 0)
         {
            if(param1)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50500119));
            }
            return false;
         }
         if(FuncOpenAutoCtrl.checkOpen(50500) == false)
         {
            if(param1)
            {
               AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(50500));
            }
            return false;
         }
         _loc2_ = ServerTimer.ins.date.getHours();
         if(_loc2_ >= 13 && _loc2_ < 23)
         {
            return true;
         }
         if(param1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50500049));
         }
         return false;
      }
      
      public static function getOpenDateStr(param1:int) : String
      {
         return BattlefieldConsts.openDate.getValue(param1);
      }
      
      public static function canStart() : Boolean
      {
         return true;
      }
      
      public static function isInTeam() : Boolean
      {
         return BattlefieldModel.ins.curTeamId != null;
      }
      
      public static function isLeader(param1:UInt64) : Boolean
      {
         return Uint64Util.equal(BattlefieldModel.ins.curLeaderId,param1);
      }
      
      public static function isFriend(param1:int) : Boolean
      {
         return BattlefieldModel.ins.currentBgStagePlayerInfo.side == param1;
      }
      
      public static function canClickTarget(param1:Point) : Boolean
      {
         return MathUtil.disWith2Point(new Point(BattlefieldModel.ins.curScene.playerHero.pos2d.x,BattlefieldModel.ins.curScene.playerHero.pos2d.y),param1) <= 145;
      }
      
      public static function bgStagePlayerInfoToScenePlayerInfo(param1:BgStagePlayerInfo) : ScenePlayerInfo
      {
         var _loc2_:ScenePlayerInfo = new ScenePlayerInfo();
         _loc2_.baseInfo = param1.playerInfo.baseInfo;
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         return _loc2_;
      }
      
      public static function bgStatusNotifyToCrossSceneMoveNotify(param1:BgPlayerStatusNotify) : BgSceneMoveNotify
      {
         var _loc2_:BgSceneMoveNotify = new BgSceneMoveNotify();
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         _loc2_.legal = false;
         _loc2_.id = param1.playerId;
         return _loc2_;
      }
      
      public static function bgStageEndNotifyToBgStageGetReportRes(param1:BgStageEndNotify) : BgStageGetReportRes
      {
         var _loc2_:BgStageGetReportRes = new BgStageGetReportRes();
         _loc2_.end = true;
         _loc2_.reportInfos = param1.reportInfos;
         _loc2_.myInitHonor = param1.myInitHonor;
         _loc2_.myInitScore = param1.myInitScore;
         return _loc2_;
      }
      
      public static function showEnterConfirm() : void
      {
         if(BattlefieldModel.ins.startStamp != 0)
         {
            TimerManager.ins.clearTimer(refuseBattlefield);
            TimerManager.ins.doOnce((BattlefieldModel.ins.startStamp + int(DefindConsts.BG_CONFIRM_TIME) - ServerTimer.ins.second) * 1000,refuseBattlefield);
            AlertUtil.comfirm(new BattlefieldStartRender(),enterBattlefield,stopAutoAssistant);
         }
      }
      
      public static function enterBattlefield() : void
      {
         if(GlobalRef.isInBattleModule == true)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000021));
         }
         else if(ModuleMgr.ins.sceneLayer.curModuleId == 50507)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000022));
         }
         else
         {
            clearTimer();
            BattlefieldService.ins.acceptBattlefield(true);
         }
      }
      
      public static function stopAutoAssistant() : void
      {
         AssistantModel.ins.removeTask(50500);
      }
      
      public static function clearTimer() : void
      {
         TimerManager.ins.clearTimer(refuseBattlefield);
         TimerManager.ins.clearTimer(showEnterConfirm);
      }
      
      public static function refuseBattlefield() : void
      {
         BattlefieldService.ins.acceptBattlefield(false);
         BattlefieldModel.ins.clearData();
         BattlefieldModel.ins.clearTeamData();
         clearTimer();
         ModuleMgr.ins.closeModule(50501);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50500,false));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MINIMAP_EFFECT_VISIBLE",new SwitchModuleEffMsg(50500,false));
      }
      
      public static function getMiniMapResSkin(param1:SceneNpc3D) : String
      {
         var _loc2_:* = null;
         switch(int(getNpcKind(param1.stcNpcId)) - 1)
         {
            case 0:
               _loc2_ = "png.uiMiniMap.img_mine";
               break;
            case 1:
               _loc2_ = "png.uiMiniMap.img_speMine";
               break;
            default:
               _loc2_ = "png.uiMiniMap.圆点";
               break;
            case 3:
               _loc2_ = "png.uiMiniMap.img_yellowFlag";
               break;
            case 4:
               _loc2_ = "png.uiMiniMap.img_yellowFlag";
               break;
            case 5:
            case 6:
               _loc2_ = "png.uiMiniMap.img_yellowFlag";
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
      
      public static function getConKillTitleId(param1:int) : int
      {
         var _loc2_:* = 0;
         var _loc5_:int = 0;
         var _loc4_:* = BattlefieldConsts.KILL_NUM_ARR;
         for each(var _loc3_ in BattlefieldConsts.KILL_NUM_ARR)
         {
            if(param1 >= _loc3_)
            {
               _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public static function checkHasTodayReward() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = BattlefieldModel.ins.taskDic.array;
         for each(var _loc1_ in BattlefieldModel.ins.taskDic.array)
         {
            if(_loc1_.status == 2)
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50505,true));
               return;
            }
         }
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50505,false));
      }
      
      public static function checkHasSeasonReward() : void
      {
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_bgtitle_intvl","title_need_kind",1);
         _loc2_.sortOn("id",16);
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            if(BattlefieldModel.ins.bgInfoRes.degree >= _loc1_.id && BattlefieldModel.ins.getedDegreeRankRewardIds.indexOf(_loc1_.id) == -1)
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50503,true));
               BattlefieldModel.ins.canGetSeasonReward = true;
               return;
            }
         }
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50503,false));
         BattlefieldModel.ins.canGetSeasonReward = false;
      }
      
      public static function isInBattleProtect(param1:UInt64) : Boolean
      {
         var _loc3_:BgStagePlayerInfo = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(param1));
         var _loc2_:int = ServerTimer.ins.second;
         if(_loc3_.defenseStamp > _loc2_)
         {
            if(_loc2_ > BattlefieldModel.ins.lastBattleProtectFloatStamp + 2)
            {
               BattlefieldModel.ins.lastBattleProtectFloatStamp = _loc2_;
               AlertUtil.float(PlayerModel.ins.getFullNameWithDistName(_loc3_.playerInfo.baseInfo) + LocaleMgr.ins.getStr(999000023) + TextFieldUtil.htmlText2(_loc3_.defenseStamp - _loc2_,16723968) + LocaleMgr.ins.getStr(999000019));
               return true;
            }
            return true;
         }
         return false;
      }
      
      public static function getBgreBatherVo(param1:int) : StcBgresGatherVo
      {
         var _loc2_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(param1);
         var _loc3_:StcBgresGatherVo = StcMgr.ins.getVoByMultiColumnValue("static_bgres_gather",["stage_id","display_npc"],[_loc2_.stage_id,_loc2_.display_npc]);
         return _loc3_;
      }
   }
}
