package nslm2.modules.cultivates.horse.utils
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHorsejingtongVo;
   import nslm2.mgrs.stcMgrs.vos.StcHorseupgradeVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HorseUtil
   {
       
      
      public function HorseUtil()
      {
         super();
      }
      
      public static function getLevelName(param1:int) : String
      {
         var _loc2_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(param1);
         var _loc3_:StcHorseupgradeVo = StcMgr.ins.getVoByColumnValue("static_horseupgrade","level",_loc2_.rank);
         return LocaleMgr.ins.getStr(_loc3_.name) + LocaleMgr.ins.getStr(999001132,[_loc2_.level]);
      }
      
      public static function getRank(param1:int) : int
      {
         var _loc2_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(param1);
         if(_loc2_)
         {
            return _loc2_.rank;
         }
         return 0;
      }
   }
}
