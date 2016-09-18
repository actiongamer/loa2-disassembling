package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.bag.UseItemTask;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.bag.UseHeroSelectBoxViewVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.quickUseModules.QuickUseModel;
   
   public class UseSingleTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      private var $vo:WealthVo;
      
      public function UseSingleTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         $vo = this.data as WealthVo;
         if($vo.stcItemVo.kind != 97)
         {
            if($vo.stcItemVo.kind == 99)
            {
               new UseItemTask($vo.item.id,$vo.item.itemId,1).addHandlers(useItemTaskCpl,diamondBoxErr).exec();
            }
            else
            {
               new UseItemTask($vo.item.id,$vo.item.itemId,1).addHandlers(useItemTaskCpl).exec();
            }
         }
         else
         {
            ModuleMgr.ins.showModule(11921,new UseHeroSelectBoxViewVo($vo,1,useItemTaskCpl),11000);
         }
      }
      
      private function diamondBoxErr(param1:UseItemTask) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = param1.errorMsg;
         if(300002005 !== _loc4_)
         {
            if(300004024 === _loc4_)
            {
               _loc2_ = StcMgr.ins.getItemVo($vo.item.itemId);
               if(_loc2_.use_cost)
               {
                  _loc3_ = WealthUtil.parseCostStr(_loc2_.use_cost);
                  AlertUtil.lackItem(_loc3_);
               }
            }
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(10000020,[$vo.stcItemVo.need_level]));
         }
      }
      
      private function useItemTaskCpl() : void
      {
         if($vo.stcItemVo.kind == 40)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(200026));
            AlertUtil.float(LocaleMgr.ins.getStr(200027,[$vo.stcItemVo.extend_1]));
         }
         QuickUseModel.ins.removeQuickUseSameId($vo.item.id);
         this.execHandlerCpl();
      }
   }
}
