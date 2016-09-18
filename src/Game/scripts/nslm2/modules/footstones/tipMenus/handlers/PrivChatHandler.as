package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.vo.PlayerVo;
   
   public class PrivChatHandler extends TipMenuHandlerBase
   {
       
      
      public function PrivChatHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(10540,vo,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      public function get vo() : PlayerVo
      {
         return this.data as PlayerVo;
      }
   }
}
