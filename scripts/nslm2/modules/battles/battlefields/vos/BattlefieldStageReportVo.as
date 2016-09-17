package nslm2.modules.battles.battlefields.vos
{
   import proto.BgStageReportInfo;
   
   public class BattlefieldStageReportVo
   {
       
      
      public var rank:int;
      
      public var bgStageReportInfo:BgStageReportInfo;
      
      public function BattlefieldStageReportVo(param1:int, param2:BgStageReportInfo)
      {
         super();
         rank = param1;
         bgStageReportInfo = param2;
      }
   }
}
