package nslm2.modules.foundations.auctionShop.view
{
   import game.ui.auctionShopModule.AuctionSellListViewUI;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class AuctionSellListView extends AuctionSellListViewUI
   {
       
      
      public function AuctionSellListView()
      {
         super();
         this.setReceiveDrag(true,["auciton_sell"]);
      }
      
      override protected function receivedDragData(param1:String, param2:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("auciton_sell" === _loc4_)
         {
            _loc3_ = param2 as WealthVo;
            if(AuctionShopModel.ins.canSell)
            {
               ModuleMgr.ins.showModule(30611,_loc3_,ModuleMgr.ins.popLayer.curModuleId);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(30610084));
            }
         }
      }
   }
}
