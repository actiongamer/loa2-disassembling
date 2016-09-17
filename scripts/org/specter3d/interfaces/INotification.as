package org.specter3d.interfaces
{
   public interface INotification
   {
       
      
      function getBody() : Object;
      
      function getName() : String;
      
      function getType() : String;
      
      function setBody(param1:Object) : void;
      
      function setType(param1:String) : void;
      
      function toString() : String;
   }
}
