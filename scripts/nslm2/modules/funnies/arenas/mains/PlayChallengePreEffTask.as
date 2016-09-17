package nslm2.modules.funnies.arenas.mains
{
   import com.mz.core.utils2.task.TaskBase;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.footstones.userBlocks.UserBlockUtil;
   import flash.geom.Point;
   
   public class PlayChallengePreEffTask extends TaskBase
   {
       
      
      private var layer3D:nslm2.modules.funnies.arenas.mains.ArenaScene3D;
      
      private var challengePlayeId:UInt64;
      
      public function PlayChallengePreEffTask(param1:nslm2.modules.funnies.arenas.mains.ArenaScene3D, param2:UInt64)
      {
         this.layer3D = param1;
         this.challengePlayeId = param2;
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         UserBlockUtil.switchBlock(true,"ArenaPlayerChallengePreEff");
         var _loc2_:ArenaUnit3D = this.layer3D.findUnit3D(this.challengePlayeId);
         var _loc1_:Point = _loc2_.pos2d;
         this.jumpEnd(_loc1_);
      }
      
      private function jumpEnd(param1:Point) : void
      {
         layer3D.player3D.moveSpeed = 450;
         layer3D.player3D.runTo(param1.x,param1.y,runCpl);
      }
      
      private function runCpl() : void
      {
         UserBlockUtil.switchBlock(false,"ArenaPlayerChallengePreEff");
         this.onComplete();
      }
   }
}
