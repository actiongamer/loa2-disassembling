package nslm2.modules.otherPt.xunleis
{
   import flash.display.Stage;
   import com.mz.core.logging.Log;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.common.model.PlayerModel;
   import nslm2.nets.sockets.ServerEngine;
   
   public class XunLeiCheckKickRole
   {
      
      private static var _ins:nslm2.modules.otherPt.xunleis.XunLeiCheckKickRole;
      
      public static var DELAY_TIME:int = 300;
       
      
      private var stage:Stage;
      
      public function XunLeiCheckKickRole()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.otherPt.xunleis.XunLeiCheckKickRole
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.otherPt.xunleis.XunLeiCheckKickRole();
         }
         return _ins;
      }
      
      public function init(param1:Stage) : void
      {
         Log.info(this,"init");
         stage = param1;
         stage.addEventListener("mouseDown",onMouseDown);
         stage.addEventListener("keyUp",onKeyboard);
      }
      
      private function onMouseDown(... rest) : void
      {
         onKeyboard();
      }
      
      private function onKeyboard(... rest) : void
      {
         TimerManager.ins.doOnce(DELAY_TIME * 1000,onKick);
      }
      
      private function onKick() : void
      {
         Log.info(this,"onKick");
         if(PlayerModel.ins.level < 5)
         {
            stage.removeEventListener("mouseDown",onMouseDown);
            stage.removeEventListener("keyUp",onKeyboard);
            ServerEngine.ins.doDisConnect();
         }
      }
   }
}
