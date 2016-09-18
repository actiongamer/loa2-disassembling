package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeroPeiyangLimitVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_hero_peiyang_limit";
       
      
      public var id:int;
      
      public var quality:int;
      
      public var level:int;
      
      public var hp:Number;
      
      public var attack:Number;
      
      public var physical_defence:Number;
      
      public var magic_defence:Number;
      
      public function StcHeroPeiyangLimitVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         quality = param1[1];
         level = param1[2];
         hp = param1[3];
         attack = param1[4];
         physical_defence = param1[5];
         magic_defence = param1[6];
      }
   }
}
