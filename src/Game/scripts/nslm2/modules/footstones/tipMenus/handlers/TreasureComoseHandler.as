package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class TreasureComoseHandler extends TipMenuHandlerBase
   {
       
      
      public function TreasureComoseHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:WealthVo = this.data as WealthVo;
         ModuleMgr.ins.showModule(41218,_loc1_,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
