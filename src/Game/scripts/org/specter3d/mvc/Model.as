package org.specter3d.mvc
{
   import flash.events.EventDispatcher;
   import org.specter3d.interfaces.IModel;
   import flash.events.Event;
   import org.specter3d.events.ModelEvent;
   import flash.events.IEventDispatcher;
   
   public class Model extends EventDispatcher implements IModel
   {
       
      
      public function Model(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function addCommandListener(param1:*, param2:Class, param3:Model = null) : void
      {
         (Facade.instance as Facade).registerCommand(param1,param2,param3);
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         if(!(param1 is ModelEvent))
         {
            throw Error("event type must be ModelEvent!");
         }
         if(hasEventListener(param1.type))
         {
            return super.dispatchEvent(param1);
         }
         return false;
      }
   }
}
