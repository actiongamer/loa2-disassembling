package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.configs.EnvConfig;
   import nslm2.nets.sockets.ServerEngine;
   
   public class InitServerEngineTaskFirstBattle extends TaskBase
   {
       
      
      public function InitServerEngineTaskFirstBattle(param1:Object = null)
      {
         super(param1);
      }
      
      override public function exec() : void
      {
         super.exec();
         if(EnvConfig.ins.useServer)
         {
            ServerEngine.ins.init();
            onComplete();
         }
      }
   }
}
