package nslm2.modules.funnies.groupon.model
{
   import flash.display.DisplayObject;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticTuanGouModel;
   import nslm2.modules.funnies.groupon.vo.GrouponVo;
   import proto.TuanGouInfo;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.StaticTuanGouRewardModel;
   import com.mz.core.event.MzEvent;
   import proto.StaticOpActivityTmModel;
   
   public class GrouponModel
   {
      
      private static var _ins:nslm2.modules.funnies.groupon.model.GrouponModel;
       
      
      private var _grouponDataList:Array;
      
      private var _myGrouponScore:int;
      
      private var _hasScoreRwd:Boolean;
      
      public var hasGotSocreRewardIDArr:Array;
      
      private var _scoreRewardArr:Array;
      
      public var needGetScoreInfo:Boolean = true;
      
      public var crtGrouponId:int;
      
      public var grouponIcon:DisplayObject;
      
      public var scoreIcon:DisplayObject;
      
      public var groupnDataGot:Boolean;
      
      public function GrouponModel()
      {
         hasGotSocreRewardIDArr = [];
         _scoreRewardArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.groupon.model.GrouponModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.groupon.model.GrouponModel();
         }
         return _ins;
      }
      
      public function get myGrouponScore() : int
      {
         return _myGrouponScore;
      }
      
      public function set myGrouponScore(param1:int) : void
      {
         if(_myGrouponScore != param1)
         {
            _myGrouponScore = param1;
            updateScoreRewardStatus();
         }
      }
      
      public function initGrouponData() : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         _grouponDataList = [];
         var _loc1_:Array = OpActivityStaticDataModel.ins.getGrouponStaticByKind(1);
         if(_loc1_)
         {
            _loc2_ = _loc1_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = _loc1_[_loc4_];
               _loc5_ = new GrouponVo();
               _loc5_.id = _loc3_.id;
               _loc5_.updateStaticData();
               _grouponDataList.push(_loc5_);
               _loc4_++;
            }
            _grouponDataList.sort(sortFunction);
         }
      }
      
      private function sortFunction(param1:GrouponVo, param2:GrouponVo) : int
      {
         if(param1.status < param2.status)
         {
            return -1;
         }
         if(param1.status > param2.status)
         {
            return 1;
         }
         if(param1.pos < param2.pos)
         {
            return -1;
         }
         return 1;
      }
      
      public function updateGroupnInfo(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_ = ArrayUtil.findByAttr(grouponDataList,"id",_loc3_.id);
            if(_loc2_)
            {
               _loc2_.updateInfo(_loc3_);
               if(crtGrouponId == _loc3_.id)
               {
                  ObserverMgr.ins.sendNotice("groupon_notice_update_detail");
               }
            }
         }
      }
      
      public function get currentGrouponVo() : GrouponVo
      {
         var _loc1_:GrouponVo = ArrayUtil.findByAttr(grouponDataList,"id",crtGrouponId);
         return _loc1_;
      }
      
      public function updateTotalBuyCnt(param1:int, param2:int) : void
      {
         var _loc3_:GrouponVo = ArrayUtil.findByAttr(grouponDataList,"id",param1);
         if(_loc3_)
         {
            _loc3_.buyCount = param2;
            if(crtGrouponId == param1)
            {
               ObserverMgr.ins.sendNotice("groupon_notice_update_detail",_loc3_);
            }
         }
      }
      
      public function updateScoreRewardStatus() : void
      {
         _hasScoreRwd = false;
         var _loc3_:int = 0;
         var _loc2_:* = scoreRewardArr;
         for each(var _loc1_ in scoreRewardArr)
         {
            if(hasGotSocreRewardIDArr.indexOf(_loc1_.id) >= 0)
            {
               _loc1_.status = 2;
            }
            else if(_myGrouponScore >= _loc1_.needScore)
            {
               _loc1_.status = 1;
               _hasScoreRwd = true;
            }
            else
            {
               _loc1_.status = 0;
            }
         }
         ObserverMgr.ins.sendNotice("groupon_notice_update_reward_status",_hasScoreRwd);
      }
      
      public function get hasScoreRwd() : Boolean
      {
         return _hasScoreRwd;
      }
      
      public function initGrouponStaticData() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _grouponDataList;
         for each(var _loc1_ in _grouponDataList)
         {
            _loc1_.updateStaticData();
         }
         ObserverMgr.ins.sendNotice("groupon_notice_update_detail");
      }
      
      public function updateGrouponStaticData(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         groupnDataGot = true;
         var _loc5_:* = OpActivityStaticDataModel.ins.getGrouponStaticByKind(1);
         if(!_loc5_)
         {
            _loc5_ = param1;
         }
         else
         {
            var _loc7_:int = 0;
            var _loc6_:* = param1;
            for each(var _loc2_ in param1)
            {
               _loc3_ = ArrayUtil.indexByAttr(_loc5_,StaticTuanGouModel.ID.name,_loc2_.id);
               if(_loc3_ >= 0)
               {
                  _loc5_[_loc3_] = _loc2_;
               }
               else
               {
                  _loc5_.push(_loc2_);
               }
            }
         }
         OpActivityStaticDataModel.ins.activityStaticDic.put(1,_loc5_);
         OpActivityStaticDataModel.ins.dispatchEvent(new MzEvent("event_groupon_static_upated"));
      }
      
      public function getGrouponStatic(param1:int) : StaticTuanGouModel
      {
         var _loc2_:Array = OpActivityStaticDataModel.ins.getGrouponStaticByKind(1) as Array;
         return ArrayUtil.findByAttr(_loc2_,StaticTuanGouModel.ID.name,param1) as StaticTuanGouModel;
      }
      
      public function get currentGrouponData() : GrouponVo
      {
         var _loc1_:GrouponVo = ArrayUtil.findByAttr(grouponDataList,"id",crtGrouponId);
         return _loc1_;
      }
      
      public function get grouponDataList() : Array
      {
         return _grouponDataList;
      }
      
      public function set scoreRewardArr(param1:Array) : void
      {
         _scoreRewardArr = param1;
         _scoreRewardArr.sortOn(StaticTuanGouRewardModel.NEED_SCORE.name,16);
      }
      
      public function get scoreRewardArr() : Array
      {
         return _scoreRewardArr;
      }
      
      public function get activityEndTime() : uint
      {
         var _loc3_:* = 0;
         var _loc2_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(1);
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(2);
         if(_loc2_ || _loc1_)
         {
            if(_loc2_ && _loc1_)
            {
               _loc3_ = uint(Math.max(_loc2_.endTm,_loc1_.endTm));
            }
            else
            {
               if(_loc2_)
               {
                  _loc3_ = uint(_loc2_.endTm);
               }
               if(_loc1_)
               {
                  _loc3_ = uint(_loc1_.endTm);
               }
            }
         }
         return _loc3_;
      }
   }
}
