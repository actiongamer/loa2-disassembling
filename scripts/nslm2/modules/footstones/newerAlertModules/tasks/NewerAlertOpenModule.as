package nslm2.modules.footstones.newerAlertModules.tasks
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class NewerAlertOpenModule extends TaskBase
   {
       
      
      public function NewerAlertOpenModule(param1:Object = null)
      {
         super(param1);
      }
      
      override public function exec() : void
      {
         super.exec();
         if(!((int(this.tag as int)) - 40408))
         {
            ChapterModel.ins.chapterType = 2;
            ModuleMgr.ins.showModule(40400);
         }
         else
         {
            ModuleMgr.ins.showModule(this.tag as int);
         }
         this.onComplete();
      }
   }
}
