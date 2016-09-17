package nslm2.modules.funnies.tencent.consts
{
   import com.mz.core.configs.EnvConfig;
   import morn.core.utils.URLUtils;
   import morn.core.components.Button;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.common.model.PlayerModel;
   import flash.display.BitmapData;
   import nslm2.modules.funnies.tencent.model.QQWeiDuanGiftService;
   import com.mz.core.logging.Log;
   
   public class QQVipUtils
   {
      
      public static const MSG_QQ_VIP_TAB_CHANGE:String = "MSG_QQ_VIP_TAB_CHANGE";
       
      
      public function QQVipUtils()
      {
         super();
      }
      
      public static function toOffical() : void
      {
         var _loc1_:* = null;
         if(EnvConfig.ins.vipType == 1)
         {
            _loc1_ = "http://v.qzone.qq.com";
         }
         else
         {
            _loc1_ = "http://gamevip.qq.com/?ADTAG=VIP.WEB.NSLM";
         }
         URLUtils.openWindow(_loc1_);
      }
      
      public static function changeBtnSkinCharge(param1:Button, param2:int = 1) : void
      {
         var _loc4_:String = SkinLib.qqVipAssets(PlayerModel.ins.vipInfoVo.curQQVip > 0?"renewal":"charge");
         if(param2 == 2 && EnvConfig.ins.vipType == 2)
         {
            _loc4_ = _loc4_ + "_2";
         }
         var _loc3_:BitmapData = App.asset.getBitmapData(_loc4_);
         param1.width = _loc3_.width;
         param1.height = _loc3_.height;
         param1.skin = _loc4_;
         param1.addEventListener("click",onQQVipUrl);
      }
      
      public static function changeBtnSkinChargeYear(param1:Button) : void
      {
         var _loc3_:String = SkinLib.qqVipAssets("chargeyearly");
         var _loc2_:BitmapData = App.asset.getBitmapData(_loc3_);
         param1.width = _loc2_.width;
         param1.height = _loc2_.height;
         param1.skin = _loc3_;
         param1.addEventListener("click",onQQVipUrlYear);
      }
      
      public static function onQQVipUrl(... rest) : void
      {
         openToQQVipAPI(false);
      }
      
      public static function onQQVipUrlYear(... rest) : void
      {
         openToQQVipAPI(true);
      }
      
      public static function openToQQVipAPI(param1:Boolean, param2:Boolean = true) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(EnvConfig.ins.vipType == 1)
         {
            if(param1)
            {
               _loc3_ = "http://pay.qq.com/qzone/index.shtml?aid=game1104913333.op&paytime=year";
            }
            else
            {
               _loc3_ = "http://pay.qq.com/qzone/index.shtml?aid=game1104913333.op";
            }
            URLUtils.openWindow(_loc3_);
         }
         else
         {
            if(QQWeiDuanGiftService.ins.checkIsFromWeiDuan() || EnvConfig.ins.useQQ_LEAGUE || EnvConfig.ins.pf == "website")
            {
               if(param1)
               {
                  _loc4_ = "window.BlueVipApi.buyBlueVip(1104913333,\"15200\",\"VIP.APP1104913333.PLATunionmini\",\"\",12)";
               }
               else
               {
                  _loc4_ = "window.BlueVipApi.buyBlueVip(1104913333,\"15200\",\"VIP.APP1104913333.PLATunionmini\",\"\",\"\")";
               }
            }
            else if(param1)
            {
               _loc4_ = "GameAPI.NewOpenGameVIPService.show(1104913333,qqcb,\"VIP.APP1104913333.PLATqqgamemini\",3,12)";
            }
            else
            {
               _loc4_ = "GameAPI.NewOpenGameVIPService.show(1104913333,qqcb,\"VIP.APP1104913333.PLATqqgamemini\",3,3)";
            }
            Log.debug(QQVipUtils,"openToQQVipAPI:",_loc4_);
            URLUtils.callJS(_loc4_);
         }
      }
      
      public static function buy(param1:String, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(EnvConfig.ins.isQQGame)
         {
            _loc3_ = "GameAPI.BuyBox.show(1104913333,\'" + param1 + "\'," + (!!param2?"true":"false") + ",\'充值\',qqcb,qqcb)";
         }
         else
         {
            _loc3_ = "fusion2.dialog.buy({param:\'" + param1 + "\',sandbox:" + (!!param2?"true":"false") + "})";
         }
         Log.debug(QQVipUtils,"buy:",_loc3_);
         URLUtils.callJS(_loc3_);
      }
      
      public static function pay(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(EnvConfig.ins.isQQGame)
         {
            _loc2_ = "GameAPI.Pay.show(1104913333,\'" + EnvConfig.ins.zoneId + "\'," + (!!param1?"1":"0") + ",qqcb)";
         }
         else
         {
            _loc2_ = "fusion2.dialog.pay({zoneid:\'" + EnvConfig.ins.zoneId + "\'," + (!!param1?"true":"false") + "})";
         }
         Log.debug(QQVipUtils,"buy:",_loc2_);
         URLUtils.callJS(_loc2_);
      }
      
      public static function openToQQVipAPIContinue(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(QQWeiDuanGiftService.ins.checkIsFromWeiDuan() || EnvConfig.ins.useQQ_LEAGUE || EnvConfig.ins.pf == "website")
         {
            _loc3_ = "window.BlueVipApi.buyBlueVipAct(1104913333,\"15200\",\"VIP.APP1104913333.PLATunionact\",\"UM160104164220403\",\"" + param2 + "\"," + "\"" + EnvConfig.ins.openId + "\",qqcb,\"" + EnvConfig.ins.zoneId + "\",\"v3\",\"self\")";
         }
         else
         {
            _loc3_ = "GameAPI.NewGameVIPAction.show(1104913333,\"UM160104164220403\",\"" + param2 + "\",\"" + EnvConfig.ins.zoneId + "\"," + "\"" + EnvConfig.ins.openId + "\",\"v3\",qqcb,3)";
         }
         Log.debug(QQVipUtils,"openToQQVipAPI:",_loc3_);
         URLUtils.callJS(_loc3_);
      }
   }
}
