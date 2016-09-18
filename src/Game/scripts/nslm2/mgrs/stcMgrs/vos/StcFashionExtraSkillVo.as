package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFashionExtraSkillVo extends StcVoBase
   {
      
      public static const SKILL_ID:String = "skillId";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_fashion_extra_skill";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var skillId:int;
      
      public var floatRange1:String;
      
      public var floatRange2:String;
      
      public var intRange:int;
      
      public function StcFashionExtraSkillVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         skillId = param1[2];
         floatRange1 = param1[3];
         floatRange2 = param1[4];
         intRange = param1[5];
      }
   }
}
