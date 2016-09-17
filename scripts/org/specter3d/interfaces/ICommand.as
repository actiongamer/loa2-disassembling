package org.specter3d.interfaces
{
   public interface ICommand
   {
       
      
      function execute() : void;
      
      function dispose() : void;
      
      function get data() : *;
      
      function set data(param1:*) : void;
   }
}
