package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSigninExtraRewardVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "ID";
      
      public static const STC_NAME:String = "static_signin_extra_reward";
       
      
      public var ID:int;
      
      public var order:int;
      
      public var reward:String;
      
      public function StcSigninExtraRewardVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         ID = param1[0];
         order = param1[1];
         reward = param1[2];
      }
   }
}
