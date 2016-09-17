package nslm2.modules.battles.PeakSports.model.vos
{
   import proto.BkFightNotify;
   
   public class FastPeakData
   {
       
      
      public var fightData:BkFightNotify;
      
      public var leftPlayerData:nslm2.modules.battles.PeakSports.model.vos.FastPeakSportsData;
      
      public var rightPlayerData:nslm2.modules.battles.PeakSports.model.vos.FastPeakSportsData;
      
      public var loseCallBack;
      
      public var winCallBack;
      
      public var closeCallBack;
      
      public var isFamilyBoss:Boolean;
      
      public function FastPeakData()
      {
         super();
      }
   }
}
