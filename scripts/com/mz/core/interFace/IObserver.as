package com.mz.core.interFace
{
   public interface IObserver
   {
       
      
      function getFocusNotices() : Array;
      
      function handleNotices(param1:String, param2:*) : void;
   }
}
