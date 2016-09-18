package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSupportDevelopVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const KIND:String = "kind";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_support_develop";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var condition_1:int;
      
      public var condition_2:int;
      
      public var attr_type:int;
      
      public var attr:String;
      
      public var level:int;
      
      public var name:String;
      
      public var desc:String;
      
      public function StcSupportDevelopVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         condition_1 = param1[2];
         condition_2 = param1[3];
         attr_type = param1[4];
         attr = param1[5];
         level = param1[6];
         name = param1[7];
         desc = param1[8];
      }
   }
}
