package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcMapVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_map";
       
      
      public var id:int;
      
      public var layer:int;
      
      public var ratio:String;
      
      public var speed:int;
      
      public function StcMapVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         layer = param1[1];
         ratio = param1[2];
         speed = param1[3];
      }
   }
}
