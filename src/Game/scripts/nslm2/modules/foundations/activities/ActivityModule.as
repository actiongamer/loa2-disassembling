package nslm2.modules.foundations.activities
{
   import game.ui.activities.ActivityModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.modules.foundations.activities.service.ActivityService;
   import nslm2.modules.foundations.activities.utils.ActivityTimeManager;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.activities.vo.ActivityInfoVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.activities.utils.ActivityUtil;
   import proto.StaticActivity;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.foundations.activities.consts.ActivityConsts;
   import com.mz.core.interFace.IViewStackPage;
   
   public class ActivityModule extends ActivityModuleUI
   {
       
      
      private var _aids:Array;
      
      public var subViewStack:ViewStack;
      
      public function ActivityModule()
      {
         subViewStack = new ViewStack();
         super();
      }
      
      public function get model() : ActivityModel
      {
         return ActivityModel.ins;
      }
      
      public function get service() : ActivityService
      {
         return ActivityService.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         switchEventListeners(true);
         if(model.needHotUpdate)
         {
            ActivityTimeManager.ins.clear();
            model.needHotUpdate = false;
            service.getStaticData();
         }
         else
         {
            service.getInfo();
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            model.addEventListener("evtGetInfoCpl",onGetInfoCpl);
            model.addEventListener("evtRewardCpl",onRewardCpl);
         }
         else
         {
            model.removeEventListener("evtGetInfoCpl",onGetInfoCpl);
            model.removeEventListener("evtRewardCpl",onRewardCpl);
         }
      }
      
      private function onGetInfoCpl(param1:MzEvent) : void
      {
         this.moduleServerCpl();
      }
      
      private function onRewardCpl(param1:MzEvent) : void
      {
         var _loc2_:ActivityInfoVo = param1.data as ActivityInfoVo;
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(_loc2_.staticActivityReward.reward));
         if(ActivityUtil.isExChangeEvent(_loc2_.staticActivityReward) && ActivityUtil.hasChanged)
         {
            ActivityUtil.setActivityInfoVoCount(param1.data);
         }
         refresh((_aids[this.list_activity.selectedIndex] as StaticActivity).id);
      }
      
      private function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.pageBar.bindList(this.list_activity);
         this.list_activity.selectHandler = listSelect;
         this._aids = ActivityModel.ins.filterStaticActivities();
         subViewStack.subViewClasses = ActivityConsts.panelArr;
         subViewStack.x = 190;
         subViewStack.y = 63;
         this.addChild(subViewStack);
         this.list_activity.dataSource = _aids;
         this.list_activity.selectedIndex = 0;
         this.preShowCpl();
      }
      
      private function listSelect(param1:int) : void
      {
         if(_aids.length > 0)
         {
            refresh((_aids[param1] as StaticActivity).id);
         }
         else
         {
            this.subViewStack.selectedIndex = 0;
         }
      }
      
      private function refresh(param1:int) : void
      {
         var _loc2_:int = 0;
         if(model.nowShowActivity && (ActivityUtil.lastPay || ActivityUtil.lastReward))
         {
            var _loc6_:int = 0;
            var _loc5_:* = model.getRewardVos(model.nowShowActivity.id);
            for each(var _loc4_ in model.getRewardVos(model.nowShowActivity.id))
            {
               if(_loc4_.staticActivityReward.id == ActivityUtil.lastRewardId)
               {
                  ActivityUtil.setActivityInfoVoCount(_loc4_);
               }
            }
         }
         var _loc3_:StaticActivity = model.getStaticActivity(param1);
         ActivityModel.ins.nowShowActivity = _loc3_;
         if(_loc3_.actLink && (_loc3_.actLink.indexOf("http://") != -1 || _loc3_.actLink.indexOf("https://") != -1))
         {
            _loc2_ = ActivityConsts.idArr.indexOf(2);
            if(this.subViewStack.selectedIndex == _loc2_)
            {
               (this.subViewStack.selection as IViewStackPage).viewStackIn();
            }
            else
            {
               this.subViewStack.selectedIndex = _loc2_;
            }
         }
         else
         {
            _loc2_ = ActivityConsts.idArr.indexOf(1);
            if(this.subViewStack.selectedIndex == _loc2_)
            {
               (this.subViewStack.selection as IViewStackPage).viewStackIn();
            }
            else
            {
               this.subViewStack.selectedIndex = _loc2_;
            }
         }
      }
   }
}
