package nslm2.modules.foundations.heroChoose
{
   public class HeroChooseModel
   {
      
      private static var _ins:nslm2.modules.foundations.heroChoose.HeroChooseModel;
       
      
      public var choosedNpcId:int;
      
      public function HeroChooseModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.heroChoose.HeroChooseModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.heroChoose.HeroChooseModel();
         }
         return _ins;
      }
   }
}
