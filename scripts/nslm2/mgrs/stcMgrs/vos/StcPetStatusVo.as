package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcPetStatusVo extends StcVoBase
   {
      
      public static const NODE:String = "node";
      
      public static const CONDITION:String = "condition";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_pet_status";
       
      
      public var id:int;
      
      public var node:int;
      
      public var model:int;
      
      public var condition:String;
      
      public var item:String;
      
      public var add:String;
      
      public var attr:String;
      
      public function StcPetStatusVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         node = param1[1];
         model = param1[2];
         condition = param1[3];
         item = param1[4];
         add = param1[5];
         attr = param1[6];
      }
   }
}
