package nslm2.modules.battles.battle
{
   import com.mz.core.logging.Log;
   import com.greensock.TweenLite;
   import nslm2.modules.fightPlayer.UnitVo;
   
   public class BServerRunner
   {
       
      
      private var _pveEngine:nslm2.modules.battles.battle.IBattleEngine;
      
      public var engine:nslm2.modules.battles.battle.IBattleEngine;
      
      private var _players:Array;
      
      private var _vo:nslm2.modules.battles.battle.BattleStartVo;
      
      public function BServerRunner()
      {
         super();
         engine = new SocketEngine();
         engine.dispatcher.addEventListener("FIGHT_IMMEDIATELY_FINISH",onResultReturn);
      }
      
      protected function onResultReturn(param1:BattleEvent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc8_:int = param1.data["re"]["result"];
         var _loc6_:int = param1.data["re"]["turnNum"];
         var _loc5_:Number = param1.data["re"]["damageSum"];
         var _loc4_:Array = param1.data["stps"];
         var _loc7_:String = "战斗结果：" + _loc8_ + "，回合数：" + _loc6_ + "，伤统：" + _loc5_ + "[";
         Log.debug(this,_loc7_);
      }
      
      public function startup(param1:Array, param2:nslm2.modules.battles.battle.BattleStartVo) : void
      {
         _players = param1;
         this._vo = param2;
         if(!engine.isReady())
         {
            TweenLite.delayedCall(0.3,startup,[param1,_vo]);
            return;
         }
         serCal();
      }
      
      public function serCal() : void
      {
         engine.createBattle();
         var _loc3_:int = 0;
         var _loc2_:* = _players;
         for each(var _loc1_ in _players)
         {
            engine.addPlayer(_loc1_);
         }
         if(_vo.replayStp && _vo.replayStp.length > 0)
         {
            engine.start(_vo.playMode,_vo.seeds,_vo.replayStp);
         }
         else
         {
            engine.start(_vo.playMode,_vo.seeds);
         }
         engine.getResult();
      }
   }
}
