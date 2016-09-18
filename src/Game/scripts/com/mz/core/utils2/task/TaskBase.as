package com.mz.core.utils2.task
{
   import com.mz.core.interFace.IDispose;
   import morn.core.utils.ObjectUtils;
   import com.mz.core.utils2.reflects.ReflectUtil;
   
   public class TaskBase implements IDispose
   {
      
      public static const TAG:String = "tag";
       
      
      private var _tag:Object;
      
      protected var _dataSource;
      
      public var state:int;
      
      public var processMax:Number = 100;
      
      public var process:Number = 0;
      
      public var errorMsg;
      
      public var handlerBatch:com.mz.core.utils2.task.TaskHandlerBatch;
      
      public var isStop:Boolean = false;
      
      public function TaskBase(param1:Object = null)
      {
         handlerBatch = new com.mz.core.utils2.task.TaskHandlerBatch();
         super();
         this.tag = param1;
         this.state = 70;
      }
      
      public function get tag() : Object
      {
         return _tag;
      }
      
      public function set tag(param1:Object) : void
      {
         _tag = param1;
      }
      
      public function get dataSource() : *
      {
         return _dataSource;
      }
      
      public function set dataSource(param1:*) : void
      {
         _dataSource = param1;
      }
      
      public function setDataSource(param1:*) : TaskBase
      {
         this.dataSource = param1;
         return this;
      }
      
      public function addHandlers(param1:*, param2:* = null, param3:* = null, param4:* = null) : TaskBase
      {
         handlerBatch.addHandlers(param1,param2,param3,param4);
         return this;
      }
      
      public function addCompleteHandler(param1:*) : TaskBase
      {
         handlerBatch.addHandler(73,param1);
         return this;
      }
      
      public function addStartHandler(param1:*) : TaskBase
      {
         handlerBatch.addHandler(71,param1);
         return this;
      }
      
      public function addProcessHandler(param1:*) : TaskBase
      {
         handlerBatch.addHandler(72,param1);
         return this;
      }
      
      public function addErrorHandler(param1:*) : TaskBase
      {
         handlerBatch.addHandler(74,param1);
         return this;
      }
      
      public function exec() : void
      {
         onStart();
      }
      
      public function onStart() : void
      {
         if(isStop)
         {
            return;
         }
         this.state = 72;
         this.handlerBatch.execute(71,[this]);
      }
      
      public function onComplete() : void
      {
         if(isStop)
         {
            return;
         }
         this.state = 73;
         this.handlerBatch.execute(73,[this]);
         this.stop();
      }
      
      public function onProcess(param1:Number) : void
      {
         if(isStop)
         {
            return;
         }
         this.process = param1;
         this.handlerBatch.execute(72,[this,param1],false);
      }
      
      public function onError(param1:* = null) : void
      {
         if(isStop)
         {
            return;
         }
         errorMsg = param1;
         this.state = 74;
         if(ObjectUtils.isNone(this.handlerBatch.getList(74)))
         {
            this.uncatchError();
         }
         else
         {
            this.handlerBatch.execute(74,[this,errorMsg]);
         }
         this.stop();
      }
      
      protected function uncatchError() : void
      {
      }
      
      public function stop() : void
      {
         this.isStop = true;
         this.handlerBatch.clear();
      }
      
      public function toString() : String
      {
         return ReflectUtil.getShortClassName(this);
      }
      
      public function dispose() : void
      {
         this.stop();
      }
   }
}
