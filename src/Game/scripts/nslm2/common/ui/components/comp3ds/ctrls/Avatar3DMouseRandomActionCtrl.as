package nslm2.common.ui.components.comp3ds.ctrls
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.events.Event;
   
   public class Avatar3DMouseRandomActionCtrl implements IDispose
   {
       
      
      private var unit3D:Unit3DBase;
      
      public var actionList:Array;
      
      public function Avatar3DMouseRandomActionCtrl(param1:Unit3DBase = null, param2:Array = null)
      {
         actionList = ["win"];
         super();
         if(param2)
         {
            actionList = param2;
         }
         if(param1)
         {
            bind(param1);
         }
      }
      
      public function bind(param1:Unit3DBase) : void
      {
         disposeAvatar();
         this.unit3D = param1;
         this.unit3D.addEventListener("unitMouseClick",unitMouseTriggerHandler);
      }
      
      public function unitMouseTriggerHandler(param1:Event) : void
      {
      }
      
      private function disposeAvatar() : void
      {
         if(unit3D != null)
         {
            unit3D.removeEventListener("unitMouseClick",unitMouseTriggerHandler);
            unit3D = null;
         }
      }
      
      public function dispose() : void
      {
         disposeAvatar();
      }
   }
}
