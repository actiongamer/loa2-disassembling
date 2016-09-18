package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSaddlehorseVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_saddlehorse";
       
      
      public var id:int;
      
      public var name:String;
      
      public var prop:String;
      
      public var glory:int;
      
      public var rank:int;
      
      public var item:String;
      
      public var model:String;
      
      public var quality:int;
      
      public var prev:int;
      
      public function StcSaddlehorseVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         prop = param1[2];
         glory = param1[3];
         rank = param1[4];
         item = param1[5];
         model = param1[6];
         quality = param1[7];
         prev = param1[8];
      }
   }
}
