package nslm2.modules.battles.PeakSports.model.vos
{
   import com.netease.protobuf.UInt64;
   
   public class PeakSportsPlayerDiedVo
   {
       
      
      public var playerId:UInt64;
      
      public var diedStamp:int;
      
      public var conDeathCount:int;
      
      public var rebornStamp:int;
      
      public function PeakSportsPlayerDiedVo(param1:UInt64, param2:int, param3:int, param4:int)
      {
         super();
         playerId = param1;
         diedStamp = param2;
         conDeathCount = param3;
         rebornStamp = param4;
      }
   }
}
