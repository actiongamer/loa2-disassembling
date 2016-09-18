package nslm2.modules.battles.battleResults
{
   import nslm2.common.vo.FightResultVO;
   
   public class BattleResultConfigVo
   {
       
      
      public var closeHandler;
      
      public var resVo:FightResultVO;
      
      public var replayHandler;
      
      public var statisticHandler;
      
      public var type:int;
      
      public var disableLossBtn:Boolean = false;
      
      public function BattleResultConfigVo(param1:*, param2:* = null, param3:* = null, param4:FightResultVO = null, param5:int = 0)
      {
         super();
         this.replayHandler = param2;
         this.closeHandler = param1;
         this.statisticHandler = param3;
         this.resVo = param4;
         this.type = param5;
      }
   }
}
