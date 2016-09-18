package nslm2.modules.funnies.newYears.newYear2016s.bossPanels
{
   import game.ui.resourceDungeonModule.ResourceDungeonModuleUI;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.battles.sceneBases.BattleSceneBase;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.modules.battles.sceneBases.BattleSceneConfigVo;
   import flash.events.Event;
   import proto.PlayerBossZhaoHuanRes;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.battles.battle.BattleEvent;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.battles.resourceDungeons.GainEff;
   import nslm2.modules.battles.resourceDungeons.GainEffList;
   import nslm2.modules.battles.resourceDungeons.ResDgExtrawardVo;
   import proto.StagePhaseCheckReq;
   import proto.SpringFightBossEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   
   public class NewYear2016BossFightModule extends ResourceDungeonModuleUI
   {
       
      
      private var panelVo:nslm2.modules.funnies.newYears.newYear2016s.bossPanels.NewYear2016BossFightModuleShowParam;
      
      private var turnCount:int;
      
      private var damageCount:int;
      
      public var battleScene_initCpl:BattleSceneBase;
      
      private var lastGainNormal:int = 0;
      
      private var lastGainExtra:int = 0;
      
      private var lastShowGain:int;
      
      private var extrawardVoArr:Array;
      
      private var latestExtrawardVo:ResDgExtrawardVo;
      
      private var _replayRes:SpringFightBossEndRes;
      
      public function NewYear2016BossFightModule()
      {
         super();
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         BattleResultGlobel.ins.doubleId = 1009;
         ModuleMgr.ins.staticLayer.closeAll();
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false,true));
         this.initUI();
         this.battleScene_initCpl = new BattleSceneBase();
         battleScene_initCpl.addEventListener("preloadCpl",onListener);
         this.addChild(this.battleScene_initCpl);
         panelVo = param1 as nslm2.modules.funnies.newYears.newYear2016s.bossPanels.NewYear2016BossFightModuleShowParam;
         this.rightHeaderUI.visible = false;
         var _loc2_:int = DefindConsts.NIAN_STAGE_ID;
         var _loc3_:StcStageVo = StcMgr.ins.getStageVo(_loc2_);
         battleScene_initCpl.initScene(new BattleSceneConfigVo(_loc2_,_loc3_.map_id,_loc3_.map_config_id,panelVo.res.random,panelVo.res.player,this.moduleId));
      }
      
      private function onListener(param1:Event) : void
      {
         this.preShowCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         battleScene_initCpl.show();
      }
      
      private function reStart() : void
      {
         this.initUI();
         battleScene_initCpl.reStart();
      }
      
      override public function getFocusNotices() : Array
      {
         return [];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      private function server_zhaohuan(param1:PlayerBossZhaoHuanRes) : void
      {
         this.reStart();
      }
      
      private function server_zhaohuan_err(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         this.alert_ok();
      }
      
      private function alert_ok() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      protected function onNewTurnBegin(param1:BattleEvent) : void
      {
      }
      
      protected function onNewGetDamage(param1:BattleEvent) : void
      {
      }
      
      private function initUI() : void
      {
      }
      
      private function validateUI() : void
      {
      }
      
      public function get bossUnitView() : UnitView
      {
         return battleScene_initCpl.rightUnitViewHash.getValueAt(0);
      }
      
      private function gainEffNormal_onCpl(param1:GainEff) : void
      {
      }
      
      private function gainEffList_onProcess(param1:GainEffList, param2:int, param3:GainEff) : void
      {
      }
      
      private function fightPlayer_onCpl(param1:BattleEvent) : void
      {
         var _loc2_:StagePhaseCheckReq = param1.data.req as StagePhaseCheckReq;
         this.end(_loc2_.stp);
      }
      
      private function end(param1:Array) : void
      {
         this.service.server_springFightBossEnd(0,0,param1,server_bossEnd_cpl);
      }
      
      private function server_bossEnd_cpl(param1:SpringFightBossEndRes) : void
      {
         _replayRes = param1;
         battleScene_initCpl.ui2D.visible = false;
         var _loc2_:FightResultVO = new FightResultVO();
         _loc2_.dropItems = param1.reward;
         if(param1.result == 1)
         {
            ModuleMgr.ins.showModule(40210,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,_loc2_,1));
         }
         else
         {
            ModuleMgr.ins.showModule(40220,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,_loc2_));
         }
      }
      
      protected function resultPage_clickHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      protected function battle_replay() : void
      {
         battleScene_initCpl.replay();
      }
      
      protected function open_statistic() : void
      {
         ModuleMgr.ins.showModule(40221,this.battleScene_initCpl.getLeftRightUnitVo(),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.battleScene_initCpl.addEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
            this.battleScene_initCpl.addEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
            this.battleScene_initCpl.addEventListener("FIGHT_ABORT",onAbort);
            this.battleScene_initCpl.addEventListener("FIGHT_REPLAY_COMPLETE",onReplayCmp);
         }
         else
         {
            this.battleScene_initCpl.removeEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
            this.battleScene_initCpl.removeEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
            this.battleScene_initCpl.removeEventListener("FIGHT_ABORT",onAbort);
            this.battleScene_initCpl.removeEventListener("FIGHT_REPLAY_COMPLETE",onReplayCmp);
         }
      }
      
      protected function onReplayCmp(param1:Event) : void
      {
         server_bossEnd_cpl(_replayRes);
      }
      
      protected function onAbort(param1:Event) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
         ServerEngine.ins.send(6256);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         this.battleScene_initCpl.dispose();
         this.battleScene_initCpl = null;
         super.dispose();
      }
   }
}
