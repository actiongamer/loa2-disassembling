package nslm2.modules.roleInfos.phaseUps
{
   public class PhaseUpRatingVo
   {
      
      public static const EXP:String = "exp";
      
      public static const PERCENT:String = "percent";
       
      
      public var exp:Number;
      
      public var percent:Number;
      
      public function PhaseUpRatingVo(param1:Number, param2:Number)
      {
         super();
         this.exp = param1;
         this.percent = param2;
      }
      
      public static function parse(param1:String) : PhaseUpRatingVo
      {
         var _loc2_:Array = param1.split(":");
         return new PhaseUpRatingVo(_loc2_[0],_loc2_[1]);
      }
   }
}
