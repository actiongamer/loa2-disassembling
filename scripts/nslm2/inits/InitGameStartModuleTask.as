package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.logModules.LogModuelAppender;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.driverInfoModules.DriverInfoChecker;
   import nslm2.common.ui.components.comps2d.others.FightValueBoxS2;
   import nslm2.modules.funnies.mainCities.MainCityReshowParam;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.utils.LocalData;
   import flash.utils.ByteArray;
   import nslm2.common.globals.GlobalRef;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.modules.funnies.mainCities.MainCityModuleParam;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector;
   import nslm2.modules.footstones.gmModules.PlayerLogUtil;
   import nslm2.modules.otherPt.xunleis.XunLeiCheckKickRole;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.foundations.activities.service.ActivityService;
   import nslm2.modules.foundations.sevenDays.service.SevenDaysService;
   import nslm2.modules.cultivates.skin.service.SkinService;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.foundations.guildModule.ctr.CheckGuildRedPointCtrl;
   import nslm2.modules.funnies.teams.TeamService;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import nslm2.modules.battles.PeakSports.service.PeakSportsService;
   import nslm2.utils.ServerTimer;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.game.shared.EffectConst;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   
   public class InitGameStartModuleTask extends TaskBase
   {
       
      
      public function InitGameStartModuleTask()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         super.exec();
         LogModuelAppender.ins;
         ModuleMgr.ins.showModule(10400);
         ModuleMgr.ins.showModule(10500);
         ModuleMgr.ins.showModule(10420);
         ModuleMgr.ins.showModule(10410);
         ModuleMgr.ins.showModule(10440);
         ModuleMgr.ins.showModule(10430);
         ModuleMgr.ins.showModule(10470);
         new DriverInfoChecker().check();
         ModuleMgr.ins.showModule(10300);
         ModuleMgr.ins.showModule(10210);
         ModuleMgr.ins.showModule(10220);
         ModuleMgr.ins.showModule(10110);
         ModuleMgr.ins.showModule(10113);
         ModuleMgr.ins.showModule(10112);
         ModuleMgr.ins.showModule(90400);
         ModuleMgr.ins.showModule(96100);
         ModuleMgr.ins.showModule(90315);
         FightValueBoxS2.insForDraw.value = -789;
         MainCityReshowParam.registerClassAliases();
         if(ClientConfig.firstBattle == 0)
         {
            _loc2_ = LocalData.insCurPlayer.load("mainCityReshowParam",null);
            if(_loc2_ != null)
            {
               LocalData.insCurPlayer.save("mainCityReshowParam",null);
               try
               {
                  GlobalRef.mainCityReshowParam = _loc2_.readObject();
               }
               catch($err:Error)
               {
               }
               if(GlobalRef.mainCityReshowParam == null)
               {
                  GlobalRef.mainCityReshowParam = new MainCityReshowParam();
               }
            }
            if(ClientConfig.enterMainCityDirectly)
            {
               ClientConfig.isNewPlayer = false;
               ModuleMgr.ins.showModule(40500);
            }
            else
            {
               _loc1_ = StcMgr.ins.getStageVo(SceneModel.ins.sceneId);
               switch(int(_loc1_.kind) - 1)
               {
                  case 0:
                  case 1:
                     throw new Error("不应该直接进入副本的肯定出错了");
                  default:
                  case 3:
                  default:
                  default:
                  default:
                  default:
                  default:
                     ClientConfig.isNewPlayer = false;
                     ModuleMgr.ins.showModule(40500,new MainCityModuleParam(_loc1_.id));
                  case 9:
                     ClientConfig.isNewPlayer = false;
                     ModuleMgr.ins.showModule(40740);
               }
            }
         }
         else if(ClientConfig.firstBattle == 2)
         {
            if(EnvConfig.ins.ptId == 33)
            {
               DuoWanGameMsgCollector.ins.reportCreateRole();
            }
            ClientConfig.isNewPlayer = false;
            PlayerLogUtil.ins.saveNext();
         }
         if(EnvConfig.ins.ptId == 15)
         {
            XunLeiCheckKickRole.ins.init(UIMgr.stage);
         }
         RecycleModel.ins.initIdleHeroList();
         CheckRoleTeamRedPointCtrl.ins.checkAll();
         BagModel.ins.checkWhenChange(true,false,true,true,true,true,true,true,true,true,true);
         ActivityService.ins.getStaticData();
         SevenDaysService.ins.getInitSevenDayInfo();
         SkinService.ins.getInitSkinInfo();
         MouseIconManager.initCursorStyle();
         MouseIconManager.ins.initSpecialMouseCursor();
         CheckGuildRedPointCtrl.ins.initGuildInfo();
         TeamService.ins.init();
         BattlefieldService.ins.init();
         PeakSportsService.ins.init();
         playFullScreenEffect();
         this.onComplete();
      }
      
      private function playFullScreenEffect() : void
      {
         if(ServerTimer.isDuLiRi() && LocalData.insCurPlayer.load("SPECIALDAY") == null)
         {
            LocalData.insCurPlayer.save("SPECIALDAY",1);
            TimerManager.ins.doFrameLoop(12,function():void
            {
               var _loc1_:int = 0;
               _loc1_ = 0;
               while(_loc1_ < 2)
               {
                  EffectConst.playLiHuaEff(new Point(MathUtil.randomInt(UIMgr.stage.stageWidth,0),MathUtil.randomInt(UIMgr.stage.stageHeight,0)),MathUtil.random(2,1));
                  _loc1_++;
               }
            },true,50);
         }
      }
   }
}
