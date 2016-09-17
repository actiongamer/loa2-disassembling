package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.mall.vo.MallParamVo;
   
   public class BuyTreasureBoxMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function BuyTreasureBoxMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc1_:int = 0;
         var _loc2_:WealthVo = this.data as WealthVo;
         var _loc3_:* = _loc2_.stcItemVo.id;
         if(17500 !== _loc3_)
         {
            if(17510 !== _loc3_)
            {
               if(17520 === _loc3_)
               {
                  _loc1_ = 2050;
               }
            }
            else
            {
               _loc1_ = 2040;
            }
         }
         else
         {
            _loc1_ = 2030;
         }
         ModuleMgr.ins.showModule(11200,new MallParamVo(2,_loc1_),ModuleMgr.ins.popLayer.curModuleId);
         super.exec();
      }
   }
}
