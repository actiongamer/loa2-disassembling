package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.nets.sockets.ServerConsts;
   
   public class InitServerConfigTask extends TaskBase
   {
       
      
      public function InitServerConfigTask()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ServerConsts.ins.init();
         this.onComplete();
      }
   }
}
