package com.mz.core.mgrs
{
   import com.mz.core.interFace.IObserver;
   
   class ObserverVo
   {
      
      public static const OBSERVER:String = "observer";
       
      
      public var observer:IObserver;
      
      public var notifyArr:Array;
      
      function ObserverVo(param1:IObserver, param2:Array)
      {
         super();
         this.observer = param1;
         this.notifyArr = param2;
      }
   }
}
