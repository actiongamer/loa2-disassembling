package nslm2.modules.footstones.moduleBases
{
   import com.mz.core.interFace.IDispose;
   import com.greensock.TweenLite;
   import com.mz.core.logging.Log;
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.mgrs.resMgrs.ResVo;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.LoadingMsg;
   import morn.customs.components.ModuleViewBase;
   import flash.events.Event;
   import nslm2.common.configs.StcLanguageConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   
   public class ShowModuleTask implements IDispose
   {
      
      public static var showedModuleDict:Object = {};
       
      
      public var miv:nslm2.modules.footstones.moduleBases.ModuleInfoVo;
      
      public var showHandler;
      
      public var closeHandler;
      
      public function ShowModuleTask(param1:nslm2.modules.footstones.moduleBases.ModuleInfoVo)
      {
         super();
         this.miv = param1;
      }
      
      public function get configVo() : ModuleConfigVo
      {
         return miv.configVo;
      }
      
      protected function get showParam() : *
      {
         return miv.param;
      }
      
      private function get layer() : ModuleLayerBase
      {
         return ModuleMgr.ins.getLayer(miv.configVo.layerKind);
      }
      
      public function toTop() : void
      {
         if(this.miv.module)
         {
            this.layer.addChild(this.miv.module);
         }
      }
      
      public function changeModuleState(param1:int) : void
      {
         var _loc2_:int = 0;
         if(miv.state != param1)
         {
            _loc2_ = miv.state;
            miv.state = param1;
            if(_loc2_ == 1)
            {
               TweenLite.killDelayedCallsTo(moduleFadeInStart);
               switch(int(miv.phase) - 11)
               {
                  case 0:
                  case 1:
                  case 2:
                     if(miv.state != 3)
                     {
                        this.removeListeners();
                        hideLoading();
                        this.moduleClose(null);
                     }
                     break;
                  case 3:
                     this.removeListeners();
                     this.preClose(null);
                     break;
                  case 4:
                     this.removeListeners();
                     this.preClose(null);
               }
            }
            else if(_loc2_ == 3)
            {
               if(miv.state == 1)
               {
                  switch(int(miv.phase) - 21)
                  {
                     case 0:
                        this.moduleShow(null);
                        break;
                     case 1:
                     case 2:
                        if(this.miv.module.parent == null)
                        {
                           this.layer.addChild(this.miv.module);
                        }
                        this.moduleFadeIn(null);
                  }
               }
               else
               {
                  Log.fatal(this,"错误的miv.state",this.miv.moduleId,this.miv.state);
               }
            }
            miv.state = param1;
         }
      }
      
      public function exec() : void
      {
         this.showLoading();
         if(configVo.loadingArr != null && configVo.loadingArr.length > 0)
         {
            startLoadingAssets();
         }
         else
         {
            this.createModule();
         }
      }
      
      private function getLoadingKindByLayer(param1:int) : int
      {
         switch(int(miv.configVo.layerKind) - 1)
         {
            case 0:
               return 1;
            default:
               return 0;
            case 2:
               return 2;
         }
      }
      
      protected function startLoadingAssets() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:TaskPool = new TaskPool();
         var _loc1_:int = this.configVo.loadingArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = this.configVo.loadingArr[_loc4_];
            _loc2_.addTask(new GetResTask(_loc3_.type,_loc3_.url,_loc3_.priority));
            _loc4_++;
         }
         miv.phase = 11;
         _loc2_.addHandlers(loadingPool_onComplete,null,loadingPool_processHandler);
         _loc2_.exec();
      }
      
      private function loadingPool_processHandler(param1:TaskPool) : void
      {
      }
      
      private function loadingPool_onComplete() : void
      {
         this.createModule();
      }
      
      protected function createModule() : void
      {
         if(miv.state == 4)
         {
            return;
         }
         ObserverMgr.ins.sendNotice("LOADING_BAR_SET_PROGRESS",new LoadingMsg(miv.moduleId,getLoadingKindByLayer(miv.configVo.layerKind),30));
         miv.module = new configVo.moduleCls() as ModuleViewBase;
         miv.module.__showModuleTask = this;
         miv.module.moduleInfo = miv;
         miv.module.initXY();
         miv.phase = 12;
         miv.module.addEventListener("moduleServerCpl",modulePreShow);
         miv.module.moduleServerStart(this.showParam);
      }
      
      private function modulePreShow(param1:Event) : void
      {
         miv.module.removeEventListener("moduleServerCpl",modulePreShow);
         miv.phase = 13;
         if(miv.module.parent == null)
         {
            this.layer.addChild(miv.module);
         }
         miv.module.setVisibleList("MODULE_PRESHOW",false);
         miv.module.addEventListener("modulePreShowCpl",moduleFadeIn);
         miv.module.preShow(this.showParam);
      }
      
      private function moduleFadeIn(param1:Event) : void
      {
         if(miv.configVo.layerKind == 3 && showedModuleDict.hasOwnProperty(miv.moduleId) == false)
         {
            showedModuleDict[miv.moduleId] = true;
            moduleFadeInStart();
         }
         else
         {
            moduleFadeInStart();
         }
      }
      
      private function showLoading() : void
      {
         if(miv.configVo.moduleId == 10100 || miv.configVo.moduleId == 10102)
         {
            return;
         }
         switch(int(miv.configVo.layerKind) - 1)
         {
            case 0:
               ObserverMgr.ins.sendNotice("LOADING_BAR_INIT",new LoadingMsg(miv.moduleId,getLoadingKindByLayer(miv.configVo.layerKind),100,StcLanguageConfig.ins.getLanguage(999000116),this.miv.configVo.loadingAutoAdd));
               break;
            default:
            case 2:
               if(configVo.forceShowLoadingType > 0)
               {
                  ObserverMgr.ins.sendNotice("LOADING_BAR_INIT",new LoadingMsg(miv.moduleId,configVo.forceShowLoadingType,100,LocaleMgr.ins.getStr(999000116),true));
                  break;
               }
         }
      }
      
      private function hideLoading() : void
      {
         if(miv.configVo.noHideLoading == false)
         {
            switch(int(miv.configVo.layerKind) - 1)
            {
               case 0:
                  ObserverMgr.ins.sendNotice("LOADING_BAR_CPL",new LoadingMsg(miv.moduleId,getLoadingKindByLayer(miv.configVo.layerKind),0));
                  break;
               default:
               case 2:
                  if(configVo.forceShowLoadingType > 0)
                  {
                     ObserverMgr.ins.sendNotice("LOADING_BAR_CPL",new LoadingMsg(miv.moduleId,configVo.forceShowLoadingType,0));
                     break;
                  }
            }
         }
      }
      
      private function moduleFadeInStart() : void
      {
         miv.module.setVisibleList("MODULE_PRESHOW",true);
         miv.module.removeEventListener("modulePreShowCpl",moduleFadeIn);
         hideLoading();
         if(miv.state != 1)
         {
            return;
         }
         miv.phase = 14;
         miv.module.addEventListener("panelTweenInCpl",moduleShow);
         miv.module.moduleFadeIn();
      }
      
      private function moduleShow(param1:Event) : void
      {
         if(miv.state != 1)
         {
            return;
         }
         if(miv.module.parent == null)
         {
            this.layer.addChild(miv.module);
         }
         miv.module.removeEventListener("panelTweenInCpl",moduleShow);
         miv.phase = 15;
         miv.module.show(this.showParam);
         Handler.execute(this.showHandler,[this]);
      }
      
      private function preClose(param1:Event) : void
      {
         miv.phase = 21;
         miv.module.addEventListener("modulePreCloseCpl",moduleFadeOut);
         miv.module.preClose(miv.param);
      }
      
      protected function moduleFadeOut(... rest) : void
      {
         miv.module.removeEventListener("modulePreCloseCpl",moduleFadeOut);
         miv.phase = 22;
         miv.module.addEventListener("panelTweenOutCpl",moduleClose);
         miv.module.moduleFadeOut();
      }
      
      private function moduleClose(param1:Event) : void
      {
         miv.phase = 23;
         if(miv.module)
         {
            miv.module.removeEventListener("panelTweenOutCpl",moduleClose);
            miv.module.close(miv.param);
            if(miv.state == 4)
            {
               miv.module.dispose();
            }
            DisplayUtils.removeSelf(miv.module);
         }
         Handler.execute(this.closeHandler,[this]);
      }
      
      private function removeListeners() : void
      {
         if(miv && miv.module)
         {
            miv.module.removeEventListener("moduleServerCpl",modulePreShow);
            miv.module.removeEventListener("modulePreShowCpl",moduleFadeIn);
            miv.module.removeEventListener("panelTweenInCpl",moduleShow);
            miv.module.removeEventListener("modulePreCloseCpl",moduleFadeOut);
            miv.module.removeEventListener("panelTweenOutCpl",moduleClose);
         }
      }
      
      public function dispose() : void
      {
         if(miv.module)
         {
            TweenLite.killDelayedCallsTo(moduleFadeInStart);
            removeListeners();
            miv.module = null;
         }
      }
   }
}
