package com.mz.core.interFace
{
   public interface ITimesCited
   {
       
      
      function addCited(param1:IUniqueId) : void;
      
      function removeCited(param1:IUniqueId) : void;
      
      function countCited() : int;
   }
}
