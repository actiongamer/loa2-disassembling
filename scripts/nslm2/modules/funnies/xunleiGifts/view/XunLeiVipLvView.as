package nslm2.modules.funnies.xunleiGifts.view
{
   import game.ui.xunleiGiftModule.view.XunLeiVipLvViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.xunleiGifts.services.XunLeiGiftService;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS3;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.Effect2DUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class XunLeiVipLvView extends XunLeiVipLvViewUI implements IViewStackPage
   {
       
      
      public function XunLeiVipLvView()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function get service() : XunLeiGiftService
      {
         return XunLeiGiftService.ins;
      }
      
      public function get pageBar() : PageBarS3
      {
         return this.pageBarUi as PageBarS3;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            this.service.server_xunleiJinzuanGetReward(1,service_getRewardCpl);
         }
      }
      
      public function viewStackIn() : void
      {
         this.txt_toWeb.text = LinkUtils.href("http://vip.niu.xunlei.com/pay.html?advNo=201602174813128313",LocaleMgr.ins.getStr(60600409));
         this.list_gifts.dataSource = this.service.vipLvDataSource;
         if(this.service.info.viplevel > 0)
         {
            this.list_gifts.page = Math.floor((this.service.info.viplevel - 1) / this.list_gifts.repeatY);
         }
         this.pageBar.bindList(this.list_gifts);
         this.refreshUI();
      }
      
      private function refreshUI() : void
      {
         if(service.info.viplevel > 0 && service.info.canget)
         {
            this.btn_get.label = LocaleMgr.ins.getStr(10700007);
            this.btn_get.disabled = false;
            Effect2DUtils.showBtnEff_btnBig(this.btn_get);
         }
         else
         {
            if(service.info.viplevel == 0)
            {
               this.btn_get.label = LocaleMgr.ins.getStr(10700007);
            }
            else
            {
               this.btn_get.label = LocaleMgr.ins.getStr(10700013);
            }
            this.btn_get.disabled = true;
            Effect2DUtils.hideBtnEff_btnBig(this.btn_get);
         }
      }
      
      private function service_getRewardCpl() : void
      {
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
      }
   }
}
