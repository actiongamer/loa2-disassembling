package nslm2.inits.firstBattles
{
   import com.mz.core.utils2.task.TaskList;
   import nslm2.inits.InitAssetsTask;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class InitDelayFirstBattleTask extends TaskList
   {
       
      
      public function InitDelayFirstBattleTask()
      {
         super();
      }
      
      override public function exec() : void
      {
         this.addTask(new InitAssetsTask().setDataSource(LocaleMgr.ins.getStr(999000003)));
         super.exec();
      }
   }
}
