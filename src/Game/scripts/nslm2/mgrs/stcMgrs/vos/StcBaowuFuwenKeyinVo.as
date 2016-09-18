package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBaowuFuwenKeyinVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const QUALITY:String = "quality";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_baowu_fuwen_keyin";
       
      
      public var id:int;
      
      public var quality:int;
      
      public var level:int;
      
      public var kind:int;
      
      public var exp:int;
      
      public var all_exp:int;
      
      public var add_exp:int;
      
      public var cost:String;
      
      public var normal_attr:String;
      
      public var fuwen_attr:Number;
      
      public function StcBaowuFuwenKeyinVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         quality = param1[1];
         level = param1[2];
         kind = param1[3];
         exp = param1[4];
         all_exp = param1[5];
         add_exp = param1[6];
         cost = param1[7];
         normal_attr = param1[8];
         fuwen_attr = param1[9];
      }
   }
}
