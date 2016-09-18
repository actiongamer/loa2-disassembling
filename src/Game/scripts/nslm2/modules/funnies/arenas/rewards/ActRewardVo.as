package nslm2.modules.funnies.arenas.rewards
{
   public class ActRewardVo
   {
       
      
      public var titleString:String;
      
      public var list_items:Array;
      
      public var canGetReward:Boolean;
      
      public var hasGotReward:Boolean;
      
      public var canGetTip:String;
      
      public var haveGotTipTop:String;
      
      public var canNotGetTip:String;
      
      public var haveGotTip:String;
      
      public var getHandler;
      
      public var yesterdayRank:int;
      
      public var rank:int;
      
      public var rankStr:String;
      
      public var tipString:String;
      
      public var notReward:Boolean;
      
      public var hideTxtRank:Boolean;
      
      public function ActRewardVo()
      {
         super();
      }
   }
}
