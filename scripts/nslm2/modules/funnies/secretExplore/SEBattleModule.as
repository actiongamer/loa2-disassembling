package nslm2.modules.funnies.secretExplore
{
   import morn.customs.components.SceneModuleView;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.battles.sceneBases.BattleSceneBase;
   import nslm2.modules.battles.sceneBases.BattleSceneConfigVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import flash.events.Event;
   import nslm2.modules.battles.battle.BattleEvent;
   import proto.StagePhaseCheckReq;
   import proto.MjtxFightEndReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.MjtxFightEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   
   public class SEBattleModule extends SceneModuleView
   {
       
      
      private var paramVo:nslm2.modules.funnies.secretExplore.SEBattleModuleParamVo;
      
      public var battleScene_initCpl:BattleSceneBase;
      
      private var _replayRes:MjtxFightEndRes;
      
      private var _replayfrsVo:FightResultVO;
      
      public function SEBattleModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.closeAll();
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false,true));
         this.battleScene_initCpl = new BattleSceneBase();
         battleScene_initCpl.addEventListener("preloadCpl",onListener);
         this.addChild(this.battleScene_initCpl);
         this.paramVo = param1 as nslm2.modules.funnies.secretExplore.SEBattleModuleParamVo;
         battleScene_initCpl.initScene(new BattleSceneConfigVo(DefindConsts.BATTLE_SHENYUAN_MAP_ID,DefindConsts.BATTLE_SHENYUAN_MAP_ID,0,paramVo.random,paramVo.player,this.moduleId));
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
         battleScene_initCpl.reStart();
      }
      
      override public function getFocusNotices() : Array
      {
         return [];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      private function fightPlayer_onCpl(param1:BattleEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:StagePhaseCheckReq = param1.data.req as StagePhaseCheckReq;
         var _loc4_:* = paramVo.funcId;
         _loc2_ = new MjtxFightEndReq();
         _loc2_.playMode = _loc3_.playMode;
         _loc2_.stp = _loc3_.stp;
         ServerEngine.ins.send(8604,_loc2_,fightEndHandler);
      }
      
      private function fightEndHandler(param1:MjtxFightEndRes) : void
      {
         _replayRes = param1;
         if(param1.result == 1)
         {
            _replayfrsVo = new FightResultVO();
            _replayfrsVo.dropItems = _replayRes.reward;
            showWinPanel(_replayfrsVo);
         }
         else
         {
            showLossPanel();
         }
      }
      
      private function showWinPanel(param1:FightResultVO) : void
      {
         this.battleScene_initCpl.ui2D.visible = false;
         ModuleMgr.ins.showModule(40210,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,param1,1));
      }
      
      protected function resultPage_clickHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function showLossPanel() : void
      {
         this.battleScene_initCpl.ui2D.visible = false;
         var _loc2_:FightResultVO = new FightResultVO();
         var _loc1_:BattleResultConfigVo = new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,_loc2_);
         _loc1_.disableLossBtn = true;
         ModuleMgr.ins.showModule(40220,_loc1_);
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
            this.battleScene_initCpl.addEventListener("FIGHT_ABORT",onAbort);
            this.battleScene_initCpl.addEventListener("FIGHT_REPLAY_COMPLETE",onReplayCmp);
         }
         else
         {
            this.battleScene_initCpl.removeEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
            this.battleScene_initCpl.removeEventListener("FIGHT_ABORT",onAbort);
            this.battleScene_initCpl.removeEventListener("FIGHT_REPLAY_COMPLETE",onReplayCmp);
         }
      }
      
      protected function onReplayCmp(param1:Event) : void
      {
         if(_replayRes.result == 1)
         {
            showWinPanel(_replayfrsVo);
         }
         else
         {
            showLossPanel();
         }
      }
      
      protected function onAbort(param1:Event) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function dispose() : void
      {
         this.battleScene_initCpl.dispose();
         this.battleScene_initCpl = null;
         super.dispose();
      }
   }
}
