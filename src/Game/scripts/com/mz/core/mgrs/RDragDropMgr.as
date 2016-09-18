package com.mz.core.mgrs
{
   import flash.events.EventDispatcher;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   
   public class RDragDropMgr extends EventDispatcher
   {
      
      public static const DRAG_MANAGER_STOP_EVENT:String = "drag_manager_stop_event";
      
      public static const DRAG_MANAGER_START_EVENT:String = "drag_manager_START_event";
      
      private static var _instance:com.mz.core.mgrs.RDragDropMgr;
       
      
      private var _startX:int;
      
      private var _startY:int;
      
      private var _bitmapData:BitmapData;
      
      private var _dx:int;
      
      private var _dy:int;
      
      private var _type:String;
      
      private var _data:Object;
      
      public var upEventTarget:Object;
      
      private var _bitmap:Bitmap;
      
      public var isReceive:Boolean = false;
      
      public function RDragDropMgr()
      {
         super();
      }
      
      public static function get getInstance() : com.mz.core.mgrs.RDragDropMgr
      {
         if(!_instance)
         {
            _instance = new com.mz.core.mgrs.RDragDropMgr();
         }
         return _instance;
      }
      
      public function start(param1:BitmapData, param2:String, param3:Object, param4:int = 0, param5:int = 0) : void
      {
         if(_bitmap)
         {
            return;
            §§push(trace("当前已有在拖动的对像"));
         }
         else
         {
            _startX = UIMgr.ins.getDragLayer().mouseX - param4;
            _startY = UIMgr.ins.getDragLayer().mouseY - param5;
            _bitmapData = param1;
            _dx = param4;
            _dy = param5;
            _type = param2;
            _data = param3;
            isReceive = false;
            _bitmap = new Bitmap(_bitmapData);
            _bitmap.x = UIMgr.ins.getDragLayer().mouseX - _dx;
            _bitmap.y = UIMgr.ins.getDragLayer().mouseY - _dy;
            _bitmap.alpha = 0.7;
            UIMgr.ins.getDragLayer().addChild(_bitmap);
            UIMgr.stage.addEventListener("mouseUp",onMouseUpHandler);
            UIMgr.stage.addEventListener("mouseMove",onMouseMoveHandler);
            this.dispatchEvent(new Event("drag_manager_START_event"));
            return;
         }
      }
      
      private function onMouseUpHandler(param1:MouseEvent) : void
      {
         upEventTarget = param1.target;
         UIMgr.stage.removeEventListener("mouseUp",onMouseUpHandler);
         UIMgr.stage.removeEventListener("mouseMove",onMouseMoveHandler);
         this.dispatchEvent(new Event("drag_manager_stop_event"));
         if(isReceive)
         {
            clear();
         }
         else
         {
            TweenLite.to(_bitmap,0.3,{
               "x":_startX,
               "y":_startY,
               "alpha":0.1,
               "scaleX":1,
               "scaleY":1,
               "onComplete":clear
            });
         }
      }
      
      private function onMouseMoveHandler(param1:MouseEvent) : void
      {
         _bitmap.x = UIMgr.ins.getDragLayer().mouseX - _dx;
         _bitmap.y = UIMgr.ins.getDragLayer().mouseY - _dy;
      }
      
      private function clear() : void
      {
         if(_bitmap)
         {
            _bitmap.bitmapData.dispose();
            _bitmap.parent.removeChild(_bitmap);
         }
         _bitmap = null;
         _bitmapData = null;
         _data = null;
         _type = null;
         isReceive = false;
      }
      
      public function get dragType() : String
      {
         return _type;
      }
      
      public function get dragData() : Object
      {
         return _data;
      }
      
      public function set dragType(param1:String) : void
      {
         _type = param1;
      }
      
      public function switchDragListen(param1:IDragDropSource, param2:Boolean) : void
      {
         if(param2)
         {
            param1.addEventListener("mouseDown",dragDropSource_mouseDown);
         }
         else
         {
            param1.removeEventListener("mouseDown",dragDropSource_mouseDown);
            param1.removeEventListener("mouseMove",dragDropSource_mouseMove);
            param1.removeEventListener("mouseUp",dragDropSource_mouseUp);
         }
      }
      
      private function dragDropSource_mouseDown(param1:MouseEvent) : void
      {
         var _loc2_:IDragDropSource = param1.currentTarget as IDragDropSource;
         _loc2_.addEventListener("mouseMove",dragDropSource_mouseMove);
         _loc2_.addEventListener("mouseUp",dragDropSource_mouseUp);
      }
      
      private function dragDropSource_mouseMove(param1:MouseEvent) : void
      {
         var _loc2_:IDragDropSource = param1.currentTarget as IDragDropSource;
         _loc2_.removeEventListener("mouseMove",dragDropSource_mouseMove);
         _loc2_.removeEventListener("mouseUp",dragDropSource_mouseUp);
         _loc2_.onDragStart();
      }
      
      private function dragDropSource_mouseUp(param1:MouseEvent) : void
      {
         var _loc2_:IDragDropSource = param1.currentTarget as IDragDropSource;
         _loc2_.removeEventListener("mouseMove",dragDropSource_mouseMove);
         _loc2_.removeEventListener("mouseUp",dragDropSource_mouseUp);
      }
   }
}
