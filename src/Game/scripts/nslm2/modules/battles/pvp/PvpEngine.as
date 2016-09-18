package nslm2.modules.battles.pvp
{
   import nslm2.modules.battles.battle.IBattleEngine;
   import flash.events.EventDispatcher;
   import proto.BattleActionNotify;
   import nslm2.modules.battles.battle.BattleEvent;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.fightPlayer.UnitVo;
   import proto.BattleManualReq;
   
   public class PvpEngine implements IBattleEngine
   {
      
      public static var isInit:Boolean = false;
       
      
      private var _dispatcher:EventDispatcher;
      
      public function PvpEngine()
      {
         super();
         _dispatcher = new EventDispatcher();
      }
      
      private function onActionNotify(param1:BattleActionNotify) : void
      {
         _dispatcher.dispatchEvent(new BattleEvent("ACTION_READY",param1.datas));
      }
      
      public function initStaticData() : void
      {
      }
      
      public function createBattle() : void
      {
         ServerEngine.ins.addAlwayHandler(2050,onActionNotify);
      }
      
      public function addPlayer(param1:UnitVo) : void
      {
         param1.sumHurt = 0;
         param1.sumDamage = 0;
         param1.sumHeal = 0;
         if(param1.hp <= 0)
         {
            return;
         }
      }
      
      public function start(param1:int, param2:Array = null, param3:Array = null) : void
      {
      }
      
      public function update() : int
      {
         return 0;
      }
      
      public function isReady() : Boolean
      {
         return true;
      }
      
      public function get dispatcher() : EventDispatcher
      {
         return _dispatcher;
      }
      
      public function get numCycles() : int
      {
         return 0;
      }
      
      public function manualSkillFire(param1:int) : void
      {
         var _loc2_:BattleManualReq = new BattleManualReq();
         _loc2_.objid = param1;
         ServerEngine.ins.send(2051,_loc2_);
      }
      
      public function getResult() : void
      {
         ServerEngine.ins.removeAlwayHandler(2050,onActionNotify);
      }
      
      public function serSkillFire(param1:int, param2:int) : void
      {
      }
      
      public function checkFireBtn(param1:int) : Boolean
      {
         return true;
      }
      
      public function skillTest(param1:int, param2:int) : void
      {
      }
   }
}
