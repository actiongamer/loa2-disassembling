package nslm2.modules.footstones.alerts
{
   import flash.display.Stage;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.LocalData;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import flash.events.ThrottleEvent;
   import flash.utils.getTimer;
   import flash.events.Event;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class FPSLowlyChecker
   {
      
      public static const LONG_CHECK_TIME:int = 180;
      
      public static const LONG_CHECK_FPS:int = 25;
      
      public static const SHORT_CHECK_TIME:int = 60;
      
      public static const SHORT_CHECK_FPS:int = 20;
      
      private static var checker:nslm2.modules.footstones.alerts.FPSLowlyChecker;
      
      public static var hasShowed:Boolean = false;
      
      private static var startTimeOutId:uint;
       
      
      private var stage:Stage;
      
      private var isActivate:Boolean = true;
      
      private var isPause:Boolean = false;
      
      private var hasEnterFrameListener:Boolean = false;
      
      private var lastSecondTime:int;
      
      private var nowFps:int = 0;
      
      private var fpsList:Array;
      
      private var isStop:Boolean = false;
      
      public function FPSLowlyChecker(param1:Stage)
      {
         super();
         this.stage = param1;
         this.fpsList = [];
         param1.addEventListener("throttle",onThrottle);
         isActivate = true;
         isPause = false;
      }
      
      public static function startCheck(param1:Stage) : void
      {
         if(hasShowed)
         {
            return;
         }
         if(PlayerModel.ins.level <= 8)
         {
            return;
         }
         if(LocalData.insCurPlayer.load("FPSLowlyAlertShow",false))
         {
            hasShowed = true;
            return;
         }
         if(isMinSetting())
         {
            return;
         }
         if(startTimeOutId > 0)
         {
            clearTimeout(startTimeOutId);
            startTimeOutId = 0;
         }
         startTimeOutId = setTimeout(doStartCheck,1000,param1);
      }
      
      private static function isMinSetting() : Boolean
      {
         if(SettingModel.ins.peopleNum != 0)
         {
            return false;
         }
         if(SettingModel.ins.otherPlayers == 0)
         {
            return false;
         }
         if(SettingModel.ins.sceneSpecEffect == 0)
         {
            return false;
         }
         if(SettingModel.ins.otherSpecEffect == 0)
         {
            return false;
         }
         return true;
      }
      
      private static function doStartCheck(param1:Stage) : void
      {
         if(checker == null)
         {
            checker = new nslm2.modules.footstones.alerts.FPSLowlyChecker(param1);
            checker.start();
         }
         else
         {
            checker.resume();
         }
      }
      
      public static function pauseCheck() : void
      {
         if(startTimeOutId > 0)
         {
            clearTimeout(startTimeOutId);
            startTimeOutId = 0;
         }
         if(checker)
         {
            checker.pause();
         }
      }
      
      protected function onThrottle(param1:ThrottleEvent) : void
      {
         if(param1.state == "throttle")
         {
            isActivate = false;
         }
         else
         {
            isActivate = true;
         }
         updateEnterFrameListener();
      }
      
      private function resume() : void
      {
         isPause = false;
         updateEnterFrameListener();
      }
      
      private function pause() : void
      {
         isPause = true;
         updateEnterFrameListener();
      }
      
      private function updateEnterFrameListener() : void
      {
         if(isActivate && isPause == false && isStop == false)
         {
            if(hasEnterFrameListener == false)
            {
               nowFps = 0;
               lastSecondTime = getTimer();
               stage.addEventListener("enterFrame",onFrame);
               hasEnterFrameListener = true;
            }
         }
         else if(hasEnterFrameListener == true)
         {
            stage.removeEventListener("enterFrame",onFrame);
            hasEnterFrameListener = false;
         }
      }
      
      private function start() : void
      {
         lastSecondTime = getTimer();
         nowFps = 0;
         isStop = false;
         updateEnterFrameListener();
      }
      
      private function stop() : void
      {
         isStop = true;
         hasEnterFrameListener = false;
         stage.removeEventListener("enterFrame",onFrame);
         stage.removeEventListener("throttle",onThrottle);
      }
      
      private function onFrame(param1:Event) : void
      {
         nowFps = Number(nowFps) + 1;
         var _loc2_:int = getTimer();
         if(_loc2_ - lastSecondTime > 1000)
         {
            if(nowFps >= 9)
            {
               fpsList.push(nowFps);
            }
            if(fpsList.length >= 180)
            {
               if(doCheck())
               {
                  return;
               }
               fpsList.shift();
            }
            nowFps = 0;
            lastSecondTime = _loc2_;
         }
      }
      
      private function doCheck() : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:Array = fpsList.slice(fpsList.length - 60);
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] > 20)
            {
               return false;
            }
            _loc4_++;
         }
         var _loc1_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < fpsList.length)
         {
            _loc1_ = _loc1_ + fpsList[_loc4_];
            _loc4_++;
         }
         var _loc2_:Number = _loc1_ / fpsList.length;
         if(_loc2_ > 25)
         {
            return false;
         }
         stop();
         showAlert();
         return true;
      }
      
      private function showAlert() : void
      {
         if(ModuleMgr.ins.sceneLayer.curModuleId == 40500)
         {
            hasShowed = true;
            if(isMinSetting() == false)
            {
               ModuleMgr.ins.showModule(10910);
            }
         }
         else
         {
            setTimeout(showAlert,1000);
         }
      }
   }
}
