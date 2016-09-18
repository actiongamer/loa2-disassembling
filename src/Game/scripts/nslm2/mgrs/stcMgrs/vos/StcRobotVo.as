package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcRobotVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_robot";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var player_hero_level:int;
      
      public var player_hero_tupo:int;
      
      public var hero_quality:int;
      
      public var hero_level:int;
      
      public var hero_tupo:int;
      
      public var equip_ids:String;
      
      public var equip_level:int;
      
      public var equip_num:int;
      
      public var robot_num:int;
      
      public var desc:String;
      
      public var heroIds:String;
      
      public function StcRobotVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         player_hero_level = param1[2];
         player_hero_tupo = param1[3];
         hero_quality = param1[4];
         hero_level = param1[5];
         hero_tupo = param1[6];
         equip_ids = param1[7];
         equip_level = param1[8];
         equip_num = param1[9];
         robot_num = param1[10];
         desc = param1[11];
         heroIds = param1[12];
      }
   }
}
