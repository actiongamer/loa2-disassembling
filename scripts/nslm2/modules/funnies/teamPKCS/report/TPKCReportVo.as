package nslm2.modules.funnies.teamPKCS.report
{
   import proto.CteamBattle;
   
   public class TPKCReportVo
   {
      
      public static const TYPE_TITLE:int = 0;
      
      public static const TYPE_CONTENT:int = 1;
       
      
      public var type:int;
      
      public var winNameStr:String;
      
      public var lossNameStr:String;
      
      public var isLeftWin:Boolean;
      
      public var pos:int;
      
      public var battle:CteamBattle;
      
      public var bOrder:int;
      
      public function TPKCReportVo()
      {
         super();
      }
   }
}
