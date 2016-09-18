package com.mz.core.mediators
{
   import com.mz.core.interFace.IDispose;
   import flash.display.InteractiveObject;
   import flash.events.MouseEvent;
   import morn.core.handlers.Handler;
   
   public class RollMediator implements IDispose
   {
       
      
      protected var ui:InteractiveObject;
      
      private var handler;
      
      private var _actived:Boolean = true;
      
      public var isDispose:Boolean;
      
      public function RollMediator(param1:InteractiveObject, param2:*)
      {
         super();
         ui = param1;
         this.handler = param2;
         param1.addEventListener("rollOver",onRollOver);
         param1.addEventListener("rollOut",onRollOut);
      }
      
      public function get actived() : Boolean
      {
         return _actived;
      }
      
      public function set actived(param1:Boolean) : void
      {
         if(_actived != param1)
         {
            _actived = param1;
         }
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         if(_actived == false)
         {
            return;
         }
         if(handler != null)
         {
            Handler.execute(handler,[true]);
         }
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         if(_actived == false)
         {
            return;
         }
         if(handler != null)
         {
            Handler.execute(handler,[false]);
         }
      }
      
      public function dispose() : void
      {
         isDispose = true;
         ui.removeEventListener("rollOver",onRollOver);
         ui.removeEventListener("rollOut",onRollOut);
         ui = null;
      }
   }
}
