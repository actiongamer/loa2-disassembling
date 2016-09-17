package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcLevelVo extends StcVoBase
   {
      
      public static const KIND:String = "kind";
      
      public static const LEVEL:String = "level";
      
      public static const QUALITY:String = "quality";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_level";
       
      
      public var id:int;
      
      public var level:int;
      
      public var kind:int;
      
      public var quality:int;
      
      public var exp:int;
      
      public var all_exp:int;
      
      public var max_stamina:int;
      
      public var stamina_recovery:int;
      
      public function StcLevelVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         level = param1[1];
         kind = param1[2];
         quality = param1[3];
         exp = param1[4];
         all_exp = param1[5];
         max_stamina = param1[6];
         stamina_recovery = param1[7];
      }
   }
}
