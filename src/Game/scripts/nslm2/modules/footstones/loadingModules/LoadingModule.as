package nslm2.modules.footstones.loadingModules
{
   import game.ui.loadingModules.LoadingModuleUI;
   import com.mz.core.interFace.IObserver;
   import flash.events.MouseEvent;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.alerts.FPSLowlyChecker;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.common.globals.GlobalRef;
   import morn.customs.expands.MornExpandUtil;
   
   public class LoadingModule extends LoadingModuleUI implements IObserver
   {
       
      
      public var id:int;
      
      public var kind:int;
      
      public var total:int;
      
      public var progress:Number = 0;
      
      private var _boxPop:nslm2.modules.footstones.loadingModules.LoadingPop;
      
      public var mainCtrl:nslm2.modules.footstones.loadingModules.LoadingMainCtrl;
      
      public var progressInfo:String = "";
      
      private var isAutoAdd:Boolean;
      
      private var _percent:int;
      
      public function LoadingModule()
      {
         super();
         GlobalRef.loadingModule = this;
         this.cover.visible = false;
         this.mainCtrl = new nslm2.modules.footstones.loadingModules.LoadingMainCtrl();
         MornExpandUtil.setLayout(this);
         this.addEventListener("click",onMouseClick);
      }
      
      public function get boxPop() : nslm2.modules.footstones.loadingModules.LoadingPop
      {
         if(this._boxPop == null)
         {
            _boxPop = new nslm2.modules.footstones.loadingModules.LoadingPop();
            this.addChild(_boxPop);
            var _loc1_:int = 0;
            _boxPop.centerY = _loc1_;
            _boxPop.centerX = _loc1_;
         }
         return _boxPop;
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         if(param1.altKey)
         {
            Log.info(this,this.id," - ",this.kind,this.progressInfo);
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["MSG_GM_CMD","LOADING_BAR_INIT","LOADING_BAR_ADD_PROGRESS","LOADING_BAR_SET_PROGRESS","LOADING_BAR_CPL","SERVICE_NET_TIME_OUT"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:LoadingMsg = param2 as LoadingMsg;
         var _loc4_:* = param1;
         if("LOADING_BAR_INIT" !== _loc4_)
         {
            if("LOADING_BAR_ADD_PROGRESS" !== _loc4_)
            {
               if("LOADING_BAR_SET_PROGRESS" !== _loc4_)
               {
                  if("LOADING_BAR_CPL" !== _loc4_)
                  {
                     if("MSG_GM_CMD" !== _loc4_)
                     {
                        if("SERVICE_NET_TIME_OUT" === _loc4_)
                        {
                           if(this.isShow)
                           {
                              this.stopAutoAdd();
                              this.percent = 100;
                           }
                        }
                     }
                     else if(param2[0] == "close")
                     {
                        if(this.isShow)
                        {
                           this.stopAutoAdd();
                           this.percent = 100;
                        }
                     }
                  }
                  else if(this.id == _loc3_.id || ModuleMgr.ins.getConfigVo(_loc3_.id).layerKind == 1)
                  {
                     this.stopAutoAdd();
                     this.percent = 100;
                     FPSLowlyChecker.startCheck(this.stage);
                  }
               }
               else if(this.id == _loc3_.id)
               {
                  if(_loc3_.info)
                  {
                     this.progressInfo = _loc3_.info;
                  }
                  if(isAutoAdd)
                  {
                     return;
                  }
                  this.progress = Math.min(_loc3_.val,this.total - 1);
                  this.percent = this.progress / this.total * 100;
               }
            }
            else if(this.id == _loc3_.id)
            {
               if(_loc3_.info)
               {
                  this.progressInfo = _loc3_.info;
               }
               if(isAutoAdd)
               {
                  return;
               }
               this.progress = Math.min(progress + _loc3_.val,this.total - 1);
               this.percent = this.progress / this.total * 100;
            }
         }
         else
         {
            this.progressInfo = _loc3_.info;
            this.id = _loc3_.id;
            this.kind = _loc3_.kind;
            this.total = _loc3_.val || 100;
            this.progress = 0;
            _percent = 0;
            this.percent = this.progress / this.total * 100;
            if(_loc3_.autoAdd)
            {
               this.startAutoAdd();
            }
            else
            {
               this.stopAutoAdd();
            }
            FPSLowlyChecker.pauseCheck();
         }
      }
      
      private function startAutoAdd() : void
      {
         isAutoAdd = true;
         TimerManager.ins.doFrameLoop(1,this.autoAddLoop);
      }
      
      private function autoAddLoop() : void
      {
         this.progress = this.progress + (total - progress) / 100;
         this.percent = this.progress / this.total * 100;
      }
      
      private function stopAutoAdd() : void
      {
         isAutoAdd = false;
         TimerManager.ins.clearTimer(this.autoAddLoop);
      }
      
      public function get percent() : int
      {
         return _percent;
      }
      
      public function set percent(param1:int) : void
      {
         if(_percent < param1 || param1 == 0)
         {
            _percent = param1;
            if(param1 >= 100)
            {
               if(this.isShow == true)
               {
                  this.tweenOut();
               }
            }
            else
            {
               if(this.isShow == false)
               {
                  this.tweenIn();
               }
               switch(int(this.kind) - 1)
               {
                  case 0:
                     this.mainCtrl.showPercent(param1,this.progressInfo);
                     break;
                  case 1:
                     this.boxPop.percent = param1;
               }
            }
         }
         else if(param1 >= 100)
         {
            if(this.isShow == true)
            {
               this.tweenOut();
            }
         }
      }
      
      public function get isShow() : Boolean
      {
         return this.cover.visible;
      }
      
      private function tweenIn() : void
      {
         this.cover.visible = true;
         switch(int(this.kind) - 1)
         {
            case 0:
               if(this._boxPop)
               {
                  this._boxPop.hide();
               }
               this.mainCtrl.tweenIn();
               break;
            case 1:
               this.mainCtrl.hide();
               this.boxPop.tweenIn();
         }
      }
      
      private function tweenOut() : void
      {
         this.cover.visible = false;
         this.mainCtrl.tweenOut();
         if(_boxPop)
         {
            this._boxPop.tweenOut();
         }
      }
   }
}
