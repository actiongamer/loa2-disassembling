package nslm2.modules.funnies.newYears.charmStar.view
{
   import game.ui.newYears.charmStar.render.CharmShopRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarShopVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.event.MzEvent;
   import proto.ShopBuyInfo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class CharmShopRender extends CharmShopRenderUI implements IObserver
   {
       
      
      private var wealthVo:WealthVo;
      
      public function CharmShopRender()
      {
         super();
         switchEventListener(true);
      }
      
      public function get vo() : CharmStarShopVo
      {
         return this.dataSource as CharmStarShopVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            refresh();
         }
      }
      
      private function refresh() : void
      {
         wealthVo = WealthVo.parseCostStr(vo.sellRes);
         this.render_item.dataSource = wealthVo;
         this.render_cost.dataSource = WealthVo.parseCostStr(vo.currRes);
         this.render_item.txt_name.visible = false;
         this.label_name.color = ColorLib.qualityColor(wealthVo.quality);
         this.label_name.text = wealthVo.showName;
         this.btn_buy.clickHandler = buyHandler;
         if(vo.limit_num == 0)
         {
            this.label_limit.visible = false;
         }
         else
         {
            this.label_limit.text = LocaleMgr.ins.getStr(60300007,[vo.limit_num - this.vo.curBuyTimes,vo.limit_num]);
         }
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         ObserverMgr.ins.regObserver(this);
         if(param1)
         {
            ShopModel.ins.addEventListener("evtShopBuyCpl",shopBuyCpl);
         }
         else
         {
            ShopModel.ins.removeEventListener("evtShopBuyCpl",shopBuyCpl);
         }
      }
      
      private function buyHandler() : void
      {
         ModuleMgr.ins.showModule(13407,vo,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function shopBuyCpl(param1:MzEvent) : void
      {
         if(!vo)
         {
            return;
         }
         if((param1.data as ShopBuyInfo).id == vo.shopid)
         {
            if(this.vo)
            {
               this.vo.curBuyTimes = ShopModel.ins.getBuyedTimes(vo.shopid);
            }
            if(BagModel.ins.getStcCount(200012) == 0)
            {
               NpcFuncService.ins.changeCount(13401,0);
               if(NpcFuncService.ins.getVo(13402).count > 0 || NpcFuncService.ins.getVo(13401).count > 0)
               {
                  NpcFuncService.ins.changeCount(13400,1);
               }
               else
               {
                  NpcFuncService.ins.changeCount(13400,0);
               }
            }
            ObserverMgr.ins.sendNotice("refresh_point");
            refresh();
         }
      }
      
      private function buyCpl() : void
      {
         FloatUtil.showGetItemsDisplayPanel([wealthVo]);
      }
      
      public function getFocusNotices() : Array
      {
         return ["CHARM_STAR_BUY_CONFIRM_REFRESH"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("CHARM_STAR_BUY_CONFIRM_REFRESH" === _loc3_)
         {
            if(!vo)
            {
               return;
            }
            if((param2 as CharmStarShopVo).id == vo.shopid)
            {
               if(BagModel.ins.getStcCount(200012) == 0)
               {
                  NpcFuncService.ins.changeCount(13401,0);
                  if(NpcFuncService.ins.getVo(13402).count > 0 || NpcFuncService.ins.getVo(13401).count > 0)
                  {
                     NpcFuncService.ins.changeCount(13400,1);
                  }
                  else
                  {
                     NpcFuncService.ins.changeCount(13400,0);
                  }
               }
               ObserverMgr.ins.sendNotice("refresh_point");
               refresh();
            }
         }
      }
      
      override public function dispose() : void
      {
         this.switchEventListener(false);
         super.dispose();
      }
   }
}
