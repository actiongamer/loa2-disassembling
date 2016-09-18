package com.mz.core.utils2.task
{
   import morn.core.handlers.HandlerBatch;
   
   public class TaskHandlerBatch extends HandlerBatch
   {
       
      
      public function TaskHandlerBatch()
      {
         super();
      }
      
      public function addHandlers(param1:*, param2:* = null, param3:* = null, param4:* = null) : TaskHandlerBatch
      {
         if(param1 != null)
         {
            addHandler(73,param1);
         }
         if(param2 != null)
         {
            addHandler(74,param2);
         }
         if(param3 != null)
         {
            addHandler(72,param3);
         }
         if(param4 != null)
         {
            addHandler(71,param4);
         }
         return this;
      }
      
      public function addCompleteHandler(param1:*) : TaskHandlerBatch
      {
         addHandler(73,param1);
         return this;
      }
      
      public function addStartHandler(param1:*) : TaskHandlerBatch
      {
         addHandler(71,param1);
         return this;
      }
      
      public function addProcessHandler(param1:*) : TaskHandlerBatch
      {
         addHandler(72,param1);
         return this;
      }
      
      public function addErrorHandler(param1:*) : TaskHandlerBatch
      {
         addHandler(74,param1);
         return this;
      }
   }
}
