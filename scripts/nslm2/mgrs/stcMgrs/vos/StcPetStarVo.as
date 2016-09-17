package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcPetStarVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const NODE:String = "node";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_pet_star";
       
      
      public var id:int;
      
      public var node:int;
      
      public var level:int;
      
      public var need_level:int;
      
      public var cost:String;
      
      public var attr:String;
      
      public var all_attr:String;
      
      public function StcPetStarVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         node = param1[1];
         level = param1[2];
         need_level = param1[3];
         cost = param1[4];
         attr = param1[5];
         all_attr = param1[6];
      }
   }
}
