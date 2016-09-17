package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcEquipJinglianVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_equip_jinglian";
       
      
      public var id:int;
      
      public var next_id:int;
      
      public var level:int;
      
      public var need_exp:int;
      
      public var unlock_level:int;
      
      public var add_growth:String;
      
      public var all_exp:int;
      
      public function StcEquipJinglianVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         next_id = param1[1];
         level = param1[2];
         need_exp = param1[3];
         unlock_level = param1[4];
         add_growth = param1[5];
         all_exp = param1[6];
      }
   }
}
