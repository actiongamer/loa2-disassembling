package nslm2.modules.funnies.newYears.olmpic2016
{
   import game.ui.newYears.olmpic2016.OlmpicSelCountryModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import nslm2.mgrs.stcMgrs.vos.StcCountryIconVo;
   import nslm2.modules.foundations.AlertUtil;
   import proto.CrossArenaSelectCountryReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CrossArenaSelectCountryRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class OlmpicSelCountryModule extends OlmpicSelCountryModuleUI
   {
       
      
      private var curSelData:StcCountryIconVo;
      
      public function OlmpicSelCountryModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         super.preShow(param1);
         panelBg.titleImgId = 9900004;
         this.btn_rule.toolTip = LocaleMgr.ins.getStr(999902680);
         var _loc3_:Array = StcMgr.ins.getCountryIconTable().array;
         this.list.selectEnable = true;
         this.list.dataSource = _loc3_;
         if(OlmpicSelCountryModel.ins.selCountry > 0)
         {
            this.txt_desc.text = LocaleMgr.ins.getStr(999902692);
            this.btn_ok.disabled = true;
            _loc2_ = ArrayUtil.indexByAttr(_loc3_,"country",OlmpicSelCountryModel.ins.selCountry);
            if(_loc2_ >= 0)
            {
               this.list.selectedIndex = _loc2_;
            }
         }
         else if(PKCrossModel.ins.info && PKCrossModel.ins.info.status == 1)
         {
            this.txt_desc.text = LocaleMgr.ins.getStr(999902693);
            this.btn_ok.clickHandler = onOK;
         }
         else
         {
            this.txt_desc.text = LocaleMgr.ins.getStr(999902696);
            this.btn_ok.disabled = true;
         }
         this.btn_cancel.clickHandler = onCancel;
         preShowCpl();
      }
      
      private function onOK() : void
      {
         var _loc1_:* = null;
         if(list.selectedIndex < 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999902695));
            return;
         }
         curSelData = list.selectedItem as StcCountryIconVo;
         if(curSelData)
         {
            _loc1_ = new CrossArenaSelectCountryReq();
            _loc1_.country = curSelData.country;
            ServerEngine.ins.send(10033,_loc1_,onSelCountryCpl);
         }
      }
      
      private function onSelCountryCpl(param1:CrossArenaSelectCountryRes) : void
      {
         if(param1.result)
         {
            OlmpicSelCountryModel.ins.selCountry = curSelData.country;
         }
         AlertUtil.float(LocaleMgr.ins.getStr(999902694));
         ModuleMgr.ins.closeModule(9900004);
      }
      
      private function onCancel() : void
      {
         ModuleMgr.ins.closeModule(9900004);
      }
   }
}
