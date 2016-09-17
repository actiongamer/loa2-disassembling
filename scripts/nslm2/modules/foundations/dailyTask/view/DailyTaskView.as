package nslm2.modules.foundations.dailyTask.view
{
   import game.ui.dailyTaskModules.view.DailyTaskViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import nslm2.modules.foundations.dailyTask.vo.DailyTaskScoreRewardVo;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.modules.Chapters.TreasureBoxModuleVo;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.miniTasks.service.TaskService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import nslm2.common.model.PlayerModel;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.compsEffects.ListRemoveItemTweenEffect;
   import nslm2.modules.foundations.dailyTask.render.DailyTaskListRender;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.greensock.TweenLite;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import morn.customs.components.WealthRender;
   import nslm2.common.event.WealthChangeEvent;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class DailyTaskView extends DailyTaskViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:TaskModel;
      
      private var crtTaskScoreVo:DailyTaskScoreRewardVo;
      
      private var crtTreuasreBoxIndex:int;
      
      private var crtRewardArr:Array;
      
      public function DailyTaskView()
      {
         model = TaskModel.ins;
         super();
         this.parts.push(new ProgressBarCtrl(this.progressBar).splitCnt(5));
         updateTreasureBoxStyle();
         list_chest.changeHandler = listChestClickHandler;
         var _loc1_:* = WealthUtil.countVo(22);
         scoreRender2.dataSource = _loc1_;
         scoreRender1.dataSource = _loc1_;
         txt_tip.text = LocaleMgr.ins.getStr(11400000);
      }
      
      private function listChestClickHandler(param1:int, param2:int) : void
      {
         var _loc4_:TreasureBoxVo = list_chest.getItem(param1) as TreasureBoxVo;
         crtTaskScoreVo = crtRewardArr[param1];
         crtTreuasreBoxIndex = param1;
         var _loc3_:TreasureBoxModuleVo = new TreasureBoxModuleVo(_loc4_,null,new Handler(rewardHandler,[crtTaskScoreVo]),13000);
         ModuleMgr.ins.showModule(40401,_loc3_,13000);
      }
      
      private function rewardHandler(param1:DailyTaskScoreRewardVo = null) : void
      {
         if(!param1)
         {
            return;
         }
         TaskService.ins.requestGetScoreReward(param1.id,getTaskScoreRewardSuccess);
      }
      
      private function getTaskScoreRewardSuccess(param1:Object = null) : void
      {
         TaskModel.ins.updateGottedRewardArr(crtTaskScoreVo.id);
         updateTaskScore();
         var _loc2_:TreasureBoxVo = list_chest.getItem(crtTreuasreBoxIndex) as TreasureBoxVo;
         ObserverMgr.ins.sendNotice("evtModuleRefresh",_loc2_);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         this.fadeIn();
         updateTaskList();
         updateTaskScore();
      }
      
      private function updateTreasureBoxStyle() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = list_chest.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = list_chest.getCell(_loc3_) as TreasureBoxBaseRender;
            _loc1_.treasureType = _loc3_ > 2?2:_loc3_;
            _loc3_++;
         }
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      private function updateTaskScore() : void
      {
         var _loc5_:* = null;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = PlayerModel.ins.getWealthValue(22);
         cliplist_score.tweenValue = _loc3_;
         crtRewardArr = model.crtTaskScoreRewardArr;
         var _loc6_:int = crtRewardArr.length;
         var _loc2_:int = 150;
         var _loc1_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = crtRewardArr[_loc7_];
            (this["txt_score_" + _loc7_] as Label).text = LocaleMgr.ins.getStr(999000228) + _loc4_.needScore;
            _loc5_ = new TreasureBoxVo(null,1);
            if(_loc4_.status == -1)
            {
               _loc5_.state = 1;
            }
            if(_loc4_.status == 0)
            {
               _loc5_.state = 2;
            }
            if(_loc4_.status > 0)
            {
               _loc5_.state = 3;
            }
            _loc5_.itemArr = WealthUtil.dropGroupIDToWealthVoArr(_loc4_.dropID);
            _loc5_.toolTip = LocaleMgr.ins.getStr(11400002,[_loc4_.needScore]) + "\n" + WealthUtil.getRewardArrayToolTipStr(_loc5_.itemArr);
            _loc5_.optionData = LocaleMgr.ins.getStr(999000229,[TextFieldUtil.htmlText2(_loc4_.needScore,458496)]);
            _loc1_.push(_loc5_);
            _loc7_++;
         }
         list_chest.dataSource = _loc1_;
         progressBar.value = _loc3_ / _loc2_;
      }
      
      private function updateTaskList(param1:Boolean = false, param2:int = 0) : void
      {
         if(param1)
         {
            new ListRemoveItemTweenEffect(this.list_task,param2,model.dailyTaskArr).set_duration(0.3).set_Removeduration(0.2).exec();
         }
         else
         {
            list_task.dataSource = model.dailyTaskArr;
         }
         updateTaskScore();
      }
      
      public function getFocusNotices() : Array
      {
         return ["task_notice_update_task","task_notice_get_reward_success","wealthChange","task_notice_get_reward_effect"];
      }
      
      private function getRewardSueccessHandler(param1:DailyTaskListRender) : void
      {
         FloatUtil.showGetItemsDisplayPanel(param1.list_reward.dataSource as Array);
         TweenLite.delayedCall(0.2,updateTaskList,[true,list_task.selectedIndex]);
      }
      
      private function getToTargetHandler(param1:ListIconFlyEff, param2:WealthRender) : *
      {
         if(param2.wealthVoIsEnable)
         {
            if(!(int(param2.wealthVo.kind) - 22))
            {
               return this.scoreRender1;
            }
            return ListIconFlyEff.getToTargetFromWealthRender(param1,param2);
         }
         return null;
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("task_notice_update_task" !== _loc4_)
         {
            if("task_notice_get_reward_success" !== _loc4_)
            {
               if("wealthChange" !== _loc4_)
               {
                  if("task_notice_get_reward_effect" !== _loc4_)
                  {
                  }
               }
               else
               {
                  _loc3_ = param2 as WealthChangeEvent;
                  if(_loc3_.wealthType == 22)
                  {
                     updateTaskScore();
                  }
               }
            }
            else
            {
               getRewardSueccessHandler(param2);
            }
         }
         else
         {
            updateTaskList();
         }
      }
      
      private function resetEnable() : void
      {
         this.list_task.mouseEvent = true;
      }
   }
}
