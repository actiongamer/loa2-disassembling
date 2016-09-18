package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcWorldBossVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_world_boss";
       
      
      public var id:int;
      
      public var object_id:int;
      
      public var kill_drop:int;
      
      public var rank:int;
      
      public var grow:Number;
      
      public var ability:int;
      
      public function StcWorldBossVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         object_id = param1[1];
         kill_drop = param1[2];
         rank = param1[3];
         grow = param1[4];
         ability = param1[5];
      }
   }
}
