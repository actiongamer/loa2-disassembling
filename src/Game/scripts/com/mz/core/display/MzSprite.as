package com.mz.core.display
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IDispose;
   import com.mz.core.mgrs.RDragDropMgr;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import com.mz.core.logging.Log;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.event.MzEvent;
   
   public class MzSprite extends Sprite implements IDispose
   {
       
      
      protected var dragTypeList:Array;
      
      private var _isReceiveDrag:Boolean = false;
      
      private var _eventDic:Dictionary;
      
      public var isDisposed:Boolean = false;
      
      public function MzSprite(param1:Boolean = false)
      {
         dragTypeList = [];
         _eventDic = new Dictionary(true);
         super();
         mouseEvent = param1;
      }
      
      public function setReceiveDrag(param1:Boolean, param2:Array) : void
      {
         _isReceiveDrag = param1;
         this.dragTypeList = param2;
         RDragDropMgr.getInstance.removeEventListener("drag_manager_stop_event",onDragManagerStopHandler);
         if(_isReceiveDrag)
         {
            RDragDropMgr.getInstance.addEventListener("drag_manager_stop_event",onDragManagerStopHandler);
         }
      }
      
      protected function onDragManagerStopHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(dragTypeList == null || dragTypeList.length == 0)
         {
            return;
         }
         if(this.parent == null)
         {
            return;
         }
         if(this.visible == false)
         {
            return;
         }
         if(this.parent.visible == false)
         {
            return;
         }
         if(this.mouseX > 0 && this.mouseX < this.width && this.mouseY > 0 && this.mouseY < this.height)
         {
            _loc2_ = RDragDropMgr.getInstance.dragType;
            _loc3_ = 0;
            while(_loc3_ < dragTypeList.length)
            {
               if(dragTypeList[_loc3_] == _loc2_ && checkReceiveData(_loc2_))
               {
                  receivedDragData(_loc2_,RDragDropMgr.getInstance.dragData);
                  RDragDropMgr.getInstance.isReceive = true;
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      protected function checkReceiveData(param1:String) : Boolean
      {
         return true;
      }
      
      protected function receivedDragData(param1:String, param2:Object) : void
      {
      }
      
      override public function set x(param1:Number) : void
      {
         .super.x = param1 >> 0;
      }
      
      override public function set y(param1:Number) : void
      {
         .super.y = param1 >> 0;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(this.isDisposed)
         {
            Log.warn(this,"已销毁,无法加帧听 ");
            return;
         }
         super.addEventListener(param1,param2,param3,param4,param5);
         var _loc6_:Array = _eventDic[param2];
         if(_loc6_ == null)
         {
            var _loc7_:* = [];
            _eventDic[param2] = _loc7_;
            _loc6_ = _loc7_;
            _loc6_.push(param1);
         }
         else if(_loc6_.indexOf(param1) == -1)
         {
            _loc6_.push(param1);
         }
      }
      
      public function set mouseEvent(param1:Boolean) : void
      {
         this.mouseChildren = param1;
         this.mouseEnabled = param1;
      }
      
      public function get mouseEvent() : Boolean
      {
         return mouseEnabled;
      }
      
      public function set scale(param1:Number) : void
      {
         if(scaleX != param1)
         {
            scaleX = param1;
         }
         if(scaleY != param1)
         {
            scaleY = param1;
         }
      }
      
      public function get scale() : Number
      {
         return scaleX;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         if(this.isDisposed)
         {
            Log.debug(this,"dispose()不应该执行两次");
            return;
         }
         isDisposed = true;
         RDragDropMgr.getInstance.removeEventListener("drag_manager_stop_event",onDragManagerStopHandler);
         DisplayUtils.disposeChildren(this);
         DisplayUtils.removeSelf(this);
         dragTypeList = null;
         hasEventListener("dispose") && this.dispatchEvent(new MzEvent("dispose"));
         var _loc7_:int = 0;
         var _loc6_:* = _eventDic;
         for(var _loc2_ in _eventDic)
         {
            _loc1_ = _eventDic[_loc2_];
            var _loc5_:int = 0;
            var _loc4_:* = _loc1_;
            for each(_loc3_ in _loc1_)
            {
               removeEventListener(_loc3_,_loc2_,true);
               removeEventListener(_loc3_,_loc2_,false);
            }
         }
         _eventDic = null;
      }
   }
}
