package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFacebookInviteRewardVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "ID";
      
      public static const STC_NAME:String = "static_facebook_invite_reward";
       
      
      public var ID:int;
      
      public var times:int;
      
      public var reward:String;
      
      public function StcFacebookInviteRewardVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         ID = param1[0];
         times = param1[1];
         reward = param1[2];
      }
   }
}
