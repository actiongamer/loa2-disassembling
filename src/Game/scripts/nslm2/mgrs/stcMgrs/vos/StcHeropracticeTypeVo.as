package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeropracticeTypeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_heropractice_type";
       
      
      public var id:int;
      
      public var type1:int;
      
      public var name:String;
      
      public var desc:String;
      
      public var icon:int;
      
      public var challengetimes:int;
      
      public var openlevel:int;
      
      public var opentime:int;
      
      public var sort:int;
      
      public function StcHeropracticeTypeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         type1 = param1[1];
         name = param1[2];
         desc = param1[3];
         icon = param1[4];
         challengetimes = param1[5];
         openlevel = param1[6];
         opentime = param1[7];
         sort = param1[8];
      }
   }
}
