package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class RuneComposeTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function RuneComposeTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:WealthVo = this.data as WealthVo;
         if(int(_loc1_.stcItemVo.extend_2) >= DefindConsts.FUMO_MAXLV)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30600213));
            return;
         }
         ModuleMgr.ins.showModule(30602,_loc1_.item,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
