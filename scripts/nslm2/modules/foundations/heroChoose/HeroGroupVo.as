package nslm2.modules.foundations.heroChoose
{
   public class HeroGroupVo
   {
       
      
      public var group:int;
      
      public var heroArr:Array;
      
      public function HeroGroupVo(param1:int, param2:Array = null)
      {
         super();
         group = param1;
         heroArr = param2;
      }
      
      public function hasChooseHero() : Boolean
      {
         return heroArr && heroArr.length;
      }
   }
}
