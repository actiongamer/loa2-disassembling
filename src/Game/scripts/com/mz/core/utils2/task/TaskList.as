package com.mz.core.utils2.task
{
   import com.mz.core.utils.ArrayUtil;
   import com.greensock.TweenLite;
   
   public class TaskList extends com.mz.core.utils2.task.TaskBase
   {
       
      
      public var taskArr:Array;
      
      protected var _currentTask:com.mz.core.utils2.task.TaskBase;
      
      public var currentIndex:int = -1;
      
      public var totalCount:int = 0;
      
      public var checkRepeat:Boolean = true;
      
      public var stopWhenError:Boolean = true;
      
      public var autoExec:Boolean = false;
      
      public var interval:Number = 0;
      
      public function TaskList()
      {
         taskArr = [];
         super();
      }
      
      public function get currentTask() : com.mz.core.utils2.task.TaskBase
      {
         return _currentTask;
      }
      
      override public function stop() : void
      {
         super.stop();
         this.clearList();
      }
      
      public function clearList() : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(this._currentTask)
         {
            this._currentTask.stop();
            this._currentTask = null;
         }
         _loc2_ = taskArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = taskArr[_loc3_];
            _loc1_.stop();
            _loc3_++;
         }
         this.taskArr = [];
         this.currentIndex = -1;
         totalCount = 0;
         this.process = 0;
      }
      
      public function addTask(param1:com.mz.core.utils2.task.TaskBase) : void
      {
         var _loc2_:* = null;
         if(checkRepeat && param1.tag != null)
         {
            _loc2_ = ArrayUtil.findByAttr(this.taskArr,"tag",param1.tag) as com.mz.core.utils2.task.TaskBase;
            if(_loc2_)
            {
               _loc2_.handlerBatch.merge(param1.handlerBatch);
            }
            else if(this.currentTask && this.currentTask.tag == param1.tag)
            {
               this.currentTask.handlerBatch.merge(param1.handlerBatch);
            }
            else
            {
               totalCount = Number(totalCount) + 1;
               this.taskArr.push(param1);
            }
         }
         else
         {
            totalCount = Number(totalCount) + 1;
            this.taskArr.push(param1);
         }
         if(autoExec)
         {
            this.exec();
         }
      }
      
      public function removeTask(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = ArrayUtil.findByAttr(this.taskArr,"tag",param1) as com.mz.core.utils2.task.TaskBase;
            if(_loc2_)
            {
               ArrayUtil.removeItemByAttr(this.taskArr,"tag",param1);
               totalCount = Number(totalCount) - 1;
            }
         }
         if(this.currentTask && this.currentTask.tag == param1)
         {
            this.currentTask.onComplete();
         }
      }
      
      override public function exec() : void
      {
         super.exec();
         this.nextTask();
      }
      
      public function nextTask() : void
      {
         if(!this.isStop)
         {
            if(!this.currentTask)
            {
               if(hasFreeTasks())
               {
                  this.currentIndex++;
                  if(this.totalCount > 0)
                  {
                     this.process = Math.round((this.currentIndex + 1) / this.totalCount * 100);
                  }
                  this._currentTask = this.taskArr.shift();
                  this._currentTask.addHandlers(this.task_completeHandler).addProcessHandler(this.task_processHandler).addErrorHandler(this.task_errorHandler);
                  this.handlerBatch.execute(72,[this,71,_currentTask],false);
                  this._currentTask.exec();
               }
               else
               {
                  this.onComplete();
               }
            }
         }
      }
      
      protected function hasFreeTasks() : Boolean
      {
         return this.taskArr.length > 0;
      }
      
      protected function task_processHandler(param1:com.mz.core.utils2.task.TaskBase) : void
      {
         if(state == 74)
         {
            return;
         }
         if(this.currentTask == param1)
         {
            this.handlerBatch.execute(72,[this,72,param1],false);
         }
      }
      
      protected function task_completeHandler(param1:com.mz.core.utils2.task.TaskBase) : void
      {
         if(state == 74)
         {
            return;
         }
         if(this.currentTask == param1)
         {
            this._currentTask = null;
            this.handlerBatch.execute(72,[this,73,param1],false);
            TweenLite.killDelayedCallsTo(this.nextTask);
            TweenLite.delayedCall(interval,this.nextTask);
         }
      }
      
      protected function task_errorHandler(param1:com.mz.core.utils2.task.TaskBase, param2:String) : void
      {
         this.errorMsg = param2;
         if(this.currentTask == param1)
         {
            this._currentTask = null;
            this.handlerBatch.execute(72,[this,74,param1],stopWhenError);
            if(stopWhenError == false)
            {
               TweenLite.killDelayedCallsTo(this.nextTask);
               TweenLite.delayedCall(interval,this.nextTask);
            }
            else
            {
               this.onError(param2);
            }
         }
      }
      
      override public function onComplete() : void
      {
         super.onComplete();
      }
      
      override public function onError(param1:* = null) : void
      {
         super.onError(param1);
      }
   }
}
