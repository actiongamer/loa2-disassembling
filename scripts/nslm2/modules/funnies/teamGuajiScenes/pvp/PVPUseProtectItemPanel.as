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
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.utils.WealthUtil;
   import morn.core.components.Button;
   import nslm2.modules.foundations.shop.service.ShopService;
   import proto.BagItemUseReq.UseInfo;
   import proto.BagItemUseReq;
   import nslm2.nets.sockets.ServerEngine;
   import flash.events.MouseEvent;
   import nslm2.common.vo.WealthVo;
   import morn.customs.expands.MornExpandUtil;
   
   public class PVPUseProtectItemPanel extends BuyPvPCountPanelUI
   {
       
      
      public function PVPUseProtectItemPanel()
      {
         super();
         var _loc1_:WealthVo = new WealthVo();
         _loc1_.sid = 60112;
         _loc1_.kind = 20;
         itemRender.dataSource = _loc1_;
         txt_tip.text = LocaleMgr.ins.getStr(41300217);
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         txt_buyCnt.visible = false;
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41300216);
         txt_des.text = LocaleMgr.ins.getStr(41300219);
      }
      
      protected function buyItemSuccess(param1:Event) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41300250),null,-1,null,DisplayUtils.localToTarget(txt_haveCnt,UIMgr.stage).add(new Point(40,6)));
         show();
      }
      
      public function show() : void
      {
         ShopModel.ins.addEventListener("evtShopBuyCpl",buyItemSuccess);
         var _loc2_:int = BagModel.ins.getStcCount(60112);
         txt_haveCnt.text = LocaleMgr.ins.getStr(41300106,[TextFieldUtil.htmlText2(_loc2_,!!_loc2_?458496:16723968)]);
         btn_use.disabled = !_loc2_;
         var _loc1_:StcShopVo = StcMgr.ins.getShopVo(4130010);
         costRender.dataSource = WealthUtil.parseCostStr(_loc1_.ori_res);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_buy !== _loc2_)
         {
            if(btn_use === _loc2_)
            {
               useItem();
            }
         }
         else
         {
            ShopService.ins.buy(4130010,1);
         }
      }
      
      private function useItem() : void
      {
         var _loc1_:Array = [];
         var _loc3_:UseInfo = new UseInfo();
         _loc3_.itemId = BagModel.ins.getIdBySid(60112);
         _loc3_.count = 1;
         _loc1_.push(_loc3_);
         var _loc2_:BagItemUseReq = new BagItemUseReq();
         _loc2_.info = _loc1_;
         ServerEngine.ins.send(4022,_loc2_,server_itemUse);
      }
      
      private function server_itemUse() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41300218));
         show();
      }
      
      override public function dispose() : void
      {
         ShopModel.ins.removeEventListener("evtShopBuyCpl",buyItemSuccess);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         DisplayUtils.removeSelf(this);
         ShopModel.ins.removeEventListener("evtShopBuyCpl",buyItemSuccess);
         this.dispatchEvent(new Event("close"));
      }
   }
}
