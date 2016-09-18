package nslm2.modules.foundations.sales
{
   import game.ui.salesModule.SalesModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.foundations.sales.model.SalesModel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.sales.service.SalesService;
   import proto.SuperSaleInfoRes;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import com.mz.core.utils.DisplayUtils;
   import flash.display.Sprite;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.common.ctrls.ProgressBarCtrl;
   import nslm2.modules.foundations.sales.view.SalesItemsView;
   import nslm2.modules.foundations.sales.view.SalesBenefitView;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class SalesModule extends SalesModuleUI
   {
       
      
      private var vs:ViewStack;
      
      private var model:SalesModel;
      
      private var textCdCtrl:TextCDCtrlS2;
      
      private const STAR_POS_ARR:Array = [144,-24,491,18,93,317,166,405];
      
      private var effIndex:int;
      
      private var redPoint:RedPoint;
      
      public function SalesModule()
      {
         model = SalesModel.ins;
         super();
         var _loc1_:ProgressBarCtrl = new ProgressBarCtrl(this.progressBar,0.93,false);
         this.parts.push(_loc1_);
         vs = new ViewStack();
         vs.x = img_bg.x;
         vs.y = img_bg.y;
         vs.subViewClasses = [SalesItemsView,SalesBenefitView];
         this.img_bg.skin = UrlLib.getSalesDiscountImg("img_bg");
         this.img_panelBg.skin = UrlLib.getSalesDiscountImg("img_panelBg");
         this.img_person.skin = UrlLib.getSalesDiscountImg("img_person");
         addChild(vs);
         this.tabBar.selectHandler = tabHandler;
      }
      
      private function tabHandler(param1:int) : void
      {
         vs.selectedIndex = tabBar.selectedIndex;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.removeAlwayHandler(7410,SalesService.ins.infoCplHandler);
         SalesService.ins.getSalesInfo(infoCplHandler);
      }
      
      private function infoCplHandler(param1:SuperSaleInfoRes) : void
      {
         SalesService.ins.infoCplHandler(param1);
         ServerEngine.ins.addAlwayHandler(7410,SalesService.ins.infoCplHandler);
         showOrHideRedPoint(model.showOrHideRedPoint1());
         this.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         vs.selectedIndex = 0;
         if(model.showHint)
         {
            model.showHint = false;
            ObserverMgr.ins.sendNotice("SalesReset");
         }
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9000000 + this.moduleId);
         this.img_help.addEventListener("click",helpHandler);
         this.btn_charge.clickHandler = VipModel.ins.gotoCharge;
         DisplayUtils.addChildAbove(this.img_star,vs);
         effIndex = 0;
         this.img_star.x = STAR_POS_ARR[2 * effIndex];
         this.img_star.y = STAR_POS_ARR[2 * effIndex + 1];
         this.img_star.alpha = 0;
         startStarEff();
         DisplayUtils.addChildBelow(this.img_progressBg,this.progressBar.getChildAt(this.progressBar.numChildren - 1));
         this.img_progressBg.x = -16;
         this.img_progressBg.y = 13;
         img_panelBg.x = img_panelBg.x - this.panelBg.x;
         img_panelBg.y = img_panelBg.y - this.panelBg.y;
         DisplayUtils.addChildAbove(img_panelBg,this.panelBg.img_rimBg);
         this.progressBar.value = model.currentvalue / model.maxvalue;
         this.label_process.text = model.currentvalue + "/" + model.maxvalue;
         this.btn_charge.label = LocaleMgr.ins.getStr(60540003);
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(0);
         _loc2_.graphics.drawRect(this.btn_charge.x + 17,this.btn_charge.y + 8,109,30);
         addChild(_loc2_);
         this.img_light.mask = _loc2_;
         if(model.canrecharge)
         {
            this.btn_charge.disabled = false;
            textCdCtrl = new TextCDCtrlS2(this.label_desc,textCDFormat,txtCDCtrl_cpl);
            textCdCtrl.start(model.limittime);
            TimerManager.ins.doOnce(1000,doTween);
         }
         else
         {
            this.btn_charge.disabled = true;
            this.label_desc.text = LocaleMgr.ins.getStr(60540002);
            img_light.x = 610;
            img_light.y = 24;
         }
         super.preShow();
      }
      
      private function startStarEff() : void
      {
         TweenLite.to(this.img_star,2,{
            "alpha":1,
            "onComplete":startStarEff2
         });
      }
      
      private function startStarEff2() : void
      {
         TweenLite.to(this.img_star,2,{"alpha":0});
         TweenLite.delayedCall(2,playNextEff);
      }
      
      private function playNextEff() : void
      {
         if(effIndex < 3)
         {
            effIndex = Number(effIndex) + 1;
         }
         else
         {
            effIndex = 0;
         }
         this.img_star.x = STAR_POS_ARR[2 * effIndex];
         this.img_star.y = STAR_POS_ARR[2 * effIndex + 1];
         startStarEff();
      }
      
      public function doTween() : void
      {
         TweenLite.to(this.img_light,1.4,{
            "x":900,
            "onComplete":tweenCpl
         });
      }
      
      public function tweenCpl() : void
      {
         img_light.x = 610;
         img_light.y = 24;
         TimerManager.ins.doOnce(1000,doTween);
      }
      
      protected function helpHandler(param1:MouseEvent) : void
      {
         var _loc2_:HelpAndRuleParam = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000359),LocaleMgr.ins.getStr(60540013));
         ModuleMgr.ins.showModule(12201,_loc2_,this.moduleId);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         model.currentvalue = 0;
         resetView();
         ObserverMgr.ins.sendNotice("AddSalesValue");
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(60540001) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(false));
      }
      
      override public function getFocusNotices() : Array
      {
         return ["AddSalesValue","ShowRedPoint"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("AddSalesValue" !== _loc3_)
         {
            if("ShowRedPoint" === _loc3_)
            {
               showOrHideRedPoint(param2);
            }
         }
         else
         {
            this.progressBar.value = model.currentvalue / model.maxvalue;
            this.label_process.text = model.currentvalue + "/" + model.maxvalue;
            if(param2 as Boolean)
            {
               textCdCtrl = new TextCDCtrlS2(this.label_desc,textCDFormat,txtCDCtrl_cpl);
               textCdCtrl.start(model.limittime);
               this.btn_charge.disabled = false;
               TimerManager.ins.doOnce(1000,doTween);
            }
            else
            {
               resetView();
            }
         }
      }
      
      private function showOrHideRedPoint(param1:Boolean) : void
      {
         if(param1)
         {
            if(!redPoint)
            {
               redPoint = new RedPoint();
               redPoint.x = 290;
               redPoint.y = 115;
               redPoint.anchorX = 0.5;
               redPoint.anchorY = 0.5;
               this.addChild(redPoint);
            }
            else
            {
               redPoint.visible = true;
            }
         }
         else if(redPoint)
         {
            redPoint.visible = false;
         }
      }
      
      private function resetView() : void
      {
         if(textCdCtrl)
         {
            textCdCtrl.dispose();
            textCdCtrl = null;
         }
         this.label_desc.text = LocaleMgr.ins.getStr(60540002);
         this.btn_charge.disabled = true;
         this.progressBar.value = model.currentvalue / model.maxvalue;
         this.label_process.text = model.currentvalue + "/" + model.maxvalue;
         TimerManager.ins.clearTimer(doTween);
         TweenLite.killTweensOf(this.img_light);
         img_light.x = 610;
         img_light.y = 24;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(textCdCtrl)
         {
            textCdCtrl.dispose();
            textCdCtrl = null;
         }
         if(redPoint)
         {
            redPoint.dispose();
            redPoint = null;
         }
         TimerManager.ins.clearTimer(doTween);
         TweenLite.killTweensOf(this.img_light);
         super.preClose(param1);
      }
   }
}
