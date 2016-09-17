package com.mz.core.interFace
{
   public interface IFadeView extends IDispose
   {
       
      
      function set fadeViewId(param1:int) : void;
      
      function get fadeViewId() : int;
      
      function fadeIn(param1:Number = 0, param2:int = 0) : void;
      
      function fadeOut() : void;
   }
}
