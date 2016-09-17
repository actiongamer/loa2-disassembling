package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBaowuAttrVo extends StcVoBase
   {
      
      public static const ATTR:String = "attr";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_baowu_attr";
       
      
      public var id:int;
      
      public var quality:int;
      
      public var kind:int;
      
      public var attr:int;
      
      public var level:int;
      
      public var random:String;
      
      public var fix:Number;
      
      public var baowu_type:int;
      
      public var baowu_quality:int;
      
      public var desc:String;
      
      public var piece:int;
      
      public function StcBaowuAttrVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         quality = param1[1];
         kind = param1[2];
         attr = param1[3];
         level = param1[4];
         random = param1[5];
         fix = param1[6];
         baowu_type = param1[7];
         baowu_quality = param1[8];
         desc = param1[9];
         piece = param1[10];
      }
   }
}
