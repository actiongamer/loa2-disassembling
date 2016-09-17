package nslm2.modules.funnies.guildPKCrossSer
{
   import flash.events.EventDispatcher;
   import proto.FamilyExpeInfoRes;
   import proto.FamilyExpeTaskNotify;
   import proto.FamilyExpeChallengeInfoRes;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyExpeTaskVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.StaticStartTmAndRoundModel;
   import nslm2.modules.foundations.miniNotice.MiniNoticeModel;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import proto.FamilyExpeLastChampionRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.RTools;
   import nslm2.utils.ServerTimer;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import org.manager.DateUtils;
   
   public class GPKCModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
       
      
      private var _info:FamilyExpeInfoRes;
      
      public var con:int;
      
      public var coin:int;
      
      public var hpPer:int;
      
      public var currPage:int;
      
      public var curTask:FamilyExpeTaskNotify;
      
      public var battleFlag:Boolean = false;
      
      public var challengeInfo:FamilyExpeChallengeInfoRes;
      
      public var startDate:String = "";
      
      public function GPKCModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.guildPKCrossSer.GPKCModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.guildPKCrossSer.GPKCModel();
         }
         return _ins;
      }
      
      public function get info() : FamilyExpeInfoRes
      {
         return _info;
      }
      
      public function set info(param1:FamilyExpeInfoRes) : void
      {
         _info = param1;
      }
      
      public function get taskInfo() : StcFamilyExpeTaskVo
      {
         if(!curTask)
         {
            return null;
         }
         return StcMgr.ins.getFamilyExpeTaskVo(curTask.taskId);
      }
      
      public function openAry() : Array
      {
         var _loc1_:* = null;
         if(startDate == "")
         {
            return String(StcMgr.ins.getDefineSpecialVo("FAMILY_EXPE_START_TIME").define_value).split("|");
         }
         _loc1_ = String(startDate.split(" ")[0]).split("-");
         _loc1_.unshift(1);
         _loc1_.push(int(StcMgr.ins.getDefineVo("FAMILY_EXPE_LAST_DAYS").define_value));
         return _loc1_;
      }
      
      public function initOpenTime(param1:StaticStartTmAndRoundModel) : void
      {
         startDate = param1.startDate;
         MiniNoticeModel.ins.addGuildCrossActionInfos();
      }
      
      public function getTaskTotalNum() : int
      {
         if(!curTask)
         {
            return 0;
         }
         if(taskInfo.kind == 1 || taskInfo.kind == 5)
         {
            return curTask.taskToalNum;
         }
         return taskInfo.num;
      }
      
      public function getPowerStatus(param1:UInt64) : int
      {
         var _loc2_:Number = Uint64Util.toNumber(info.self.ability);
         var _loc4_:Number = Uint64Util.toNumber(param1);
         var _loc3_:Number = (_loc4_ - _loc2_) * 100 / _loc2_;
         if(_loc3_ > GPKConst.power_percent)
         {
            return GPKConst.power_strong;
         }
         if(_loc3_ < -GPKConst.power_percent)
         {
            return GPKConst.power_weak;
         }
         return GPKConst.power_normal;
      }
      
      public function reqLastChampion(param1:Function) : void
      {
         handler = param1;
         onRes = function(param1:FamilyExpeLastChampionRes):void
         {
            if(handler is Function)
            {
               handler(param1);
            }
         };
         ServerEngine.ins.send(4367,null,onRes);
      }
      
      public function getGPKStatus() : int
      {
         var _loc12_:* = null;
         var _loc11_:int = 0;
         var _loc1_:int = 0;
         var _loc3_:* = null;
         var _loc8_:StcFunctionVo = StcMgr.ins.getFunctionVo(40760);
         if(!_loc8_.canOpen)
         {
            return 0;
         }
         if(PlayerModel.ins.level < _loc8_.level)
         {
            return 0;
         }
         var _loc5_:Array = openAry();
         var _loc9_:int = _loc5_[1];
         var _loc7_:int = _loc5_[2];
         var _loc10_:int = _loc5_[3];
         var _loc2_:Number = RTools.getTimestamp(_loc9_,_loc7_,_loc10_,0,0,0);
         var _loc6_:uint = _loc2_ / 1000;
         var _loc4_:uint = _loc2_ + 86400000 * _loc5_[4] - 60000;
         if(ServerTimer.ins.second > _loc6_ && ServerTimer.ins.second < _loc4_)
         {
            _loc12_ = String(DefindConsts.FAMILY_EXPE_TIME_INTVL).split("|");
            _loc11_ = _loc12_[0];
            _loc1_ = _loc12_[1];
            _loc3_ = ServerTimer.ins.date;
            if(_loc3_.hours >= _loc11_ && _loc3_.hours < _loc1_)
            {
               return 1;
            }
            return 2;
         }
         return 0;
      }
   }
}
