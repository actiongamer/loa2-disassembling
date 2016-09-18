package nslm2.modules.funnies.tencent.view
{
   import game.ui.TencentModule.view.TencentVipRewardViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.tencent.model.TencentVipModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import morn.customs.expands.MornExpandUtil;
   
   public class TencentVipRewardView extends TencentVipRewardViewUI implements IViewStackPage
   {
       
      
      private var oriX:int;
      
      public function TencentVipRewardView()
      {
         super();
         oriX = this.btn_charge.x;
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         TencentVipModel.ins.addEventListener("EVT_GET_GIFT_DAILY_YEAR",onGetGiftYear);
      }
      
      override public function dispose() : void
      {
         TencentVipModel.ins.removeEventListener("EVT_GET_GIFT_DAILY_YEAR",onGetGiftYear);
         super.dispose();
      }
      
      public function viewStackIn() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         this.visible = true;
         this.label_title1.text = LocaleMgr.ins.getStr(EnvConfig.ins.vipType == 1?60710106:60710606);
         this.label_title3.text = LocaleMgr.ins.getStr(EnvConfig.ins.vipType == 1?60710107:60710607);
         this.img_vipYearly.skin = UrlLib.getQQVipImg("img_vipYearly");
         this.img_vipYearlyLux.skin = UrlLib.getQQVipImg("img_vipLux");
         var _loc3_:int = DefindConsts.QQ_VIP_LV_MAX;
         var _loc2_:Array = [];
         _loc4_ = 1;
         while(_loc4_ <= _loc3_)
         {
            _loc1_ = WealthUtil.costStrToArr(DefindConsts.getQQVip_DAY_LV(_loc4_));
            _loc2_.push(_loc1_);
            _loc4_++;
         }
         if(EnvConfig.ins.vipType == 2)
         {
            this.btn_charge.x = oriX - 60;
         }
         listDay.dataSource = _loc2_;
         this.list_yearly.array = WealthUtil.costStrToArr(DefindConsts.getQQVip_DAY_YEAR());
         this.list_yearlyLux.array = WealthUtil.costStrToArr(DefindConsts.getQQVip_DAY_LUX());
         QQVipUtils.changeBtnSkinCharge(btn_charge);
         QQVipUtils.changeBtnSkinChargeYear(btn_chargeYearly);
         refereshBtnGetReward();
      }
      
      private function refereshBtnGetReward() : void
      {
         if(PlayerModel.ins.vipInfoVo.curQQVip && (PlayerModel.ins.vipInfoVo.isQQYear || PlayerModel.ins.vipInfoVo.isQQLux))
         {
            if(NpcFuncService.ins.getVo(60715).count)
            {
               this.btn_getReward.disabled = false;
               this.btn_getReward.label = LocaleMgr.ins.getStr(999000240);
            }
            else
            {
               this.btn_getReward.disabled = true;
               this.btn_getReward.label = LocaleMgr.ins.getStr(10600041);
            }
         }
         else
         {
            this.btn_getReward.label = LocaleMgr.ins.getStr(999000240);
            this.btn_getReward.disabled = true;
         }
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(btn_getReward === _loc3_)
         {
            TencentVipModel.ins.server_qqDayHighGift();
         }
      }
      
      private function onGetGiftYear(param1:Event) : void
      {
         this.refereshBtnGetReward();
      }
   }
}
