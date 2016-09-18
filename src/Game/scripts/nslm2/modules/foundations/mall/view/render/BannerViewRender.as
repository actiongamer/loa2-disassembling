package nslm2.modules.foundations.mall.view.render
{
   import game.ui.mallModule.render.BannerViewRenderUI;
   import nslm2.modules.foundations.mall.vo.MallItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.mall.util.MallUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class BannerViewRender extends BannerViewRenderUI
   {
       
      
      private var _data:MallItemVo;
      
      private var leftCnt:int;
      
      private var buyLimit:int;
      
      public function BannerViewRender()
      {
         super();
         btn_buy.clickHandler = doBuy;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = 0;
         _data = param1 as MallItemVo;
         if(_data)
         {
            list_items.dataSource = WealthUtil.costStrToArr(_data.stcMallItemVo.items);
            if(_data.stcMallItemVo.old_price == _data.stcMallItemVo.now_price)
            {
               oriPriceRender.visible = false;
               img_saleLine.visible = false;
            }
            else
            {
               oriPriceRender.dataSource = WealthUtil.parseCostStr(_data.stcMallItemVo.old_price,false);
               oriPriceRender.visible = true;
               img_saleLine.visible = true;
            }
            priceRender.dataSource = WealthUtil.parseCostStr(_data.stcMallItemVo.now_price,false);
            _loc4_ = MallUtil.getBuyLimit(_data.stcMallItemVo,2);
            _loc2_ = MallUtil.getBuyLimit(_data.stcMallItemVo,1);
            _loc5_ = 99;
            if(_loc4_)
            {
               _loc5_ = _loc4_ - _data.buyCountGlobal;
               _loc3_ = uint(_loc5_ > 0?458496:16723968);
               this.txt_count.text = LocaleMgr.ins.getStr(999000303) + TextFieldUtil.htmlText2(_loc5_ + "/" + _loc4_,_loc3_);
            }
            if(_loc2_)
            {
               _loc5_ = _loc2_ - _data.buyCount;
               _loc3_ = uint(_loc5_ > 0?458496:16723968);
               this.txt_count.text = LocaleMgr.ins.getStr(999000303) + TextFieldUtil.htmlText2(_loc5_ + "/" + _loc2_,_loc3_);
            }
            else
            {
               this.txt_count.text = "";
            }
         }
         if(_data.banner)
         {
            img_banner.url = _data.banner;
         }
         else
         {
            img_banner.url = UrlLib.getBannerImg("ziyuanbao1.jpg");
         }
      }
      
      private function doBuy() : void
      {
         if(_data.canBuyCount > 0)
         {
            doBuyItem();
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000304));
         }
      }
      
      private function doBuyItem() : void
      {
         ModuleMgr.ins.showModule(11201,_data,ModuleMgr.ins.popLayer.curModuleId);
         ObserverMgr.ins.sendNotice("mall_start_auto_scroll_banner",false);
      }
   }
}
