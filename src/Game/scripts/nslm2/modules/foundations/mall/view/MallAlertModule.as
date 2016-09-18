package nslm2.modules.foundations.mall.view
{
   import game.ui.mallModule.MallAlertModuleUI;
   import nslm2.modules.foundations.mall.service.MallService;
   import proto.MallListRes;
   import nslm2.modules.foundations.mall.model.MallModel;
   import nslm2.modules.foundations.mall.view.render.MallAlertWealthRender;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class MallAlertModule extends MallAlertModuleUI
   {
       
      
      public function MallAlertModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         MallService.ins.getMallData(updateMallData);
      }
      
      private function updateMallData(param1:MallListRes) : void
      {
         MallModel.ins.updateMallData(param1);
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.render_libao.dataSource = MallModel.ins.bannerItemList[0];
         this.img_llibaoBg.width = (this.render_libao as MallAlertWealthRender).list_wealth.width + 10;
         this.list_tuijianAndTejia.dataSource = MallModel.ins.recommendMallItemList.concat(MallModel.ins.specialMallItemList);
         this.right = 80;
         this.bottom = 36;
         this.preShowCpl();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_go !== _loc2_)
         {
            if(this.btn_close === _loc2_)
            {
               ModuleMgr.ins.closeModule(this.moduleId);
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
            ModuleMgr.ins.showModule(11200);
         }
      }
   }
}
