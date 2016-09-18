package nslm2.modules.funnies.mainCities
{
   import morn.customs.components.SceneModuleView;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.common.ui.components.comps2d.BmcS1;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.miniTasks.ctrl.TaskCompleteCtrl;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.battles.PeakSports.utils.PeakSportsUtil;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertCtrl;
   import nslm2.modules.footstones.quickUseModules.QuickUseModel;
   import nslm2.modules.footstones.quickUseModules.QuickUseCtrl;
   import nslm2.modules.footstones.roleLvlUpModule.RoleLvlUpModuleParam;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.foundations.signIn.FSignInModule;
   import nslm2.modules.battles.battleResults.battleLoss.BattleLossExitMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
   import nslm2.modules.foundations.alerts.GetNewVersionLogTask;
   import nslm2.modules.foundations.firstCharge.chargeTips.ChargeTipUtils;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.LocalData;
   import nslm2.utils.ServerTimer;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.foundations.miniMaps.MiniMap;
   import nslm2.modules.foundations.miniTasks.vo.HintVo;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   
   public class MainCityModule extends SceneModuleView implements INewerGuideGetComp, INewerGuideCheckHandler
   {
       
      
      private var compEff:BmcS1;
      
      public var scene:Scene45Base;
      
      private var preShowParam:Object;
      
      public function MainCityModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         preShowParam = param1;
         if(preShowParam is MainCityModuleParam)
         {
            _loc2_ = preShowParam as MainCityModuleParam;
         }
         this.scene = new Scene45Base();
         if(_loc2_)
         {
            this.scene.init(this.moduleId,_loc2_.stageId,this.initHandler);
         }
         else
         {
            this.scene.init(this.moduleId,DefindConsts.MAIN_CITY_ID,this.initHandler);
         }
         this.addChild(this.scene);
         MainToolBarChangeMsg.showMainCityStatic();
      }
      
      private function initHandler() : void
      {
         this.preShowCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         if(EnvConfig.ins.ptId == 33)
         {
            DuoWanGameMsgCollector.ins.reportScene();
         }
         ObserverMgr.ins.sendNotice("MAIN_CITY_SCENE_45_INIT_CPL");
         TaskCompleteCtrl.ins.effectContainer = this;
         TaskCompleteCtrl.ins.showTaskCompleteEff();
         if(AssistantModel.ins.isActingAuto(50500) && BattlefieldModel.ins.startStamp)
         {
            BattlefieldUtil.showEnterConfirm();
         }
         else if(AssistantModel.ins.isActingAuto(50520) && PeakSportsModel.ins.startStamp)
         {
            PeakSportsUtil.showEnterConfirm();
         }
         else if(GlobalRef.mainCityReshowParam.needShowPanel)
         {
            if(NGUtil.isShowLock && NGUtil.isCurFuncId(10150) == false)
            {
               this.afterShow();
            }
            else
            {
               showLevelUpModule();
            }
         }
         else
         {
            this.afterShow();
         }
         if(GlobalRef.mainCityReshowParam.miniNoticeFirstShowed == false)
         {
            GlobalRef.mainCityReshowParam.miniNoticeFirstShowed = true;
            ObserverMgr.ins.sendNotice("MSG_FUNCTION_ACTION_FIRST_SHOW");
         }
         NewerAlertModel.ins.canShowNewerAlert = true;
         NewerAlertCtrl.ins.checkShow();
         QuickUseModel.ins.canShowQuickUse = true;
         QuickUseCtrl.ins.checkShow();
      }
      
      private function showLevelUpModule() : void
      {
         var _loc1_:RoleLvlUpModuleParam = new RoleLvlUpModuleParam();
         _loc1_.handler = afterShow;
         ModuleMgr.ins.showModule(10150,_loc1_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function afterShow() : void
      {
         var _loc1_:Boolean = true;
         if((NGUtil.checkModuleShow(this.moduleId,this) || NGUtil.checkModuleShow(10430)) && !NGUtil.isCurGuideId(99409))
         {
            _loc1_ = false;
            GlobalRef.mainCityReshowParam.showResDgId = 0;
            GlobalRef.mainCityReshowParam.needShowGuildDungeon = false;
         }
         else if(_loc1_ && FuncOpenAutoCtrl.checkOpen(11500) && !FSignInModule.hasFirstShowed)
         {
            FSignInModule.hasFirstShowed = true;
            ModuleMgr.ins.showModule(11500);
         }
         else if(!BattleLossExitMgr.ins.checkModuleShow())
         {
            if(ModuleMgr.ins.sceneLayer.preCloseId != 40300)
            {
               if(GlobalRef.mainCityReshowParam.showResDgId)
               {
                  _loc1_ = false;
                  NpcFuncRef.ins.execHandler(41400);
                  GlobalRef.mainCityReshowParam.needShowGuildDungeon = false;
               }
               else if(GlobalRef.mainCityReshowParam.needShowGuildDungeon)
               {
                  _loc1_ = false;
                  ModuleMgr.ins.showModule(40720);
                  GlobalRef.mainCityReshowParam.needShowGuildDungeon = false;
               }
               else if(GlobalRef.mainCityReshowParam.heroAwakenRoadModuleInitVo)
               {
                  _loc1_ = false;
                  ModuleMgr.ins.showModule(30121,GlobalRef.mainCityReshowParam.heroAwakenRoadModuleInitVo);
                  GlobalRef.mainCityReshowParam.heroAwakenRoadModuleInitVo = null;
               }
            }
            else if(GlobalRef.mainCityReshowParam.chapterModuleInitVo)
            {
               _loc1_ = false;
               ModuleMgr.ins.showModule(40400,GlobalRef.mainCityReshowParam.chapterModuleInitVo);
               GlobalRef.mainCityReshowParam.chapterModuleInitVo = null;
               GlobalRef.mainCityReshowParam.showResDgId = 0;
               GlobalRef.mainCityReshowParam.needShowGuildDungeon = false;
               this.checkAndShowChargeTip();
            }
            else
            {
               GlobalRef.mainCityReshowParam.chapterModuleInitVo = null;
               GlobalRef.mainCityReshowParam.showResDgId = 0;
               GlobalRef.mainCityReshowParam.needShowGuildDungeon = false;
            }
         }
         if(_loc1_)
         {
            if(NGUtil.isCurFuncId(40400,true))
            {
               _loc1_ = false;
               ModuleMgr.ins.showModule(40400);
            }
         }
         if(_loc1_)
         {
            if(GlobalRef.needShowVip)
            {
               _loc1_ = false;
               ModuleMgr.ins.showModule(12100);
            }
         }
         if(_loc1_)
         {
            if(GetNewVersionLogTask.needShow)
            {
               _loc1_ = false;
               ModuleMgr.ins.showModule(96050,null,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
         else if(GetNewVersionLogTask.needShow)
         {
            GetNewVersionLogTask.needShow = false;
         }
         if(_loc1_)
         {
            if(this.checkAndShowChargeTip())
            {
               _loc1_ = false;
            }
            if(this.checkAndShowMallAlert())
            {
               _loc1_ = false;
            }
         }
      }
      
      private function checkAndShowChargeTip() : Boolean
      {
         var _loc1_:int = ChargeTipUtils.checkKind();
         if(_loc1_ && ChargeTipUtils.getNoShowAgain(_loc1_) == false && EnvConfig.ins.ptId != 2306)
         {
            ModuleMgr.ins.showModule(60210,_loc1_);
            return true;
         }
         return false;
      }
      
      private function checkAndShowMallAlert() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = false;
         if(PlayerModel.ins.level >= 20)
         {
            _loc1_ = LocalData.insCurPlayer.load("lastShowMallAlertTime",0);
            _loc2_ = ServerTimer.ins.second - _loc1_ >= 86400;
            if(_loc2_)
            {
               ModuleMgr.ins.showModule(11202);
               return true;
            }
         }
         return false;
      }
      
      private function taskEffComplete() : void
      {
         compEff = null;
         ModuleMgr.ins.showModule(10421);
      }
      
      override public function getFocusNotices() : Array
      {
         return ["task_notice_auto_track","task_notice_auto_track_by_func_id","task_notice_go_loterry"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("task_notice_auto_track" !== _loc3_)
         {
            if("task_notice_auto_track_by_func_id" !== _loc3_)
            {
               if("task_notice_go_loterry" === _loc3_)
               {
                  scene.goToLottery();
               }
            }
            else
            {
               scene.autoTrackByFuncId(param2);
            }
         }
         else
         {
            scene.autoTrack(param2);
         }
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         if(param2.isFindNpc2)
         {
            if(GlobalRef.hint_list)
            {
               (ModuleMgr.ins.getModule(10410) as MiniMap).setHintHeight(false,false,true);
               _loc5_ = param2.comp_id.split(":")[1];
               _loc4_ = GlobalRef.hint_list.array.length;
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  _loc3_ = GlobalRef.hint_list.array[_loc6_];
                  if(_loc3_.npgRelationId == _loc5_)
                  {
                     ModuleMgr.ins.popLayer.closeAll();
                     return GlobalRef.hint_list.cells[_loc6_];
                  }
                  _loc6_++;
               }
            }
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 20032))
         {
            if(TeamGuajiModel.ins.pvpCount <= 0)
            {
               return 0;
            }
         }
         return 1;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         NewerAlertModel.ins.canShowNewerAlert = false;
         QuickUseModel.ins.canShowQuickUse = false;
         ModuleMgr.ins.closeModule(96400);
         ModuleMgr.ins.closeModule(96500);
         ModuleMgr.ins.closeModule(10910);
         super.preClose(param1);
      }
   }
}
