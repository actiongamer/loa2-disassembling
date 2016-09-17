package nslm2.modules.foundations.heroChoose
{
   public class HeroChooseInitVo
   {
       
      
      public var fengbaoArr:Array;
      
      public var zhenbaoArr:Array;
      
      public var shenshengArr:Array;
      
      public var alert:String;
      
      public function HeroChooseInitVo(param1:Array = null, param2:Array = null, param3:Array = null, param4:String = "")
      {
         super();
         fengbaoArr = param1;
         zhenbaoArr = param2;
         shenshengArr = param3;
         alert = param4;
      }
      
      public function hasFengbaoArr() : Boolean
      {
         return fengbaoArr && fengbaoArr.length > 0;
      }
      
      public function hasZhenbaoArr() : Boolean
      {
         return zhenbaoArr && zhenbaoArr.length > 0;
      }
      
      public function hasShenshengArr() : Boolean
      {
         return shenshengArr && shenshengArr.length > 0;
      }
      
      public function initByAllNpcId() : void
      {
         fengbaoArr = HeroChooseUtil.getNpcVoArr(1);
         zhenbaoArr = HeroChooseUtil.getNpcVoArr(3);
         shenshengArr = HeroChooseUtil.getNpcVoArr(2);
      }
   }
}
