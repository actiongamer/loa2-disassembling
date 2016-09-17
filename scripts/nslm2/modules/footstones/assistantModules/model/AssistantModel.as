package nslm2.modules.footstones.assistantModules.model
{
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.footstones.assistantModules.vos.AssistantBattlefieldSettingVo;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShenyuanSettingVo;
   import nslm2.modules.footstones.assistantModules.vos.AssistantMysterySettingVo;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShopSetVo;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.setting.service.SettingService;
   import com.mz.core.logging.Log;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.footstones.assistantModules.AssistantTasksFactory;
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.footstones.assistantModules.AssistantTimerManager;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.components.Label;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils2.task.TaskList;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcAssistantLevelVo;
   import nslm2.utils.RestrictiveConditionUtils;
   
   public class AssistantModel
   {
      
      private static var _ins:nslm2.modules.footstones.assistantModules.model.AssistantModel;
       
      
      public var isActing:Boolean = false;
      
      private var _needDoIdArr:Array;
      
      public var battleFieldHasFirstWin:Boolean = false;
      
      public var dataDict:DictHash;
      
      public var logArr:Array;
      
      public var funcSettingDict:DictHash;
      
      public var voDict:DictHash;
      
      private var _label:Label;
      
      private var _str:String;
      
      private var cptaIn:int = 0;
      
      private var _taskList:TaskList;
      
      public var _assistantShopSetVo:AssistantShopSetVo;
      
      public function AssistantModel()
      {
         _needDoIdArr = [];
         dataDict = new DictHash();
         logArr = [];
         super();
         regSettingId();
         regVo();
      }
      
      public static function get ins() : nslm2.modules.footstones.assistantModules.model.AssistantModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.assistantModules.model.AssistantModel();
         }
         return _ins;
      }
      
      public function get needDoIdArr() : Array
      {
         return _needDoIdArr.sort(needDoIdSortFun);
      }
      
      public function set needDoIdArr(param1:Array) : void
      {
         _needDoIdArr = param1;
      }
      
      private function needDoIdSortFun(param1:int, param2:int) : int
      {
         if(param1 == 50500)
         {
            if(BattlefieldModel.ins.isInBattleScene == true)
            {
               return -1;
            }
            return 1;
         }
         if(param2 == 50500)
         {
            if(BattlefieldModel.ins.isInBattleScene == true)
            {
               return 1;
            }
            return -1;
         }
         return 0;
      }
      
      private function regSettingId() : void
      {
         funcSettingDict = new DictHash();
         funcSettingDict.put(50500,50);
         funcSettingDict.put(41500,51);
         funcSettingDict.put(60310,52);
         funcSettingDict.put(41600,53);
      }
      
      private function regVo() : void
      {
         voDict = new DictHash();
         voDict.put(50500,AssistantBattlefieldSettingVo);
         voDict.put(41500,AssistantShenyuanSettingVo);
         voDict.put(60310,AssistantMysterySettingVo);
         voDict.put(41600,AssistantShopSetVo);
      }
      
      public function addLog(param1:String, param2:int) : void
      {
         var _loc4_:* = param1;
         param1 = TimeUtils.getFullTimeStr(ServerTimer.ins.second) + " [" + LocaleMgr.ins.getStr(9000000 + param2) + "] " + param1;
         this.logArr.unshift(param1);
         var _loc3_:int = logArr.length;
         if(_loc3_ > 50)
         {
            logArr.splice(_loc3_ - 1);
         }
         ObserverMgr.ins.sendNotice("logChanged");
      }
      
      public function getLog() : String
      {
         return logArr.join("\n");
      }
      
      public function clearLog() : void
      {
         this.logArr = [];
         AlertUtil.float(LocaleMgr.ins.getStr(60200041));
      }
      
      public function getSetting(param1:int) : *
      {
         var _loc4_:* = null;
         var _loc2_:* = undefined;
         var _loc5_:int = funcSettingDict.getValue(param1);
         var _loc3_:String = SettingService.ins.getValue(_loc5_);
         var _loc6_:Class = voDict.getValue(param1);
         if(_loc3_)
         {
            try
            {
               _loc4_ = JSON.parse(_loc3_);
            }
            catch(err:Error)
            {
               Log.error(this,"getAssistantSetting error",err);
            }
         }
         if(_loc6_)
         {
            _loc2_ = dataDict.getValue(param1);
            if(_loc2_ == null)
            {
               _loc2_ = new _loc6_();
               dataDict.put(param1,_loc2_);
            }
            ObjectUtils.setParams(_loc2_,_loc4_);
         }
         else
         {
            _loc2_ = {};
            dataDict.put(param1,_loc2_);
            Log.error(this,"没有在AssistantModel注册功能id" + param1 + "的数据类型");
         }
         return _loc2_;
      }
      
      public function saveSetting(param1:int, param2:Object, param3:Boolean = true) : void
      {
         var _loc4_:String = JSON.stringify(param2);
         var _loc5_:int = funcSettingDict.getValue(param1);
         if(_loc5_ != 0)
         {
            SettingService.ins.save(_loc5_,_loc4_);
            if(param3)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(60200032));
            }
         }
      }
      
      public function addTask(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         param1.sort(needDoIdSortFun);
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            addNeedDoFunId(param1[_loc4_]);
            _loc3_ = AssistantTasksFactory.getNewTaskByFuncId(param1[_loc4_]);
            if(_loc3_)
            {
               this.taskList.addTask(_loc3_);
            }
            _loc4_++;
         }
      }
      
      public function removeTask(param1:Object) : void
      {
         this.taskList.removeTask(param1);
         AssistantTimerManager.ins.removeTimer(param1 as int);
      }
      
      public function addNeedDoFunId(param1:int) : void
      {
         if(needDoIdArr.indexOf(param1) == -1)
         {
            needDoIdArr.push(param1);
         }
      }
      
      public function removeNeedDoFuncId(param1:int) : void
      {
         var _loc2_:int = ArrayUtil.removeItem(needDoIdArr,param1);
         if(_loc2_ != -1 && needDoIdArr.length <= 0)
         {
            clearTask();
         }
         if(_loc2_ != -1)
         {
            ObserverMgr.ins.sendNotice("refreshModule");
         }
      }
      
      public function isNeedAuto(param1:int) : Boolean
      {
         return needDoIdArr.indexOf(param1) != -1;
      }
      
      public function isActingAuto(param1:int) : Boolean
      {
         return isActing && isNeedAuto(param1);
      }
      
      public function allStart() : void
      {
         isActing = true;
         AssistantTimerManager.ins.init();
         this.taskList.isStop = false;
         this.taskList.exec();
         ObserverMgr.ins.sendNotice("refreshModule");
      }
      
      public function showDoingAlert(param1:String) : void
      {
         _str = param1;
         if(_label == null)
         {
            _label = new Label();
            _label.style = "渐变1";
            _label.text = param1;
            _label.width = _label.textWidth + 50;
            _label.height = 22;
            _label.mouseEvent = false;
            _label.centerX = 0;
            _label.bottom = 200;
            _label.commitMeasure();
         }
         TweenLite.killDelayedCallsTo(canPassTxtAnimation);
         ModuleMgr.ins.topLayer.addChild(_label);
         canPassTxtAnimation();
      }
      
      private function canPassTxtAnimation() : void
      {
         var _loc1_:Array = ["",".","..","..."];
         cptaIn = Number(cptaIn) + 1;
         this._label.text = _str + _loc1_[cptaIn % _loc1_.length];
         TweenLite.delayedCall(0.5,canPassTxtAnimation);
      }
      
      public function hideDoingAlert() : void
      {
         if(_label)
         {
            _label.dispose();
            _label = null;
         }
         TweenLite.killDelayedCallsTo(canPassTxtAnimation);
      }
      
      public function get taskList() : TaskList
      {
         if(_taskList == null)
         {
            _taskList = new TaskList();
            _taskList.interval = 0;
            _taskList.addCompleteHandler(onComplete);
         }
         return _taskList;
      }
      
      private function onComplete() : void
      {
         ObserverMgr.ins.sendNotice("refreshModule");
      }
      
      public function clearTask() : void
      {
         if(_taskList)
         {
            _taskList.stop();
            _taskList.dispose();
            _taskList = null;
         }
         isActing = false;
         AssistantTimerManager.ins.stop();
         ObserverMgr.ins.sendNotice("refreshModule");
      }
      
      public function canUseAssistant(param1:int) : Boolean
      {
         if(PlayerModel.ins.level >= getOpenLevel(param1))
         {
            return true;
         }
         return false;
      }
      
      public function getOpenLevel(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc3_:int = FuncOpenAutoCtrl.getOpenLevel(param1);
         var _loc2_:StcAssistantLevelVo = StcMgr.ins.getAssistantLevelVo(param1);
         if(_loc2_)
         {
            _loc4_ = RestrictiveConditionUtils.getParamValue(String(_loc2_.condition));
         }
         return Math.max(_loc3_,_loc4_);
      }
      
      public function get assistantShopSetVo() : AssistantShopSetVo
      {
         if(_assistantShopSetVo == null)
         {
            _assistantShopSetVo = getSetting(41600) as AssistantShopSetVo;
         }
         return _assistantShopSetVo;
      }
      
      public function set assistantShopSetVo(param1:AssistantShopSetVo) : void
      {
         _assistantShopSetVo = param1;
      }
      
      public function getAssisShopVoByType(param1:int) : Object
      {
         var _loc2_:* = null;
         if(assistantShopSetVo)
         {
            _loc2_ = assistantShopSetVo.shopVoObj[param1];
         }
         return _loc2_;
      }
      
      public function getShopPropVo(param1:int, param2:int) : Object
      {
         var _loc3_:* = null;
         var _loc4_:Object = getAssisShopVoByType(param1);
         if(_loc4_)
         {
            _loc3_ = _loc4_.assistantShopVoObj[param2];
         }
         return _loc3_;
      }
   }
}
