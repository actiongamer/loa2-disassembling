package nslm2.common.ui.components.comp3ds.ctrls
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   import org.specter3d.display.Specter3D;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.MouseEvent;
   import nslm2.utils.TransformUtil;
   
   public class WeaponDragCtrl extends EventDispatcher implements IDispose
   {
      
      public static const DRAG_END:String = "dragEnd";
       
      
      public var target:Specter3D;
      
      private var lastPoiX:int;
      
      public function WeaponDragCtrl(param1:Specter3D)
      {
         super();
         bind(param1);
      }
      
      public function bind(param1:Specter3D) : void
      {
         disposeAvatar();
         this.target = param1;
      }
      
      public function dragStart(param1:Event = null) : void
      {
         lastPoiX = UIMgr.stage.mouseX;
         UIMgr.stage.addEventListener("mouseUp",stage_mouseUp);
         UIMgr.stage.addEventListener("mouseMove",stage_mouseMove);
      }
      
      private function stage_mouseUp(param1:MouseEvent = null, param2:Boolean = true) : void
      {
         UIMgr.stage.removeEventListener("mouseUp",stage_mouseUp);
         UIMgr.stage.removeEventListener("mouseMove",stage_mouseMove);
         if(param2)
         {
            this.dispatchEvent(new Event("dragEnd"));
         }
      }
      
      private function stage_mouseMove(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.buttonDown)
         {
            _loc2_ = TransformUtil.ro3Dto2D(target.rotationY);
            target.setRotation(_loc2_ + (UIMgr.stage.mouseX - lastPoiX),false);
            lastPoiX = UIMgr.stage.mouseX;
         }
         else
         {
            stage_mouseUp();
         }
      }
      
      private function disposeAvatar() : void
      {
         if(target != null)
         {
            target = null;
         }
      }
      
      public function dispose() : void
      {
         disposeAvatar();
         stage_mouseUp(null,false);
      }
   }
}
