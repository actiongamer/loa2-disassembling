package nslm2.modules.footstones.newerAutoCtrl
{
   import flash.display.DisplayObject;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.greensock.TweenLite;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import flash.display.Stage;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.modules.foundations.dailyTask.DailyTaskBtnCtrl;
   
   public class NewerAutoCtrl
   {
      
      private static var _ins:nslm2.modules.footstones.newerAutoCtrl.NewerAutoCtrl;
       
      
      private const NEED_AUTO_MAX_LEVEL:int = 10;
      
      private var _newerAutoRender:nslm2.modules.footstones.newerAutoCtrl.NewerAutoRender;
      
      private var _isAutoing:Boolean;
      
      private var _comp:DisplayObject;
      
      private var _needStageClick:Boolean;
      
      private var _stage:Stage;
      
      public function NewerAutoCtrl()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.newerAutoCtrl.NewerAutoCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.newerAutoCtrl.NewerAutoCtrl();
         }
         return _ins;
      }
      
      public function addAutoClick(param1:DisplayObject) : void
      {
         if(checkNeedAuto() == false)
         {
            return;
         }
         _comp = param1;
         if(_isAutoing)
         {
            TimerManager.ins.clearTimer(onAuto);
            TweenLite.killDelayedCallsTo(onAuto);
            TweenLite.delayedCall(int(DefindConsts.AUTO_GUIDE_GAP),onAuto);
         }
         else
         {
            readyDoAuto();
         }
      }
      
      public function removeAutoClick(param1:DisplayObject) : void
      {
         if(_comp == param1)
         {
            _comp = null;
         }
      }
      
      public function set needStageClick(param1:Boolean) : void
      {
         _needStageClick = param1;
         if(param1)
         {
            if(_isAutoing)
            {
               TimerManager.ins.clearTimer(onAuto);
               TweenLite.killDelayedCallsTo(onAuto);
               TweenLite.delayedCall(int(DefindConsts.AUTO_GUIDE_GAP),onAuto);
            }
            else
            {
               readyDoAuto();
            }
         }
      }
      
      public function get needStageClick() : Boolean
      {
         return _needStageClick;
      }
      
      public function init(param1:Stage) : void
      {
      }
      
      private function initLabel() : void
      {
         if(_newerAutoRender == null)
         {
            _newerAutoRender = new nslm2.modules.footstones.newerAutoCtrl.NewerAutoRender();
            _newerAutoRender.mouseEvent = false;
            _newerAutoRender.centerX = 0;
            _newerAutoRender.centerY = 0;
            _newerAutoRender.visible = false;
            ModuleMgr.ins.topLayer.addChild(_newerAutoRender);
         }
      }
      
      private function onMouseDown(... rest) : void
      {
         onKeyboard();
      }
      
      private function onKeyboard(... rest) : void
      {
         _newerAutoRender.visible = false;
         _isAutoing = false;
         readyDoAuto();
      }
      
      private function readyDoAuto() : void
      {
      }
      
      public function doAutoLoop() : void
      {
      }
      
      private function onAuto() : void
      {
      }
      
      private function checkNeedAuto() : Boolean
      {
         return false;
      }
      
      private function autoDungeon() : void
      {
      }
   }
}
