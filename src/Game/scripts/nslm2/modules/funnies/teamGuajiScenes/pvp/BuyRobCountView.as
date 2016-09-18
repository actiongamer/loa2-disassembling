package nslm2.modules.funnies.teamGuajiScenes.pvp
{
   import game.ui.teamGuajiScenes.mains.BuyRobCountUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.common.model.PlayerModel;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.AlertUtil;
   
   public class BuyRobCountView extends BuyRobCountUI
   {
       
      
      public var COUNT_PER:int = 1;
      
      private var already_buy:int;
      
      public function BuyRobCountView()
      {
         super();
         numBar.addEventListener("evt_numbar_value_change",numBar_change);
      }
      
      public function get numBar() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      override public function setAlert(param1:SimpleAlert) : void
      {
         super.setAlert(param1);
         this.alert.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41300272);
         this.alert.contentYesHandler = yesHandler;
         var _loc3_:int = VipModel.ins.getVipValue(10410);
         already_buy = TimePriceUtil.curTimes(5);
         var _loc2_:int = _loc3_ - already_buy;
         _loc2_ = _loc2_ < 0?0:_loc2_;
         if(_loc2_)
         {
            numBar.init(1,_loc3_ - already_buy,1);
            txt_buyCnt.color = 458496;
            txt_buyCnt.text = "(" + _loc2_ + "/" + _loc3_ + ")";
         }
         else
         {
            numBar.init(0,0,0);
            txt_buyCnt.color = 16723968;
            txt_buyCnt.text = "(0/" + _loc3_ + ")";
         }
         var _loc4_:int = TimePriceUtil.curTimePriceVo(5).count;
         this.txt_get.text = LocaleMgr.ins.getStr(41300274,[COUNT_PER,_loc4_]);
         this.txt_tip.text = LocaleMgr.ins.getStr(41300273,[PlayerModel.ins.vip,_loc3_]);
      }
      
      private function numBar_change(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = this.numBar.nowNum;
         _loc5_ = 1;
         while(_loc5_ <= _loc4_)
         {
            _loc2_ = _loc2_ + TimePriceUtil.getCost(5,already_buy + _loc5_).count;
            _loc5_++;
         }
         var _loc3_:WealthVo = WealthUtil.needVo(3,0,_loc2_);
         this.txt_get.text = LocaleMgr.ins.getStr(41300274,[COUNT_PER * int(_loc4_),_loc2_]);
      }
      
      private function successHandler() : void
      {
         var _loc1_:int = this.numBar.nowNum;
         AlertUtil.float(LocaleMgr.ins.getStr(41300246,[_loc1_]));
         this.alert.onYes();
      }
      
      private function yesHandler() : void
      {
         var _loc1_:int = this.numBar.nowNum;
         if(_loc1_)
         {
            TimePriceUtil.buyTimes(5,_loc1_,successHandler);
         }
      }
   }
}
