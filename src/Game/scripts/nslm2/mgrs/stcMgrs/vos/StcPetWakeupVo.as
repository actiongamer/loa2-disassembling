package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcPetWakeupVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const KIND:String = "kind";
      
      public static const KIND_NODE:int = 1;
      
      public static const KIND_LEVEL:int = 2;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_pet_wakeup";
       
      
      public var id:int;
      
      public var level:int;
      
      public var kind:int;
      
      public var attr:String;
      
      public var need_status:int;
      
      public var cost:String;
      
      public var quality:int;
      
      public function StcPetWakeupVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         level = param1[1];
         kind = param1[2];
         attr = param1[3];
         need_status = param1[4];
         cost = param1[5];
         quality = param1[6];
      }
   }
}
