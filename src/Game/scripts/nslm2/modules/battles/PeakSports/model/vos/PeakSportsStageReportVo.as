package nslm2.modules.battles.PeakSports.model.vos
{
   import proto.BkStageReportInfo;
   
   public class PeakSportsStageReportVo
   {
       
      
      public var rank:int;
      
      public var bgStageReportInfo:BkStageReportInfo;
      
      public function PeakSportsStageReportVo(param1:int, param2:BkStageReportInfo)
      {
         super();
         rank = param1;
         bgStageReportInfo = param2;
      }
   }
}
