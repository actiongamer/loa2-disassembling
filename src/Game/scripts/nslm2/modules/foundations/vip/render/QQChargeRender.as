package nslm2.modules.foundations.vip.render
{
   import game.ui.vipModule.render.QQChargeRenderUI;
   import nslm2.modules.foundations.vip.vo.QQChargeVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.vip.model.VipModel;
   
   public class QQChargeRender extends QQChargeRenderUI
   {
       
      
      private var _data:QQChargeVo;
      
      public function QQChargeRender()
      {
         super();
         this.btn_buy.addEventListener("click",onClick);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as QQChargeVo;
         if(_data == null)
         {
            return;
         }
         this.img_bg.skin = UrlLib.getTencentImg("chargeRenderBg");
         this.img_diamond.skin = UrlLib.itemIcon(3);
         this.img_iconShow.skin = UrlLib.getTencentImg("chargeRenderIcon" + (this.listCellVo.dataIndex + 1));
         this.diamond_value.value = _data.diamondNum;
         this.btn_buy.label = "¥" + _data.price;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         VipModel.ins.qq_addGoods(this.listCellVo.dataIndex + 1);
      }
   }
}
