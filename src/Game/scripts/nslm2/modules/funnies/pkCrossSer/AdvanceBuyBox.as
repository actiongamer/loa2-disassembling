package nslm2.modules.funnies.pkCrossSer
{
   import game.ui.shenYuans.ShenYuanBuyBoxUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.foundations.TimePriceUtil;
   import flash.events.Event;
   import nslm2.modules.foundations.vip.model.VipModel;
   
   public class AdvanceBuyBox extends ShenYuanBuyBoxUI
   {
       
      
      private var maxBuyCnt:int = 0;
      
      private var alreadyBuy:int;
      
      private var _timePriceId:int;
      
      private var _titleLangId:int;
      
      private var _getLangId:int;
      
      private var _yesHandler:Function;
      
      private var _vipTimesId:int;
      
      public function AdvanceBuyBox(param1:int, param2:int, param3:uint, param4:uint, param5:uint, param6:Function = null)
      {
         super();
         _timePriceId = param1;
         _titleLangId = param4;
         _vipTimesId = param2;
         _yesHandler = param6;
         _getLangId = param5;
         alreadyBuy = TimePriceUtil.curTimes(param1);
         maxBuyCnt = int(VipModel.ins.getVipValue(param2));
         numBar.addEventListener("evt_numbar_value_change",numBar_change);
         this.txt_tip.text = LocaleMgr.ins.getStr(param3);
         wealth_diamond.visible = false;
         txt_get.width = NaN;
         txt_get.autoSize = "left";
      }
      
      public function get numBar() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      override public function setAlert(param1:SimpleAlert) : void
      {
         super.setAlert(param1);
         this.alert.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(_titleLangId);
         this.txt_title.text = LocaleMgr.ins.getStr(_titleLangId);
         this.alert.contentYesHandler = onYes;
         var _loc3_:int = maxBuyCnt - alreadyBuy;
         _loc3_ = _loc3_ < 0?0:_loc3_;
         if(_loc3_)
         {
            numBar.init(1,maxBuyCnt - alreadyBuy,1);
            txt_buyCnt.color = 458496;
            txt_buyCnt.text = "(" + _loc3_ + "/" + maxBuyCnt + ")";
         }
         else
         {
            numBar.init(0,0,0);
            txt_buyCnt.color = 16723968;
            txt_buyCnt.text = "(0/" + maxBuyCnt + ")";
         }
         if(alreadyBuy == 0)
         {
            this.txt_firstBuy.visible = EnvConfig.ins.showQQModule;
         }
         else
         {
            this.txt_firstBuy.visible = false;
         }
         var _loc2_:int = TimePriceUtil.getCost(_timePriceId,alreadyBuy + 1).count;
         this.txt_get.text = LocaleMgr.ins.getStr(_getLangId,[1,_loc2_]);
      }
      
      protected function onYes() : void
      {
         var _loc1_:int = this.numBar.nowNum;
         TimePriceUtil.buyTimes(_timePriceId,_loc1_,_yesHandler,_vipTimesId);
         this.alert.onYes();
      }
      
      private function numBar_change(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = this.numBar.nowNum;
         _loc4_ = 1;
         while(_loc4_ <= _loc3_)
         {
            _loc2_ = _loc2_ + TimePriceUtil.getCost(_timePriceId,alreadyBuy + _loc4_).count;
            _loc4_++;
         }
         this.txt_get.text = LocaleMgr.ins.getStr(_getLangId,[_loc3_,_loc2_]);
      }
   }
}
