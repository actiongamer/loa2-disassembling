package nslm2.modules.foundations.sales.view
{
   import game.ui.salesModule.view.SalesItemsViewUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.foundations.sales.model.SalesModel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcRechargeVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.FilterLib;
   import nslm2.utils.LabelMedItem;
   import nslm2.common.ui.components.comps2d.icons.labels.WealthRenderLabelS0;
   import nslm2.modules.foundations.sales.service.SalesService;
   import proto.SuperSaleInfoRes;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class SalesItemsView extends SalesItemsViewUI implements IObserver, IViewStackPage
   {
       
      
      private var model:SalesModel;
      
      private var textCdCtrl:TextCDCtrlS2;
      
      private var breathCtrl:GlowFilterBreathCtrl;
      
      private var breathCtrl2:GlowFilterBreathCtrl;
      
      public function SalesItemsView()
      {
         model = SalesModel.ins;
         super();
         ObserverMgr.ins.regObserver(this);
         this.img_icon.skin = UrlLib.getSalesDiscountImg("img_icon");
         this.img_refreshBg.skin = UrlLib.getSalesDiscountImg("img_refreshBg");
         if(model.canrecharge)
         {
            setChargeText();
         }
         else
         {
            box_canCharge.visible = false;
            this.img_cannotcharge.visible = true;
         }
         label_canCharge.text = LocaleMgr.ins.getStr(60540006) + "\n" + "\n" + LocaleMgr.ins.getStr(60540007) + "\n" + "\n" + LocaleMgr.ins.getStr(60540008);
         list_sales.dataSource = model.itemsArr.sortOn("goodid",16);
         textCdCtrl = new TextCDCtrlS2(this.label_nextRefresh,textCDFormat,txtCDCtrl_cpl);
         textCdCtrl.start(model.nextresettime);
      }
      
      private function setChargeText() : void
      {
         var _loc1_:StcRechargeVo = StcMgr.ins.getRechargeVo(model.recharge);
         box_canCharge.visible = true;
         this.img_cannotcharge.visible = false;
         label_charge.text = _loc1_.recharge + LocaleMgr.ins.getStr(999000358);
         label_return1.text = LocaleMgr.ins.parseParamAdvance("@{wealth:3}",[]);
         label_return.text = LocaleMgr.ins.parseParamAdvance("@{wealth:3}",[]);
         this.clip_charge.value = _loc1_.recharge;
         this.clip_reward.value = _loc1_.present;
         if(!breathCtrl)
         {
            breathCtrl = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER_WHITE,2,0,2.5,-1).addHandler(breath_cb);
            ((label_return.labelMedItemList[0] as LabelMedItem).comp as WealthRenderLabelS0).img_icon.parts.push(breathCtrl);
         }
         if(!breathCtrl2)
         {
            breathCtrl = new GlowFilterBreathCtrl(FilterLib.BORDER_YELLOW,0,2,2.5,-1).addHandler(breath_cb2);
         }
      }
      
      private function breath_cb(param1:Array) : void
      {
         ((label_return.labelMedItemList[0] as LabelMedItem).comp as WealthRenderLabelS0).img_icon.filters = param1;
      }
      
      private function breath_cb2(param1:Array) : void
      {
         clip_reward.filters = param1;
      }
      
      private function txtCDCtrl_cpl() : void
      {
         SalesService.ins.getSalesInfo(infoCplHandler);
      }
      
      private function infoCplHandler(param1:SuperSaleInfoRes) : void
      {
         SalesService.ins.infoCplHandler(param1);
         list_sales.dataSource = model.itemsArr.sortOn("goodid",16);
         textCdCtrl = new TextCDCtrlS2(this.label_nextRefresh,textCDFormat,txtCDCtrl_cpl);
         textCdCtrl.start(model.nextresettime);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(60540004) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      public function getFocusNotices() : Array
      {
         return ["AddSalesValue"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("AddSalesValue" === _loc3_)
         {
            if(param2 as Boolean)
            {
               setChargeText();
            }
            else
            {
               box_canCharge.visible = false;
               this.img_cannotcharge.visible = true;
            }
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      override public function dispose() : void
      {
         if(textCdCtrl)
         {
            textCdCtrl.dispose();
            textCdCtrl = null;
         }
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
