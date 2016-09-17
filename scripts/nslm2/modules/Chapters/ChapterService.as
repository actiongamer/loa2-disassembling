package nslm2.modules.Chapters
{
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetStageInfosRes;
   
   public class ChapterService
   {
      
      private static var _ins:nslm2.modules.Chapters.ChapterService;
       
      
      public function ChapterService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.Chapters.ChapterService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.Chapters.ChapterService();
         }
         return _ins;
      }
      
      public function requestStageInfo() : void
      {
         ServerEngine.ins.send(8055,null,serverCpl_getStageInfos);
      }
      
      public function serverCpl_getStageInfos(param1:GetStageInfosRes) : void
      {
         if(param1)
         {
            ChapterModel.ins.parse(param1.infos);
         }
         else
         {
            ChapterModel.ins.parse([]);
         }
      }
   }
}
