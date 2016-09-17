package nslm2.modules.foundations.dailyTask.render
{
   import game.ui.dailyTaskModules.DailyTaskListRenderUI;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.dailyTask.DailyTaskBtnCtrl;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import nslm2.utils.PlatformUtil;
   import morn.core.components.Button;
   import nslm2.modules.foundations.miniTasks.service.TaskService;
   import org.specter3d.utils.StringUtil;
   import nslm2.modules.globalModules.facebook.control.FBBtnControl;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import com.mz.core.mediators.RollMediator;
   
   public class DailyTaskListRender extends DailyTaskListRenderUI
   {
       
      
      private var _data:TaskVo;
      
      private var btnEff:BmcSpriteSheet;
      
      private var eff:BmcSpriteSheet;
      
      private var preVo:TaskVo;
      
      public function DailyTaskListRender()
      {
         super();
         btn_go.clickHandler = btnClickHandler;
         this.parts.push(new RollMediator(this,rollhandler));
      }
      
      private function rollhandler(param1:Boolean) : void
      {
         this.img_selectedBg.visible = param1;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as TaskVo;
         if(_data)
         {
            if(preVo && preVo.id != _data.id)
            {
               resetBtn();
            }
            preVo = _data;
            if(PlayerModel.ins.vip < _data.vipLimit)
            {
               txt_vipLimit.text = LocaleMgr.ins.getStr(_data.taskStcVO.vip_limit_desc);
               btn_go.visible = false;
               txt_progress.visible = false;
            }
            else
            {
               txt_vipLimit.text = "";
               btn_go.visible = true;
               txt_progress.visible = true;
            }
            img_vipMark.visible = _data.vipLimit;
            img_yueka.visible = DailyTaskBtnCtrl.checkIsYueKaTask(_data.targetType);
            txt_title.text = _data.title + TextFieldUtil.htmlText2(" （" + _data.titleContent + "）",458496,12);
            txt_progress.text = _data.progressStr;
            img_gotReward.visible = false;
            switch(int(_data.status) - 1)
            {
               case 0:
                  btn_go.label = LocaleMgr.ins.getStr(999000227);
                  btn_go.style = "按钮大黄";
                  break;
               case 1:
                  btn_go.label = LocaleMgr.ins.getStr(11900045);
                  btn_go.style = "按钮大绿";
                  break;
               case 2:
                  img_gotReward.visible = true;
                  btn_go.visible = false;
            }
            list_reward.dataSource = _data.rewardArr;
            iconRender.dataSource = _data.rewardArr[0];
            if(_data.targetType == 1001)
            {
               txt_progress.text = "";
            }
            showOrHideInvite();
         }
         showOrHideBtnEffect();
      }
      
      private function resetBtn() : void
      {
         btn_go.mouseEnabled = true;
      }
      
      private function showOrHideBtnEffect() : void
      {
         if(_data && _data.status == 2)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.x = 603;
               btnEff.y = 26;
               this.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function showOrHideInvite() : void
      {
         var _loc1_:StcFacebookFeedVo = StcMgr.ins.getVoByMultiColumnValue("static_facebook_feed",["feedType","para_1"],[8,_data.taskStcVO.id]) as StcFacebookFeedVo;
         if(PlatformUtil.isFeedShowFaceBook && _data.type == 1 && _loc1_)
         {
            feedCheckBox.visible = true;
            feedCheckBox.selected = true;
         }
         else
         {
            feedCheckBox.visible = false;
            feedCheckBox.selected = false;
         }
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         switch(int(_data.status) - 1)
         {
            case 0:
               DailyTaskBtnCtrl.openTargetModuel(_data.targetType,_data.dungeonID);
               break;
            case 1:
               param1.mouseEnabled = false;
               TaskService.ins.taskFinish(_data.id,showCompleteEffects);
               if(PlatformUtil.isFeedShowFaceBook && _data.type == 1 && feedCheckBox.selected)
               {
                  _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_facebook_feed",["feedType","para_1"],[8,_data.taskStcVO.id]) as StcFacebookFeedVo;
                  if(_loc3_)
                  {
                     _loc2_ = StringUtil.substitute(LocaleMgr.ins.getStr(_loc3_.description),_data.title,_data.titleContent);
                     FBBtnControl.instance.reqFaceBookFeed(_loc3_,_loc2_);
                     break;
                  }
                  break;
               }
         }
      }
      
      private function showCompleteEffects() : void
      {
         getRewardHandler();
         ObserverMgr.ins.sendNotice("task_notice_get_reward_effect");
      }
      
      private function taskEffComplete() : void
      {
         eff = null;
         getRewardHandler();
      }
      
      override public function changeSelectState(param1:int) : void
      {
         if(param1 == 3)
         {
            return;
         }
         img_selectedBg.visible = param1 == 2;
      }
      
      private function getRewardHandler() : void
      {
         TaskModel.ins.updateTaskStatus(_data.id,3);
         ObserverMgr.ins.sendNotice("task_notice_get_reward_success",this);
      }
   }
}
