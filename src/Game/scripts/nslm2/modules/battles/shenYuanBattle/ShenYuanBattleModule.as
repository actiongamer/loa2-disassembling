package nslm2.modules.battles.shenYuanBattle
{
   import morn.customs.components.SceneModuleView;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.battles.sceneBases.BattleSceneBase;
   import proto.FightShenYuanStartRes;
   import nslm2.modules.battles.sceneBases.BattleSceneConfigVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import flash.events.Event;
   import proto.StagePhaseCheckReq;
   import nslm2.modules.battles.battle.BattleEvent;
   import nslm2.modules.scenes.shenYuans.service.ShenYuanService;
   import proto.FightShenYuanEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.modules.battles.battle.BattleLogger;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   import nslm2.nets.sockets.ServerEngine;
   
   public class ShenYuanBattleModule extends SceneModuleView
   {
       
      
      private var shenYuanModel:ShenYuanModel;
      
      public var battleScene_initCpl:BattleSceneBase;
      
      private var _ReqForDebug:StagePhaseCheckReq;
      
      private var _replayRes:FightShenYuanEndRes;
      
      private var _replayfrsVo:FightResultVO;
      
      public function ShenYuanBattleModule()
      {
         super();
         shenYuanModel = ShenYuanModel.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.closeAll();
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false,true));
         this.battleScene_initCpl = new BattleSceneBase();
         battleScene_initCpl.addEventListener("preloadCpl",onListener);
         this.addChild(this.battleScene_initCpl);
         var _loc2_:FightShenYuanStartRes = param1 as FightShenYuanStartRes;
         battleScene_initCpl.initScene(new BattleSceneConfigVo(DefindConsts.BATTLE_SHENYUAN_MAP_ID,DefindConsts.BATTLE_SHENYUAN_MAP_ID,0,_loc2_.random,_loc2_.player,this.moduleId));
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
      
      private function fightPlayer_onCpl(param1:BattleEvent) : void
      {
         var _loc2_:StagePhaseCheckReq = param1.data.req as StagePhaseCheckReq;
         _ReqForDebug = _loc2_;
         ShenYuanService.ins.requestFightEnd(_loc2_,fightEndHandler);
      }
      
      private function fightEndHandler(param1:FightShenYuanEndRes) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_ReqForDebug.clientRet != param1.result)
         {
            _loc2_ = GameObjectManager.Instance.debug_buffs;
            _loc3_ = GameObjectManager.Instance.debugActions;
            new BattleLogger().send("buffs:" + _loc2_ + "|actions:" + _loc3_);
         }
         shenYuanModel.addStar = param1.nowstar - shenYuanModel.crtStarCnt;
         shenYuanModel.crtStarCnt = param1.nowstar;
         shenYuanModel.canRevive = param1.canRevive;
         shenYuanModel.helptimes = param1.friendHelpNum;
         _replayRes = param1;
         if(param1.result == 1)
         {
            _replayfrsVo = new FightResultVO();
            _replayfrsVo.dropItems = _replayRes.btlReward;
            _replayfrsVo.star = _replayRes.star;
            _replayfrsVo.shenyuanStar = _replayRes.totalstar;
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
         ServerEngine.ins.send(6087,null);
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
