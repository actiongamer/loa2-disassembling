package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcPlayerqualityVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_playerquality";
       
      
      public var id:int;
      
      public var quality:int;
      
      public var addprop:String;
      
      public function StcPlayerqualityVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         quality = param1[1];
         addprop = param1[2];
      }
   }
}
