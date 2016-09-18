package nslm2.modules.funnies.teamPKCS
{
   import flash.geom.Point;
   import proto.CTeamMemberInfo;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   
   public class TPKConst
   {
      
      public static const fighter_num:int = 5;
      
      public static const TPKC_MINI_LEVEL:int = 50;
      
      public static const stage_invite:int = 0;
      
      public static const stage_pre:int = 1;
      
      public static const stage_final:int = 2;
      
      public static const JUMP_PAGE:int = 5;
      
      public static const NUM_PER_PAGE:int = 5;
      
      public static const rank_type_pre:int = 0;
      
      public static const rank_type_final:int = 1;
      
      public static const sign_up_not:int = 1;
      
      public static const sign_up_success:int = 2;
      
      public static const invate_state_no:int = 0;
      
      public static const invate_state_signup:int = 1;
      
      public static const invate_state_no_signup:int = 2;
      
      public static const invate_state_signup_fail:int = 3;
      
      public static const final_pos_base:Point = new Point(-547,-81);
      
      public static const bet_num:int = 100;
      
      public static const OPT_TPKC_CHANGE_ORDER_CLOSE:String = "OPT_TPKC_CHANGE_ORDER_CLOSE";
      
      public static const OPT_TPKC_OPEN_REPORT:String = "OPT_TPKC_OPEN_REPORT";
      
      public static const OPT_TPKC_OPEN_RANK_REWARD:String = "OPT_TPKC_OPEN_RANK_REWARD";
      
      public static const OPT_TPKC_GET_GAMBLE_REWARD_SUCCESS:String = "OPT_TPKC_GET_GAMBLE_REWARD_SUCCESS";
      
      public static const OPT_TPKC_NEW_EVENT_HAPPEN:String = "OPT_TPKC_NEW_EVENT_HAPPEN";
      
      public static const OPT_TPKC_SEE_TEAM_FROM_MY_BET:String = "OPT_TPKC_SEE_TEAM_FROM_MY_BET";
      
      public static const OPT_TPKC_ENTER_LAST_FINAL_VIEW:String = "OPT_TPKC_ENTER_LAST_FINAL_VIEW";
      
      public static const EVT_PRE_BATTLE_RUN_COMPLETE:String = "EVT_PRE_BATTLE_RUN_COMPLETE";
      
      public static const EVT_PRE_BATTLE_ONE_FIGHT_OVER:String = "EVT_PRE_BATTLE_ONE_FIGHT_OVER";
      
      public static const OPT_TPKC_BACK_TO_INVITEMODE:String = "OPT_TPKC_BACK_TO_INVITEMODE";
      
      public static var half0:Array = [29,25,26,17,18,19,20,1,2,3,4,5,6,7,8];
      
      public static var half1:Array = [30,27,28,21,22,23,24,9,10,11,12,13,14,15,16];
      
      public static const titARr:Array = [50800082,50800083,50800084,50800085,50800086];
       
      
      public function TPKConst()
      {
         super();
      }
      
      public static function getDistName(param1:String, param2:Number, param3:String) : String
      {
         return ["S" + param2 % 10000,param3].join(".");
      }
      
      public static function sIdToCId(param1:*) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < half0.length)
         {
            if(half0[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < half1.length)
         {
            if(half1[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return 31;
      }
      
      public static function getLeader(param1:UInt64, param2:Array) : CTeamMemberInfo
      {
         var _loc5_:int = 0;
         var _loc4_:* = param2;
         for each(var _loc3_ in param2)
         {
            if(Uint64Util.equal(_loc3_.info.id,param1))
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function indexToPhase(param1:int) : int
      {
         if(param1 == 31)
         {
            return 4;
         }
         if(param1 <= 14 && param1 >= 7)
         {
            return 0;
         }
         if(param1 <= 6 && param1 >= 3)
         {
            return 1;
         }
         if(param1 <= 2 && param1 >= 1)
         {
            return 2;
         }
         return 3;
      }
      
      public static function setOrder(param1:Array, param2:Array) : Array
      {
         member = param1;
         order = param2;
         getMember = function(param1:UInt64):CTeamMemberInfo
         {
            var _loc2_:int = 0;
            _loc2_ = 0;
            while(_loc2_ < member.length)
            {
               if(Uint64Util.equal(CTeamMemberInfo(member[_loc2_]).info.id,param1))
               {
                  return member[_loc2_];
               }
               _loc2_++;
            }
            return null;
         };
         var arr:Array = [];
         var i:int = 0;
         while(i < order.length)
         {
            arr.push(getMember(order[i]));
            i = Number(i) + 1;
         }
         return arr;
      }
   }
}
