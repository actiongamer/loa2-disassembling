package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcEquipStrengthVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_equip_strength";
       
      
      public var id:int;
      
      public var next_id:int;
      
      public var level:int;
      
      public var cost_gold:int;
      
      public var unlock_level:int;
      
      public var add_growth:String;
      
      public function StcEquipStrengthVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         next_id = param1[1];
         level = param1[2];
         cost_gold = param1[3];
         unlock_level = param1[4];
         add_growth = param1[5];
      }
   }
}
