package nslm2.common.ui.components.comp3ds.ctrls
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import morn.core.managers.timerMgrs.TimerManager;
   import away3d.events.AnimatorEvent;
   import org.specter3d.enum.AnimationEnum;
   
   public class Avatar3DAutoRandomActionCtrl implements IDispose
   {
       
      
      private var unit3D:Unit3DBase;
      
      public var actionList:Array;
      
      public function Avatar3DAutoRandomActionCtrl(param1:Unit3DBase = null, param2:Array = null)
      {
         actionList = ["std_3","win"];
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
         unit3D.addEventListener("animator_complete",onAnimatorComplete);
         TimerManager.ins.doLoop(8000,onLoop);
      }
      
      private function onAnimatorComplete(param1:AnimatorEvent = null) : void
      {
         var _loc2_:int = actionList.indexOf(this.unit3D.action);
         _loc2_++;
         if(_loc2_ >= actionList.length)
         {
            _loc2_ = 0;
         }
         unit3D.action = actionList[_loc2_];
      }
      
      private function onLoop() : void
      {
         if(AnimationEnum.getLoop(this.unit3D.action))
         {
            onAnimatorComplete();
         }
      }
      
      private function disposeAvatar() : void
      {
         if(unit3D != null)
         {
            unit3D.removeEventListener("animator_complete",onAnimatorComplete);
            unit3D = null;
         }
      }
      
      public function dispose() : void
      {
         disposeAvatar();
         TimerManager.ins.clearTimer(onLoop);
      }
   }
}
