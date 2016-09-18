package nslm2.modules.battles.resourceDungeons
{
   public class ResDgExtrawardVo
   {
       
      
      public var need:int;
      
      public var gain:int;
      
      public function ResDgExtrawardVo()
      {
         super();
      }
      
      public static function parse(param1:String) : ResDgExtrawardVo
      {
         var _loc2_:ResDgExtrawardVo = new ResDgExtrawardVo();
         var _loc3_:Array = param1.split(":");
         _loc2_.need = _loc3_[0];
         _loc2_.gain = _loc3_[1];
         return _loc2_;
      }
   }
}
