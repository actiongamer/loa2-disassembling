package nslm2.modules.cultivates.horse.vos
{
   public class HorseStateVo
   {
      
      public static const STCHORSEID:String = "stcHorseId";
      
      public static const STATE:String = "state";
       
      
      public var stcHorseId:int;
      
      public var state:int;
      
      public function HorseStateVo(param1:int, param2:int)
      {
         super();
         this.stcHorseId = param1;
         this.state = param2;
      }
   }
}
