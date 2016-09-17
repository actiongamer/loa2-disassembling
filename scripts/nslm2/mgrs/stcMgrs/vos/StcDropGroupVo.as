package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcDropGroupVo extends StcVoBase
   {
      
      public static const DROP_GROUP_ID:String = "drop_group_id";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_drop_group";
       
      
      public var id:int;
      
      public var drop_group_id:int;
      
      public var call_prob:Number;
      
      public var correctable:int;
      
      public function StcDropGroupVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         drop_group_id = param1[1];
         call_prob = param1[2];
         correctable = param1[3];
      }
   }
}
