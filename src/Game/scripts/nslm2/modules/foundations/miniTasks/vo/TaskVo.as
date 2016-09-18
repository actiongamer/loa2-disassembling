package nslm2.modules.foundations.miniTasks.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcTaskVo;
   import proto.TaskInfo;
   import nslm2.common.model.PlayerModel;
   import proto.TaskInfo.Progress;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   
   public class TaskVo
   {
       
      
      public var id:int;
      
      public var progressArr:Array;
      
      private var _title:String;
      
      private var _content:String;
      
      private var _taskStcVO:StcTaskVo;
      
      private var _targetCnt:int;
      
      private var _targetType:int;
      
      private var _targetID:int;
      
      private var _checkTargetArr:Array;
      
      private var _status:int;
      
      public function TaskVo()
      {
         super();
      }
      
      private function get checkTargetArr() : Array
      {
         if(_checkTargetArr == null)
         {
            updateCheckDic();
         }
         return _checkTargetArr;
      }
      
      private function set checkTargetArr(param1:Array) : void
      {
         _checkTargetArr = param1;
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function set status(param1:int) : void
      {
         _status = param1;
      }
      
      public function updateInfo(param1:TaskInfo) : void
      {
         if(id != param1.id)
         {
            id = param1.id;
            updateCheckDic();
         }
         id = param1.id;
         progressArr = param1.progress;
         status = param1.status;
      }
      
      private function updateCheckDic() : void
      {
         var _loc4_:* = null;
         if(taskStcVO == null)
         {
            return;
         }
         _checkTargetArr = [];
         var _loc3_:String = taskStcVO.check_point_1;
         var _loc1_:Array = _loc3_.split("|");
         var _loc6_:int = 0;
         var _loc5_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            _loc4_ = _loc2_.split(":");
            _targetType = _loc4_[1];
            _checkTargetArr.push([_loc4_[0],_loc4_[3]]);
         }
      }
      
      private function getTargetCnt() : int
      {
         return checkTargetArr[taskLvl][1];
      }
      
      private function get taskLvl() : int
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = PlayerModel.ins.level;
         var _loc3_:int = checkTargetArr.length;
         var _loc4_:* = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = checkTargetArr[_loc5_];
            if(_loc1_ >= _loc2_[0])
            {
               _loc4_ = _loc5_;
               _loc5_++;
               continue;
            }
            break;
         }
         return _loc4_;
      }
      
      private function getRewardDropIdByIndex() : int
      {
         var _loc1_:Array = taskStcVO.reward_drop_ids.split("|");
         return _loc1_[taskLvl];
      }
      
      public function get content() : String
      {
         var _loc2_:int = getTargetCnt();
         var _loc3_:int = (progressArr[0] as Progress).count;
         var _loc1_:Array = [_loc3_,_loc2_];
         return _content;
      }
      
      public function get progressStr() : String
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(progressArr[0] as Progress)
         {
            _loc3_ = (progressArr[0] as Progress).count;
            _loc2_ = getTargetCnt();
            _loc3_ = _loc3_ > _loc2_?_loc2_:int(_loc3_);
            if(_loc2_ <= _loc3_)
            {
               _loc1_ = 458496;
            }
            else
            {
               _loc1_ = 16723968;
            }
            return TextFieldUtil.htmlText2(_loc3_ + "/" + _loc2_,_loc1_);
         }
         return "";
      }
      
      public function get titleContent() : String
      {
         var _loc2_:int = getTargetCnt();
         var _loc1_:Array = [_loc2_];
         _content = LocaleMgr.ins.getStr(taskStcVO.task_description,_loc1_);
         if(taskStcVO.task_description == "8200170")
         {
            if(VipModel.ins.silverDay > -1)
            {
               _content = LocaleMgr.ins.getStr(60530001,[VipModel.ins.silverDay]);
            }
            else
            {
               _content = LocaleMgr.ins.getStr(taskStcVO.task_description,_loc1_);
            }
         }
         if(taskStcVO.task_description == "8200180")
         {
            if(VipModel.ins.goldDay > -1)
            {
               _content = LocaleMgr.ins.getStr(60530001,[VipModel.ins.goldDay]);
            }
            else
            {
               _content = LocaleMgr.ins.getStr(taskStcVO.task_description,_loc1_);
            }
         }
         return _content;
      }
      
      public function get groupId() : int
      {
         if(taskStcVO)
         {
            return taskStcVO.group;
         }
         return 0;
      }
      
      public function get title() : String
      {
         if(!_title)
         {
            _title = LocaleMgr.ins.getStr(taskStcVO.name);
         }
         return _title;
      }
      
      public function get taskStcVO() : StcTaskVo
      {
         if(!_taskStcVO)
         {
            _taskStcVO = StcMgr.ins.getTaskVo(id);
         }
         return _taskStcVO;
      }
      
      public function get rewardArr() : Array
      {
         var _loc1_:Array = WealthUtil.dropGroupIDToWealthVoArr(getRewardDropIdByIndex());
         _loc1_.sort(sortReward);
         return _loc1_;
      }
      
      private function sortReward(param1:WealthVo, param2:WealthVo) : int
      {
         if(param1.kind == 22)
         {
            return 1;
         }
         if(param2.kind == 22)
         {
            return -1;
         }
         return 0;
      }
      
      public function get targetType() : int
      {
         return _targetType;
      }
      
      public function get targetID() : int
      {
         return _targetID;
      }
      
      public function get type() : int
      {
         return taskStcVO.kind;
      }
      
      public function get dungeonID() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = taskStcVO.findpath.split(":")[1];
         var _loc3_:StcStageVo = StcMgr.ins.getStageVo(_loc1_);
         if(_loc3_)
         {
            _loc2_ = StcMgr.ins.getStageVo(_loc1_).chapter_id;
         }
         return _loc2_;
      }
      
      public function get dungeonStageVo() : StcStageVo
      {
         var _loc1_:int = taskStcVO.findpath.split(":")[1];
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(_loc1_);
         return _loc2_;
      }
      
      public function get vipLimit() : int
      {
         return taskStcVO.vip_limit;
      }
   }
}
