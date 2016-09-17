package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeroDescVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_hero_desc";
       
      
      public var id:int;
      
      public var hero_id:int;
      
      public var desc_total:String;
      
      public var skill:int;
      
      public var sound:int;
      
      public function StcHeroDescVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         hero_id = param1[1];
         desc_total = param1[2];
         skill = param1[3];
         sound = param1[4];
      }
   }
}
