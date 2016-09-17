package nslm2.modules.funnies.newYears.luckTrees.panels
{
   import game.ui.newYears.luckTrees.panels.LuckTreeShopPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import flash.events.Event;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import proto.StaticLuckTreeShopModel;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.RTools;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   
   public class LuckTreeShopPanel extends LuckTreeShopPanelUI implements IViewStackPage
   {
       
      
      public function LuckTreeShopPanel()
      {
         super();
         this.pageBar.bindList(list_shop);
         this.tab.labels = LuckTreeService.ins.shopKindNameList.join(",");
         this.tab.addEventListener("change",onLabelChange);
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      protected function onLabelChange(param1:Event) : void
      {
         doLabelChange(tab.selectedIndex);
      }
      
      private function doLabelChange(param1:int, param2:Boolean = false) : void
      {
         tabIndex = param1;
         var _loc4_:int = LuckTreeService.ins.shopKindList[param1];
         var _loc3_:Array = this.service.getShopItemByKind(_loc4_);
         _loc3_.sortOn(StaticLuckTreeShopModel.ID.name,16);
         this.list_shop.dataSource = _loc3_;
         if(param2)
         {
            this.tab.removeEventListener("change",onLabelChange);
            this.tab.selectedIndex = tabIndex;
            this.pageBar.pageTo(0,false);
            this.tab.addEventListener("change",onLabelChange);
         }
      }
      
      public function get service() : LuckTreeService
      {
         return LuckTreeService.ins;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.service.addEventListener("EVT_SHOP_BUY_CPL",onShopBuyCpl);
         tabIndex = 0;
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         this.service.removeEventListener("EVT_SHOP_BUY_CPL",onShopBuyCpl);
         this.visible = false;
      }
      
      private function onShopBuyCpl(param1:Event) : void
      {
         this.refreshUI(false);
      }
      
      private function refreshUI(param1:Boolean = true) : void
      {
         var _loc2_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(13);
         this.txt_cd.text = LocaleMgr.ins.getStr(50600046) + TimeUtils.getFullTimeStrCN(_loc2_.startTm,false,false,RTools.cl(false,true),false) + " - " + TimeUtils.getFullTimeStrCN(_loc2_.endTm,false,false,RTools.cl(false,true),false);
         doLabelChange(tabIndex,param1);
         var _loc3_:WealthVo = WealthUtil.createWealthVo(35);
         _loc3_.useStcCount = true;
         this.render_coin.dataSource = _loc3_;
      }
      
      override public function dispose() : void
      {
         this.service.removeEventListener("EVT_SHOP_BUY_CPL",onShopBuyCpl);
         super.dispose();
      }
   }
}
