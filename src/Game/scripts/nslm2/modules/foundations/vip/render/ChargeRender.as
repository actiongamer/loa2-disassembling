package nslm2.modules.foundations.vip.render
{
   import game.ui.vipModule.render.ChargeRenderUI;
   import nslm2.modules.foundations.vip.vo.ChargeVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class ChargeRender extends ChargeRenderUI
   {
       
      
      private var _data:ChargeVo;
      
      public function ChargeRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as ChargeVo;
         if(_data == null)
         {
            return;
         }
         this.img_diamond.skin = UrlLib.itemIcon(3);
         this.txt_desc.text = LocaleMgr.ins.getStr(_data.desc);
         this.diamond_value.value = StcMgr.ins.getGlobalPriceVo(_data.num).price;
         this.btn_buy.label = "¥" + this.diamond_value.value / 10;
      }
   }
}
