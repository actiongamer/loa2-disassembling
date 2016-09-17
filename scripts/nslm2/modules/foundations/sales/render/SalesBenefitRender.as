package nslm2.modules.foundations.sales.render
{
   import game.ui.salesModule.render.SalesBenefitRenderUI;
   import nslm2.modules.foundations.sales.model.SalesModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.events.MouseEvent;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.sales.vo.SalesBenefitVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.foundations.sales.service.SalesService;
   import nslm2.modules.foundations.vip.model.VipModel;
   import proto.SuperSaleGetRewardRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class SalesBenefitRender extends SalesBenefitRenderUI
   {
       
      
      private var model:SalesModel;
      
      private var btnEff:BmcSpriteSheet;
      
      public function SalesBenefitRender()
      {
         model = SalesModel.ins;
         super();
         yueKaTxt.addEventListener("click",yueKaTipTxtClick);
      }
      
      protected function yueKaTipTxtClick(param1:MouseEvent) : void
      {
         if(FuncOpenAutoCtrl.checkOpen(60530))
         {
            ModuleMgr.ins.showModule(60530,null,ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000230));
         }
      }
      
      public function get vo() : SalesBenefitVo
      {
         return dataSource as SalesBenefitVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         .super.dataSource = param1;
         if(vo)
         {
            _loc2_ = WealthUtil.dropGroupSidToWealthVoArr(vo.dropid)[0];
            itemRender.dataSource = _loc2_;
            itemRender.txt_name.visible = false;
            label_desc.color = ColorLib.qualityColor(_loc2_.quality);
            label_desc.text = _loc2_.showName + " x " + _loc2_.showCount;
            label_limit.text = LocaleMgr.ins.getStr(60540005,[vo.num]);
            _loc3_ = uint(SalesService.ins.getStatus(vo.id));
            switch(int(_loc3_))
            {
               case 0:
                  btn_canGet.label = LocaleMgr.ins.getStr(60540016);
                  btn_canGet.disabled = true;
                  btn_canGet.visible = true;
                  img_gotReward.visible = false;
                  yueKaTxt.visible = false;
                  break;
               case 1:
                  btn_canGet.visible = false;
                  img_gotReward.visible = false;
                  yueKaTxt.visible = true;
                  break;
               case 2:
                  btn_canGet.visible = false;
                  img_gotReward.visible = false;
                  yueKaTxt.visible = true;
                  break;
               case 3:
                  btn_canGet.label = LocaleMgr.ins.getStr(60540017);
                  btn_canGet.disabled = false;
                  btn_canGet.visible = true;
                  btn_canGet.clickHandler = getCplHandler;
                  img_gotReward.visible = false;
                  yueKaTxt.visible = false;
            }
            setYueKaTxt(_loc3_);
            showOrHideBtnEffect();
         }
      }
      
      private function setYueKaTxt(param1:uint) : void
      {
         if(vo.cardLimit == 1)
         {
            yueKaTipTxt.text = "<font color=\'" + (VipModel.ins.silverDay != -1?"#00ff00":"#ff0000") + "\'>" + LocaleMgr.ins.getStr(999000586) + "</font>";
         }
         else if(vo.cardLimit == 2)
         {
            yueKaTipTxt.text = "<font color=\'" + (VipModel.ins.goldDay != -1?"#00ff00":"#ff0000") + "\'>" + LocaleMgr.ins.getStr(999000587) + "</font>";
         }
         else
         {
            yueKaTipTxt.text = "";
         }
      }
      
      private function getCplHandler() : void
      {
         SalesService.ins.getReward(this.vo.id,buyCplHandler);
      }
      
      private function buyCplHandler(param1:SuperSaleGetRewardRes) : void
      {
         FloatUtil.showGetItemsDisplayPanel([itemRender.wealthVo]);
         vo.status = 4;
         btn_canGet.visible = false;
         img_gotReward.visible = true;
         if(model.alreadyget.indexOf(this.vo.id) == -1)
         {
            model.alreadyget.push(this.vo.id);
         }
         SalesService.ins.setStatus(param1.rewardId,param1.status);
         ObserverMgr.ins.sendNotice("ShowRedPoint",model.showOrHideRedPoint1());
         ObserverMgr.ins.sendNotice("RefreshBenefitList");
         showOrHideBtnEffect();
      }
      
      private function showOrHideBtnEffect() : void
      {
         if(vo && vo.status == 3)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.x = btn_canGet.x - 9;
               btnEff.y = btn_canGet.y - 10;
               this.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            if(btnEff.parent)
            {
               btnEff.parent.removeChild(btnEff);
            }
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      override public function dispose() : void
      {
         yueKaTxt.removeEventListener("click",yueKaTipTxtClick);
         super.dispose();
      }
   }
}
