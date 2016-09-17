package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcCountryIconVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "country";
      
      public static const STC_NAME:String = "static_country_icon";
       
      
      public var country:int;
      
      public var name:int;
      
      public var icon:String;
      
      public function StcCountryIconVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         country = param1[0];
         name = param1[1];
         icon = param1[2];
      }
   }
}
