package nslm2.modules.foundations.auctionShop.view.render
{
   import game.ui.auctionShopModule.render.AuctionItemListRenderUI;
   import com.mz.core.mgrs.IDragDropSource;
   import com.mz.core.mgrs.RDragDropMgr;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Image;
   
   public class AuctionItemListRender extends AuctionItemListRenderUI implements IDragDropSource
   {
       
      
      public function AuctionItemListRender()
      {
         super();
      }
      
      override protected function validateQuality() : void
      {
         super.validateQuality();
         this.buttonMode = true;
         if(this.ref_img_quality.visible == false)
         {
            buttonMode = false;
            this.ref_img_quality.skin = this.ori_img_quality_skin + 0;
            this.ref_img_quality.visible = true;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1)
         {
            this.doubleClickEnabled = true;
            this.mouseEvent = true;
            this.buttonMode = true;
            addEventListener("doubleClick",sellItem);
            RDragDropMgr.getInstance.switchDragListen(this,true);
         }
         else
         {
            this.buttonMode = false;
            this.doubleClickEnabled = false;
            removeEventListener("doubleClick",sellItem);
            this.mouseEvent = false;
            RDragDropMgr.getInstance.switchDragListen(this,false);
            img_selected.visible = false;
         }
         .super.dataSource = param1;
      }
      
      protected function sellItem(param1:MouseEvent) : void
      {
         if(AuctionShopModel.ins.canSell)
         {
            ModuleMgr.ins.showModule(30611,dataSource,ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30610084));
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         img_selected.visible = dataSource && (param1 == 2 || param1 == 3);
      }
      
      public function onDragStart() : void
      {
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            if(this.img_icon.bitmapData)
            {
               _loc1_ = this.img_icon;
            }
            else
            {
               _loc1_ = this.img_quality;
            }
            RDragDropMgr.getInstance.start(_loc1_.bitmapData.clone(),"auciton_sell",dataSource,_loc1_.mouseX,_loc1_.mouseY);
         }
      }
      
      override public function dispose() : void
      {
         RDragDropMgr.getInstance.switchDragListen(this,true);
         super.dispose();
      }
   }
}
