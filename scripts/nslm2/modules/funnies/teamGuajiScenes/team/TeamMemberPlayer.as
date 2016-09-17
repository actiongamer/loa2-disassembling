package nslm2.modules.funnies.teamGuajiScenes.team
{
   import flash.events.EventDispatcher;
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import nslm2.modules.funnies.teamGuajiScenes.ctrl.TeamFollowerCtr;
   import com.greensock.TweenLite;
   
   public class TeamMemberPlayer extends EventDispatcher
   {
      
      public static const FOLLOW_ME:String = "follow_me";
      
      public static const STOP_NOEW:String = "stop_noew";
       
      
      private var isRun:Boolean;
      
      private var runTargetPoint:Array;
      
      private var _leader:nslm2.modules.funnies.teamGuajiScenes.team.TeamMemberPlayer;
      
      private var _player:SceneUnit3D;
      
      private var runCompleteHandler:Function;
      
      public function TeamMemberPlayer(param1:SceneUnit3D)
      {
         runTargetPoint = [];
         super();
         _player = param1;
      }
      
      public function stop(param1:Event = null) : void
      {
         player.stopRun();
         isRun = false;
         dispatchEvent(new MzEvent("stop_noew"));
      }
      
      public function get player() : SceneUnit3D
      {
         return _player;
      }
      
      public function run(param1:int, param2:int, param3:Function = null) : void
      {
         var _loc6_:* = null;
         var _loc5_:Number = NaN;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:Number = NaN;
         runCompleteHandler = param3;
         isRun = true;
         if(_player)
         {
            _loc6_ = _player.runTo(param1,param2,runCpl);
            _loc5_ = -MathUtil.roWith2Point(_player.pos2d,new Point(param1,param2)) * 3.14159265358979 / 180;
            _loc7_ = param1 - TeamFollowerCtr.TEAM_MEMBER_GAP * Math.cos(_loc5_);
            _loc4_ = param2 + TeamFollowerCtr.TEAM_MEMBER_GAP * Math.sin(_loc5_);
            if(_loc6_ && _loc6_.length > 1)
            {
               _loc8_ = MathUtil.random(0.8,0.4);
               TweenLite.delayedCall(0.2,notifyFollower,[[this._player.pos2d,new Point(_loc7_,_loc4_)]]);
            }
         }
      }
      
      private function notifyFollower(param1:Array) : void
      {
         dispatchEvent(new MzEvent("follow_me",param1));
      }
      
      private function runCpl() : void
      {
         var _loc1_:* = null;
         if(runTargetPoint.length > 0)
         {
            _loc1_ = runTargetPoint.shift();
            run(_loc1_.x,_loc1_.y);
         }
         else
         {
            isRun = false;
            if(this.leader)
            {
               this.player.rotation = leader.player.rotation;
            }
            if(runCompleteHandler != null)
            {
               runCompleteHandler();
            }
         }
      }
      
      public function set leader(param1:nslm2.modules.funnies.teamGuajiScenes.team.TeamMemberPlayer) : void
      {
         if(_leader)
         {
            _leader.removeEventListener("follow_me",follow);
            _leader.removeEventListener("stop_noew",stop);
         }
         _leader = param1;
         _leader.addEventListener("follow_me",follow);
         _leader.addEventListener("stop_noew",stop);
      }
      
      public function get leader() : nslm2.modules.funnies.teamGuajiScenes.team.TeamMemberPlayer
      {
         return _leader;
      }
      
      protected function follow(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         if(isRun)
         {
            runTargetPoint.pop();
            runTargetPoint.push(param1.data[0]);
            runTargetPoint.push(param1.data[1]);
         }
         else
         {
            runTargetPoint = [];
            runTargetPoint.push(param1.data[0]);
            runTargetPoint.push(param1.data[1]);
            _loc2_ = runTargetPoint.shift();
            run(_loc2_.x,_loc2_.y);
         }
      }
      
      public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(notifyFollower);
         if(_leader)
         {
            _leader.removeEventListener("follow_me",follow);
            _leader.removeEventListener("stop_noew",stop);
            _leader = null;
         }
         runTargetPoint = [];
      }
   }
}
