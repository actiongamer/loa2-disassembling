package nslm2.modules.foundations.mall.view
{
   import game.ui.mallModule.FirstPageViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import flash.display.DisplayObject;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.mall.model.MallModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.foundations.mall.view.render.BannerViewRender;
   import morn.customs.FilterLib;
   import com.greensock.TweenLite;
   
   public class MallFirstPage extends FirstPageViewUI implements IViewStackPage, IObserver
   {
       
      
      private var filterBreath:GlowFilterBreathCtrl;
      
      private var highLightItem:DisplayObject;
      
      public function MallFirstPage()
      {
         super();
      }
      
      public function viewStackIn() : void
      {
         visible = true;
         update();
         ObserverMgr.ins.regObserver(this);
         this.crtDiamondRender.dataSource = WealthUtil.countVo(3);
         fadeIn();
         this.btn_charge.clickHandler = clickHandler;
      }
      
      private function clickHandler() : void
      {
         VipModel.ins.gotoCharge();
      }
      
      public function viewStackOut() : void
      {
         visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      private function update() : void
      {
         list_commend.dataSource = MallModel.ins.recommendMallItemList;
         list_sale.dataSource = MallModel.ins.specialMallItemList;
         bannerView.dataSource = MallModel.ins.bannerItemList;
      }
      
      public function getFocusNotices() : Array
      {
         return ["mall_notice_update_info","mall_hilight_item"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc5_:* = param1;
         if("mall_notice_update_info" !== _loc5_)
         {
            if("mall_hilight_item" === _loc5_)
            {
               if(param2)
               {
                  _loc3_ = ArrayUtil.indexByAttr(list_commend.dataSource,"id",param2);
                  if(_loc3_ >= 0)
                  {
                     _loc4_ = list_commend.getCell(_loc3_);
                  }
                  else
                  {
                     _loc3_ = ArrayUtil.indexByAttr(list_sale.dataSource,"id",param2);
                     if(_loc3_ >= 0)
                     {
                        _loc4_ = list_sale.getCell(_loc3_);
                     }
                     else
                     {
                        _loc3_ = ArrayUtil.indexByAttr(bannerView.list_banner.dataSource,"id",param2);
                        if(_loc3_ >= 0)
                        {
                           _loc4_ = (bannerView.list_banner.getCell(_loc3_) as BannerViewRender).list_items;
                        }
                     }
                  }
                  if(_loc4_)
                  {
                     highLightItem = _loc4_;
                     filterBreath = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER,2,0.5,0.5).addHandler(filterBreath_cb);
                     TweenLite.delayedCall(3,hideHighLiht);
                  }
               }
            }
         }
         else
         {
            update();
         }
      }
      
      private function filterBreath_cb(param1:Array) : void
      {
         highLightItem.filters = param1;
      }
      
      private function hideHighLiht() : void
      {
         if(filterBreath)
         {
            filterBreath.dispose();
            filterBreath = null;
         }
         if(highLightItem)
         {
            highLightItem.filters = [];
            highLightItem = null;
         }
      }
   }
}
