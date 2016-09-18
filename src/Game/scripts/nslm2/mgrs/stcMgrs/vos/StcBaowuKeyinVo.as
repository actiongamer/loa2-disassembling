package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBaowuKeyinVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_baowu_keyin";
       
      
      public var id:int;
      
      public var itemid:int;
      
      public var level:int;
      
      public var exp:int;
      
      public var all_exp:int;
      
      public var add_exp:int;
      
      public var cost:String;
      
      public var add_attr:String;
      
      public function StcBaowuKeyinVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         itemid = param1[1];
         level = param1[2];
         exp = param1[3];
         all_exp = param1[4];
         add_exp = param1[5];
         cost = param1[6];
         add_attr = param1[7];
      }
   }
}
