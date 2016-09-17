package nslm2.modules.cultivates.heroBag
{
   import proto.HeroInfo;
   
   public class HeroPieceActiveSuccessParam
   {
       
      
      public var heroInfo:HeroInfo;
      
      public var handler;
      
      public function HeroPieceActiveSuccessParam(param1:HeroInfo, param2:*)
      {
         super();
         this.heroInfo = param1;
         this.handler = param2;
      }
   }
}
