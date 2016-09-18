package nslm2.modules.foundations.angelFund
{
   import game.ui.angelFundModule.AngelFundModuleUI;
   import proto.StaticFundModel;
   import proto.FundInfo;
   import nslm2.modules.foundations.angelFund.model.AngelFundModel;
   import nslm2.modules.foundations.angelFund.service.AngelFundService;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS1;
   import nslm2.modules.foundations.angelFund.vo.AngelFundTitleVo;
   import nslm2.utils.RTools;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import morn.core.components.Image;
   
   public class AngelFundModule extends AngelFundModuleUI
   {
       
      
      private var staticData:StaticFundModel;
      
      private var curInfo:FundInfo;
      
      public function AngelFundModule()
      {
         super();
      }
      
      public function get model() : AngelFundModel
      {
         return AngelFundModel.ins;
      }
      
      public function get service() : AngelFundService
      {
         return AngelFundService.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         switchEventListeners(true);
         if(model.haveGotFundStaticInfo)
         {
            service.requestModuleData();
         }
         else
         {
            service.requestStaticData();
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            DialMsgs.ins.addEventListener("static_data_cpl",onStaticDataCpl);
            DialMsgs.ins.addEventListener("module_data_cpl",onModuleDataCpl);
         }
         else
         {
            DialMsgs.ins.removeEventListener("static_data_cpl",onStaticDataCpl);
            DialMsgs.ins.addEventListener("module_data_cpl",onModuleDataCpl);
         }
      }
      
      protected function onModuleDataCpl(param1:Event) : void
      {
         this.moduleServerCpl();
      }
      
      private function onGetInfoCpl(param1:MzEvent) : void
      {
         this.moduleServerCpl();
      }
      
      private function onRewardCpl(param1:MzEvent) : void
      {
      }
      
      private function onStaticDataCpl(param1:Event) : void
      {
         if(model.haveGotFundStaticInfo)
         {
            service.requestModuleData();
         }
         else
         {
            AlertUtil.floadFuncTimeIsExpire(this.moduleId);
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         this.img_diamond.skin = UrlLib.itemIcon(4);
         this.img_diamond2.skin = UrlLib.itemIcon(3);
         tabBar.labels = [LocaleMgr.ins.getStr(13400001),LocaleMgr.ins.getStr(13400002),LocaleMgr.ins.getStr(13400003),LocaleMgr.ins.getStr(13400004),LocaleMgr.ins.getStr(13400005)].join(",");
         tabBar.selectedIndex = 0;
         tabBar.selectHandler = tabHandler;
         list_title.selectHandler = titleHandler;
         model.curId = model.totalIdArr.sort(16)[0];
         staticData = model.getFundData(model.curId);
         curInfo = model.getFundInfo(model.curId);
         (pageBarUI as PageBarS1).bindList(list_title);
         (pageBarUI as PageBarS1).visible = false;
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = model.totalIdArr;
         for each(var _loc3_ in model.totalIdArr)
         {
            _loc2_ = new AngelFundTitleVo();
            _loc2_.id = _loc3_;
            _loc2_.str = RTools.getStrByJSON(model.getFundData(_loc3_).fundName);
            _loc4_.push(_loc2_);
         }
         this.panelBg.titleImgId = this.moduleId;
         this.list_title.dataSource = _loc4_;
         this.list_title.selectedIndex = 0;
         this.btn_buy.clickHandler = buyHandler;
         this.btn_get.clickHandler = getHandler;
         this.txt_charge.text = LocaleMgr.ins.getStr(13400006);
         this.txt_charge.buttonMode = true;
         this.txt_charge.mouseChildren = false;
         this.txt_charge.underline = true;
         this.txt_charge.addEventListener("click",charge);
         this.txt_extra.text = LocaleMgr.ins.getStr(13400010);
         refresh();
         super.preShowCpl();
      }
      
      private function updateLabelPosition() : void
      {
         l1.width = l1.textField.textWidth + 5;
         lDiamond.width = lDiamond.textField.textWidth + 5;
         l2.width = l2.textField.textWidth + 5;
         lPercent.width = lPercent.textField.textWidth + 5;
         l3.width = l3.textField.textWidth + 5;
         l4.width = l4.textField.textWidth + 5;
      }
      
      override public function show(param1:Object = null) : void
      {
         showFloat();
         super.show();
      }
      
      public function showFloat() : void
      {
      }
      
      public function showWait() : void
      {
         TweenLite.delayedCall(5,hideWait);
      }
      
      public function hideWait() : void
      {
      }
      
      protected function charge(param1:MouseEvent) : void
      {
         VipModel.ins.gotoCharge();
      }
      
      private function getHandler() : void
      {
         service.getReward(tabBar.selectedIndex);
      }
      
      private function buyHandler() : void
      {
         AlertUtil.comfirm(LocaleMgr.ins.getStr(13400007,["@{wealth:" + WealthUtil.costStrToVo(staticData.buyCost).kind + "}",WealthUtil.costStrToVo(staticData.buyCost).showCount]),service.buyFund);
      }
      
      private function titleHandler() : void
      {
         if(list_title.selectedItem)
         {
            model.curId = (list_title.selectedItem as AngelFundTitleVo).id;
            refresh();
         }
      }
      
      private function tabHandler() : void
      {
         var _loc1_:Array = !!staticData?WealthUtil.costStrToArr(staticData.reward.split(",")[tabBar.selectedIndex]):[];
         this.list_reward.repeatX = _loc1_.length;
         this.list_reward.dataSource = _loc1_;
         this.list_reward.centerX = this.list_reward.centerX;
         this.list_reward.commitMeasure();
         if(curInfo && curInfo.isGet[tabBar.selectedIndex])
         {
            this.btn_get.disabled = true;
            this.btn_get.label = LocaleMgr.ins.getStr(10600041);
            Effect2DUtils.hideBtnEff_btnBig(this.btn_get);
         }
         else
         {
            this.btn_get.label = LocaleMgr.ins.getStr(10700007);
            if(curInfo && curInfo.isBuy && model.canGetReward(model.curId,tabBar.selectedIndex))
            {
               this.btn_get.disabled = false;
               Effect2DUtils.showBtnEff_btnBig(this.btn_get);
            }
            else
            {
               this.btn_get.disabled = true;
               Effect2DUtils.hideBtnEff_btnBig(this.btn_get);
            }
         }
      }
      
      private function refresh() : void
      {
         staticData = model.getFundData(model.curId);
         curInfo = model.getFundInfo(model.curId);
         btn_rule.toolTip = LocaleMgr.ins.getStr(13400011);
         btn_rule.mouseEvent = true;
         btn_rule.buttonMode = true;
         this.txt_buyTime.text = !!staticData?TimeUtils.getFullTimeStrCN(model.getFundInfo(model.curId).buyStartTm,false,false,RTools.cl(false,true)) + "-" + TimeUtils.getFullTimeStrCN(model.getFundInfo(model.curId).buyEndTm,false,false,RTools.cl(false,true)):"";
         this.txt_rewardTime.text = !!staticData?TimeUtils.getFullTimeStrCN(model.getFundInfo(model.curId).rewardStartTm,false,false,RTools.cl(false,true)) + "-" + TimeUtils.getFullTimeStrCN(model.getFundInfo(model.curId).rewardEndTm,false,false,RTools.cl(false,true)):"";
         if(staticData.chargeCondi > 10000)
         {
            this.lCur.size = 20;
            this.lCur.y = 8;
         }
         else
         {
            this.lCur.size = 24;
            this.lCur.y = 6;
         }
         this.lCur.text = (!!curInfo?Math.min(curInfo.charge,staticData.chargeCondi):0) + "/" + (!!staticData?staticData.chargeCondi:0);
         this.costRender.dataSource = !!staticData?WealthUtil.costStrToVo(staticData.buyCost):null;
         if(curInfo && curInfo.isBuy)
         {
            this.btn_buy.label = LocaleMgr.ins.getStr(13400009);
            Effect2DUtils.hideBtnEff_btnBig(this.btn_buy);
            this.btn_buy.disabled = true;
         }
         else
         {
            this.btn_buy.label = LocaleMgr.ins.getStr(13400008);
            if(curInfo && staticData && curInfo.charge >= staticData.chargeCondi && model.canBuyFund(model.curId))
            {
               Effect2DUtils.showBtnEff_btnBig(this.btn_buy);
               this.btn_buy.disabled = false;
            }
            else
            {
               Effect2DUtils.hideBtnEff_btnBig(this.btn_buy);
               this.btn_buy.disabled = true;
            }
         }
         this.clip_totalValue.value = !!staticData?staticData.priceDesc:0;
         this.lDiamond.text = (String(!!staticData?staticData.priceDesc:0)) + LocaleMgr.ins.getStr(999900511);
         this.lPercent.text = (String(!!staticData?staticData.fundDesc:0)) + LocaleMgr.ins.getStr(999900513);
         updateLabelPosition();
         tabHandler();
         checkLabelRedPoint();
      }
      
      override public function getFocusNotices() : Array
      {
         return ["fund_buy_cpl","fund_get_reward_cpl"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("fund_buy_cpl" !== _loc3_)
         {
            if("fund_get_reward_cpl" === _loc3_)
            {
               FloatUtil.showGetItemsDisplayPanel(list_reward.dataSource as Array);
               this.btn_get.label = LocaleMgr.ins.getStr(10600041);
               Effect2DUtils.hideBtnEff_btnBig(this.btn_get);
               this.btn_get.disabled = true;
               checkLabelRedPoint();
            }
         }
         else
         {
            this.btn_buy.label = LocaleMgr.ins.getStr(13400009);
            Effect2DUtils.hideBtnEff_btnBig(this.btn_buy);
            this.btn_buy.disabled = true;
            checkLabelRedPoint();
            tabHandler();
         }
      }
      
      public function checkLabelRedPoint() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = !!curInfo?curInfo.isGet:[];
         _loc1_ = 0;
         while(_loc1_ < 5)
         {
            if(_loc1_ < _loc2_.length)
            {
               if(curInfo.isBuy && _loc2_[_loc1_] == false && model.canGetReward(model.curId,_loc1_))
               {
                  (this["img_red" + _loc1_] as Image).visible = true;
               }
               else
               {
                  (this["img_red" + _loc1_] as Image).visible = false;
               }
            }
            else
            {
               (this["img_red" + _loc1_] as Image).visible = false;
            }
            _loc1_++;
         }
      }
   }
}
