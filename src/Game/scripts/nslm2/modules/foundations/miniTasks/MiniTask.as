package nslm2.modules.foundations.miniTasks
{
   import game.ui.miniTasks.MiniTaskUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import nslm2.modules.footstones.newerGuideModules.NewerGuideCommonRender;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.MouseEvent;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import flash.geom.Point;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.Chapters.ChapterModel;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.foundations.dailyTask.DailyTaskBtnCtrl;
   import nslm2.modules.foundations.miniTasks.service.TaskService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import flash.display.Sprite;
   
   public class MiniTask extends MiniTaskUI implements INewerGuideGetComp
   {
      
      private static const IMG_CPL:String = "img_cpl";
      
      private static const IMG_NEW:String = "img_new";
      
      private static const NG_NAME:String = "miniTask";
       
      
      private var eff:BmcSpriteSheet;
      
      private var rawSkin:String;
      
      private var model:TaskModel;
      
      private var hasRwdEff:BmcSpriteSheet;
      
      private var lightEff:BmcSpriteSheet;
      
      private var initY:int = 0;
      
      private var _newerGuideCommonRender:NewerGuideCommonRender;
      
      private var taskVo:TaskVo;
      
      private const MOVE_HEIGHT_MAX:int = 780;
      
      private const MOVE_HEIGHT_MIN:int = 730;
      
      public function MiniTask()
      {
         super();
         this.right = 3;
         this.y = 300;
         model = TaskModel.ins;
         box_content.addEventListener("click",btnClickHandler);
         box_content.addEventListener("rollOver",onRollOver);
         box_content.addEventListener("rollOut",onRollOut);
         rawSkin = iconRender.img_quality.skin.substr(0,iconRender.img_quality.skin.length - 1);
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.lineStyle(null,0);
         _loc1_.graphics.moveTo(-5,-4);
         _loc1_.graphics.lineTo(187,-4);
         _loc1_.graphics.lineTo(187,69);
         _loc1_.graphics.lineTo(-39,69);
         _loc1_.graphics.beginFill(0);
         addChild(_loc1_);
         this.img_light.mask = _loc1_;
      }
      
      private function get newerGuideAlert() : NewerGuideCommonRender
      {
         if(_newerGuideCommonRender == null)
         {
            _newerGuideCommonRender = new NewerGuideCommonRender();
            this.addChild(_newerGuideCommonRender);
         }
         return _newerGuideCommonRender;
      }
      
      public function doTween() : void
      {
         TweenLite.to(this.img_light,1.4,{
            "x":347,
            "y":-42,
            "onComplete":tweenCpl
         });
      }
      
      public function tweenCpl() : void
      {
         img_light.x = -30;
         img_light.y = -42;
         TimerManager.ins.doOnce(3000,doTween);
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
         this.img_bg.filters = [];
      }
      
      protected function onRollOver(param1:MouseEvent) : void
      {
         this.img_bg.filters = [FilterUtil.highLightFilter(6)];
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["task_notice_update_task","task_notice_get_reward_success","MSG_SWITCH_MODULE_BUBBLE_ALERT"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("task_notice_update_task" !== _loc4_)
         {
            if("task_notice_get_reward_success" !== _loc4_)
            {
               if("MSG_SWITCH_MODULE_BUBBLE_ALERT" === _loc4_)
               {
                  _loc3_ = param2 as int;
                  this.newerGuideAlert.setVisibleList("MSG_SWITCH_MODULE_BUBBLE_ALERT",_loc3_ == 2);
               }
            }
            addr41:
            return;
         }
         showRedPoint();
         updateTaskInfo();
         §§goto(addr41);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      private function updateTaskInfo() : void
      {
         taskVo = model.crtTaskVo;
         if(!taskVo)
         {
            this.txt_title.text = "";
            this.txt_progress.text = "";
            iconRender.visible = false;
            txt_empty.visible = true;
            txt_empty.text = LocaleMgr.ins.getStr(13001899);
            this.txt_des.text = "";
            return;
         }
         txt_empty.visible = false;
         iconRender.visible = true;
         this.txt_title.text = taskVo.titleContent;
         this.txt_progress.text = taskVo.progressStr;
         updateNpcIcon();
         if(model.crtTaskVo.status == 2)
         {
            showHasRewardEffect(true);
            if(FloatBubbleUtil.checkInLevel(2) == true)
            {
               this.newerGuideAlert.show(new Point(this.width,this.height),5,5,FloatBubbleUtil.getDescribeString(2));
               FloatBubbleUtil.changeShow(2,true);
               this.newerGuideAlert.visible = true;
            }
            else
            {
               FloatBubbleUtil.changeShow(2,false);
            }
            this.txt_des.text = "领取奖励";
         }
         else
         {
            showHasRewardEffect(false);
            if(FloatBubbleUtil.checkInLevel(2) == true && PlayerModel.ins.level >= model.crtTaskVo.dungeonStageVo.unlock_level && ChapterModel.ins.isStageCpl(model.crtTaskVo.dungeonStageVo.id) == false)
            {
               FloatBubbleUtil.changeShow(2,true);
               this.newerGuideAlert.visible = true;
               this.newerGuideAlert.show(new Point(this.width,this.height),5,5,LocaleMgr.ins.getStr(40740220));
            }
            else
            {
               FloatBubbleUtil.changeShow(2,false);
            }
            if(PlayerModel.ins.level >= model.crtTaskVo.dungeonStageVo.unlock_level)
            {
               this.txt_des.text = "点击前往";
            }
            else
            {
               this.txt_des.text = model.crtTaskVo.dungeonStageVo.unlock_level + "级开启";
            }
         }
      }
      
      private function showHasRewardEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(!hasRwdEff)
            {
               hasRwdEff = new BmcSpriteSheet();
               hasRwdEff.y = -33;
               hasRwdEff.x = -73;
               hasRwdEff.init(130002,1,"all",true);
               TimerManager.ins.doOnce(1000,doTween);
            }
            addChild(hasRwdEff);
         }
         else if(hasRwdEff)
         {
            hasRwdEff.dispose();
            hasRwdEff = null;
            TweenLite.killTweensOf(this.img_light);
            TimerManager.ins.clearTimer(doTween);
         }
      }
      
      override protected function onResize(param1:Event) : void
      {
         super.onResize(param1);
         if(this.visible == false || stage == null)
         {
            return;
         }
         if(UIMgr.gameHeight < 730)
         {
            this.y = initY + 730 - 780;
         }
         if(UIMgr.gameHeight >= 730 && UIMgr.gameHeight < 780)
         {
            this.y = initY + UIMgr.gameHeight - 780;
         }
         else if(UIMgr.gameHeight >= 780)
         {
            this.y = initY;
         }
      }
      
      private function updateNpcIcon() : void
      {
         var _loc1_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(taskVo.dungeonStageVo.icon_id);
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(_loc1_.display_npc);
         iconRender.img_icon.url = UrlLib.headIcon(_loc1_.head_id.toString());
         var _loc3_:int = _loc2_.quality;
         _loc3_ = _loc3_ < 4?4:_loc3_;
         iconRender.img_quality.skin = rawSkin + _loc3_;
      }
      
      private function btnClickHandler(param1:Object) : void
      {
         if(!taskVo)
         {
            return;
         }
         switch(int(taskVo.status) - 1)
         {
            case 0:
               DailyTaskBtnCtrl.openTargetModuel(taskVo.targetType,taskVo.dungeonID);
               break;
            case 1:
               TaskService.ins.taskFinish(taskVo.id,getRewardHandler);
         }
      }
      
      private function getRewardHandler() : void
      {
         showEffects();
      }
      
      private function showNewTask() : void
      {
         ObserverMgr.ins.sendNotice("task_notice_update_task");
      }
      
      private function showEffects() : void
      {
         taskEffComplete();
      }
      
      private function taskEffComplete() : void
      {
         eff = null;
         FloatUtil.showGetItemsDisplayPanel(taskVo.rewardArr);
         TweenLite.to(box_content,0.2,{
            "delay":0.3,
            "x":500,
            "alpha":0
         });
         TweenLite.to(box_content,0.2,{
            "delay":0.5,
            "x":-73,
            "alpha":1
         });
         TweenLite.delayedCall(0.5,showNewTask);
         TaskModel.ins.updateTaskStatus(taskVo.id,3);
      }
      
      private function showDetailPanel() : void
      {
         ModuleMgr.ins.showModule(10421);
      }
      
      override public function show(param1:Object = null) : void
      {
         updateTaskInfo();
         super.show(param1);
         NGUtil.checkModuleShow(10420,this);
         initY = 300;
         this.onResize(null);
         this.newerGuideAlert.setVisibleList("MSG_SWITCH_MODULE_BUBBLE_ALERT",FloatBubbleUtil.lastShowingTypeId == 2);
      }
      
      private function showRedPoint() : void
      {
      }
      
      private function showLightEff(param1:Boolean) : void
      {
         if(param1)
         {
            if(!lightEff)
            {
               lightEff = new BmcSpriteSheet();
               lightEff.y = -10;
               lightEff.x = 170;
               lightEff.init(130003,1,"all",true);
            }
            addChild(lightEff);
         }
         else if(lightEff)
         {
            lightEff.dispose();
            lightEff = null;
         }
      }
      
      private function showOrHideContent(param1:Object) : void
      {
         ModuleMgr.ins.showModule(13000);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         if(param1 == "miniTask")
         {
            return this.box_content;
         }
         return null;
      }
   }
}
