package nslm2.modules.footstones.newerAlertModules.tasks
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.roleInfos.RoleInfoModel;
   
   public class NewerAlertToTupo extends TaskBase
   {
       
      
      public function NewerAlertToTupo(param1:Object = null)
      {
         super(param1);
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         var _loc2_:HeroInfo = NewerAlertModel.ins.getCanTupoHero();
         if(_loc2_)
         {
            _loc1_ = new RoleInfoModuleParam();
            _loc1_.init(_loc2_,30110);
            NewerAlertModel.ins.addNewerGuideIdByFunId(30110);
            RoleInfoModel.ins.showRoleInfoModule(30110,_loc2_);
         }
         this.onComplete();
      }
   }
}
