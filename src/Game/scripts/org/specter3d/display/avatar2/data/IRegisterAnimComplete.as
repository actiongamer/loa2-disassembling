package org.specter3d.display.avatar2.data
{
   public interface IRegisterAnimComplete
   {
       
      
      function get allAnimList() : Array;
      
      function get allAnimCompleteList() : Array;
      
      function get hadAnimList() : Array;
      
      function get noAnimList() : Array;
      
      function get isComplete() : Boolean;
      
      function get initNum() : int;
   }
}
