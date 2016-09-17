package nslm2.modules.funnies.teamGuajiScenes.mains
{
   import game.ui.teamGuajiScenes.mains.BuyGuajiEnergyUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.RTools;
   import nslm2.modules.foundations.TimePriceUtil;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.AlertUtil;
   
   public class BuyGuajiEnergy extends BuyGuajiEnergyUI
   {
      
      private static const MAX_BUY_CNT:int = 20;
       
      
      private var global_price:Array;
      
      private var already_buy:int;
      
      public function BuyGuajiEnergy()
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
         this.alert.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000619);
         txt_tip.align = RTools.cl("center","left");
         this.txt_tip.text = LocaleMgr.ins.getStr(41210604);
         this.alert.contentYesHandler = yesHandler;
         already_buy = TimePriceUtil.curTimes(4);
         var _loc2_:int = 20 - already_buy;
         _loc2_ = _loc2_ < 0?0:_loc2_;
         if(_loc2_)
         {
            numBar.init(1,20 - already_buy,1);
            txt_buyCnt.color = 458496;
            txt_buyCnt.text = "(" + _loc2_ + "/" + 20 + ")";
         }
         else
         {
            numBar.init(0,0,0);
            txt_buyCnt.color = 16723968;
            txt_buyCnt.text = "(0/20)";
         }
         this.wealth_diamond.dataSource = TimePriceUtil.curTimePriceVo(4);
      }
      
      private function numBar_change(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = this.numBar.nowNum;
         _loc5_ = 1;
         while(_loc5_ <= _loc4_)
         {
            _loc2_ = _loc2_ + TimePriceUtil.getCost(4,already_buy + _loc5_).count;
            _loc5_++;
         }
         var _loc3_:WealthVo = WealthUtil.needVo(3,0,_loc2_);
         this.wealth_diamond.dataSource = _loc3_;
         this.txt_get.text = LocaleMgr.ins.getStr(999000463,[int(_loc4_) * 10]);
      }
      
      private function yesHandler() : void
      {
         var _loc1_:int = this.numBar.nowNum;
         if(_loc1_)
         {
            TimePriceUtil.buyTimes(4,_loc1_,buySuccessHanlder);
         }
         this.alert.onYes();
      }
      
      private function buySuccessHanlder() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(3008) + "+" + this.numBar.nowNum * 10);
      }
   }
}
