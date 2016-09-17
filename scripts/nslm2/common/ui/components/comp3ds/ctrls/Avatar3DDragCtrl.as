package nslm2.common.ui.components.comp3ds.ctrls
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.MouseEvent;
   
   public class Avatar3DDragCtrl implements IDispose
   {
       
      
      private var unit3D:Unit3DBase;
      
      private var lastPoiX:int;
      
      public function Avatar3DDragCtrl(param1:Unit3DBase = null)
      {
         super();
         if(param1)
         {
            bind(param1);
         }
      }
      
      public function bind(param1:Unit3DBase) : void
      {
         disposeAvatar();
         this.unit3D = param1;
         unit3D.addEventListener("unitMouseTrigger",unitTrigger);
      }
      
      private function unitTrigger(param1:Event) : void
      {
         lastPoiX = UIMgr.stage.mouseX;
         UIMgr.stage.addEventListener("mouseUp",stage_mouseUp);
         UIMgr.stage.addEventListener("mouseMove",stage_mouseMove);
      }
      
      private function stage_mouseUp(param1:MouseEvent = null) : void
      {
         UIMgr.stage.removeEventListener("mouseUp",stage_mouseUp);
         UIMgr.stage.removeEventListener("mouseMove",stage_mouseMove);
      }
      
      private function stage_mouseMove(param1:MouseEvent) : void
      {
         if(param1.buttonDown)
         {
            unit3D.setRotation(unit3D.rotation + (UIMgr.stage.mouseX - lastPoiX),false);
            lastPoiX = UIMgr.stage.mouseX;
         }
         else
         {
            stage_mouseUp();
         }
      }
      
      private function disposeAvatar() : void
      {
         if(unit3D != null)
         {
            unit3D.removeEventListener("unitMouseTrigger",unitTrigger);
            unit3D = null;
         }
      }
      
      public function dispose() : void
      {
         disposeAvatar();
         stage_mouseUp();
      }
   }
}
