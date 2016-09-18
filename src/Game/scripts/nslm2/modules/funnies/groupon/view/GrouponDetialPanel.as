package nslm2.modules.funnies.groupon.view
{
   import game.ui.groupon.GrouponDetialViewUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.groupon.vo.GrouponVo;
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.NumberUtil;
   import com.mz.core.configs.ClientConfig;
   import nslm2.utils.RTools;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.funnies.groupon.view.render.GrouponProgressBar;
   import nslm2.common.model.PlayerModel;
   import proto.MapKey32Value32;
   import com.mz.core.utils.MathUtil;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.groupon.vo.GrouponBuyInfo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class GrouponDetialPanel extends GrouponDetialViewUI implements IObserver
   {
       
      
      private var _data:GrouponVo;
      
      private var model:GrouponModel;
      
      private var cdCtr:TextCDCtrlS2;
      
      private var isStart:Boolean;
      
      private var oriCost:WealthVo;
      
      public function GrouponDetialPanel()
      {
         model = GrouponModel.ins;
         super();
         ObserverMgr.ins.regObserver(this);
         txt_rule1.text = LocaleMgr.ins.getStr(30000715);
         txt_rule2.text = LocaleMgr.ins.getStr(30000716);
         txt_rule3.text = LocaleMgr.ins.getStr(30000717);
         btn_buy.clickHandler = doBuy;
         txt_useCoupon.restrict = "0-9";
         txt_useCoupon.addEventListener("change",changeCouponHandler);
         check_useCoupon.addEventListener("change",updateBackCouponAndScore);
      }
      
      protected function changeCheckHandler(param1:Event) : void
      {
         changeCouponHandler(null);
      }
      
      protected function showVipModule(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(10800,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      public function getFocusNotices() : Array
      {
         return ["groupon_notice_update_detail"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("groupon_notice_update_detail" === _loc3_)
         {
            update();
         }
      }
      
      private function update() : void
      {
         var _loc1_:* = null;
         _data = model.currentGrouponData;
         txt_name.text = LocaleMgr.ins.getStr(30000700) + " " + _data.sellItem.showName;
         var _loc2_:Number = _data.discount / 10;
         if(NumberUtil.isFloatNumber(_loc2_))
         {
            txt_discount.text = !!ClientConfig.isChineseLang()?RTools.getZheKou(_loc2_).toFixed(1):RTools.getZheKou(_loc2_).toFixed(0) + (!!ClientConfig.isChineseLang()?"":"%");
         }
         else
         {
            txt_discount.text = RTools.getZheKou(_loc2_) + "" + (!!ClientConfig.isChineseLang()?"":"%");
         }
         itemRender.dataSource = _data.sellItem;
         oriCost = WealthUtil.parseCostStr(_data.staticData.costRes,false);
         oriPrice.dataSource = oriCost;
         oriCost.count = _data.nowPrice;
         nowPrice.dataSource = oriCost;
         img_discount.url = UrlLib.moduleMallBarginBg(_data.discount * 10);
         (progressBar as GrouponProgressBar).init(_data.discountArr);
         (progressBar as GrouponProgressBar).value = _data.buyCount;
         progressBar.toolTip = _data.buyCount + "/" + _data.discountArr[_data.discountArr.length - 1].activateCount;
         var _loc4_:int = _data.maxBuyCnt;
         var _loc3_:int = _data.canBuyCnt;
         if(_loc3_)
         {
            txt_countLimit.color = 458496;
            txt_countLimit.text = "(" + _loc3_ + "/" + _loc4_ + ")";
         }
         else
         {
            txt_countLimit.color = 16723968;
            txt_countLimit.text = "(0/" + _loc4_ + ")";
         }
         if(PlayerModel.ins.vip < 15)
         {
            _loc1_ = _data.nextVipBuyCnt;
            if(_loc1_)
            {
               txt_vipBuyCnt.text = LocaleMgr.ins.getStr(30121034,[_loc1_.key,_loc1_.value]);
            }
            else
            {
               txt_vipBuyCnt.text = "";
            }
         }
         else
         {
            txt_vipBuyCnt.text = "";
         }
         txt_resetTip.visible = _data.staticData.resetKind == 1;
         txt_maxUse.text = LocaleMgr.ins.getStr(30000720,[_data.maxUseCouponCnt]);
         updateStatus();
         changeCouponHandler(null);
      }
      
      protected function changeCouponHandler(param1:Event) : void
      {
         var _loc2_:int = txt_useCoupon.text;
         if(param1)
         {
            _loc2_ = MathUtil.min([_loc2_,_data.maxUseCouponCnt,PlayerModel.ins.getWealthValue(27)]);
         }
         else
         {
            _loc2_ = MathUtil.min([_data.maxUseCouponCnt,PlayerModel.ins.getWealthValue(27)]);
         }
         txt_useCoupon.text = _loc2_ + "";
         updateBackCouponAndScore();
      }
      
      private function updateBackCouponAndScore(param1:Event = null) : void
      {
         if(param1 != null && check_useCoupon.selected)
         {
            txt_useCoupon.text = Math.min(_data.maxUseCouponCnt,PlayerModel.ins.getWealthValue(27)) + "";
         }
         var _loc2_:int = txt_useCoupon.text;
         if(check_useCoupon.selected)
         {
            txt_back.text = LocaleMgr.ins.getStr(30000721,[int((_data.nowPrice - _loc2_) * 0.1),int((_data.nowPrice - _loc2_) * 0.1)]);
         }
         else
         {
            txt_back.text = LocaleMgr.ins.getStr(30000721,[int(_data.nowPrice * 0.1),int(_data.nowPrice * 0.1)]);
         }
      }
      
      private function updateStatus() : void
      {
         if(ServerTimer.ins.second >= _data.openStamp)
         {
            if(ServerTimer.ins.second >= _data.endStamp)
            {
               btn_buy.disabled = true;
               btn_buy.label = LocaleMgr.ins.getStr(30000722);
               txt_cd.visible = false;
               if(cdCtr)
               {
                  cdCtr.dispose();
               }
               isStart = false;
            }
            else
            {
               btn_buy.disabled = false;
               btn_buy.label = LocaleMgr.ins.getStr(30000709);
               txt_cd.visible = true;
               isStart = true;
               startCountDown(_data.endStamp);
               if(_data.canBuyCnt == 0)
               {
                  btn_buy.disabled = true;
               }
            }
         }
         else
         {
            btn_buy.disabled = true;
            btn_buy.label = LocaleMgr.ins.getStr(30000710);
            txt_cd.visible = true;
            startCountDown(_data.openStamp);
            isStart = false;
         }
      }
      
      private function doBuy() : void
      {
         var _loc1_:int = 0;
         if(check_useCoupon.selected)
         {
            _loc1_ = txt_useCoupon.text;
         }
         else
         {
            _loc1_ = 0;
         }
         var _loc2_:int = _data.nowPrice - _loc1_;
         if(PlayerModel.ins.diamond < _loc2_)
         {
            AlertUtil.showRechargeAlert();
         }
         else
         {
            showBuyComfirmPanel(_data.nowPrice,_loc1_);
         }
      }
      
      private function showBuyComfirmPanel(param1:int, param2:int) : void
      {
         var _loc3_:GrouponBuyInfo = new GrouponBuyInfo();
         _loc3_.id = _data.id;
         _loc3_.canBuyCnt = _data.canBuyCnt;
         _loc3_.item = _data.sellItem;
         _loc3_.diamond = param1;
         _loc3_.coupon = param2;
         _loc3_.wealthKind = oriCost.kind;
         ModuleMgr.ins.showModule(60561,_loc3_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function startCountDown(param1:uint) : void
      {
         if(!cdCtr)
         {
            cdCtr = new TextCDCtrlS2(txt_cd,getCdStr,cdCompleteHadler);
            parts.push(cdCtr);
         }
         cdCtr.start(param1);
      }
      
      private function getCdStr(param1:int) : String
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(isStart)
         {
            _loc2_ = 458496;
            _loc3_ = LocaleMgr.ins.getStr(30000711);
         }
         else
         {
            _loc3_ = LocaleMgr.ins.getStr(30000712);
            _loc2_ = 16723968;
         }
         return TextFieldUtil.htmlText2(_loc3_ + TimeUtils.hisCNWithDay(param1),_loc2_);
      }
      
      private function cdCompleteHadler() : void
      {
         updateStatus();
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
