package nslm2.modules.battles.battle
{
   import nslm2.modules.fightPlayer.UnitVo;
   import flash.events.EventDispatcher;
   
   public interface IBattleEngine
   {
       
      
      function initStaticData() : void;
      
      function createBattle() : void;
      
      function addPlayer(param1:UnitVo) : void;
      
      function start(param1:int, param2:Array = null, param3:Array = null) : void;
      
      function update() : int;
      
      function isReady() : Boolean;
      
      function get dispatcher() : EventDispatcher;
      
      function get numCycles() : int;
      
      function manualSkillFire(param1:int) : void;
      
      function getResult() : void;
      
      function serSkillFire(param1:int, param2:int) : void;
      
      function checkFireBtn(param1:int) : Boolean;
      
      function skillTest(param1:int, param2:int) : void;
   }
}
