package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class ShowGotWayHandler extends TipMenuHandlerBase
   {
       
      
      public function ShowGotWayHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         super.exec();
         if(this.data is WealthVo)
         {
            _loc1_ = this.data as WealthVo;
            if(_loc1_)
            {
               _loc2_ = new ResGetPointModuleParam();
               _loc2_.wealthKind = _loc1_.kind;
               _loc2_.sid = _loc1_.sid;
               _loc2_.count = 1;
               ModuleMgr.ins.showModule(12101,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
      }
   }
}
