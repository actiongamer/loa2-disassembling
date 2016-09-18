package morn.customs.components
{
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.moduleBases.ShowModuleTask;
   import nslm2.modules.footstones.moduleBases.ModuleInfoVo;
   import flash.events.Event;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class ModuleViewBase extends PanelViewBase implements IObserver
   {
      
      public static const MODULE_ID:String = "moduleId";
      
      public static const MOUSEENABLED_KEY_FADEIN:String = "MOUSEENABLED_KEY_FADEIN";
      
      public static const MOUSEENABLED_KEY_DEFAULT:String = "MOUSEENABLED_KEY_DEFAULT";
      
      public static const MOUSECHILDREN_KEY_FADEIN:String = "MOUSECHILDREN_KEY_FADEIN";
      
      public static const MOUSECHILDREN_KEY_DEFAULT:String = "MOUSECHILDREN_KEY_DEFAULT";
       
      
      public var __showModuleTask:ShowModuleTask;
      
      public var moduleInfo:ModuleInfoVo;
      
      protected var _mouseEnabledList:Object;
      
      protected var _mouseChildrenList:Object;
      
      public function ModuleViewBase()
      {
         _mouseEnabledList = {};
         _mouseChildrenList = {};
         super();
         setMouseEnabledList("MOUSEENABLED_KEY_FADEIN",false);
         setMouseChildrenList("MOUSECHILDREN_KEY_FADEIN",false);
      }
      
      public function getHistoryParam() : *
      {
         return null;
      }
      
      public function initXY() : void
      {
      }
      
      public function get moduleId() : uint
      {
         return moduleInfo.moduleId;
      }
      
      override public function get fadeViewId() : int
      {
         if(_fadeViewId == -1)
         {
            if(moduleInfo)
            {
               return this.moduleId;
            }
            return super.fadeViewId;
         }
         return _fadeViewId;
      }
      
      public function moduleServerStart(param1:*) : void
      {
         this.moduleServerCpl();
      }
      
      protected function moduleServerCpl() : void
      {
         this.dispatchEvent(new Event("moduleServerCpl"));
      }
      
      public function preShow(param1:Object = null) : void
      {
         this.preShowCpl();
      }
      
      protected function preShowCpl() : void
      {
         this.dispatchEvent(new Event("modulePreShowCpl"));
      }
      
      public function moduleFadeIn(param1:Number = 0) : void
      {
         this.fadeIn(param1);
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         super.fadeView_fadeInCpl();
         this.moduleFadeInCpl();
      }
      
      protected function moduleFadeInCpl() : void
      {
         this.dispatchEvent(new Event("panelTweenInCpl"));
      }
      
      public function show(param1:Object = null) : void
      {
         switchEventListeners(true);
         App.observer.regObserver(this);
         setMouseEnabledList("MOUSEENABLED_KEY_FADEIN",true);
         setMouseChildrenList("MOUSECHILDREN_KEY_FADEIN",true);
      }
      
      public function preClose(param1:Object = null) : void
      {
         TimerManager.ins.clearTimer(fadeView_fadeInCpl);
         switchEventListeners(false);
         App.observer.unregObserver(this);
         this.preCloseCpl();
      }
      
      protected function preCloseCpl() : void
      {
         this.dispatchEvent(new Event("modulePreCloseCpl"));
      }
      
      public function moduleFadeOut() : void
      {
         this.fadeOut();
      }
      
      override public function fadeView_fadeOutCpl() : void
      {
         super.fadeView_fadeOutCpl();
         this.moduleFadeOutCpl();
      }
      
      protected function moduleFadeOutCpl() : void
      {
         this.dispatchEvent(new Event("panelTweenOutCpl"));
      }
      
      public function close(param1:Object = null) : void
      {
         TimerManager.ins.clearTimer(fadeView_fadeInCpl);
      }
      
      protected function get canRun() : Boolean
      {
         if(this.isDisposed)
         {
            return false;
         }
         if(this.moduleInfo == null)
         {
            return false;
         }
         if(this.moduleInfo.state == 4)
         {
            return false;
         }
         return true;
      }
      
      public function getFocusNotices() : Array
      {
         return [];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function get mouseEnabled() : Boolean
      {
         return super.mouseEnabled;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         setMouseEnabledList("MOUSEENABLED_KEY_DEFAULT",param1);
      }
      
      public function setMouseEnabledList(param1:String, param2:Boolean) : void
      {
         _mouseEnabledList[param1] = param2;
         this.mouseEnabledList();
      }
      
      public function getMouseEnabledList(param1:String) : Boolean
      {
         if(_mouseEnabledList.hasOwnProperty(param1))
         {
            return _mouseEnabledList[param1];
         }
         return true;
      }
      
      protected function mouseEnabledList() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = this._mouseEnabledList;
         for each(var _loc1_ in this._mouseEnabledList)
         {
            if(_loc1_ == false)
            {
               .super.mouseEnabled = false;
               return;
            }
         }
         .super.mouseEnabled = true;
      }
      
      override public function get mouseChildren() : Boolean
      {
         return getMouseChildrenList("MOUSECHILDREN_KEY_DEFAULT");
      }
      
      override public function set mouseChildren(param1:Boolean) : void
      {
         setMouseChildrenList("MOUSECHILDREN_KEY_DEFAULT",param1);
      }
      
      public function setMouseChildrenList(param1:String, param2:Boolean) : void
      {
         _mouseChildrenList[param1] = param2;
         this.mouseChildrenList();
      }
      
      public function getMouseChildrenList(param1:String) : Boolean
      {
         if(_mouseChildrenList.hasOwnProperty(param1))
         {
            return _mouseChildrenList[param1];
         }
         return true;
      }
      
      protected function mouseChildrenList() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = this._mouseChildrenList;
         for each(var _loc1_ in this._mouseChildrenList)
         {
            if(_loc1_ == false)
            {
               .super.mouseChildren = false;
               return;
            }
         }
         .super.mouseChildren = true;
      }
   }
}
