package nslm2.modules.footstones.newerAlertModules
{
   import game.ui.newerAlertModules.NewerAlertModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.MouseEvent;
   import morn.customs.expands.MornExpandUtil;
   
   public class NewerAlertModule extends NewerAlertModuleUI
   {
       
      
      private var _subViewStack:ViewStack;
      
      private var _showingFuncId:int;
      
      public function NewerAlertModule()
      {
         super();
         this.bottom = 100;
         this.right = 82;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _showingFuncId = param1 as int;
         this.panelBg.titleImgId = this.moduleId;
         _subViewStack = new ViewStack();
         this.addChild(_subViewStack);
         _subViewStack.subViewClasses = NewerAlertConsts.subViewStackPanelArr;
         if(NewerAlertConsts.FIGHT_VALUE_ALERT_ARRAY.indexOf(_showingFuncId) == -1)
         {
            _subViewStack.selectedIndex = NewerAlertConsts.subViewStackIdArr.indexOf(1);
            this.btn_confirm.label = LocaleMgr.ins.getStr(964100000 + _showingFuncId);
         }
         else
         {
            _subViewStack.selectedIndex = NewerAlertConsts.subViewStackIdArr.indexOf(2);
            this.btn_confirm.label = LocaleMgr.ins.getStr(999000564);
         }
         (_subViewStack.selection as INewerAlert).show(_showingFuncId);
         this.preShowCpl();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_confirm === _loc2_)
         {
            onBtnConfirmClicked();
         }
      }
      
      private function onBtnConfirmClicked() : void
      {
         var _loc1_:TaskBase = NewerAlertTaskFactory.getTaskByFuncId(_showingFuncId);
         (_subViewStack.selection as INewerAlert).btnCloseHandler();
         ObserverMgr.ins.sendNotice("msgDeleteNewerAlert",_showingFuncId);
         _loc1_.exec();
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         (_subViewStack.selection as INewerAlert).btnCloseHandler();
         ObserverMgr.ins.sendNotice("msgDeleteNewerAlert",_showingFuncId);
      }
   }
}
