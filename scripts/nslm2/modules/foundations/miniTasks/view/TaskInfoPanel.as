package nslm2.modules.foundations.miniTasks.view
{
   import game.ui.miniTasks.TaskDetailInfoPanelUI;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Button;
   import nslm2.modules.foundations.miniTasks.ctrl.AutoTrackCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.miniTasks.service.TaskService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TaskInfoPanel extends TaskDetailInfoPanelUI
   {
       
      
      private var model:TaskModel;
      
      private var taskVO:TaskVo;
      
      public function TaskInfoPanel()
      {
         super();
         model = TaskModel.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         super.preShow(param1);
         addEvent();
         taskVO = model.crtTaskVo;
         if(taskVO)
         {
            txt_title.text = taskVO.title;
            txt_content.text = taskVO.content;
            _loc2_ = ArrayUtil.findByAttr(taskVO.rewardArr,"kind",1);
            if(_loc2_)
            {
               this.render_gold.dataSource = _loc2_;
            }
            list_reward.dataSource = getRewardExceptGold(taskVO.rewardArr);
            if(taskVO.status == 2)
            {
               btn_finish.visible = true;
               btn_go.visible = false;
            }
            else
            {
               btn_finish.visible = false;
               btn_go.visible = true;
            }
         }
         this.img_titleBg.skin = UrlLib.moduleLocaleImg(this.moduleId,"img_reward");
         this.panelBg.titleImgId = this.moduleId;
      }
      
      private function getRewardExceptGold(param1:Array) : Array
      {
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(_loc2_.kind != 1)
            {
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_;
      }
      
      private function addEvent() : void
      {
         btn_finish.clickHandler = btnClickHandler;
         btn_go.clickHandler = btnClickHandler;
      }
      
      private function removeEvent() : void
      {
         btn_finish.clickHandler = null;
         btn_go.clickHandler = null;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_go !== _loc2_)
         {
            if(btn_finish === _loc2_)
            {
               TaskService.ins.taskFinish(taskVO.id,getRewardSuccessHandler);
            }
         }
         else
         {
            AutoTrackCtrl.startAutoTrak();
            ModuleMgr.ins.closeModule(10421);
         }
      }
      
      private function getRewardSuccessHandler(param1:Object) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(40400021));
         model.removeFinishedTask(taskVO.id);
         ModuleMgr.ins.closeModule(10421);
      }
      
      override public function dispose() : void
      {
         removeEvent();
         super.dispose();
      }
   }
}
