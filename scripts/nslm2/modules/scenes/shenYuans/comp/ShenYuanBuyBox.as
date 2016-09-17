package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanBuyBoxUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.foundations.TimePriceUtil;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import proto.ShenYuanGetMysteriBoxReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ShenYuanGetMysteriBoxRes;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ShenYuanBuyBox extends ShenYuanBuyBoxUI
   {
      
      public static const MAX_BUY_CNT:int = 20;
       
      
      private var global_price:Array;
      
      private var already_buy:int;
      
      public function ShenYuanBuyBox()
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
         this.alert.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41500137);
         this.alert.contentYesHandler = yesHandler;
         already_buy = ShenYuanModel.ins.boxOpenNum;
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
         if(already_buy == 0)
         {
            this.txt_firstBuy.visible = EnvConfig.ins.showQQModule;
         }
         else
         {
            this.txt_firstBuy.visible = false;
         }
         this.wealth_diamond.dataSource = TimePriceUtil.getCost(6,already_buy + 1);
         this.txt_get.text = LocaleMgr.ins.getStr(41500140,[1]);
      }
      
      private function numBar_change(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = this.numBar.nowNum;
         _loc5_ = 1;
         while(_loc5_ <= _loc4_)
         {
            _loc2_ = _loc2_ + TimePriceUtil.getCost(6,already_buy + _loc5_).count;
            _loc5_++;
         }
         var _loc3_:WealthVo = WealthUtil.needVo(3,0,_loc2_);
         this.wealth_diamond.dataSource = _loc3_;
         this.txt_get.text = LocaleMgr.ins.getStr(41500140,[_loc4_]);
      }
      
      private function yesHandler() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = this.numBar.nowNum;
         if(_loc1_)
         {
            _loc2_ = new ShenYuanGetMysteriBoxReq();
            _loc2_.num = _loc1_;
            ServerEngine.ins.send(6075,_loc2_,buySuccessHanlder);
         }
         this.alert.onYes();
      }
      
      private function buySuccessHanlder(param1:ShenYuanGetMysteriBoxRes) : void
      {
         this.txt_firstBuy.visible = false;
         ShenYuanModel.ins.boxOpenNum = param1.boxOpenNum;
         ObserverMgr.ins.sendNotice("SHENYUAN_OPEN_DIAMOND_BOX",param1);
      }
   }
}
