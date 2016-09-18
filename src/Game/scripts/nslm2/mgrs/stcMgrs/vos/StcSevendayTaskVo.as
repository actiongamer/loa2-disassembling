package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSevendayTaskVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_sevenday_task";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var reset_kind:int;
      
      public var value:String;
      
      public var drop_id:int;
      
      public var desc_id:int;
      
      public var relation_func_id:int;
      
      public function StcSevendayTaskVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         reset_kind = param1[2];
         value = param1[3];
         drop_id = param1[4];
         desc_id = param1[5];
         relation_func_id = param1[6];
      }
   }
}
