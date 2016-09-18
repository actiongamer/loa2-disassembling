package nslm2.modules.footstones.loadingModules
{
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.ServerTimer;
   import com.greensock.TweenLite;
   
   public class LoadingMainCtrl
   {
       
      
      private var _loadingSceneAIRFake:nslm2.modules.footstones.loadingModules.LoadingScene;
      
      public function LoadingMainCtrl()
      {
         super();
      }
      
      public function get loadingPage() : *
      {
         return ClientConfig.mainLoadingPage;
      }
      
      public function get loadingSceneAIRFake() : nslm2.modules.footstones.loadingModules.LoadingScene
      {
         var _loc1_:* = null;
         if(_loadingSceneAIRFake == null)
         {
            _loadingSceneAIRFake = new nslm2.modules.footstones.loadingModules.LoadingScene();
            _loc1_ = ModuleMgr.ins.getModule(90400) as LoadingModule;
            if(_loc1_)
            {
               _loc1_.addChild(_loadingSceneAIRFake);
            }
         }
         return _loadingSceneAIRFake;
      }
      
      public function showPercent(param1:int, param2:String) : void
      {
         if(loadingPage)
         {
            this.loadingPage.show(param1,param2 || "");
         }
         else
         {
            this.loadingSceneAIRFake.percent = param1;
         }
      }
      
      public function tweenIn() : void
      {
         if(loadingPage)
         {
            this.loadingPage.reset();
            this.loadingPage.visible = true;
            if(EnvConfig.ins.useServer)
            {
               this.loadingPage.scrollTipCtrl.show(PlayerModel.ins.vip,PlayerModel.ins.level,ServerTimer.ins.second);
            }
            TweenLite.to(loadingPage,0.1,{
               "delay":0.3,
               "alpha":1,
               "overwrite":1
            });
         }
         else
         {
            loadingSceneAIRFake.tweenIn();
         }
      }
      
      public function tweenOut() : void
      {
         if(loadingPage)
         {
            TweenLite.to(loadingPage,0.1,{
               "alpha":0.5,
               "onComplete":tweenOut_cpl,
               "overwrite":1
            });
         }
         else
         {
            loadingSceneAIRFake.tweenOut();
         }
      }
      
      private function tweenOut_cpl() : void
      {
         this.loadingPage.visible = false;
      }
      
      public function hide() : void
      {
         if(loadingPage)
         {
            TweenLite.killTweensOf(loadingPage);
            this.loadingPage.visible = false;
            this.loadingPage.alpha = 0;
         }
         else
         {
            loadingSceneAIRFake.hide;
         }
      }
   }
}
