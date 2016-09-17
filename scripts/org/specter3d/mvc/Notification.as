package org.specter3d.mvc
{
   import org.specter3d.interfaces.INotification;
   
   public class Notification implements INotification
   {
       
      
      private var body:Object;
      
      private var name:String;
      
      private var type:String;
      
      public function Notification(param1:String, param2:Object = null, param3:String = null)
      {
         super();
         this.name = param1;
         this.body = param2;
         this.type = param3;
      }
      
      public function getBody() : Object
      {
         return body;
      }
      
      public function getName() : String
      {
         return name;
      }
      
      public function getType() : String
      {
         return type;
      }
      
      public function setBody(param1:Object) : void
      {
         this.body = param1;
      }
      
      public function setType(param1:String) : void
      {
         this.type = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "Notification Name: " + getName();
         _loc1_ = _loc1_ + ("\nBody:" + (body == null?"null":body.toString()));
         _loc1_ = _loc1_ + ("\nType:" + (type == null?"null":type));
         return _loc1_;
      }
   }
}
