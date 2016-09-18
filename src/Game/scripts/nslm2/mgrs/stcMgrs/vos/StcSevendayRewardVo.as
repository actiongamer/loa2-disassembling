package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSevendayRewardVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_sevenday_reward";
       
      
      public var id:int;
      
      public var title_id:int;
      
      public var desc_id:int;
      
      public var login_reward:String;
      
      public var shop_id:String;
      
      public var task_title1_id:int;
      
      public var task_content1:String;
      
      public var task_title2_id:int;
      
      public var task_content2:String;
      
      public var shop_limit_num:int;
      
      public function StcSevendayRewardVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         title_id = param1[1];
         desc_id = param1[2];
         login_reward = param1[3];
         shop_id = param1[4];
         task_title1_id = param1[5];
         task_content1 = param1[6];
         task_title2_id = param1[7];
         task_content2 = param1[8];
         shop_limit_num = param1[9];
      }
   }
}
