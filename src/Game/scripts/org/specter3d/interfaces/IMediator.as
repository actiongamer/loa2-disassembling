package org.specter3d.interfaces
{
   public interface IMediator
   {
       
      
      function onRegister() : void;
      
      function onRemove() : void;
      
      function addNotifierListener(param1:String, param2:Function) : void;
      
      function removeNotifierListener(param1:String) : void;
      
      function getMediatorName() : String;
      
      function startup() : void;
   }
}
