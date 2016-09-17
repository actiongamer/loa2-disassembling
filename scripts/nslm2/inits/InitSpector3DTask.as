package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.UIMgr;
   import flash.display.Stage3D;
   import org.specter3d.debug.DevLog;
   import org.specter3d.context.AppGlobalContext;
   import com.mz.core.configs.ClientConfig;
   import org.specter3d.display.particle.EffectManager;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import org.specter3d.display.Specter3DStage;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.loaders.AssetLib;
   import flash.events.Event;
   
   public class InitSpector3DTask extends TaskBase
   {
       
      
      public function InitSpector3DTask(param1:Object = null)
      {
         super(param1);
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:Stage3D = UIMgr.stage.stage3Ds[0];
         _loc1_.addEventListener("context3DCreate",contextCreated);
         DevLog.version = 1.1;
         DevLog.developers = "all_log";
         AppGlobalContext.initEngine(UIMgr.stage,UIMgr.spriteFor3D,initApp,ClientConfig.frameRate,false);
      }
      
      private function initApp() : void
      {
         EffectManager.init(AvatarBody3D);
         AppGlobalContext.initStage3d(new Specter3DStage());
         AppGlobalContext.stage3d.debugStats = EnvConfig.ins.showGPUStatus || LocalData.insCurPlayer.load("showStatue3d",false);
         AppGlobalContext.stage3d.debugAxesVisible = false;
         AppGlobalContext.stage3d.view3d.antiAlias = SettingModel.ins.antiAlias == 0?2:0;
         UIMgr.root3D = new ObjectContainer3D();
         AppGlobalContext.stage3d.addChild(UIMgr.root3D);
         if(!AssetLib.relativePath)
         {
            throw new Error("必须提前设置好AssetLib.relativePath");
         }
         this.onComplete();
      }
      
      private function contextCreated(param1:Event) : void
      {
         param1.target.removeEventListener("context3DCreate",contextCreated);
         ClientConfig._driverInfo = Stage3D(param1.target).context3D.driverInfo;
      }
   }
}
