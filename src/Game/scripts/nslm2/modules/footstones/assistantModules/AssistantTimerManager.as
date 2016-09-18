package nslm2.modules.footstones.assistantModules
{
   import com.mz.core.interFace.IObserver;
   import com.mz.core.utils.DictHash;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import proto.FunctionActionInfo;
   import nslm2.modules.footstones.assistantModules.vos.AssistantTimerVo;
   import nslm2.utils.ServerTimer;
   
   public class AssistantTimerManager implements IObserver
   {
      
      private static var _ins:nslm2.modules.footstones.assistantModules.AssistantTimerManager;
       
      
      private var _timerDict:DictHash;
      
      public function AssistantTimerManager()
      {
         _timerDict = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.assistantModules.AssistantTimerManager
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.assistantModules.AssistantTimerManager();
         }
         return _ins;
      }
      
      public function init() : void
      {
         ObserverMgr.ins.regObserver(this);
      }
      
      public function stop() : void
      {
         ObserverMgr.ins.unregObserver(this);
         TimerManager.ins.clearTimer(doAssistantTask);
         _timerDict = new DictHash();
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_FUNCTION_ACTION_CHANGED"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = param1;
         if("MSG_FUNCTION_ACTION_CHANGED" === _loc6_)
         {
            if(AssistantModel.ins.isActing)
            {
               _loc4_ = param2 as Array;
               _loc6_ = 0;
               var _loc5_:* = _loc4_;
               for each(var _loc3_ in _loc4_)
               {
                  if(_loc3_.status == 1 && AssistantModel.ins.isActingAuto(_loc3_.funcid))
                  {
                     AssistantModel.ins.addTask([_loc3_.funcid]);
                  }
               }
               AssistantModel.ins.allStart();
            }
         }
      }
      
      public function addTimer(param1:AssistantTimerVo) : void
      {
         if(AssistantModel.ins.isActing && AssistantModel.ins.isActingAuto(param1.funcId))
         {
            _timerDict.put(param1.funcId,param1);
            initTimer();
         }
      }
      
      public function removeTimer(param1:int) : void
      {
         _timerDict.remove(param1);
         initTimer();
      }
      
      public function initTimer() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         TimerManager.ins.clearTimer(doAssistantTask);
         var _loc2_:Array = _timerDict.array.concat();
         _loc2_.sortOn("showNoticeTime",16);
         if(_loc2_.length > 0)
         {
            _loc1_ = _loc2_[0];
            _loc3_ = _loc1_.showNoticeTime - ServerTimer.ins.second;
            if(_loc3_ <= 0)
            {
               doAssistantTask();
            }
            else
            {
               TimerManager.ins.doOnce(_loc3_ * 1000,doAssistantTask);
            }
         }
      }
      
      private function doAssistantTask() : void
      {
         var _loc1_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = _timerDict.array.concat();
         _loc2_.sortOn("showNoticeTime",16);
         if(_loc2_.length > 0)
         {
            _loc1_ = _loc2_.length;
            _loc4_ = [];
            _loc5_ = 0;
            while(_loc5_ < _loc1_)
            {
               _loc3_ = _loc2_[_loc5_];
               if(_loc3_ && (_loc3_.showNoticeTime - ServerTimer.ins.second < 0 || Math.abs(_loc3_.showNoticeTime - ServerTimer.ins.second) < 5))
               {
                  _loc4_.push(_loc3_.funcId);
                  _timerDict.remove(_loc3_.funcId);
                  _loc5_++;
                  continue;
               }
               break;
            }
            if(_loc4_.length > 0)
            {
               AssistantModel.ins.addTask(_loc4_);
               AssistantModel.ins.allStart();
               initTimer();
            }
         }
      }
   }
}
