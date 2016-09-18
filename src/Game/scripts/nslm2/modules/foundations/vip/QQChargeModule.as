package nslm2.modules.foundations.vip
{
   import game.ui.vipModule.QQChargeModuleUI;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.foundations.vip.vo.QQChargeVo;
   
   public class QQChargeModule extends QQChargeModuleUI
   {
       
      
      public function QQChargeModule()
      {
         super();
         this.panelBg.btn_close.x = this.panelBg.btn_close.x - 20;
         this.panelBg.btn_close.y = this.panelBg.btn_close.y + 14;
         this.panelBg.img_rim.skin = UrlLib.getTencentImg("chargeRim");
         this.panelBg.img_rim.sizeGrid = "0,0,0,0";
         this.img_role.skin = UrlLib.dialog("2400b");
         this.panelBg.bgCustom.addChild(this.img_line);
         this.panelBg.img_rimBg.skin = UrlLib.getTencentImg("img_backpanel");
         this.panelBg.img_rimBg.sizeGrid = "28,0,28,0";
         this.panelBg.img_rimBg.top = 20;
         this.panelBg.img_titleBg.autoSize = true;
         this.panelBg.img_titleBg.centerX = 0;
         this.panelBg.img_titleBg.y = this.panelBg.img_titleBg.y - 10;
         this.panelBg.img_titleBg.skin = UrlLib.getTencentImg("chargeTitle");
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         QQVipUtils.changeBtnSkinCharge(this.btn_beVip);
         this.img_tip1.skin = UrlLib.getQQVipImg("charge_img_tip1");
         var _loc3_:Array = [];
         var _loc2_:Array = [10,100,500,1000,5000,10000];
         var _loc5_:int = _loc2_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = new QQChargeVo();
            _loc4_.price = _loc2_[_loc6_] / 10;
            _loc4_.diamondNum = _loc2_[_loc6_];
            _loc3_.push(_loc4_);
            this.list_items.array = _loc3_;
            _loc6_++;
         }
         super.preShow(param1);
      }
   }
}
