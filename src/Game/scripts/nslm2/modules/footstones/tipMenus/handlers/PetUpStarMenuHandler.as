package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class PetUpStarMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function PetUpStarMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:WealthVo = this.data as WealthVo;
         ModuleMgr.ins.showModule(32000,[int(_loc1_.stcItemVo.extend_2),2],ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
