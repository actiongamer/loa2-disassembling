package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcNewFunctionVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_new_function";
       
      
      public var id:int;
      
      public var function_id:int;
      
      public var title:String;
      
      public var icon:String;
      
      public var pic:String;
      
      public var des:String;
      
      public var timebegin:String;
      
      public var timeend:String;
      
      public var open:int;
      
      public function StcNewFunctionVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         function_id = param1[1];
         title = param1[2];
         icon = param1[3];
         pic = param1[4];
         des = param1[5];
         timebegin = param1[6];
         timeend = param1[7];
         open = param1[8];
      }
   }
}
