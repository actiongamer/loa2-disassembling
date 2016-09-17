package nslm2.modules.foundations.auctionShop.view.render
{
   import game.ui.auctionShopModule.render.MyOrderListRenderUI;
   import proto.AuctionItem;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   
   public class AuctionOrderListRender extends MyOrderListRenderUI
   {
       
      
      private var data:AuctionItem;
      
      public function AuctionOrderListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         data = param1 as AuctionItem;
         if(data)
         {
            if(data.baowu)
            {
               txt_itemName.text = WealthUtil.getItemColorName(data.baowu.baseId);
               _loc2_ = WealthUtil.treasureToVo(data.baowu);
               var _loc3_:* = WealthUtil.treasureToVo(data.baowu);
               this.toolTip = _loc3_;
               txt_itemName.toolTip = _loc3_;
            }
            else
            {
               txt_itemName.text = WealthUtil.getItemColorName(data.item.id);
               _loc2_ = new WealthVo();
               _loc2_.sid = data.item.id;
               _loc2_.kind = 20;
               _loc3_ = _loc2_;
               this.toolTip = _loc3_;
               txt_itemName.toolTip = _loc3_;
            }
            txt_quality.text = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(6000 + _loc2_.quality),ColorLib.qualityColor(_loc2_.quality));
            txt_time.text = TimeUtils.oneCN(data.endTm - ServerTimer.ins.second);
            txt_time.toolTip = TimeUtils.getFullTimeStr(data.endTm) + LocaleMgr.ins.getStr(999000553);
            txt_price.text = data.curPrice + "";
            txt_priceTotal.text = data.myPrice + "";
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         img_selected.visible = param1 == 2 || param1 == 3;
      }
   }
}
