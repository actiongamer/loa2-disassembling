package nslm2.modules.battles.resourceDungeons
{
   import game.ui.resourceDungeonModule.ResourceDungeonModuleUI;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.battles.sceneBases.BattleSceneBase;
   import nslm2.modules.battles.sceneBases.BattleSceneConfigVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.events.Event;
   import proto.PlayerBossZhaoHuanReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerBossZhaoHuanRes;
   import proto.ProtocolStatusRes;
   import nslm2.modules.battles.battle.BattleEvent;
   import nslm2.modules.fightPlayer.UnitView;
   import proto.StagePhaseCheckReq;
   import proto.HeroPracticeFightEndReq;
   import proto.HeroPracticeFightEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class ResourceDungeonModule extends ResourceDungeonModuleUI
   {
       
      
      private var panelVo:nslm2.modules.battles.resourceDungeons.ResourceDungeonShowVo;
      
      private var turnCount:int;
      
      private var damageCount:int;
      
      public var battleScene_initCpl:BattleSceneBase;
      
      private var lastGainNormal:int = 0;
      
      private var lastGainExtra:int = 0;
      
      private var lastShowGain:int;
      
      private var extrawardVoArr:Array;
      
      private var latestExtrawardVo:nslm2.modules.battles.resourceDungeons.ResDgExtrawardVo;
      
      private var _replayRes:HeroPracticeFightEndRes;
      
      public function ResourceDungeonModule()
      {
         super();
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
         panelVo = param1 as nslm2.modules.battles.resourceDungeons.ResourceDungeonShowVo;
         this.rightHeaderUI.visible = false;
         var _loc2_:int = panelVo.stcVo.stageid;
         battleScene_initCpl.initScene(new BattleSceneConfigVo(_loc2_,StcMgr.ins.getStageVo(_loc2_).map_id,0,panelVo.res.random,panelVo.res.player,this.moduleId));
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
         return ["MSG_GM_CMD"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_GM_CMD" === _loc3_)
         {
            _loc3_ = param2[0];
            if("s" === _loc3_)
            {
               this.battleScene_initCpl.finishImmediately();
            }
         }
      }
      
      private function alert_restart() : void
      {
         var _loc1_:PlayerBossZhaoHuanReq = new PlayerBossZhaoHuanReq();
         _loc1_.id = panelVo.stcVo.id;
         ServerEngine.ins.send(7090,_loc1_,server_zhaohuan,server_zhaohuan_err);
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
         var _loc2_:HeroPracticeFightEndReq = new HeroPracticeFightEndReq();
         _loc2_.playMode = 2;
         _loc2_.stp = param1;
         _loc2_.nanduid = panelVo.stcVo.id;
         _loc2_.typeid = panelVo.stcVo.type1;
         ServerEngine.ins.send(7204,_loc2_,server_fightEnd_cpl);
      }
      
      private function server_fightEnd_cpl(param1:HeroPracticeFightEndRes) : void
      {
         _replayRes = param1;
         battleScene_initCpl.ui2D.visible = false;
         var _loc2_:FightResultVO = new FightResultVO();
         if(param1.result == 1)
         {
            _loc2_.dropItems = param1.rewards;
            ModuleMgr.ins.showModule(40210,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,_loc2_,1));
            NpcFuncService.ins.changeCount(41400,param1.totaltimes);
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
         server_fightEnd_cpl(_replayRes);
      }
      
      protected function onAbort(param1:Event) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
         var _loc2_:HeroPracticeFightEndReq = new HeroPracticeFightEndReq();
         _loc2_.playMode = 0;
         _loc2_.nanduid = panelVo.stcVo.id;
         _loc2_.typeid = panelVo.stcVo.type1;
         _loc2_.fightdrop = true;
         ServerEngine.ins.send(7204,_loc2_);
      }
      
      override public function dispose() : void
      {
         this.battleScene_initCpl.dispose();
         this.battleScene_initCpl = null;
         super.dispose();
      }
   }
}
