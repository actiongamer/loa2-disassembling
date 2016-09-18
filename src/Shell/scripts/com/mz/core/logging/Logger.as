package com.mz.core.logging
{
   import com.mz.core.interFace.ILogger;
   
   public class Logger implements ILogger
   {
       
      
      private var className:String;
      
      public function Logger(param1:String = null)
      {
         super();
         this.className = param1;
      }
      
      public function debug(... rest) : void
      {
         Log.append(1,className,rest);
      }
      
      public function info(... rest) : void
      {
         Log.append(2,className,rest);
      }
      
      public function warn(... rest) : void
      {
         Log.append(4,className,rest);
      }
      
      public function error(... rest) : void
      {
         Log.append(8,className,rest);
      }
      
      public function fatal(... rest) : void
      {
         Log.append(16,className,rest);
      }
   }
}
