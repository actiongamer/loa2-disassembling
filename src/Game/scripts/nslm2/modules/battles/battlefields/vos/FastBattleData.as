package nslm2.modules.battles.battlefields.vos
{
   import proto.BgFightNotify;
   
   public class FastBattleData
   {
       
      
      public var fightData:BgFightNotify;
      
      public var leftPlayerData:nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
      
      public var rightPlayerData:nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
      
      public var loseCallBack;
      
      public var winCallBack;
      
      public var closeCallBack;
      
      public var isFamilyBoss:Boolean;
      
      public function FastBattleData()
      {
         super();
      }
   }
}
