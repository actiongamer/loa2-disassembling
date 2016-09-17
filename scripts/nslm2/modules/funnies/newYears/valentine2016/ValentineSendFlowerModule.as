package nslm2.modules.funnies.newYears.valentine2016
{
   import game.ui.newYears.valentine2016s.ValentineSendFlowerModuleUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.newYears.valentine2016.service.ValentineService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class ValentineSendFlowerModule extends ValentineSendFlowerModuleUI
   {
       
      
      private const FLOWER_ID:int = 83020;
      
      private var id:uint;
      
      public function ValentineSendFlowerModule()
      {
         super();
         this.item_render.txt_name.x = 66;
         this.item_render.txt_name.centerX = 90;
         this.item_render.txt_name.y = 5;
         this.item_render.txt_name.align = "left";
         this.item_render.txt_num.x = 66;
         this.item_render.txt_num.y = 25;
         this.item_render.txt_num.width = 100;
         this.item_render.txt_num.align = "left";
         this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(13320004);
         this.id = param1 as uint;
         if(id > 0)
         {
            this.item_render.dataSource = WealthUtil.createItemVo(83020,1);
            _loc2_ = BagModel.ins.getStcCount(83020);
            this.item_render.txt_num.text = LocaleMgr.ins.parseParamAdvance("拥有：@{value}",[_loc2_]);
            this.btn_cancel.clickHandler = cancelClickHandler;
            this.btn_ok.clickHandler = sendFlower;
            if(_loc2_ < 9)
            {
               this.numBarRef.init(0,_loc2_,_loc2_,DefindConsts.ROSE_CHANGE_NUMBER);
               this.btn_ok.disabled = true;
            }
            else
            {
               this.numBarRef.init(DefindConsts.ROSE_CHANGE_NUMBER,_loc2_,DefindConsts.ROSE_CHANGE_NUMBER,DefindConsts.ROSE_CHANGE_NUMBER);
            }
         }
         this.preShowCpl();
      }
      
      private function numBarRef_change(param1:MzEvent) : void
      {
      }
      
      public function cancelClickHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function sendFlower() : void
      {
         ValentineService.ins.sendFlower(this.id,this.numBarRef.nowNum,cplHandler);
      }
      
      private function cplHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
         ObserverMgr.ins.sendNotice("show_eff",this.id);
         FloatUtil.showGetItemsDisplayPanel([WealthUtil.createItemVo(ValentineService.ins.dict.getValue(id),this.numBarRef.nowNum / DefindConsts.ROSE_CHANGE_NUMBER)]);
      }
   }
}
