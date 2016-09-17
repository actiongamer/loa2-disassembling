package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class EquipComposeTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function EquipComposeTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:WealthVo = this.data as WealthVo;
         ModuleMgr.ins.showModule(11040,_loc1_.item,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
