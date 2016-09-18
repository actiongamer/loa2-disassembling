package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFunctionOpenTipsVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "ID";
      
      public static const STC_NAME:String = "static_function_open_tips";
       
      
      public var ID:int;
      
      public var name:String;
      
      public var icon:int;
      
      public var functionOpenLv:int;
      
      public var tipsOpenLv:int;
      
      public var describe:String;
      
      public function StcFunctionOpenTipsVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         ID = param1[0];
         name = param1[1];
         icon = param1[2];
         functionOpenLv = param1[3];
         tipsOpenLv = param1[4];
         describe = param1[5];
      }
   }
}
