package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import org.specter3d.display.Specter3D;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class Avatar3DAutoRotationYCtrl implements IDispose
   {
       
      
      private var o3d:Specter3D;
      
      public var isPlaying:Boolean = true;
      
      public function Avatar3DAutoRotationYCtrl(param1:Specter3D)
      {
         super();
         o3d = param1;
         TimerManager.ins.doFrameLoop(1,onLoop);
      }
      
      private function onLoop(param1:TimerHandlerVo) : void
      {
         if(isPlaying == false)
         {
            return;
         }
         o3d.rotationY = o3d.rotationY + 0.5;
         if(o3d.rotationY > 360)
         {
            o3d.rotationY = o3d.rotationY - 360;
            o3d.rotationY = o3d.rotationY - 360;
         }
      }
      
      public function dispose() : void
      {
         TimerManager.ins.clearTimer(onLoop);
         o3d = null;
      }
      
      public function pause() : void
      {
         isPlaying = false;
      }
      
      public function resume() : void
      {
         isPlaying = true;
      }
   }
}
