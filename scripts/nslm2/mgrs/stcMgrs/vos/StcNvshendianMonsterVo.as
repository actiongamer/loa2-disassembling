package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcNvshendianMonsterVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_nvshendian_monster";
       
      
      public var id:int;
      
      public var layer:int;
      
      public var mulitple:int;
      
      public var object_ids:String;
      
      public var ratio:Number;
      
      public var position:int;
      
      public var btlpower:int;
      
      public function StcNvshendianMonsterVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         layer = param1[1];
         mulitple = param1[2];
         object_ids = param1[3];
         ratio = param1[4];
         position = param1[5];
         btlpower = param1[6];
      }
   }
}
