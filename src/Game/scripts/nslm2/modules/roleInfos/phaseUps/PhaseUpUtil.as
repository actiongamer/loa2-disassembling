package nslm2.modules.roleInfos.phaseUps
{
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   
   public class PhaseUpUtil
   {
       
      
      public function PhaseUpUtil()
      {
         super();
      }
      
      public static function getRatingArr(param1:StcHeroShengjieVo) : Array
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc4_:Array = [];
         var _loc2_:String = param1.rating;
         var _loc3_:Array = _loc2_.split("|");
         var _loc6_:int = _loc3_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = PhaseUpRatingVo.parse(_loc3_[_loc7_]);
            _loc4_.push(_loc5_);
            _loc7_++;
         }
         return _loc4_;
      }
   }
}
