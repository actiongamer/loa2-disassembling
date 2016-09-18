package nslm2.nets.sockets
{
   import morn.core.managers.timerMgrs.TimerManager;
   
   class OnceHandlerVo
   {
      
      public static const CMD:String = "cmd";
      
      public static const UID:String = "uid";
       
      
      public var sendTimer:int;
      
      public var cmd:int;
      
      public var cplHandler;
      
      public var errHandler;
      
      function OnceHandlerVo()
      {
         super();
         this.sendTimer = TimerManager.ins.currTimer;
      }
   }
}
