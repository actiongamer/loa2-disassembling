package nslm2.modules.foundations.auctionShop.view.render
{
   import game.ui.auctionShopModule.render.AuctionListRenderUI;
   import proto.AuctionItem;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import nslm2.utils.Uint64Util;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import nslm2.common.model.PlayerModel;
   
   public class AuctionListRender extends AuctionListRenderUI
   {
       
      
      private var data:AuctionItem;
      
      public function AuctionListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc6_:* = null;
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         var _loc4_:* = null;
         .super.dataSource = param1;
         data = param1 as AuctionItem;
         if(data)
         {
            var _loc8_:* = 0;
            var _loc7_:* = AuctionShopModel.ins.myOrderArr;
            for each(var _loc5_ in AuctionShopModel.ins.myOrderArr)
            {
               if(Uint64Util.equal(_loc5_.id,data.id))
               {
                  _loc2_ = true;
               }
            }
            if(data.baowu)
            {
               _loc3_ = WealthUtil.getItemColorName(data.baowu.baseId);
               _loc6_ = WealthUtil.treasureToVo(data.baowu);
               _loc8_ = WealthUtil.treasureToVo(data.baowu);
               this.toolTip = _loc8_;
               txt_itemName.toolTip = _loc8_;
            }
            else
            {
               _loc4_ = "";
               if(data.item.count > 1)
               {
                  _loc4_ = "x" + data.item.count;
               }
               _loc3_ = WealthUtil.getItemColorName(data.item.id,_loc4_);
               _loc6_ = new WealthVo();
               _loc6_.sid = data.item.id;
               _loc6_.kind = 20;
               _loc6_.count = data.item.count;
               _loc7_ = _loc6_;
               this.toolTip = _loc7_;
               txt_itemName.toolTip = _loc7_;
            }
            if(_loc2_)
            {
               _loc3_ = _loc3_ + LocaleMgr.ins.getStr(30610101);
            }
            txt_itemName.text = _loc3_;
            txt_quality.text = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(6000 + _loc6_.quality),ColorLib.qualityColor(_loc6_.quality));
            txt_time.text = TimeUtils.oneCN(data.endTm - ServerTimer.ins.second);
            txt_time.toolTip = TimeUtils.getFullTimeStr(data.endTm) + " " + LocaleMgr.ins.getStr(30610086);
            if(data.dist != PlayerModel.ins.dist)
            {
               txt_PlayerName.text = data.opName + "." + "S" + data.dist % 10000 + "." + data.name;
            }
            else
            {
               txt_PlayerName.text = data.name;
            }
            txt_OnePrice.text = data.oncePrice + "";
            txt_price.text = data.curPrice + "";
            this.doubleClickEnabled = true;
         }
         else
         {
            this.doubleClickEnabled = false;
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         img_selected.visible = param1 == 2 || param1 == 3;
      }
   }
}
