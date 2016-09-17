package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSpringFirecrackerRewardVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_spring_firecracker_reward";
       
      
      public var id:int;
      
      public var num:int;
      
      public var reward:String;
      
      public function StcSpringFirecrackerRewardVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         num = param1[1];
         reward = param1[2];
      }
   }
}
