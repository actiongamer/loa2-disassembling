package nslm2.inits
{
   import com.mz.core.utils2.task.TaskList;
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.configs.StcLanguageConfig;
   import com.mz.core.logging.Log;
   import morn.core.handlers.Handler;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.inits.firstBattles.InitAssetsTaskFirstBattle;
   import nslm2.inits.firstBattles.RegRuntimeClassTaskFirstBattle;
   import nslm2.inits.firstBattles.RegModuleTaskFirstBattle;
   import nslm2.inits.firstBattles.InitGameStartModuleTaskFirstBattle;
   
   public class InitWebAllTask extends TaskList
   {
      
      public static var createRoleTask:nslm2.inits.CreateRoleTask;
       
      
      public var totalWeight:int;
      
      private var _subTaskProgressHandler:Function;
      
      public function InitWebAllTask(param1:Boolean = true, param2:Function = null)
      {
         super();
         _subTaskProgressHandler = param2;
         if(ClientConfig.publishPath == null)
         {
            ClientConfig.publishPath = "../../../publish/";
         }
         addTask(new InitLayersTask().setDataSource(new InitConfigVo("",1)));
         addTask(new InitClientConfigTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000005),1)));
         addTask(new InitServerConfigTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000006),1)));
         addTask(InitWebAllTask.getInitStcTask());
         addTask(new InitLanguagePacks().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000006),1)));
         if(ClientConfig.firstBattle == 1)
         {
            addTask(new InitServerEngineTaskFirstBattle().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000007),5)));
         }
         else
         {
            addTask(new InitServerEngineTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000007),5)));
            addTask(new InitServerFoundationTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000008),10)));
         }
         addTask(new InitSpector3DTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000009),3)));
         addTask(new RegRuntimeClassTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000010),10)));
         if(ClientConfig.firstBattle == 1)
         {
            addTask(new InitAssetsTaskFirstBattle().setDataSource(new InitConfigVo(6,40)).addStartHandler(initAssetStartHandler).addProcessHandler(initAssetTaskProgress).addCompleteHandler(initAssetTaskComlete));
            addTask(new RegRuntimeClassTaskFirstBattle().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000010),1)));
            addTask(new RegModuleTaskFirstBattle().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000011),1)));
            if(param1)
            {
               addTask(new InitGameStartModuleTaskFirstBattle().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000012),10)));
            }
         }
         else
         {
            addTask(new InitAssetsTask().setDataSource(new InitConfigVo(6,40)).addStartHandler(initAssetStartHandler).addProcessHandler(initAssetTaskProgress));
            addTask(new RegModuleTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000011),10)));
            if(param1)
            {
               addTask(new InitGameStartModuleTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000012),10)));
            }
         }
      }
      
      public static function getInitStcTask() : TaskBase
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(ClientConfig.shellData)
         {
            if(ClientConfig.shellData.hasOwnProperty("initStcTask"))
            {
               _loc2_ = ClientConfig.shellData["initStcTask"];
               _loc1_ = new _loc2_();
               _loc1_.setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000004),10));
               return _loc1_;
            }
         }
         return new InitStcTask().setDataSource(new InitConfigVo(StcLanguageConfig.ins.getLanguage(999000004),10));
      }
      
      override public function addTask(param1:TaskBase) : void
      {
         if(param1.dataSource is InitConfigVo)
         {
            this.totalWeight = this.totalWeight + (param1.dataSource as InitConfigVo).weight;
         }
         else
         {
            Log.fatal(this,param1,".dataSource is not InitConfigVo",param1.dataSource);
         }
         super.addTask(param1);
      }
      
      private function initAssetStartHandler(param1:TaskBase) : void
      {
         if(_subTaskProgressHandler)
         {
            Handler.execute(_subTaskProgressHandler,[param1,71]);
         }
      }
      
      private function initAssetTaskProgress(param1:TaskBase, param2:int, param3:TaskBase) : void
      {
         if(_subTaskProgressHandler)
         {
            if(param2 == 73)
            {
               Handler.execute(_subTaskProgressHandler,[param1,param2,param3]);
            }
         }
      }
      
      private function initAssetTaskComlete(param1:TaskBase) : void
      {
         createRoleTask = new nslm2.inits.CreateRoleTask(UIMgr.root.parent,createRoleLoadCpl);
         createRoleTask.exec();
      }
      
      private function createRoleLoadCpl() : void
      {
         addTask(new InitAssetsTask().setDataSource(new InitConfigVo(6,40)).addStartHandler(initAssetStartHandler).addProcessHandler(initAssetTaskProgress));
      }
   }
}
