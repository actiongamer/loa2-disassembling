package
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IObserver;
   import flash.events.Event;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.funnies.tencent.model.QQWeiDuanGiftService;
   import morn.core.utils.URLUtils;
   import flash.system.Security;
   import com.mz.core.logging.Log;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.inits.InitWebAllTask;
   import com.mz.core.utils2.task.TaskPool;
   import nslm2.inits.InitConfigVo;
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class GameMain extends Sprite implements IObserver
   {
       
      
      private var processTotal:int;
      
      private var processWeight:Number = 0;
      
      public function GameMain()
      {
         super();
      }
      
      private function onInit(param1:Event = null) : void
      {
         if(EnvConfig.ins.showQQModule)
         {
            if(QQWeiDuanGiftService.ins.checkIsFromWeiDuan() || EnvConfig.ins.useQQ_LEAGUE || EnvConfig.ins.pf == "website")
            {
               URLUtils.callJS("jQuery.getScript(\"http://imgcache.qq.com/bossweb/ipay/js/api/cashier.js\")");
               URLUtils.callJS("jQuery.getScript(\"http://minigame.qq.com/plat/social_hall/app_frame/blue_vip_api.js\")");
            }
         }
         this.removeEventListener("addedToStage",onInit);
         if(this.loadingPage)
         {
            stage.addEventListener("resize",stage_resize);
         }
         try
         {
            Security.allowDomain("*");
         }
         catch(e:Error)
         {
         }
         Log.regUncatchError(this.loaderInfo);
         stage.scaleMode = "noScale";
         stage.align = "TL";
         App.init(this);
         App.language = ClientConfig.language;
         App.languageAry = ClientConfig.languageAry;
         App.languageCodeIdAry = ClientConfig.languageCodeIdAry;
         UIMgr.root = this;
         UIMgr.stage = stage;
         this.visible = false;
         ObserverMgr.ins.regObserver(this);
         new InitWebAllTask(true,subTaskProgressHandler).addHandlers(init_onComplete,null,init_onProcess).exec();
      }
      
      private function subTaskProgressHandler(param1:TaskPool, param2:int) : void
      {
         if(param2 == 73)
         {
            processWeight = processWeight + 1 / param1.totalCount * InitConfigVo(param1.dataSource).weight;
            processWeight = Math.min(processWeight,processTotal - 1);
            if(this.loadingPage)
            {
               this.loadingPageShow(processWeight / processTotal * 100,InitConfigVo(param1.dataSource).toString());
            }
         }
      }
      
      private function init_onProcess(param1:InitWebAllTask, param2:int, param3:TaskBase) : void
      {
         var _loc4_:int = 0;
         if(processTotal == 0)
         {
            processTotal = param1.totalWeight;
         }
         if(loadingPage)
         {
            if(param2 == 71)
            {
               if((param3.dataSource as InitConfigVo).key == 6)
               {
                  this.loadingPageShow(processWeight / processTotal * 100,InitConfigVo(param3.dataSource).toString());
               }
               else
               {
                  processWeight = processWeight + (param3.dataSource as InitConfigVo).weight;
                  processWeight = Math.min(processWeight,processTotal - 1);
                  this.loadingPageShow(processWeight / processTotal * 100,InitConfigVo(param3.dataSource).toString());
               }
            }
            else if(param2 == 72)
            {
               if((param3.dataSource as InitConfigVo).key != 6)
               {
                  this.loadingPageShow(processWeight / processTotal * 100,InitConfigVo(param3.dataSource).toString());
               }
            }
            else if(param2 == 74)
            {
               this.loadingPageShow(processWeight / processTotal * 100,String("错误:" + param3.errorMsg));
            }
         }
      }
      
      private function loadingPageShow(param1:Number, param2:String) : void
      {
         if(ClientConfig.IS_REFRESH_AUTO)
         {
            param2 = LocaleMgr.ins.getStr(999000544);
         }
         this.loadingPage.show(param1,param2);
      }
      
      private function stage_resize(param1:Event) : void
      {
         if(loadingPage)
         {
            this.loadingPage.resize(stage.stageWidth,stage.stageHeight - EnvConfig.ins.shellY);
         }
      }
      
      private function init_onComplete() : void
      {
         this.visible = true;
      }
      
      public function getFocusNotices() : Array
      {
         return ["LOADING_BAR_CPL"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("LOADING_BAR_CPL" !== _loc3_)
         {
         }
      }
      
      public function get loadingPage() : *
      {
         return ClientConfig.mainLoadingPage;
      }
   }
}
