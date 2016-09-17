package nslm2.modules.foundations.shop.comp
{
   import game.ui.shopModules.render.ShopRefreshRenderUI;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.LabelMed;
   import com.mz.core.utils.FilterUtil;
   import morn.core.components.Button;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.modules.foundations.shop.service.ShopService;
   import morn.customs.expands.MornExpandUtil;
   
   public class ShopRefreshRender extends ShopRefreshRenderUI
   {
       
      
      private var _refreshWealthVo:WealthVo;
      
      public function ShopRefreshRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnFunc);
      }
      
      private function get shopType() : int
      {
         return dataSource as int;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         .super.dataSource = param1;
         var _loc2_:WealthVo = ShopModel.ins.getMysteryRefreshItemVo(shopType);
         if(_loc2_)
         {
            this.btn_refresh.filters = null;
            _refreshWealthVo = _loc2_;
            if(ShopModel.ins.getLeftFreeRefreshTimes(shopType) > 0)
            {
               this.txt_refresh.text = LocaleMgr.ins.getStr(999000366);
            }
            else
            {
               this.txt_refresh.text = LocaleMgr.ins.getStr(60300006,[LabelMed.wealthParam(_loc2_.kind,_loc2_.sid,_loc2_.count)]);
            }
         }
         else
         {
            _loc3_ = ShopModel.ins.getInitMysteryRefreshItemVo(shopType);
            _refreshWealthVo = _loc3_;
            if(ShopModel.ins.getLeftFreeRefreshTimes(shopType) > 0)
            {
               this.txt_refresh.text = LocaleMgr.ins.getStr(999000366);
            }
            else
            {
               this.txt_refresh.text = LocaleMgr.ins.getStr(60300006,[LabelMed.wealthParam(_loc3_.kind,_loc3_.sid,_loc3_.count)]);
            }
            this.btn_refresh.filters = [FilterUtil.grayFilter()];
         }
         this.txt_refresh.commitMeasure();
         if(ShopModel.ins.getLeftRefreshTimes(shopType) <= 0 && ShopModel.ins.getLeftFreeRefreshTimes(shopType) <= 0)
         {
            this.filters = [FilterUtil.grayFilter()];
         }
         else
         {
            this.filters = null;
         }
      }
      
      private function btnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_refresh === _loc2_)
         {
            if(NGUtil.isCurFuncId(60310))
            {
               NGUtil.skipAll();
               ShopModel.ins.dispatchEvent(new MzEvent("evtShopRefresh",false));
               return;
            }
            if(ShopModel.ins.getLeftRefreshTimes(shopType) <= 0 && ShopModel.ins.getLeftFreeRefreshTimes(shopType) <= 0)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(350000303));
            }
            else if(PlayerModel.ins.getCountByWealthVo(_refreshWealthVo) <= 0 && ShopModel.ins.getLeftFreeRefreshTimes(shopType) <= 0)
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(_refreshWealthVo),ModuleMgr.ins.popLayer.curModuleId);
            }
            else if(this._refreshWealthVo.kind == 3)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(999000367,[LabelMed.wealthParam(this._refreshWealthVo.kind,this._refreshWealthVo.sid,this._refreshWealthVo.count)]),doRefresh,null,"mysteryRefreshShopNoShow");
            }
            else if(ShopModel.ins.mysteryShopHasHeroInTeam(shopType))
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(60300028),doRefresh);
            }
            else
            {
               doRefresh();
            }
         }
      }
      
      private function doRefresh() : void
      {
         ShopService.ins.refresh(shopType,ShopModel.ins.getRefreshItemType(this._refreshWealthVo.kind));
      }
   }
}
