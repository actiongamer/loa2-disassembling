package nslm2.modules.funnies.dials.panels
{
   import game.ui.dialModule.panels.DialShopPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.StaticZhuanPanShopModel;
   import nslm2.modules.funnies.dials.consts.DialConsts;
   
   public class DialShopPanel extends DialShopPanelUI implements IViewStackPage
   {
       
      
      public function DialShopPanel()
      {
         super();
         this.pageBar.bindList(list_shop);
         initLanguage();
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarRef as IPageBar;
      }
      
      private function initLanguage() : void
      {
         var _loc1_:int = DialModel.TYPE == 60800?60800021:60810003;
         this.txt_tip1.text = LocaleMgr.ins.getStr(_loc1_);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         switchEventListeners(true);
         this.txt_cd.text = DialModel.ins.getEventTimeStr();
         refresh();
      }
      
      public function viewStackOut() : void
      {
         switchEventListeners(false);
         this.visible = false;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
         }
      }
      
      private function refresh() : void
      {
         if(DialModel.TYPE == 60810)
         {
            this.tab.visible = true;
            this.tab.labels = [LocaleMgr.ins.getStr(60810014),LocaleMgr.ins.getStr(60810015)].join(",");
            this.tab.userChangeHandler = tab_userChangeHandler;
         }
         else
         {
            this.tab.visible = false;
            this.tab.selectedIndex = 0;
         }
         refreshUI();
         var _loc1_:Array = DialModel.ins.getCostWealthVoArr();
         this.list_coin.repeatY = _loc1_.length;
         this.list_coin.dataSource = _loc1_;
      }
      
      private function tab_userChangeHandler(param1:int) : void
      {
         refreshUI();
      }
      
      private function refreshUI() : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = DialModel.ins.shopDict.array;
         var _loc1_:Array = [];
         var _loc3_:int = _loc2_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _loc2_[_loc5_];
            if(_loc4_.kind == DialConsts.SHOP_KIND_ARR[this.tab.selectedIndex] || DialModel.TYPE == 60800)
            {
               _loc1_.push(_loc4_);
            }
            _loc5_++;
         }
         _loc2_ = _loc1_;
         _loc2_.sortOn(StaticZhuanPanShopModel.ID.name,16);
         this.list_shop.dataSource = _loc2_;
      }
   }
}
