package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeroTalentVo extends StcVoBase
   {
      
      public static const NODE:String = "node";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_hero_talent";
       
      
      public var id:int;
      
      public var node:int;
      
      public var talent_1:int;
      
      public var talent_2:int;
      
      public var talent_3:int;
      
      public function StcHeroTalentVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         node = param1[1];
         talent_1 = param1[2];
         talent_2 = param1[3];
         talent_3 = param1[4];
      }
   }
}
