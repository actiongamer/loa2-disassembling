package nslm2.modules.funnies.newYears.fooldays
{
   import game.ui.newYears.fooldays.Foolday2016ShopPanelUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.shop.model.ShopPlusModel;
   import nslm2.modules.foundations.shop.model.ShopTabConfigVo;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.utils.TimeUtils;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class Foolday2016ShopPanel extends Foolday2016ShopPanelUI
   {
       
      
      public var funcId:int;
      
      private var shopTabConfigArr:Array;
      
      private var cdCtrl:TextCDCtrlS2;
      
      public function Foolday2016ShopPanel()
      {
         super();
         this.tab_1.visible = false;
         this.tab_1.userChangeHandler = tab_changeHandler;
         (this.pageBarUI as IPageBar).bindList(this.list_sales);
      }
      
      public function init(param1:int) : void
      {
         this.funcId = param1;
         if(shopTabConfigArr == null)
         {
            shopTabConfigArr = ShopModel.ins.shopTabConfigArrByType(this.funcId);
            if(shopTabConfigArr.length > 0)
            {
               this.tab_1.labels = ArrayUtil.distill(shopTabConfigArr,"strVal").join(",");
               tab_1.selectedIndex = 0;
            }
         }
         if(shopTabConfigArr.length > 0)
         {
            this.tab_1.visible = true;
         }
         else
         {
            this.tab_1.visible = false;
         }
         tab_changeHandler(0);
         txt_tip1.text = LocaleMgr.ins.getStr(13332001);
         if(cdCtrl)
         {
            this.cdCtrl.dispose();
            this.cdCtrl = null;
         }
         this.cdCtrl = new TextCDCtrlS2(this.txt_cd,textCDFormat,textCDCpl);
         this.cdCtrl.start(NpcFuncService.ins.getOpenTimeVo(funcId).endTime);
      }
      
      private function tab_changeHandler(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = null;
         _loc2_ = ShopPlusModel.INS.getShopItemArrByKind(101);
         if(shopTabConfigArr.length > 0)
         {
            _loc6_ = [];
            _loc4_ = shopTabConfigArr[param1];
            _loc5_ = _loc2_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc3_ = _loc2_[_loc7_];
               if(_loc3_.getTabIndex == _loc4_.tabIndex)
               {
                  _loc6_.push(_loc3_);
               }
               _loc7_++;
            }
            _loc2_ = _loc6_;
         }
         _loc2_.sortOn("id",16);
         this.list_sales.dataSource = _loc2_;
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13323003) + TimeUtils.hisCNWithDay(param1);
      }
      
      private function textCDCpl() : void
      {
         this.txt_cd.text = "";
      }
   }
}
