package nslm2.modules.battles.battlefields.vos
{
   import com.netease.protobuf.UInt64;
   
   public class BattlefieldGatherVo
   {
       
      
      public var gatherId:int;
      
      public var playerId:UInt64;
      
      public function BattlefieldGatherVo(param1:int, param2:UInt64)
      {
         super();
         gatherId = param1;
         playerId = param2;
      }
   }
}
