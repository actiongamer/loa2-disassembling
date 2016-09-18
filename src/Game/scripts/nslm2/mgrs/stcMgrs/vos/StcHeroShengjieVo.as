package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeroShengjieVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const KIND:String = "kind";
      
      public static const KIND_HERO:int = 1;
      
      public static const KIND_PET:int = 2;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_hero_shengjie";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var level:int;
      
      public var name:String;
      
      public var item:String;
      
      public var exp_range:String;
      
      public var add_attr:String;
      
      public var skill_level:int;
      
      public var rating:String;
      
      public var glory_rating:Number;
      
      public function StcHeroShengjieVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         level = param1[2];
         name = param1[3];
         item = param1[4];
         exp_range = param1[5];
         add_attr = param1[6];
         skill_level = param1[7];
         rating = param1[8];
         glory_rating = param1[9];
      }
   }
}
