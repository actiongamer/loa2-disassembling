package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGoddessScoreRewardVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_goddess_score_reward";
       
      
      public var id:int;
      
      public var score:int;
      
      public var reward:String;
      
      public function StcGoddessScoreRewardVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         score = param1[1];
         reward = param1[2];
      }
   }
}
