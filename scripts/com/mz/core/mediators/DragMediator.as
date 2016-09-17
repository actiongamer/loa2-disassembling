package com.mz.core.mediators
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   import flash.display.InteractiveObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   
   public class DragMediator extends EventDispatcher implements IDispose
   {
       
      
      public var target:InteractiveObject;
      
      public var root:DisplayObjectContainer;
      
      public var useAlt:Boolean;
      
      public var oriMouseX:Number;
      
      public var oriMouseY:Number;
      
      private var _lastMouseX:Number;
      
      public var lastMouseY:Number;
      
      public var thisMouseX:Number;
      
      public var thisMouseY:Number;
      
      public function DragMediator(param1:InteractiveObject, param2:DisplayObjectContainer)
      {
         super();
         target = param1;
         if(param2 == null)
         {
            root = target.stage;
         }
         else
         {
            root = param2;
         }
         if(root == null)
         {
            throw new Error("root cannot be null");
         }
         target.addEventListener("mouseDown",onMouseDown);
      }
      
      public function get lastMouseX() : Number
      {
         return _lastMouseX;
      }
      
      public function set lastMouseX(param1:Number) : void
      {
         _lastMouseX = param1;
         if(isNaN(param1))
         {
            throw new Error("");
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(useAlt == true && param1.altKey == false)
         {
            return;
         }
         oriMouseX = param1.stageX;
         oriMouseY = param1.stageY;
         root.addEventListener("mouseMove",onMouseMove);
         root.addEventListener("mouseUp",onMouseUp);
         thisMouseX = param1.stageX;
         thisMouseY = param1.stageY;
         lastMouseX = thisMouseX;
         lastMouseY = thisMouseY;
         this.dispatchEvent(new Event("start"));
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(param1.buttonDown)
         {
            thisMouseX = param1.stageX;
            thisMouseY = param1.stageY;
            this.dispatchEvent(new MzEvent("valueChange",param1));
            this.dispatchEvent(new MzEvent("update",param1));
            lastMouseX = thisMouseX;
            lastMouseY = thisMouseY;
         }
         else
         {
            this.onMouseUp();
         }
      }
      
      public function get changeX() : Number
      {
         return this.thisMouseX - this.lastMouseX;
      }
      
      public function get changeY() : Number
      {
         return this.thisMouseY - this.lastMouseY;
      }
      
      private function onMouseUp(param1:MouseEvent = null) : void
      {
         root.removeEventListener("mouseMove",onMouseMove);
         root.removeEventListener("mouseUp",onMouseUp);
      }
      
      public function dispose() : void
      {
         if(target)
         {
            target.removeEventListener("mouseDown",onMouseDown);
            target = null;
         }
         if(root)
         {
            root.removeEventListener("mouseMove",onMouseMove);
            root.removeEventListener("mouseUp",onMouseUp);
            root = null;
         }
      }
   }
}
