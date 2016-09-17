package nslm2.mgrs.uiFades
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.DisplayObjectContainer;
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.utils2.task.DelayTask;
   import nslm2.mgrs.stcMgrs.vos.StcUiFadeVo;
   import flash.display.DisplayObject;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class UIFadeTask extends TaskBase
   {
       
      
      private var fadeViewId:int;
      
      private var taskPool:TaskPool;
      
      private var taskList:Vector.<nslm2.mgrs.uiFades.CompFadeTask>;
      
      private var fadeVoArr:Array;
      
      public var isFadeIn:Boolean;
      
      public var startDelay:Number;
      
      private var oriMouseEnabled:Boolean;
      
      private var oriMouseChildren:Boolean;
      
      public function UIFadeTask(param1:DisplayObjectContainer, param2:int, param3:Boolean, param4:Number = 0)
      {
         var _loc8_:int = 0;
         var _loc5_:* = null;
         fadeVoArr = [];
         super(param1);
         fadeViewId = param2;
         oriMouseEnabled = param1.mouseEnabled;
         oriMouseChildren = param1.mouseChildren;
         var _loc7_:Array = StcMgr.ins.getVoArrByColumnValue("static_ui_fade","fade_view_id",fadeViewId);
         var _loc6_:int = _loc7_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc5_ = _loc7_[_loc8_];
            if(UIFadeUtil.checkTriggerKind_fade(_loc5_.trigger_kind,param3))
            {
               this.fadeVoArr.push(_loc5_);
            }
            _loc8_++;
         }
         this.isFadeIn = param3;
         this.startDelay = param4;
      }
      
      public function get ui() : DisplayObjectContainer
      {
         return this.tag as DisplayObjectContainer;
      }
      
      override public function exec() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         super.exec();
         taskPool = new TaskPool();
         taskList = new Vector.<nslm2.mgrs.uiFades.CompFadeTask>();
         if(this.startDelay > 0)
         {
            taskPool.addTask(new DelayTask(this.startDelay * 1000));
         }
         taskPool.addCompleteHandler(taskPool_onCpl);
         var _loc2_:int = fadeVoArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = fadeVoArr[_loc3_];
            distillComp(ui,_loc1_);
            _loc3_++;
         }
         if(taskPool.totalCount > 0)
         {
            taskPool.exec();
         }
         else
         {
            this.taskPool_onCpl();
         }
      }
      
      private function distillComp(param1:DisplayObjectContainer, param2:StcUiFadeVo) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         if(param1.hasOwnProperty(param2.comp_id) && param1[param2.comp_id] as DisplayObject != null)
         {
            _loc4_ = new nslm2.mgrs.uiFades.CompFadeTask(param1[param2.comp_id],param2,this.isFadeIn,startDelay);
            this.taskPool.addTask(_loc4_);
            this.taskList.push(_loc4_);
         }
         else if(param1.numChildren)
         {
            _loc5_ = param1.numChildren;
            _loc6_ = _loc5_ - 1;
            while(_loc6_ >= 0)
            {
               _loc3_ = param1.getChildAt(_loc6_);
               if(_loc3_ is DisplayObjectContainer)
               {
                  distillComp(_loc3_ as DisplayObjectContainer,param2);
               }
               _loc6_--;
            }
         }
      }
      
      public function taskPool_onCpl() : void
      {
         this.onComplete();
      }
      
      public function resetOriAndStop() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(taskList)
         {
            _loc2_ = taskList.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = taskList[_loc3_];
               _loc1_.resetOriAndStop();
               _loc3_++;
            }
         }
      }
      
      override public function stop() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(taskList)
         {
            _loc2_ = taskList.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = taskList[_loc3_];
               _loc1_.stop();
               _loc3_++;
            }
            taskList = null;
         }
         super.stop();
      }
   }
}
