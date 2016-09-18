package nslm2.inits.firstBattles
{
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class InitAssetsTaskFirstBattle extends TaskPool
   {
       
      
      public function InitAssetsTaskFirstBattle()
      {
         super();
      }
      
      override public function exec() : void
      {
         this.addTask(new GetResTask(33,"ui/uiFirstBattle.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiFightPlayer.uibaz",3,true));
         this.addTask(new GetResTask(3,"ui/fightText_1.swf"));
         this.addTask(new GetResTask(3,"ui/ccengine.swf"));
         this.addTask(new GetResTask(33,"ui/uiScript.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiScript_" + ClientConfig.language + ".uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiNewerGuide.uibaz",3,true));
         this.addTask(new GetResTask(10,UrlLib.skillConfigUrl()));
         super.exec();
      }
   }
}
