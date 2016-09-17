package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFamilyBossRewardVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_family_boss_reward";
       
      
      public var id:int;
      
      public var damage:int;
      
      public var dmg_drop:int;
      
      public var level:int;
      
      public function StcFamilyBossRewardVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         damage = param1[1];
         dmg_drop = param1[2];
         level = param1[3];
      }
   }
}
