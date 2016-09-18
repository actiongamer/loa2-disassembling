package nslm2.modules.foundations.sevenDays
{
   import game.ui.sevenDayModule.SevenDaysModuleUI;
   import nslm2.modules.foundations.sevenDays.model.SevenDaysModel;
   import morn.core.components.ViewStack;
   import proto.SevenDayInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.sevenDays.service.SevenDaysService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.sevenDays.view.SevenDaysGiftView;
   import nslm2.modules.foundations.sevenDays.view.SevDaysMainTskView;
   import nslm2.modules.foundations.sevenDays.view.SevDaysEnhTskView;
   import nslm2.modules.foundations.sevenDays.view.HalfPriceView;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.foundations.sevenDays.view.DayRender;
   import proto.SevenDayInfoRes;
   import proto.SevenDayTimeStampRes;
   import morn.core.components.Button;
   
   public class SevenDaysModule extends SevenDaysModuleUI
   {
       
      
      private var model:SevenDaysModel;
      
      private var vs:ViewStack;
      
      private var today:int = 0;
      
      public function SevenDaysModule()
      {
         model = SevenDaysModel.ins;
         super();
      }
      
      public function getSevenDayInfo(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:SevenDayInfoReq = new SevenDayInfoReq();
         if(param2 == true)
         {
            _loc3_.day = 0;
         }
         else
         {
            _loc3_.day = param1 + 1;
            today = param1 + 1;
         }
         ServerEngine.ins.send(4070,_loc3_,onDailyInfoCpl);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(SevenDaysService.ins.isDead)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(9100000 + 13100) + LocaleMgr.ins.getStr(999000360));
            ObserverMgr.ins.sendNotice("sevenday_notice_event_not_avail");
            ModuleMgr.ins.closeModule(this.moduleId);
            return;
         }
         SevenDaysService.ins.getInitSevenDayInfo();
         vs = new ViewStack();
         vs.x = 220;
         vs.y = 71;
         addChild(vs);
         vs.subViewClasses = [SevenDaysGiftView,SevDaysMainTskView,SevDaysEnhTskView,HalfPriceView];
         getSevenDayInfo(0,true);
         ObserverMgr.ins.regObserver(this);
         this.panelBg.titleImgId = 13100;
         vs.selectedIndex = 0;
         tabBar.selectHandler = selectHandler;
         super.preShow();
      }
      
      public function getSDStcVOs() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_.push(StcMgr.ins.getSevendayRewardVo(_loc2_ + 1));
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
         return ["sevenday_notice_card_click","sevenday_notice_update_red_point","sevenday_notice_update_shop","sevenday_notice_update_login","sevenday_notice_update_task"];
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
                     }
                  }
                  addr55:
                  day_list.selectedIndex = param2 as int;
                  updateRedPointStatus();
               }
               addr54:
               §§goto(addr55);
            }
            else
            {
               if(int((day_list.selection as DayRender).red_point.txt_count.text) - 1 == 0)
               {
                  (day_list.selection as DayRender).hideRed_point();
               }
               (day_list.selection as DayRender).red_point.txt_count.text = (int((day_list.selection as DayRender).red_point.txt_count.text) - 1).toString();
            }
            §§goto(addr54);
         }
         else
         {
            day_list.selectedIndex = param2 as int;
            getSevenDayInfo(param2 as int);
         }
      }
      
      private function onDailyInfoCpl(param1:SevenDayInfoRes) : void
      {
         if(param1 != null)
         {
            model.actualDay = param1.day - 1;
            if(today == 0)
            {
               if(param1.day > 0 && param1.day < 8)
               {
                  model.currentDay = param1.day - 1;
               }
               else if(param1.day >= 8)
               {
                  model.currentDay = 6;
               }
               else
               {
                  model.currentDay = 0;
               }
            }
            else
            {
               model.currentDay = today - 1;
            }
            model.initTasksArr(param1.taskInfos);
            model.initLoginBonusArr(param1.loginInfos);
            model.initShop(param1.shopInfo);
            model.initAvailArr(param1.avaiInfos);
         }
         update();
      }
      
      public function onEventTimeInfoCpl(param1:SevenDayTimeStampRes) : void
      {
         if(param1 != null)
         {
            model.startTime = param1.startStamp;
            model.endTime = param1.endStamp;
            model.rewardEndTime = param1.rewardEndStamp;
         }
      }
      
      public function update() : void
      {
         day_list.changeHandler = dayHandler;
         day_list.dataSource = getSDStcVOs();
         day_list.selectedIndex = model.currentDay;
         (tabBar.items[1] as Button).label = LocaleMgr.ins.getStr(model.currentDayRewardVo.sdStcVO.task_title1_id);
         (tabBar.items[2] as Button).label = LocaleMgr.ins.getStr(model.currentDayRewardVo.sdStcVO.task_title2_id);
      }
      
      private function dayHandler(param1:int) : void
      {
         (vs.items[0] as SevenDaysGiftView).updateGiftList(param1);
         getSevenDayInfo(param1);
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
         SevenDaysModel.ins.updateRedPointStatus(_loc1_);
      }
   }
}
