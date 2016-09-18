package nslm2.modules.funnies.newYears.fooldays
{
   import game.ui.newYears.fooldays.FooldayShopRenderUI;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.mz.core.event.MzEvent;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.foundations.shop.model.ShopPlusModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class FooldayShopRender extends FooldayShopRenderUI
   {
       
      
      private var wealthVo:WealthVo;
      
      public function FooldayShopRender()
      {
         super();
         this.btn_buy.clickHandler = buyHandler;
         this.txt_status.text = LocaleMgr.ins.getStr(11200302);
         this.txt_give.font = "Em_YaHeiB";
         this.txt_give.size = 12;
         this.txt_give.rotation = -45;
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
            ShopModel.ins.addEventListener("evtShopBuyCpl",onBuyCpl);
         }
         else
         {
            ShopModel.ins.removeEventListener("evtShopBuyCpl",onBuyCpl);
         }
      }
      
      private function onBuyCpl(param1:MzEvent) : void
      {
         refresh();
      }
      
      public function get shopVo() : StcShopVo
      {
         return this.dataSource as StcShopVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(shopVo)
         {
            refresh();
            switchEventListener(true);
         }
         else
         {
            switchEventListener(false);
         }
      }
      
      private function refresh() : void
      {
         wealthVo = WealthVo.parseCostStr(shopVo.sell_res);
         this.render_item.dataSource = wealthVo;
         this.render_cost.dataSource = WealthVo.parseCostStr(shopVo.curr_res);
         this.render_item.txt_name.visible = false;
         var _loc1_:WealthVo = WealthVo.parseCostStr(shopVo.ori_res);
         if(_loc1_.count != this.render_cost.wealthVo.count)
         {
            this.oriRes.dataSource = _loc1_;
            this.oriRes.visible = true;
            this.img_saleLine.visible = true;
         }
         else
         {
            this.oriRes.visible = false;
            this.img_saleLine.visible = false;
         }
         countHint();
         this.label_name.color = ColorLib.qualityColor(wealthVo.quality);
         this.label_name.text = wealthVo.showName;
         var _loc2_:int = ShopPlusModel.INS.getBuyedTimes(this.shopVo.id);
         if(shopVo.limit_num == 0)
         {
            this.label_limit.visible = false;
         }
         this.label_limit.text = LocaleMgr.ins.getStr(60300007,[shopVo.limit_num - _loc2_,shopVo.limit_num]);
         if(shopVo.limit_num - _loc2_ > 0)
         {
            this.box_saled.visible = false;
            this.img_give_tag.visible = true;
            this.txt_give.visible = true;
            this.btn_buy.disabled = false;
         }
         else
         {
            this.box_saled.visible = true;
            this.img_give_tag.visible = false;
            this.txt_give.visible = false;
            this.btn_buy.disabled = true;
         }
      }
      
      private function countHint() : void
      {
         var _loc1_:* = null;
         if(StringUtils.isNull(this.shopVo.discount_num))
         {
            this.label_hint.visible = false;
         }
         else
         {
            _loc1_ = WealthVo.parseCostStr(shopVo.discount_num);
            this.label_hint.text = LocaleMgr.ins.getStr(13323004,[_loc1_.count]);
            this.label_hint.visible = true;
         }
      }
      
      private function buyHandler() : void
      {
         ModuleMgr.ins.showModule(60320,this.shopVo,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      override public function dispose() : void
      {
         switchEventListener(false);
         super.dispose();
      }
   }
}
