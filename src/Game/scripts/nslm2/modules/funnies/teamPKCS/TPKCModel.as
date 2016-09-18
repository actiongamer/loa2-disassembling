package nslm2.modules.funnies.teamPKCS
{
   import flash.events.EventDispatcher;
   import nslm2.utils.ServerTimer;
   import org.manager.DateUtils;
   import nslm2.utils.RTools;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.StaticStartTmAndRoundModel;
   import nslm2.modules.foundations.miniNotice.MiniNoticeModel;
   import flash.utils.Timer;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.TimerEvent;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import flash.events.Event;
   import proto.CteamArenaFinalBetInfo;
   import proto.CteamArenaFinalStage;
   import nslm2.utils.Uint64Util;
   import proto.CTeamInfo;
   import com.netease.protobuf.UInt64;
   import proto.CteamArenaInfoRes;
   import proto.CteamArenaStateRes;
   import proto.CteamPlayerInfoRes;
   import proto.CteamArenaFinalTeamRes;
   
   public class TPKCModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.funnies.teamPKCS.TPKCModel;
       
      
      public var time_arr_start:Array;
      
      public var time_arr_invite:Array;
      
      public var time_arr_pre:Array;
      
      public var time_arr_32to16:Array;
      
      public var time_arr_16to8:Array;
      
      public var time_arr_8to4:Array;
      
      public var time_arr_4to2:Array;
      
      public var time_arr_2to1:Array;
      
      public var startDate:String = "";
      
      public var remindStr:String;
      
      public var phase:int = 0;
      
      private var timer:Timer;
      
      private var timeArr:Array;
      
      public var inviteState:int = 0;
      
      public var outActDay:Boolean = false;
      
      public var preInfo:CteamArenaInfoRes;
      
      public var stateRes:CteamArenaStateRes;
      
      public var playerInfo:CteamPlayerInfoRes;
      
      public var myRank:int = 0;
      
      public var finalRes:CteamArenaFinalTeamRes;
      
      public function TPKCModel()
      {
         timeArr = [];
         super();
         time_arr_invite = String(DefindConsts.CROSS_GROUP_FIRST_STAGE).split("|");
         time_arr_pre = String(DefindConsts.CROSS_GROUP_SECOND_STAGE).split("|");
         time_arr_32to16 = String(DefindConsts.CROSS_GROUP_32TO16_STAGE).split("|");
         time_arr_16to8 = String(DefindConsts.CROSS_GROUP_16TO8_STAGE).split("|");
         time_arr_8to4 = String(DefindConsts.CROSS_GROUP_8TO4_STAGE).split("|");
         time_arr_4to2 = String(DefindConsts.CROSS_GROUP_4TO2_STAGE).split("|");
         time_arr_2to1 = String(DefindConsts.CROSS_GROUP_2TO1_STAGE).split("|");
      }
      
      public static function get ins() : nslm2.modules.funnies.teamPKCS.TPKCModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.teamPKCS.TPKCModel();
         }
         return _ins;
      }
      
      public static function tStrToSec(param1:String) : uint
      {
         var _loc3_:Array = param1.split(":");
         var _loc2_:DateUtils = ServerTimer.ins.date;
         var _loc4_:uint = RTools.getTimestamp(_loc2_.fullYear,_loc2_.month + 1,_loc2_.date,_loc3_[0],_loc3_[1],0,0) / 1000;
         return _loc4_;
      }
      
      public function openAry() : Array
      {
         var _loc1_:* = null;
         if(startDate == "")
         {
            return String(StcMgr.ins.getDefineSpecialVo("CROSS_GROUP_START_TIME").define_value).split("|");
         }
         _loc1_ = String(startDate.split(" ")[0]).split("-");
         _loc1_.unshift(1);
         return _loc1_;
      }
      
      public function initOpenTime(param1:StaticStartTmAndRoundModel) : void
      {
         startDate = param1.startDate;
         time_arr_start = openAry();
         MiniNoticeModel.ins.addTPKCActionInfos();
      }
      
      public function tryStartTimer() : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(time_arr_start == null)
         {
            time_arr_start = openAry();
         }
         var _loc3_:Boolean = false;
         if(isInviteDay)
         {
            FloatUtil.sendEventNotice([3],LocaleMgr.ins.getStr(50800067,[time_arr_invite[1] + ":00",time_arr_invite[2] + ":00",time_arr_invite[0]]));
         }
         else if(isPreDay)
         {
            FloatUtil.sendEventNotice([3],LocaleMgr.ins.getStr(50800068,[time_arr_pre[1] + ":00",time_arr_pre[2] + ":00",time_arr_pre[0]]));
         }
         else if(isHalfDay)
         {
            _loc3_ = true;
         }
         else if(isFinalDay)
         {
            _loc3_ = true;
         }
         if(_loc3_)
         {
            _loc1_ = [time_arr_32to16,time_arr_16to8,time_arr_8to4,time_arr_4to2,time_arr_2to1];
            _loc4_ = 0;
            while(_loc4_ < _loc1_.length)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc1_[_loc4_].length)
               {
                  if(_loc4_ <= 1)
                  {
                     timeArr.push(getHalfSec(_loc1_[_loc4_][_loc2_]) + 5);
                  }
                  else
                  {
                     timeArr.push(getFinalSec(_loc1_[_loc4_][_loc2_]) + 5);
                  }
                  _loc2_++;
               }
               _loc4_++;
            }
            if(timeArr.length > 0)
            {
               timer = new Timer(1000);
               timer.addEventListener("timer",onTimer);
               timer.start();
            }
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc9_:* = null;
         var _loc2_:* = null;
         var _loc8_:* = null;
         var _loc5_:* = null;
         if(timeArr.length <= 0)
         {
            timer.stop();
            timer.removeEventListener("timer",onTimer);
            return;
         }
         var _loc4_:Number = ServerTimer.ins.second;
         while(_loc4_ >= timeArr[0])
         {
            timeArr.shift();
            phase = Number(phase) + 1;
            _loc6_ = (phase - 1) / 5;
            _loc7_ = (phase - 1) % 5;
            _loc3_ = [time_arr_32to16,time_arr_16to8,time_arr_8to4,time_arr_4to2,time_arr_2to1];
            _loc9_ = _loc3_[_loc6_];
            switch(int(_loc7_))
            {
               case 0:
                  remindStr = LocaleMgr.ins.getStr(50800107,[_loc9_[0],_loc9_[1]]);
                  _loc5_ = String(DefindConsts.CROSS_GROUP_CHIPIN_ODDS).split("|");
                  _loc8_ = [50800069,50800071,50800074,50800076,50800078];
                  _loc2_ = LocaleMgr.ins.getStr(_loc8_[_loc6_],[_loc9_[0],_loc9_[1],_loc5_[_loc6_]]);
                  FloatUtil.sendEventNotice([3],_loc2_);
                  break;
               case 1:
                  _loc8_ = [50800070,50800072,50800075,50800077,50800079];
                  _loc2_ = LocaleMgr.ins.getStr(_loc8_[_loc6_]);
                  FloatUtil.sendEventNotice([3],_loc2_);
                  remindStr = LocaleMgr.ins.getStr(50800108,[1,_loc9_[2]]);
                  break;
               case 2:
                  remindStr = LocaleMgr.ins.getStr(50800108,[2,_loc9_[3]]);
                  break;
               case 3:
                  remindStr = LocaleMgr.ins.getStr(50800108,[3,_loc9_[4]]);
                  break;
               case 4:
                  remindStr = "";
                  if(_loc6_ == 1)
                  {
                     _loc2_ = LocaleMgr.ins.getStr(50800073);
                     FloatUtil.sendEventNotice([3],_loc2_);
                  }
                  else if(_loc6_ == 4)
                  {
                     _loc2_ = LocaleMgr.ins.getStr(50800080);
                     FloatUtil.sendEventNotice([3],_loc2_);
                  }
            }
            this.dispatchEvent(new Event("OPT_TPKC_NEW_EVENT_HAPPEN"));
         }
      }
      
      public function isBetWin(param1:CteamArenaFinalBetInfo) : int
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = finalRes.index;
         for each(var _loc2_ in finalRes.index)
         {
            if(param1.index == _loc2_.id)
            {
               _loc3_ = _loc2_;
            }
         }
         if(_loc3_ && _loc3_.win)
         {
            if(Uint64Util.isZero(_loc3_.win))
            {
               return 0;
            }
            if(Uint64Util.equal(_loc3_.win,param1.team))
            {
               return 1;
            }
            return 2;
         }
         return 0;
      }
      
      public function get isInviteDay() : Boolean
      {
         var _loc3_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc2_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc1_:uint = _loc3_ / 1000;
         var _loc4_:uint = _loc3_ / 1000 + int(time_arr_invite[0]) * 3600 * 24 - 60;
         if(ServerTimer.ins.second > _loc1_ && ServerTimer.ins.second < _loc4_)
         {
            return true;
         }
         return false;
      }
      
      public function getInvateDateParam() : Array
      {
         var _loc5_:int = time_arr_start[1];
         var _loc3_:int = time_arr_start[2];
         var _loc6_:int = time_arr_start[3];
         var _loc2_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0,0);
         var _loc1_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0,0));
         var _loc7_:Number = _loc2_ / 1000 + (int(time_arr_invite[0] - 1)) * 3600 * 24;
         var _loc4_:DateUtils = new DateUtils(_loc7_ * 1000);
         return [_loc5_ + "/" + _loc3_ + "/" + _loc6_,_loc4_.fullYear + "/" + (_loc4_.month + 1) + "/" + _loc4_.date,time_arr_invite[1] + ":00",time_arr_invite[2] + ":00"];
      }
      
      public function getPreDataParam() : Array
      {
         var _loc3_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc2_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc7_:uint = _loc3_ / 1000 + int(time_arr_invite[0]) * 3600 * 24;
         var _loc5_:DateUtils = new DateUtils(_loc7_ * 1000);
         var _loc6_:String = _loc5_.fullYear + "/" + (_loc5_.month + 1) + "/" + _loc5_.date;
         var _loc1_:uint = _loc7_ + (int(time_arr_pre[0] - 1)) * 3600 * 24;
         var _loc4_:DateUtils = new DateUtils(_loc1_ * 1000);
         return [_loc6_,_loc4_.fullYear + "/" + (_loc4_.month + 1) + "/" + _loc4_.date,time_arr_pre[1] + ":00",time_arr_pre[2] + ":00"];
      }
      
      public function get timeAllArr() : Array
      {
         var _loc3_:Array = [];
         var _loc6_:int = time_arr_start[1];
         var _loc4_:int = time_arr_start[2];
         var _loc7_:int = time_arr_start[3];
         var _loc2_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc1_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc9_:uint = _loc2_ / 1000 + (int(time_arr_invite[0] - 1)) * 3600 * 24;
         var _loc5_:DateUtils = new DateUtils(_loc9_ * 1000);
         _loc3_.push(_loc6_ + "/" + _loc4_ + "/" + _loc7_);
         _loc3_.push(_loc5_.fullYear + "/" + (_loc5_.month + 1) + "/" + _loc5_.date);
         _loc3_.push(time_arr_invite[0]);
         _loc2_ = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         _loc1_ = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         _loc9_ = _loc2_ / 1000 + int(time_arr_invite[0]) * 3600 * 24;
         _loc5_ = new DateUtils(_loc9_ * 1000);
         var _loc8_:String = _loc5_.fullYear + "/" + (_loc5_.month + 1) + "/" + _loc5_.date;
         _loc9_ = _loc9_ + (int(time_arr_pre[0] - 1)) * 3600 * 24;
         _loc5_ = new DateUtils(_loc9_ * 1000);
         _loc3_.push(_loc8_);
         _loc3_.push(_loc5_.fullYear + "/" + (_loc5_.month + 1) + "/" + _loc5_.date);
         _loc3_.push(time_arr_pre[0]);
         _loc3_.push(time_arr_pre[1] + ":00");
         _loc3_.push(time_arr_pre[2] + ":00");
         _loc2_ = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         _loc1_ = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         _loc9_ = _loc2_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0])) * 3600 * 24;
         _loc5_ = new DateUtils(_loc9_ * 1000);
         _loc8_ = _loc5_.fullYear + "/" + (_loc5_.month + 1) + "/" + _loc5_.date;
         _loc3_.push(_loc8_);
         _loc3_.push(_loc8_);
         _loc3_.push(1);
         _loc3_.push(time_arr_32to16[0],time_arr_32to16[1],time_arr_32to16[2],time_arr_32to16[2],time_arr_32to16[3],time_arr_32to16[3],time_arr_32to16[4],time_arr_32to16[4]);
         _loc3_.push(time_arr_16to8[0],time_arr_16to8[1],time_arr_16to8[2],time_arr_16to8[2],time_arr_16to8[3],time_arr_16to8[3],time_arr_16to8[4],time_arr_16to8[4]);
         _loc2_ = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         _loc1_ = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         _loc9_ = _loc2_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0]) + 1) * 3600 * 24;
         _loc5_ = new DateUtils(_loc9_ * 1000);
         _loc8_ = _loc5_.fullYear + "/" + (_loc5_.month + 1) + "/" + _loc5_.date;
         _loc3_.push(_loc8_);
         _loc3_.push(_loc8_);
         _loc3_.push(1);
         _loc3_.push(time_arr_8to4[0],time_arr_8to4[1],time_arr_8to4[2],time_arr_8to4[2],time_arr_8to4[3],time_arr_8to4[3],time_arr_8to4[4],time_arr_8to4[4]);
         _loc3_.push(time_arr_4to2[0],time_arr_4to2[1],time_arr_4to2[2],time_arr_4to2[2],time_arr_4to2[3],time_arr_4to2[3],time_arr_4to2[4],time_arr_4to2[4]);
         _loc3_.push(time_arr_2to1[0],time_arr_2to1[1],time_arr_2to1[2],time_arr_2to1[2],time_arr_2to1[3],time_arr_2to1[3],time_arr_2to1[4],time_arr_2to1[4]);
         return _loc3_;
      }
      
      public function get isPreDay() : Boolean
      {
         var _loc4_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc3_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc6_:uint = _loc4_ / 1000 + int(time_arr_invite[0]) * 3600 * 24;
         var _loc5_:DateUtils = new DateUtils(_loc6_ * 1000);
         var _loc2_:* = _loc6_;
         var _loc1_:uint = _loc6_ + int(time_arr_pre[0]) * 3600 * 24 - 60;
         if(ServerTimer.ins.second > _loc2_ && ServerTimer.ins.second < _loc1_)
         {
            return true;
         }
         return false;
      }
      
      public function halfStr() : Array
      {
         var _loc2_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc1_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc5_:uint = _loc2_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0])) * 3600 * 24;
         var _loc3_:DateUtils = new DateUtils(_loc5_ * 1000);
         var _loc4_:String = _loc3_.fullYear + "/" + (_loc3_.month + 1) + "/" + _loc3_.date;
         return [_loc4_,_loc4_,time_arr_32to16[0],time_arr_16to8[4]];
      }
      
      public function finalStr() : Array
      {
         var _loc2_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc1_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc5_:uint = _loc2_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0]) + 1) * 3600 * 24;
         var _loc3_:DateUtils = new DateUtils(_loc5_ * 1000);
         var _loc4_:String = _loc3_.fullYear + "/" + (_loc3_.month + 1) + "/" + _loc3_.date;
         return [_loc4_,_loc4_,time_arr_8to4[0],time_arr_2to1[4]];
      }
      
      public function get isHalfDay() : Boolean
      {
         var _loc4_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc3_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc6_:uint = _loc4_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0])) * 3600 * 24;
         var _loc5_:DateUtils = new DateUtils(_loc6_ * 1000);
         var _loc2_:* = _loc6_;
         var _loc1_:uint = _loc6_ + int(time_arr_pre[0]) * 3600 * 24 - 60;
         if(ServerTimer.ins.second > _loc2_ && ServerTimer.ins.second < _loc1_)
         {
            return true;
         }
         return false;
      }
      
      public function get isFinalDay() : Boolean
      {
         var _loc4_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc3_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc6_:uint = _loc4_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0]) + 1) * 3600 * 24;
         var _loc5_:DateUtils = new DateUtils(_loc6_ * 1000);
         var _loc2_:* = _loc6_;
         var _loc1_:uint = _loc6_ + int(time_arr_pre[0]) * 3600 * 24 - 60;
         if(ServerTimer.ins.second > _loc2_ && ServerTimer.ins.second < _loc1_)
         {
            return true;
         }
         return false;
      }
      
      public function get isActDay() : Boolean
      {
         var _loc3_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc2_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc1_:uint = _loc3_ / 1000;
         var _loc4_:uint = _loc3_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0]) + 2) * 3600 * 24 - 60;
         if(ServerTimer.ins.second > _loc1_ && ServerTimer.ins.second < _loc4_)
         {
            return true;
         }
         return false;
      }
      
      public function get preDay() : int
      {
         var _loc3_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc2_:DateUtils = new DateUtils(RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0));
         var _loc7_:uint = _loc3_ / 1000 + int(time_arr_invite[0]) * 3600 * 24;
         var _loc5_:DateUtils = new DateUtils(_loc7_ * 1000);
         var _loc1_:* = _loc7_;
         var _loc4_:Number = ServerTimer.ins.second - _loc1_;
         if(_loc4_ <= 0)
         {
            return 0;
         }
         var _loc6_:int = _loc4_ / 86400;
         return _loc6_ + 1;
      }
      
      public function getHalfSec(param1:String) : uint
      {
         var _loc4_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc5_:uint = _loc4_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0])) * 3600 * 24;
         var _loc3_:Array = param1.split(":");
         var _loc2_:uint = _loc5_ + _loc3_[0] * 3600 + _loc3_[1] * 60;
         return _loc2_;
      }
      
      public function getFinalSec(param1:String) : uint
      {
         var _loc4_:Number = RTools.getTimestamp(time_arr_start[1],time_arr_start[2],time_arr_start[3],0,0,0);
         var _loc5_:uint = _loc4_ / 1000 + (int(time_arr_invite[0]) + int(time_arr_pre[0]) + 1) * 3600 * 24;
         var _loc3_:Array = param1.split(":");
         var _loc2_:uint = _loc5_ + _loc3_[0] * 3600 + _loc3_[1] * 60;
         return _loc2_;
      }
      
      public function getCteamInfo(param1:UInt64) : CTeamInfo
      {
         var _loc4_:int = 0;
         var _loc3_:* = finalRes.team;
         for each(var _loc2_ in finalRes.team)
         {
            if(Uint64Util.equal(_loc2_.id,param1))
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
