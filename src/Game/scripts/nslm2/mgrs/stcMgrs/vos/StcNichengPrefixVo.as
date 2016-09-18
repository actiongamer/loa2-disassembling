package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcNichengPrefixVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_nicheng_prefix";
       
      
      public var id:int;
      
      public var prefix:String;
      
      public function StcNichengPrefixVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         prefix = param1[1];
      }
   }
}
