package morn.core.managers
{
   import morn.core.handlers.Handler;
   
   public interface IResLoader
   {
       
      
      function tryLoad() : void;
      
      function tryToCloseLoad() : void;
      
      function load(param1:String, param2:int, param3:Handler, param4:Handler, param5:Boolean = true) : void;
      
      function get url() : String;
   }
}
