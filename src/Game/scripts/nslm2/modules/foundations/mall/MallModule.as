package nslm2.modules.foundations.mall
{
   import game.ui.mallModule.MallModuleViewUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.foundations.mall.model.MallModel;
   import nslm2.modules.foundations.mall.view.MallBuySuccessPanel;
   import nslm2.modules.foundations.mall.vo.MallParamVo;
   import nslm2.modules.foundations.mall.vo.MallItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMallItemVo;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.ServerTimer;
   import org.manager.DateUtils;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.foundations.mall.view.MallFirstPage;
   import nslm2.modules.foundations.mall.view.MallCommonPage;
   import nslm2.modules.foundations.mall.service.MallService;
   import proto.MallListRes;
   import com.mz.core.event.MzEvent;
   
   public class MallModule extends MallModuleViewUI
   {
       
      
      private var vs:ViewStack;
      
      private var mallModel:MallModel;
      
      private var buySuccessPanel:MallBuySuccessPanel;
      
      public function MallModule()
      {
         mallModel = MallModel.ins;
         super();
         init();
         tabBar.labels = [LocaleMgr.ins.getStr(11200200),LocaleMgr.ins.getStr(11200201),LocaleMgr.ins.getStr(11200202),LocaleMgr.ins.getStr(11200203)].join(",");
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         if(param1 && param1 is MallParamVo)
         {
            _loc4_ = param1 as MallParamVo;
            if(tabBar.selectedIndex == _loc4_.tabIndex)
            {
               vs.selectedIndex = _loc4_.tabIndex;
            }
            else
            {
               tabBar.selectedIndex = _loc4_.tabIndex;
            }
            if(_loc4_.itemId)
            {
               _loc5_ = new MallItemVo();
               _loc2_ = StcMgr.ins.getMallItemVo(_loc4_.itemId);
               if(!_loc2_)
               {
               }
               ObserverMgr.ins.sendNotice("mall_hilight_item",_loc4_.itemId);
            }
         }
         else
         {
            vs.selectedIndex = 0;
         }
         boxQQVip.visible = EnvConfig.ins.vipType != 0;
         if(boxQQVip.visible)
         {
            QQVipUtils.changeBtnSkinCharge(btn_qqVip,2);
            if(EnvConfig.ins.vipType == 2)
            {
               btn_qqVip.y = btn_qqVip.y + 8;
               this.txtQQvipTip.text = LocaleMgr.ins.getStr(60710612);
            }
            else
            {
               this.txtQQvipTip.text = LocaleMgr.ins.getStr(60710112);
            }
         }
         var _loc3_:DateUtils = ServerTimer.ins.date;
         _loc3_.hours = 5;
         LocalData.insCurPlayer.save("lastShowMallAlertTime",_loc3_.time / 1000);
         super.preShow(param1);
      }
      
      private function init() : void
      {
         vs = new ViewStack();
         vs.subViewClasses = [MallFirstPage,MallCommonPage];
         addChild(vs);
         vs.x = 55;
         vs.y = 114;
         tabBar.selectHandler = onTabChanged;
      }
      
      private function onTabChanged(param1:int) : void
      {
         if(param1 == 0)
         {
            vs.selectedIndex = 0;
         }
         else
         {
            mallModel.currentPage = param1;
            vs.selectedIndex = 1;
            ObserverMgr.ins.sendNotice("mall_notice_update_info",true);
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         MallService.ins.getMallData(updateMallData);
      }
      
      private function updateMallData(param1:MallListRes) : void
      {
         mallModel.updateMallData(param1);
         super.moduleServerCpl();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["mall_buy_success"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("mall_buy_success" === _loc3_)
         {
            mallModel.crtBuyItem = null;
            mallModel.crtBuyItemCnt = 1;
         }
      }
      
      protected function onResPanelDispose(param1:MzEvent) : void
      {
         buySuccessPanel = null;
      }
   }
}
