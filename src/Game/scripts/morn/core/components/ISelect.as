package morn.core.components
{
   public interface ISelect
   {
       
      
      function get selected() : Boolean;
      
      function set selected(param1:Boolean) : void;
      
      function get clickHandler() : *;
      
      function set clickHandler(param1:*) : void;
   }
}
