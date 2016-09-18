package nslm2.modules.funnies.arenas
{
   public class ArenaMultiChallengeResultVo
   {
       
      
      public var isWin:Boolean;
      
      public var id:int;
      
      public var drops:Array;
      
      public function ArenaMultiChallengeResultVo(param1:int, param2:Boolean, param3:Array)
      {
         super();
         id = param1;
         isWin = param2;
         drops = param3;
      }
   }
}
