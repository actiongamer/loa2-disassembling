package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSigninRewardVo extends StcVoBase
   {
      
      public static const MONTH:String = "month";
      
      public static const ORDER:String = "order";
      
      public static const PRIMARY_KEY:String = "ID";
      
      public static const STC_NAME:String = "static_signin_reward";
       
      
      public var ID:int;
      
      public var month:int;
      
      public var order:int;
      
      public var reward:String;
      
      public var viplimit:int;
      
      public var vipmulti:int;
      
      public var effect:int;
      
      public function StcSigninRewardVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         ID = param1[0];
         month = param1[1];
         order = param1[2];
         reward = param1[3];
         viplimit = param1[4];
         vipmulti = param1[5];
         effect = param1[6];
      }
   }
}
