package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGonghuiVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_gonghui";
       
      
      public var id:int;
      
      public var level:int;
      
      public var exp:int;
      
      public var all_num:int;
      
      public var vice_num:int;
      
      public var zl_num:int;
      
      public var donate_reward:String;
      
      public function StcGonghuiVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         level = param1[1];
         exp = param1[2];
         all_num = param1[3];
         vice_num = param1[4];
         zl_num = param1[5];
         donate_reward = param1[6];
      }
   }
}
