package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFamilyTechCostVo extends StcVoBase
   {
      
      public static const TECHTYPE:String = "techtype";
      
      public static const RANK:String = "rank";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_family_tech_cost";
       
      
      public var id:int;
      
      public var techtype:int;
      
      public var rank:int;
      
      public var effect:String;
      
      public var cost:int;
      
      public var personcost:String;
      
      public var costtime:int;
      
      public function StcFamilyTechCostVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         techtype = param1[1];
         rank = param1[2];
         effect = param1[3];
         cost = param1[4];
         personcost = param1[5];
         costtime = param1[6];
      }
   }
}
