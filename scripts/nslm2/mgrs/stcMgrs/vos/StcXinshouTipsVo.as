package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcXinshouTipsVo extends StcVoBase
   {
      
      public static const FUNC_ID:String = "func_id";
      
      public static const GROUP:String = "group";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_xinshou_tips";
       
      
      public var id:int;
      
      public var talk_id:int;
      
      public var func_id:int;
      
      public var comp_id:String;
      
      public var level:String;
      
      public var check:String;
      
      public var num:int;
      
      public var offest:int;
      
      public var direction:String;
      
      public var priority:int;
      
      public var group:int;
      
      public function StcXinshouTipsVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         talk_id = param1[1];
         func_id = param1[2];
         comp_id = param1[3];
         level = param1[4];
         check = param1[5];
         num = param1[6];
         offest = param1[7];
         direction = param1[8];
         priority = param1[9];
         group = param1[10];
      }
   }
}
