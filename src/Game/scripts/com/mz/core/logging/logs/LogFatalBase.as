package com.mz.core.logging.logs
{
   import com.mz.core.logging.Log;
   
   public class LogFatalBase
   {
       
      
      public function LogFatalBase(param1:*, ... rest)
      {
         super();
         Log.append(16,Log.getClassName(param1),rest);
      }
   }
}
