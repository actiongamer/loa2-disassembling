package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGrowthVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_growth";
       
      
      public var id:int;
      
      public var hp:Number;
      
      public var attack:Number;
      
      public var physical_defence:Number;
      
      public var magic_defence:Number;
      
      public var agility:Number;
      
      public var hit_rating:Number;
      
      public var dodge_rating:Number;
      
      public var block_rating:Number;
      
      public var crit_rating:Number;
      
      public var resilience_rating:Number;
      
      public function StcGrowthVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         hp = param1[1];
         attack = param1[2];
         physical_defence = param1[3];
         magic_defence = param1[4];
         agility = param1[5];
         hit_rating = param1[6];
         dodge_rating = param1[7];
         block_rating = param1[8];
         crit_rating = param1[9];
         resilience_rating = param1[10];
      }
   }
}
