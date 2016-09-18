package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcDefineVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "define_name";
      
      public static const STC_NAME:String = "static_define";
       
      
      public var define_name:String;
      
      public var define_value:String;
      
      public var describe:String;
      
      public function StcDefineVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         define_name = param1[0];
         define_value = param1[1];
         describe = param1[2];
      }
   }
}
