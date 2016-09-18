package nslm2.inits
{
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.utils.Effect3DUtils;
   import nslm2.utils.ServerTimer;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class InitAssetsTask extends TaskPool
   {
       
      
      public function InitAssetsTask()
      {
         super();
      }
      
      override public function exec() : void
      {
         if(ClientConfig.firstBattle == 1)
         {
            this.addTask(new GetResTask(33,"ui/uiBattleResults.uibaz",2,true));
            this.addTask(new GetResTask(14,"effect2d/battle/dgWinLogo.swf",2));
         }
         this.addTask(new GetResTask(33,"ui/uiNewerGuide.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/aLocale.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/comp.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/compCustoms.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiCommon.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiBag.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiChatModules.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiMainToolBar.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiPlayerHeader.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiLoadingModules.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiMiniNotice.uibaz",3,true));
         this.addTask(new InitFontTask());
         this.addTask(new GetResTask(3,"ui/faces.swf"));
         this.addTask(new GetResTask(3,"ui/ccengine.swf"));
         this.addTask(new GetResTask(33,"ui/uiFightPlayer.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiMainCitys.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiMiniMap.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiMiniTask.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/a5.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiScript.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiNotice.uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiNewerGuide.uibaz",3,true));
         this.addTask(new GetResTask(10,UrlLib.skillConfigUrl()));
         this.addTask(new GetResTask(33,"ui/uiPlayerHeader_" + ClientConfig.language + ".uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiLoadingModules_" + ClientConfig.language + ".uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiMainCitys_" + ClientConfig.language + ".uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiMiniMap_" + ClientConfig.language + ".uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/a5_" + ClientConfig.language + ".uibaz",3,true));
         this.addTask(new GetResTask(33,"ui/uiScript_" + ClientConfig.language + ".uibaz",3,true));
         if(EnvConfig.ins.useServer)
         {
            this.addTask(new GetResEffect3DTask(Effect3DUtils.getUrlBySid(107)));
            this.addTask(new GetResEffect3DTask(Effect3DUtils.getUrlBySid(106)));
         }
         if(ClientConfig.firstBattle == 1)
         {
            this.addTask(new GetResTask(33,"ui/uiRoleTeam.uibaz",3,true));
            this.addTask(new GetResTask(33,"ui/uiNpcFuncLists.uibaz",3,true));
         }
         if(ClientConfig.firstBattle == 2)
         {
            if(ServerTimer.isDuLiRi())
            {
               this.addTaskArr(BmcSpriteSheet.getPreloadTaskArr(new <int>[90000000,1000107,6000005,6000004]));
            }
            else
            {
               this.addTaskArr(BmcSpriteSheet.getPreloadTaskArr(new <int>[1000107,6000005,6000004]));
            }
         }
         else
         {
            this.addTaskArr(BmcSpriteSheet.getPreloadTaskArr(new <int>[1000107]));
         }
         if(ClientConfig.firstBattle != 1)
         {
            if(EnvConfig.ins.showQQModule)
            {
               this.addTask(new GetResTask(33,"ui/uiYellowVip.uibaz",3,true));
               this.addTask(new GetResTask(33,"ui/uiBlueVip.uibaz",3,true));
            }
         }
         super.exec();
      }
   }
}
