package morn.core.managers.timerMgrs
{
   public class TimerHandlerVo
   {
       
      
      public var delay:int;
      
      public var loopOrMs_total:int;
      
      public var useFrame:Boolean;
      
      public var method;
      
      public var method_end;
      
      var waitTimeMs:int;
      
      public var overFrame:int;
      
      public var overTimeMs:int;
      
      public var runTimes:int;
      
      public var runTimeMs:int;
      
      public var loopOrMs_leave:int;
      
      public var isDisposed:Boolean = false;
      
      public function TimerHandlerVo()
      {
         super();
      }
      
      public function dispose() : void
      {
         this.isDisposed = true;
         method = null;
      }
   }
}
