package nslm2.modules.foundations.sevenDays.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcSevendayTaskVo;
   import proto.SevenDayTaskInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.stcMgrs.vos.StcHorsejingtongVo;
   
   public class SevenDayTaskVo
   {
       
      
      public var id:int;
      
      public var progress:String;
      
      private var _titleId:int;
      
      private var _title:String;
      
      private var _taskStcVO:StcSevendayTaskVo;
      
      private var checkTargetArr:Array;
      
      private var _targetType:int;
      
      public var status:int;
      
      public function SevenDayTaskVo()
      {
         super();
      }
      
      public function updateInfo(param1:SevenDayTaskInfo) : void
      {
         if(id != param1.id)
         {
            id = param1.id;
            updateCheckDic();
         }
         id = param1.id;
         progress = param1.value + "/" + taskStcVO.value;
         status = param1.status;
      }
      
      private function updateCheckDic() : void
      {
         _targetType = taskStcVO.kind;
      }
      
      public function get taskStcVO() : StcSevendayTaskVo
      {
         if(!_taskStcVO)
         {
            _taskStcVO = StcMgr.ins.getSevendayTaskVo(id);
         }
         return _taskStcVO;
      }
      
      private function getRewardDropIdByIndex() : int
      {
         return taskStcVO.drop_id;
      }
      
      public function get rewardArr() : Array
      {
         var _loc1_:Array = WealthUtil.dropGroupIDToWealthVoArr(getRewardDropIdByIndex());
         return _loc1_;
      }
      
      public function get targetType() : int
      {
         return _targetType;
      }
      
      public function get title() : String
      {
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _title = LocaleMgr.ins.getStr(taskStcVO.desc_id);
         if(taskStcVO.kind == 2)
         {
            _loc4_ = [int(int(taskStcVO.value) / 100)];
            _loc1_ = StcMgr.ins.getStageVo(int(taskStcVO.value));
            _loc2_ = StcMgr.ins.getChapterVo(_loc1_.chapter_id);
            progress = "";
            if(ClientConfig.isChineseLang())
            {
               _loc4_ = [int(LocaleMgr.ins.getStr(_loc2_.name).split("第")[1].split("章")[0])];
            }
            else
            {
               _loc4_ = [int(LocaleMgr.ins.getStr(_loc2_.name).substr(4,2))];
            }
         }
         else
         {
            if(taskStcVO.kind == 104 && int(progress.split("/")[0]) == 0)
            {
               progress = LocaleMgr.ins.getStr(13100901);
            }
            _loc4_ = [taskStcVO.value];
         }
         if(taskStcVO.kind == 107)
         {
            progress = "";
         }
         if(taskStcVO.kind == 29)
         {
            _loc3_ = StcMgr.ins.getHorsejingtongVo(int(taskStcVO.value));
            _loc4_ = [_loc3_.rank,_loc3_.level];
            progress = "";
         }
         _title = LocaleMgr.ins.parseParamAdvance(_title,_loc4_);
         if(status == 1 || status == 3)
         {
            progress = LocaleMgr.ins.getStr(999000365);
         }
         return _title;
      }
   }
}
