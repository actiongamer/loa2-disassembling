package nslm2.modules.foundations.sales.render
{
   import game.ui.salesModule.render.SalesItemRenderUI;
   import proto.SuperSaleItem;
   import nslm2.modules.foundations.sales.model.SalesModel;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSuperscaleVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.foundations.sales.service.SalesService;
   import proto.SuperSaleBuyItemRes;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class SalesItemRender extends SalesItemRenderUI
   {
       
      
      private var _data:SuperSaleItem;
      
      private var model:SalesModel;
      
      private var discountDict:DictHash;
      
      private const RED:String = "red";
      
      private const GREEN:String = "green";
      
      private const PURPLE:String = "purple";
      
      public function SalesItemRender()
      {
         model = SalesModel.ins;
         super();
         discountDict = new DictHash();
         discountDict.put(1,"red");
         discountDict.put(2,"red");
         discountDict.put(3,"red");
         discountDict.put(4,"purple");
         discountDict.put(5,"purple");
         discountDict.put(6,"purple");
         discountDict.put(7,"green");
         discountDict.put(8,"green");
         discountDict.put(9,"green");
         discountDict.put(1.5,"red");
         discountDict.put(2.5,"red");
         discountDict.put(3.5,"red");
         discountDict.put(4.5,"purple");
         discountDict.put(5.5,"purple");
         discountDict.put(6.5,"purple");
         discountDict.put(7.5,"green");
         discountDict.put(8.5,"green");
         discountDict.put(9.5,"green");
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         _data = param1 as SuperSaleItem;
         if(_data)
         {
            _loc2_ = StcMgr.ins.getSuperscaleVo(_data.goodid);
            this.itemRender.dataSource = WealthUtil.costStrToArr(_loc2_.content)[0];
            label_itemName.color = ColorLib.qualityColor((this.itemRender.dataSource as WealthVo).quality);
            label_itemName.text = (this.itemRender.dataSource as WealthVo).showName;
            oriRes.dataSource = WealthUtil.parseCostStr(_loc2_.originalprice,true);
            curRes.dataSource = WealthUtil.parseCostStr(_loc2_.currentprice,true);
            if(model.alreadybuy.indexOf(_data.goodid) != -1)
            {
               this.img_havebought.visible = true;
               this.btn_buy.disabled = true;
            }
            else
            {
               this.img_havebought.visible = false;
               this.btn_buy.disabled = false;
               this.btn_buy.clickHandler = buyHandler;
            }
            if(_loc2_.discount > 0 && _loc2_.discount < 1)
            {
               this.img_discount.skin = UrlLib.getSalesDiscountImg((_loc2_.discount * 10).toString());
               this.img_discountBg.skin = UrlLib.getSalesDiscountImg(discountDict.getValue(_loc2_.discount * 10));
            }
            else
            {
               this.img_discount.visible = false;
               this.img_discountBg.visible = false;
            }
         }
      }
      
      private function buyHandler() : void
      {
         SalesService.ins.buyItem(_data.goodid,buyCplHandler);
      }
      
      private function buyCplHandler(param1:SuperSaleBuyItemRes) : void
      {
         var _loc2_:Boolean = false;
         model.currentvalue = param1.youhuizhi;
         if(param1.finishtime != 0)
         {
            model.limittime = param1.finishtime;
            model.recharge = param1.rechargeid;
            _loc2_ = true;
         }
         ObserverMgr.ins.sendNotice("AddSalesValue",_loc2_);
         FloatUtil.showGetItemsDisplayPanel([this.itemRender.wealthVo]);
         this.img_havebought.visible = true;
         this.btn_buy.disabled = true;
      }
   }
}
