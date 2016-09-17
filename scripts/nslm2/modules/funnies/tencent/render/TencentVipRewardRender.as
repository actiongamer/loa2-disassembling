package nslm2.modules.funnies.tencent.render
{
   import game.ui.TencentModule.render.TencentVipRewardRenderUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.tencent.model.TencentVipModel;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.common.model.PlayerModel;
   import flash.events.Event;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class TencentVipRewardRender extends TencentVipRewardRenderUI
   {
       
      
      public function TencentVipRewardRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.btn_get.x = this.btn_get.x - 12;
         this.btn_get.y = this.btn_get.y - 2;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            TencentVipModel.ins.removeEventListener("EVT_GET_GIFT_DAILY",onGift);
            TencentVipModel.ins.addEventListener("EVT_GET_GIFT_DAILY",onGift);
            TencentVipModel.ins.server_qqGiftDaily();
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.list_reward.array = param1 as Array;
         }
         this.img_vipLvl.skin = SkinLib.vipIconPic(this.listCellVo.dataIndex + 1,false,false);
         this.btn_get.visible = this.listCellVo.dataIndex + 1 == PlayerModel.ins.vipInfoVo.curQQVip;
         if(this.btn_get.visible)
         {
            this.btn_get.style = "按钮中绿";
            refreshBtn();
         }
      }
      
      private function onGift(param1:Event) : void
      {
         TencentVipModel.ins.removeEventListener("EVT_GET_GIFT_DAILY",onGift);
         refreshBtn();
      }
      
      private function refreshBtn() : void
      {
         if(EnvConfig.ins.vipType == 2)
         {
            if(TencentVipModel.ins.qqGiftInfo.blueDayVip)
            {
               this.btn_get.label = LocaleMgr.ins.getStr(10600041);
               this.btn_get.disabled = true;
            }
            else
            {
               this.btn_get.label = LocaleMgr.ins.getStr(999000240);
               this.btn_get.disabled = false;
            }
         }
         else if(TencentVipModel.ins.qqGiftInfo.yellowDayVip)
         {
            this.btn_get.label = LocaleMgr.ins.getStr(10600041);
            this.btn_get.disabled = true;
         }
         else
         {
            this.btn_get.label = LocaleMgr.ins.getStr(999000240);
            this.btn_get.disabled = false;
         }
      }
      
      override public function dispose() : void
      {
         TencentVipModel.ins.removeEventListener("EVT_GET_GIFT_DAILY",onGift);
         super.dispose();
      }
   }
}
