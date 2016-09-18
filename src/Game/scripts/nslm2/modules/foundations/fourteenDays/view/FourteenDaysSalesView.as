package nslm2.modules.foundations.fourteenDays.view
{
   import game.ui.sevenDayModule.view.SevenDaysSalesViewUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class FourteenDaysSalesView extends SevenDaysSalesViewUI implements IObserver
   {
       
      
      private var model:FourteenDaysModel;
      
      public function FourteenDaysSalesView()
      {
         model = FourteenDaysModel.ins;
         super();
         this.event_period.text = LocaleMgr.ins.getStr(13100501,[TimeUtils.getShortTimeStr(model.startTime),TimeUtils.getShortTimeStr(model.rewardEndTime)]);
         this.img_titleBG.skin = UrlLib.sevenDayTask(1,2,4);
         titleTxt.text = LocaleMgr.ins.getStr(999902300);
         this.img_salesBg.skin = UrlLib.sevenDaySalesBG();
         ObserverMgr.ins.regObserver(this);
         refreshView();
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13100502) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      private function textCDFormat2(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13100503) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      private function refreshView() : void
      {
         this.list_sales.dataSource = model.currentDayRewardVo.buyArr.sortOn("id",16);
      }
      
      public function getFocusNotices() : Array
      {
         return ["sevenday_notice_update_shop","PLAYER_VIP_UP"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = param1;
         if("sevenday_notice_update_shop" !== _loc5_)
         {
            if("PLAYER_VIP_UP" === _loc5_)
            {
               _loc3_ = model.currentDayRewardVo.sdStcVO["vip" + PlayerModel.ins.vip].split("|").sort();
               _loc4_ = 0;
               while(_loc4_ < model.currentDayRewardVo.buyArr.length)
               {
                  model.currentDayRewardVo.buyArr[_loc4_].id = _loc3_[_loc4_];
                  _loc4_++;
               }
               refreshView();
            }
         }
         else
         {
            refreshView();
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
