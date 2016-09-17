package com.mz.core.utils2.task
{
   import com.greensock.TweenLite;
   
   public class DelayTask extends TaskBase
   {
       
      
      public var delay:int;
      
      public function DelayTask(param1:int)
      {
         super();
         this.delay = param1;
      }
      
      override public function exec() : void
      {
         super.exec();
         TweenLite.delayedCall(delay / 1000,this.onComplete);
      }
   }
}
