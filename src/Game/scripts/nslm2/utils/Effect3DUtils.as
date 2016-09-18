package nslm2.utils
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   
   public class Effect3DUtils
   {
       
      
      public function Effect3DUtils()
      {
         super();
      }
      
      public static function getUrlBySid(param1:int) : String
      {
         var _loc2_:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(param1);
         return "particle/" + _loc2_.effect;
      }
   }
}
