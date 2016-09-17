package nslm2.modules.foundations.fourteenDays
{
   import game.ui.sevenDayModule.SevenDaysModuleUI;
   import nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel;
   import morn.core.components.ViewStack;
   import proto.FourteenInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.fourteenDays.service.FourteenDaysService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.fourteenDays.view.FourteenDaysGiftView;
   import nslm2.modules.foundations.fourteenDays.view.FourteenDaysTaskView;
   import nslm2.modules.foundations.fourteenDays.view.FourteenDaysEnhTaskView;
   import nslm2.modules.foundations.fourteenDays.view.FourteenDaysSalesView;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.foundations.sevenDays.view.DayRender;
   import proto.FourteenInfoRes;
   import morn.core.components.Button;
   
   public class FourteenDaysModule extends SevenDaysModuleUI
   {
       
      
      private var model:FourteenDaysModel;
      
      private var vs:ViewStack;
      
      private var SUB_VIEW_ARR:Array;
      
      private var today:int = 0;
      
      public function FourteenDaysModule()
      {
         model = FourteenDaysModel.ins;
         SUB_VIEW_ARR = [LocaleMgr.ins.getStr(11000826),LocaleMgr.ins.getStr(13300217),LocaleMgr.ins.getStr(13300217),LocaleMgr.ins.getStr(13300002)];
         super();
      }
      
      public function getFourteenDayInfo(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:FourteenInfoReq = new FourteenInfoReq();
         if(param2 == true)
         {
            _loc3_.day = 0;
         }
         else
         {
            _loc3_.day = param1;
            today = param1;
         }
         ServerEngine.ins.send(6231,_loc3_,onDailyInfoCpl);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(FourteenDaysService.ins.isDead)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(9100000 + 13300) + LocaleMgr.ins.getStr(999000241));
            ObserverMgr.ins.sendNotice("sevenday_notice_event_not_avail");
            ModuleMgr.ins.closeModule(this.moduleId);
            return;
         }
         FourteenDaysService.ins.getInitFourteenDayInfo();
         ObserverMgr.ins.sendNotice("HintReset");
         vs = new ViewStack();
         vs.x = 220;
         vs.y = 71;
         addChild(vs);
         tabBar.labels = SUB_VIEW_ARR.join(",");
         vs.subViewClasses = [FourteenDaysGiftView,FourteenDaysTaskView,FourteenDaysEnhTaskView,FourteenDaysSalesView];
         getFourteenDayInfo(0,true);
         ObserverMgr.ins.regObserver(this);
         this.panelBg.titleImgId = 13300;
         tabBar.selectHandler = selectHandler;
         day_list.changeHandler = dayHandler;
         super.preShow();
      }
      
      public function getSDStcVOs() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_.push(StcMgr.ins.get14DayTaskVo(_loc2_ + 8));
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function selectHandler(param1:int) : void
      {
         vs.selectedIndex = tabBar.selectedIndex;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["sevenday_notice_card_click","sevenday_notice_update_red_point","sevenday_notice_update_shop","sevenday_notice_update_login","sevenday_notice_update_task","sevenday_notice_event_refreshed"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("sevenday_notice_card_click" !== _loc3_)
         {
            if("sevenday_notice_update_red_point" !== _loc3_)
            {
               if("sevenday_notice_update_login" !== _loc3_)
               {
                  if("sevenday_notice_update_task" !== _loc3_)
                  {
                     if("sevenday_notice_update_shop" !== _loc3_)
                     {
                        if("sevenday_notice_event_refreshed" === _loc3_)
                        {
                           onDailyInfoCpl(param2 as FourteenInfoRes);
                        }
                     }
                  }
                  addr57:
                  updateRedPointStatus();
               }
               addr56:
               §§goto(addr57);
            }
            else
            {
               if(int((day_list.selection as DayRender).red_point.txt_count.text) - 1 == 0)
               {
                  (day_list.selection as DayRender).hideRed_point();
               }
               (day_list.selection as DayRender).red_point.txt_count.text = (int((day_list.selection as DayRender).red_point.txt_count.text) - 1).toString();
            }
            §§goto(addr56);
         }
         else
         {
            day_list.selectedIndex = param2 as int;
            getFourteenDayInfo((param2 as int) + 8);
         }
      }
      
      private function onDailyInfoCpl(param1:FourteenInfoRes) : void
      {
         if(param1 != null)
         {
            model.actualDay = param1.day - 1;
            if(today == 0)
            {
               if(param1.day > 0 && param1.day < 15)
               {
                  model.currentDay = param1.day - 1;
               }
               else if(param1.day >= 15)
               {
                  model.currentDay = 13;
               }
               else
               {
                  model.currentDay = 0;
               }
               vs.selectedIndex = 0;
            }
            else
            {
               model.currentDay = today - 1;
            }
            model.initTasksArr(param1.taskInfos);
            model.initLoginBonusArr(param1.loginInfos);
            model.initShop(param1.shopInfo);
            model.initAvailArr(param1.availInfos);
         }
         update();
      }
      
      public function update() : void
      {
         day_list.dataSource = getSDStcVOs();
         day_list.selectedIndex = model.currentDay - 7;
         updateTitle();
      }
      
      private function dayHandler(param1:int) : void
      {
         (vs.items[0] as FourteenDaysGiftView).updateGiftList(param1);
         getFourteenDayInfo(param1 + 8);
         updateTitle();
      }
      
      private function updateTitle() : void
      {
         (tabBar.items[1] as Button).label = LocaleMgr.ins.getStr(model.currentDayRewardVo.sdStcVO.taskTitle);
         (tabBar.items[2] as Button).label = LocaleMgr.ins.getStr(model.currentDayRewardVo.sdStcVO.taskTitle_1);
      }
      
      private function updateRedPointStatus() : void
      {
         var _loc1_:Boolean = false;
         img_redPoint1.visible = model.hasLoginBonus;
         img_redPoint2.visible = model.hasTask1Reward;
         img_redPoint3.visible = model.hasTask2Reward;
         img_redPoint4.visible = model.hasHalfPrice;
         var _loc4_:int = 0;
         var _loc3_:* = day_list.cells;
         for each(var _loc2_ in day_list.cells)
         {
            if(_loc2_.red_point.visible)
            {
               _loc1_ = true;
            }
         }
         FourteenDaysModel.ins.updateRedPointStatus(_loc1_);
      }
   }
}
