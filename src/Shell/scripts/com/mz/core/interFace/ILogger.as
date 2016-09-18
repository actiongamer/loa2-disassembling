package com.mz.core.interFace
{
   public interface ILogger
   {
       
      
      function debug(... rest) : void;
      
      function info(... rest) : void;
      
      function warn(... rest) : void;
      
      function error(... rest) : void;
      
      function fatal(... rest) : void;
   }
}
