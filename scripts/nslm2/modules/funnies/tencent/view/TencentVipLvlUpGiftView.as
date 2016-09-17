package nslm2.modules.funnies.tencent.view
{
   import game.ui.TencentModule.view.TencentVipLvlUpGiftViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS3;
   import nslm2.modules.funnies.tencent.model.TencentVipModel;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.common.model.PlayerModel;
   import flash.events.Event;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TencentVipLvlUpGiftView extends TencentVipLvlUpGiftViewUI implements IViewStackPage
   {
       
      
      public function TencentVipLvlUpGiftView()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.btn_get.label = LocaleMgr.ins.getStr(41300099);
         TencentVipModel.ins.addEventListener("EVT_GET_GIFT_LEVEL_UP",onGetGift);
      }
      
      public function get pageBar() : PageBarS3
      {
         return this.pageBarUi as PageBarS3;
      }
      
      override public function dispose() : void
      {
         TencentVipModel.ins.removeEventListener("EVT_GET_GIFT_LEVEL_UP",onGetGift);
         super.dispose();
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            TencentVipModel.ins.server_qqLevelGift();
         }
      }
      
      public function viewStackIn() : void
      {
         var _loc3_:int = 0;
         this.visible = true;
         var _loc1_:Array = [];
         var _loc2_:int = 6;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(_loc3_ + 1);
            _loc3_++;
         }
         this.list_reward.array = _loc1_;
         this.pageBar.bindList(this.list_reward);
         QQVipUtils.changeBtnSkinCharge(btn_charge);
         this.refreshBtn();
      }
      
      private function refreshBtn() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         this.btn_get.disabled = !NpcFuncService.ins.getVo(60713).count > 0;
         var _loc2_:Array = TencentVipModel.ins.giftLevelUpWaitGet();
         if(_loc2_.length == 0)
         {
            _loc3_ = Math.floor(PlayerModel.ins.level / 10);
            _loc1_ = Math.min(list_reward.totalPage - 1,Math.floor(_loc3_ / 2));
         }
         else
         {
            _loc1_ = Math.floor((_loc2_[0] - 1) / 2);
         }
         this.pageBar.pageTo(_loc1_,false);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      public function onGetGift(param1:Event) : void
      {
         this.list_reward.refresh();
         refreshBtn();
      }
   }
}
