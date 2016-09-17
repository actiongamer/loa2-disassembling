package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcLessVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_less";
       
      
      public var id:int;
      
      public var function_id:String;
      
      public var star:String;
      
      public var para_id:String;
      
      public var name:String;
      
      public var desc:String;
      
      public var desc_all:String;
      
      public function StcLessVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         function_id = param1[1];
         star = param1[2];
         para_id = param1[3];
         name = param1[4];
         desc = param1[5];
         desc_all = param1[6];
      }
   }
}
