package nslm2.modules.battles.battlefields.vos
{
   import com.netease.protobuf.UInt64;
   
   public class BattlefieldPlayerDiedVo
   {
       
      
      public var playerId:UInt64;
      
      public var diedStamp:int;
      
      public var conDeathCount:int;
      
      public function BattlefieldPlayerDiedVo(param1:UInt64, param2:int, param3:*)
      {
         super();
         playerId = param1;
         diedStamp = param2;
         conDeathCount = param3;
      }
   }
}
