package com.mz.core.interFace
{
   public interface IAppender
   {
       
      
      function addClassFilter(param1:String) : void;
      
      function clearClassFilters() : void;
      
      function set parameterExpander(param1:Function) : void;
      
      function write(param1:int, param2:String, param3:Array) : Boolean;
   }
}
