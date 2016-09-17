package nslm2.modules.funnies.tencent.view
{
   import game.ui.TencentModule.view.TencentVipGiftViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.tencent.model.TencentVipModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   import flash.events.Event;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import morn.customs.expands.MornExpandUtil;
   
   public class TencentVipGiftView extends TencentVipGiftViewUI implements IViewStackPage
   {
       
      
      public function TencentVipGiftView()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         TencentVipModel.ins.addEventListener("EVT_GET_NEW_GIFT",onGetNewGift);
      }
      
      override public function dispose() : void
      {
         TencentVipModel.ins.removeEventListener("EVT_GET_NEW_GIFT",onGetNewGift);
         super.dispose();
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         if(PlayerModel.ins.vip)
         {
            this.box_title1.visible = false;
            this.box_title2.visible = true;
            this.img_isVip.url = UrlLib.getQQVipImg("nishi");
         }
         else
         {
            this.box_title1.visible = true;
            this.box_title2.visible = false;
            this.img_isNotVip.url = UrlLib.getQQVipImg("img_vipNewerTip1");
         }
         txt_tip2a.text = LocaleMgr.ins.getStr(EnvConfig.ins.vipType == 1?60710104:60710604);
         refreshBtn();
      }
      
      private function refreshBtn() : void
      {
         var _loc1_:Boolean = false;
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
               _loc1_ = TencentVipModel.ins.qqGiftInfo.yellowNewVip;
               this.list_gift.dataSource = WealthUtil.costStrToArr(DefindConsts.YELLOW_NEW);
               break;
            case 1:
               _loc1_ = TencentVipModel.ins.qqGiftInfo.blueNewVip;
               this.list_gift.dataSource = WealthUtil.costStrToArr(DefindConsts.BLUE_NEW);
         }
         if(_loc1_)
         {
            this.btn_know.label = LocaleMgr.ins.getStr(10600041);
            this.btn_know.disabled = true;
         }
         else
         {
            this.btn_know.label = LocaleMgr.ins.getStr(41300099);
            if(PlayerModel.ins.vipInfoVo.curQQVip)
            {
               this.btn_know.disabled = false;
            }
            else
            {
               this.btn_know.disabled = true;
            }
         }
         QQVipUtils.changeBtnSkinCharge(btn_charge);
      }
      
      private function onGetNewGift(param1:Event) : void
      {
         this.refreshBtn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(btn_know !== _loc3_)
         {
            if(btn_charge !== _loc3_)
            {
            }
         }
         else
         {
            TencentVipModel.ins.server_qqNewGift();
         }
      }
   }
}
