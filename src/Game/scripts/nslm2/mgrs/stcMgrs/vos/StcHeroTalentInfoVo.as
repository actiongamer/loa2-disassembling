package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeroTalentInfoVo extends StcVoBase
   {
      
      public static const NODE:String = "node";
      
      public static const LV:String = "lv";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_hero_talent_info";
       
      
      public var id:int;
      
      public var node:int;
      
      public var lv:int;
      
      public var cond:int;
      
      public var name:String;
      
      public var attr:String;
      
      public var cost:String;
      
      public var desc:String;
      
      public var icon:int;
      
      public var ability:int;
      
      public function StcHeroTalentInfoVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         node = param1[1];
         lv = param1[2];
         cond = param1[3];
         name = param1[4];
         attr = param1[5];
         cost = param1[6];
         desc = param1[7];
         icon = param1[8];
         ability = param1[9];
      }
   }
}
