package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcTupoVo extends StcVoBase
   {
      
      public static const HERO_NODE:String = "hero_node";
      
      public static const TUPO_LEVEL:String = "tupo_level";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_tupo";
       
      
      public var id:int;
      
      public var hero_node:int;
      
      public var tupo_level:int;
      
      public var cost_res:String;
      
      public var cost_hero:String;
      
      public var cost_item:String;
      
      public var need_level:int;
      
      public var attr:String;
      
      public var skill_count:int;
      
      public var name:String;
      
      public var desc:String;
      
      public function StcTupoVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         hero_node = param1[1];
         tupo_level = param1[2];
         cost_res = param1[3];
         cost_hero = param1[4];
         cost_item = param1[5];
         need_level = param1[6];
         attr = param1[7];
         skill_count = param1[8];
         name = param1[9];
         desc = param1[10];
      }
   }
}
