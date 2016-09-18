package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcRecommendHeroVo extends StcVoBase
   {
      
      public static const GROUP:String = "group";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_recommend_hero";
       
      
      public var id:int;
      
      public var name:String;
      
      public var group:String;
      
      public var battle:String;
      
      public var support:String;
      
      public var desc:String;
      
      public function StcRecommendHeroVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         group = param1[2];
         battle = param1[3];
         support = param1[4];
         desc = param1[5];
      }
   }
}
