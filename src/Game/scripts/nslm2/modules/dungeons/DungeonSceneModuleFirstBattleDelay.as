package nslm2.modules.dungeons
{
   import morn.customs.components.SceneModuleView;
   import com.mz.core.configs.ClientConfig;
   import nslm2.inits.InitWebAllTask;
   import com.mz.core.utils2.task.TaskList;
   import nslm2.nets.sockets.SimpleServerEngine;
   import nslm2.inits.InitServerEngineTask;
   import nslm2.inits.InitConfigVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.inits.InitServerFoundationTask;
   import nslm2.inits.RegModuleTask;
   import nslm2.inits.InitGameStartModuleTask;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.LoadingMsg;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class DungeonSceneModuleFirstBattleDelay extends SceneModuleView
   {
       
      
      private var currentSubSceneIndex:int;
      
      private var dgVo:nslm2.modules.dungeons.DungeonVo;
      
      public function DungeonSceneModuleFirstBattleDelay()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ClientConfig.mainLoadingPage.visible = false;
         InitWebAllTask.createRoleTask.addHandlers(createRoleComplete);
         InitWebAllTask.createRoleTask.showCreateRolePage();
         ClientConfig.firstBattle = 2;
         var _loc2_:TaskList = new TaskList();
         _loc2_.addTask(InitWebAllTask.getInitStcTask());
         _loc2_.exec();
      }
      
      private function createRoleComplete() : void
      {
         SimpleServerEngine.ins.dispose();
         ClientConfig.mainLoadingPage.visible = true;
         ClientConfig.firstBattle = 2;
         currentSubSceneIndex = 0;
         dgVo = new nslm2.modules.dungeons.DungeonVo(100);
         nextScript();
         var _loc1_:TaskList = new TaskList();
         _loc1_.addTask(new InitServerEngineTask().setDataSource(new InitConfigVo(LocaleMgr.ins.getStr(999000007),2)));
         _loc1_.addTask(new InitServerFoundationTask().setDataSource(new InitConfigVo(LocaleMgr.ins.getStr(999000008),2)));
         _loc1_.addTask(new RegModuleTask().setDataSource(new InitConfigVo(LocaleMgr.ins.getStr(999000011),2)));
         _loc1_.addTask(new InitGameStartModuleTask().setDataSource(new InitConfigVo(LocaleMgr.ins.getStr(999000012),2)));
         _loc1_.addProcessHandler(taskList_process);
         _loc1_.addCompleteHandler(taskList_cpl);
         _loc1_.exec();
      }
      
      protected function nextScript() : void
      {
         if(currentSubSceneIndex >= dgVo.subSceneMax - 1)
         {
            if(dgVo.stcStageVo && StringUtils.isNull(dgVo.stcStageVo.drama_script_4) == false)
            {
               NGUtil.chapterCpl(int(dgVo.stcStageVo.drama_script_4));
            }
         }
         else
         {
            currentSubSceneIndex = Number(currentSubSceneIndex) + 1;
            nextScript();
         }
      }
      
      private function taskList_process(param1:TaskList, param2:int, param3:TaskBase) : void
      {
         if(param2 == 73)
         {
            ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,10,param3.dataSource));
         }
      }
      
      private function taskList_cpl() : void
      {
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,2,LocaleMgr.ins.getStr(999000101)));
         GameObjectManager.Instance.engine.initStaticData();
         PlayerModel.ins.exp = 0;
         ClientConfig.firstBattle = 0;
         GlobalRef.mainCityReshowParam.lastAttackChapterId = 100;
         ModuleMgr.ins.closeModule(this.moduleId);
      }
   }
}
