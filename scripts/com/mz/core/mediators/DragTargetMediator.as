package com.mz.core.mediators
{
   import flash.events.Event;
   import flash.display.InteractiveObject;
   import flash.display.DisplayObjectContainer;
   
   public class DragTargetMediator extends DragMediator
   {
       
      
      public function DragTargetMediator(param1:InteractiveObject, param2:DisplayObjectContainer)
      {
         super(param1,param2);
         this.addEventListener("valueChange",onValueChange);
      }
      
      private function onValueChange(param1:Event) : void
      {
         target.x = target.x + this.changeX;
         target.y = target.y + this.changeY;
      }
   }
}
