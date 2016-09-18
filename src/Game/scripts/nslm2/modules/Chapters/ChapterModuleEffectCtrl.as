package nslm2.modules.Chapters
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ChapterModuleEffectCtrl implements IDispose
   {
      
      private static var _ins:nslm2.modules.Chapters.ChapterModuleEffectCtrl;
       
      
      public function ChapterModuleEffectCtrl()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.Chapters.ChapterModuleEffectCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.Chapters.ChapterModuleEffectCtrl();
         }
         return _ins;
      }
      
      private function get model() : ChapterModel
      {
         return ChapterModel.ins;
      }
      
      public function exec() : void
      {
         showNewStage();
         showChapterCpl();
         showStarAdd();
      }
      
      public function showNewStage() : void
      {
         if(model.newOpenStageId != 0 && model.newChapterId == 0)
         {
            ObserverMgr.ins.sendNotice("evtNewDungeon",model.newOpenStageId);
         }
         model.newOpenStageId = 0;
      }
      
      public function showChapterCpl() : void
      {
         if(model.newChapterId != 0)
         {
            ObserverMgr.ins.sendNotice("evtChapterCpl");
         }
         model.newChapterId = 0;
      }
      
      public function showStarAdd() : void
      {
         if(model.chapterStarCntAdd() != 0)
         {
            ObserverMgr.ins.sendNotice("evtChapterStarCntAdded");
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
