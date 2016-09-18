package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSysMailVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_sys_mail";
       
      
      public var id:int;
      
      public var title:String;
      
      public var content:String;
      
      public var reward:String;
      
      public function StcSysMailVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         title = param1[1];
         content = param1[2];
         reward = param1[3];
      }
   }
}
