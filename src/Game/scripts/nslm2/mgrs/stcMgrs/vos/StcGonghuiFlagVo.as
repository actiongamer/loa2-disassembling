package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGonghuiFlagVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_gonghui_flag";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var icon:int;
      
      public var level:int;
      
      public function StcGonghuiFlagVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         icon = param1[2];
         level = param1[3];
      }
   }
}
