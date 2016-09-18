package nslm2.modules.funnies.teamGuajiScenes.pvp
{
   import game.ui.teamGuajiScenes.pvp.BuyPvPCountPanelUI;
   import flash.events.Event;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.UIMgr;
   import flash.geom.Point;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.TimePriceUtil;
   import com.mz.core.utils.TextFieldUtil;
   import morn.core.components.Button;
   import proto.BagItemUseReq.UseInfo;
   import proto.BagItemUseReq;
   import nslm2.nets.sockets.ServerEngine;
   import flash.events.MouseEvent;
   import nslm2.common.vo.WealthVo;
   import morn.customs.expands.MornExpandUtil;
   
   public class BuyPvPCntPanel extends BuyPvPCountPanelUI
   {
       
      
      public function BuyPvPCntPanel()
      {
         super();
         var _loc1_:WealthVo = new WealthVo();
         _loc1_.sid = 60111;
         _loc1_.kind = 20;
         itemRender.dataSource = _loc1_;
         txt_tip.text = LocaleMgr.ins.getStr(41300104);
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41300216);
         txt_des.text = "";
         btn_buy.label = LocaleMgr.ins.getStr(41300266);
      }
      
      protected function buyItemSuccess(param1:Event) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41300250),null,-1,null,DisplayUtils.localToTarget(txt_haveCnt,UIMgr.stage).add(new Point(40,6)));
         show();
      }
      
      public function show() : void
      {
         ShopModel.ins.addEventListener("evtShopBuyCpl",buyItemSuccess);
         var _loc1_:int = BagModel.ins.getStcCount(60111);
         var _loc2_:int = int(VipModel.ins.getVipValue(10410)) - TimePriceUtil.curTimes(5);
         _loc2_ = _loc2_ < 0?0:_loc2_;
         txt_buyCnt.text = LocaleMgr.ins.getStr(41300105,[TextFieldUtil.htmlText2(_loc2_ + "/" + VipModel.ins.getVipValue(10410),!!_loc2_?458496:16723968)]);
         txt_haveCnt.text = LocaleMgr.ins.getStr(41300106,[TextFieldUtil.htmlText2(_loc1_,!!_loc1_?458496:16723968)]);
         btn_use.disabled = !_loc1_;
         btn_buy.disabled = !_loc2_;
         costRender.dataSource = TimePriceUtil.curTimePriceVo(5);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = param1;
         if(btn_buy !== _loc5_)
         {
            if(btn_use === _loc5_)
            {
               _loc2_ = [];
               _loc4_ = new UseInfo();
               _loc4_.itemId = BagModel.ins.getIdBySid(60111);
               _loc4_.count = 1;
               _loc2_.push(_loc4_);
               _loc3_ = new BagItemUseReq();
               _loc3_.info = _loc2_;
               ServerEngine.ins.send(4022,_loc3_,server_itemUse);
            }
         }
         else
         {
            TimePriceUtil.buyTimes(5,1,addTimes,10410);
         }
      }
      
      private function server_itemUse() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41300246));
         show();
      }
      
      private function addTimes() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41300246));
         show();
      }
      
      override public function dispose() : void
      {
         ShopModel.ins.removeEventListener("evtShopBuyCpl",buyItemSuccess);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         ShopModel.ins.removeEventListener("evtShopBuyCpl",buyItemSuccess);
         DisplayUtils.removeSelf(this);
         this.dispatchEvent(new Event("close"));
      }
   }
}
