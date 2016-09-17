package nslm2.modules.dungeons.s3ds
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.dungeons.DungeonSceneModule;
   import nslm2.modules.fightPlayer.UnitView;
   
   public class BossSceneCtrlBase extends TaskBase
   {
       
      
      public var dg:DungeonSceneModule;
      
      public var bossView:UnitView;
      
      public function BossSceneCtrlBase(param1:DungeonSceneModule, param2:UnitView)
      {
         super();
         this.dg = param1;
         this.bossView = param2;
      }
   }
}
