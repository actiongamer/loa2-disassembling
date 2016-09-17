package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBaowuStrengthVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_baowu_strength";
       
      
      public var id:int;
      
      public var quality:int;
      
      public var level:int;
      
      public var exp:int;
      
      public var all_exp:int;
      
      public var playerLevel:int;
      
      public function StcBaowuStrengthVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         quality = param1[1];
         level = param1[2];
         exp = param1[3];
         all_exp = param1[4];
         playerLevel = param1[5];
      }
   }
}
