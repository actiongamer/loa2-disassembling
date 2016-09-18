package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcClotheSuitVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_clothe_suit";
       
      
      public var id:int;
      
      public var name:String;
      
      public var skill_1:int;
      
      public var skill_2:int;
      
      public function StcClotheSuitVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         skill_1 = param1[2];
         skill_2 = param1[3];
      }
   }
}
