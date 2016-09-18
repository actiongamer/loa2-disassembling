package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcManifestoVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_manifesto";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var manifesto:String;
      
      public var describe:String;
      
      public var language_id:int;
      
      public function StcManifestoVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         manifesto = param1[2];
         describe = param1[3];
         language_id = param1[4];
      }
   }
}
