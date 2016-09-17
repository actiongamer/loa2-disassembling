package nslm2.modules.foundations.miniTasks.ctrl
{
   import nslm2.common.ui.components.comps2d.BmcS1;
   import flash.display.DisplayObjectContainer;
   
   public class TaskCompleteCtrl
   {
      
      private static var _ins:nslm2.modules.foundations.miniTasks.ctrl.TaskCompleteCtrl;
       
      
      private var eff:BmcS1;
      
      private var _effectContainer:DisplayObjectContainer;
      
      public function TaskCompleteCtrl()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.miniTasks.ctrl.TaskCompleteCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.miniTasks.ctrl.TaskCompleteCtrl();
         }
         return _ins;
      }
      
      public function showTaskCompleteEff() : void
      {
      }
      
      private function taskEffComplete() : void
      {
         eff = null;
      }
      
      public function set effectContainer(param1:DisplayObjectContainer) : void
      {
         _effectContainer = param1;
      }
   }
}
