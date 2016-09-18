package nslm2.modules.funnies.teamGuajiScenes.ctrl
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.funnies.teamGuajiScenes.team.TeamMemberPlayer;
   import com.mz.core.utils.MathUtil;
   
   public class TeamFollowerCtr implements IDispose
   {
      
      public static var TEAM_MEMBER_GAP:int = 260;
       
      
      private var teamArr:Array;
      
      public function TeamFollowerCtr()
      {
         super();
         teamArr = [];
      }
      
      public function removeMember(param1:TeamMemberPlayer) : void
      {
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = teamArr.length;
         _loc5_ = _loc4_ - 1;
         while(_loc5_ >= 0)
         {
            _loc2_ = teamArr[_loc5_];
            if(_loc2_ == param1)
            {
               if(_loc5_ != _loc4_ - 1)
               {
                  _loc3_ = teamArr[_loc5_ + 1];
                  if(_loc3_)
                  {
                     _loc3_.leader = _loc2_.leader;
                  }
               }
               teamArr.splice(_loc5_,1);
            }
            _loc5_--;
         }
      }
      
      public function addMember(param1:TeamMemberPlayer) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         if(teamArr.length > 0)
         {
            _loc3_ = teamArr[teamArr.length - 1];
            if(_loc3_)
            {
               param1.leader = _loc3_;
               _loc2_ = MathUtil.angelToRadian(_loc3_.player.rotation);
               param1.player.rotation = param1.leader.player.rotation;
               param1.player.pos2d = MathUtil.getNearByPoint3D(_loc3_.player.pos2d,TEAM_MEMBER_GAP,_loc2_);
            }
         }
         teamArr.push(param1);
      }
      
      public function dispose() : void
      {
         teamArr.length = 0;
         teamArr = null;
      }
   }
}
