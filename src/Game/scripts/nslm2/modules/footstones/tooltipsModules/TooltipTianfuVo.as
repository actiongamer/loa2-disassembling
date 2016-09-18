package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   
   public class TooltipTianfuVo
   {
       
      
      public var tupoArr:Array;
      
      public var nowTupoLevel:int;
      
      public var totleTupoLevel:int;
      
      public function TooltipTianfuVo(param1:int)
      {
         tupoArr = [];
         super();
         var _loc2_:StcTupoVo = StcMgr.ins.getTupoVo(param1);
         if(_loc2_ == null)
         {
            totleTupoLevel = 0;
            return;
         }
         nowTupoLevel = _loc2_.tupo_level;
         var _loc3_:int = _loc2_.hero_node;
         tupoArr = StcMgr.ins.getVoArrByColumnValue("static_tupo","hero_node",_loc3_);
         tupoArr.sortOn("id",16);
         totleTupoLevel = tupoArr.length - 1;
      }
   }
}
