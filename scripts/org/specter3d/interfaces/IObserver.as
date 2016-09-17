package org.specter3d.interfaces
{
   public interface IObserver
   {
       
      
      function setNotifyMethod(param1:Function) : void;
      
      function setNotifyContext(param1:Object) : void;
      
      function notifyObserver(param1:INotification) : void;
   }
}
