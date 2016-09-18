package com.mz.core.utils2.task
{
   import com.mz.core.utils.ArrayUtil;
   import morn.core.handlers.Handler;
   
   public class TaskPool extends TaskBase
   {
       
      
      private var taskArr:Array;
      
      public var completeCount:int;
      
      public var totalCount:int = 0;
      
      public var checkRepeat:Boolean = true;
      
      public var stopWhenError:Boolean = true;
      
      public function TaskPool()
      {
         taskArr = [];
         super();
      }
      
      public function addTask(param1:TaskBase) : void
      {
         var _loc2_:* = null;
         if(checkRepeat && param1.tag != null)
         {
            _loc2_ = ArrayUtil.findByAttr(this.taskArr,"tag",param1.tag) as TaskBase;
            if(_loc2_)
            {
               _loc2_.handlerBatch.merge(param1.handlerBatch);
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
      }
      
      public function addTaskArr(param1:Vector.<TaskBase>) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            this.addTask(_loc2_);
            _loc4_++;
         }
      }
      
      override public function exec() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         super.exec();
         var _loc2_:int = this.taskArr.length;
         if(_loc2_ == 0)
         {
            this.onComplete();
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = this.taskArr[_loc3_];
               _loc1_.addCompleteHandler(new Handler(this.task_completeHandler)).addErrorHandler(new Handler(this.task_errorHandler));
               _loc1_.exec();
               _loc3_++;
            }
         }
      }
      
      protected function hasFreeTasks() : Boolean
      {
         return this.taskArr.length > 0;
      }
      
      protected function task_completeHandler(param1:TaskBase) : void
      {
         this.completeCount++;
         if(state == 74)
         {
            return;
         }
         this.handlerBatch.execute(72,[this,73,param1],false);
         if(this.completeCount >= this.totalCount)
         {
            this.onComplete();
         }
      }
      
      protected function task_errorHandler(param1:TaskBase) : void
      {
         this.completeCount++;
         this.handlerBatch.execute(72,[this,74,param1],stopWhenError);
         if(stopWhenError == true)
         {
            this.onError();
         }
         else if(this.completeCount >= this.totalCount)
         {
            this.onComplete();
         }
      }
      
      override public function stop() : void
      {
         super.stop();
         this.taskArr = [];
      }
      
      public function clearList() : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = taskArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = taskArr[_loc3_];
            _loc1_.stop();
            _loc3_++;
         }
         this.taskArr = [];
         this.completeCount = 0;
         this.totalCount = 0;
         this.process = 0;
      }
      
      override public function dispose() : void
      {
         this.stop();
         this.clearList();
      }
   }
}
