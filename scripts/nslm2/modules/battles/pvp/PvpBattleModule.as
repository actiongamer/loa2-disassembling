package nslm2.modules.battles.pvp
{
   import morn.customs.components.SceneModuleView;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.BattleTestStartNotify;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.PlayerBossZhaoHuanRes;
   import proto.ProtocolStatusRes;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.battles.battle.BattleEvent;
   import proto.PlayerResStageFightEndRes;
   
   public class PvpBattleModule extends SceneModuleView
   {
       
      
      private var turnCount:int;
      
      private var damageCount:int;
      
      public var battleScene:nslm2.modules.battles.pvp.PvpBattleSceneBase;
      
      private var lastGainNormal:int = 0;
      
      private var lastGainExtra:int = 0;
      
      private var lastShowGain:int;
      
      public function PvpBattleModule()
      {
         super();
      }
      
      override public function show(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.closeAll([10400]);
         this.initUI();
         this.battleScene = new nslm2.modules.battles.pvp.PvpBattleSceneBase();
         this.addChild(this.battleScene);
         super.show(param1);
         ServerEngine.ins.send(2052,null);
         ServerEngine.ins.addAlwayHandler(2053,onBattleStar);
      }
      
      private function onBattleStar(param1:BattleTestStartNotify) : void
      {
         battleScene.initScene(new PvpBattleSceneConfigVo(DefindConsts.BATTLE_REPORT_SCENE_MAP_ID,param1.player,param1.left));
      }
      
      private function reStart() : void
      {
         this.initUI();
         battleScene.reStart();
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
      
      private function initUI() : void
      {
      }
      
      private function validateUI() : void
      {
      }
      
      public function get bossUnitView() : UnitView
      {
         return battleScene.rightUnitViewHash.getValueAt(0);
      }
      
      private function playGainEffNormal(param1:int) : void
      {
      }
      
      private function playGainEffExtra(param1:int) : void
      {
      }
      
      private function fightPlayer_onCpl(param1:BattleEvent) : void
      {
      }
      
      private function end(param1:Array) : void
      {
      }
      
      private function server_fightEnd_cpl(param1:PlayerResStageFightEndRes) : void
      {
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.battleScene.addEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
         }
         else
         {
            this.battleScene.removeEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         this.battleScene.dispose();
         this.battleScene = null;
         super.dispose();
      }
   }
}
