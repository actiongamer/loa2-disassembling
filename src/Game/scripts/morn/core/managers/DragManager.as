package morn.core.managers
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.events.MouseEvent;
   import morn.core.events.DragEvent;
   import com.mz.core.configs.EnvConfig;
   import flash.events.Event;
   
   public class DragManager
   {
       
      
      private var _dragInitiator:DisplayObject;
      
      private var _dragImage:Sprite;
      
      private var _data;
      
      public function DragManager()
      {
         super();
      }
      
      public function doDrag(param1:Sprite, param2:Sprite = null, param3:* = null, param4:Point = null) : void
      {
         var _loc5_:* = null;
         _dragInitiator = param1;
         _dragImage = !!param2?param2:param1;
         _data = param3;
         if(_dragImage != _dragInitiator)
         {
            if(!_dragImage.parent)
            {
               App.stage.addChild(_dragImage);
            }
            param4 = param4 || new Point();
            _loc5_ = _dragImage.globalToLocal(new Point(App.stage.mouseX,App.stage.mouseY));
            _dragImage.x = _loc5_.x - param4.x;
            _dragImage.y = _loc5_.y - param4.y;
            _dragImage.visible = false;
         }
         App.stage.addEventListener("mouseMove",onStageMouseMove);
         App.stage.addEventListener("mouseUp",onStageMouseUp);
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         if(!_dragImage.visible)
         {
            _dragImage.visible = true;
            _dragImage.startDrag();
            _dragInitiator.dispatchEvent(new DragEvent("dragStart",_dragInitiator,_data));
         }
         if(param1.stageX <= 0 || param1.stageX >= App.stage.stageWidth || param1.stageY <= 0 || param1.stageY >= App.stage.stageHeight - EnvConfig.ins.shellY)
         {
            _dragImage.stopDrag();
         }
         else
         {
            _dragImage.startDrag();
         }
      }
      
      private function onStageMouseUp(param1:Event) : void
      {
         App.stage.removeEventListener("mouseMove",onStageMouseMove);
         App.stage.removeEventListener("mouseUp",onStageMouseUp);
         _dragImage.stopDrag();
         var _loc2_:DisplayObject = getDropTarget(_dragImage.dropTarget);
         if(_loc2_)
         {
            _loc2_.dispatchEvent(new DragEvent("dragDrop",_dragInitiator,_data));
         }
         _dragInitiator.dispatchEvent(new DragEvent("dragComplete",_dragInitiator,_data));
         if(_dragInitiator != _dragImage && _dragImage.parent)
         {
            _dragImage.parent.removeChild(_dragImage);
         }
         _dragInitiator = null;
         _data = null;
         _dragImage = null;
      }
      
      private function getDropTarget(param1:DisplayObject) : DisplayObject
      {
         while(param1)
         {
            if(param1.hasEventListener("dragDrop"))
            {
               return param1;
            }
            param1 = param1.parent;
         }
         return null;
      }
   }
}
