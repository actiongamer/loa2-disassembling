package nslm2.modules.Chapters
{
   public class ChapterModuleInitVo
   {
       
      
      public var chapterId:int;
      
      public var stageId:int;
      
      public var showFade:Boolean;
      
      public function ChapterModuleInitVo(param1:int = 0, param2:int = 0, param3:Boolean = true)
      {
         super();
         chapterId = param1;
         stageId = param2;
         showFade = param3;
      }
   }
}
