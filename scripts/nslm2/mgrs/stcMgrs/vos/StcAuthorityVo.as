package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcAuthorityVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_authority";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var desc:int;
      
      public function StcAuthorityVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         desc = param1[2];
      }
   }
}
