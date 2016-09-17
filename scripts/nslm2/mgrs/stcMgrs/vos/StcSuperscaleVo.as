package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSuperscaleVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_superscale";
       
      
      public var id:int;
      
      public var content:String;
      
      public var kind:int;
      
      public var originalprice:String;
      
      public var currentprice:String;
      
      public var discount:Number;
      
      public var progress:int;
      
      public var costlimit:int;
      
      public var levellow:int;
      
      public var levelhigh:int;
      
      public var viplow:int;
      
      public var viphigh:int;
      
      public var weight:int;
      
      public var superweight:int;
      
      public var conditional:String;
      
      public function StcSuperscaleVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         content = param1[1];
         kind = param1[2];
         originalprice = param1[3];
         currentprice = param1[4];
         discount = param1[5];
         progress = param1[6];
         costlimit = param1[7];
         levellow = param1[8];
         levelhigh = param1[9];
         viplow = param1[10];
         viphigh = param1[11];
         weight = param1[12];
         superweight = param1[13];
         conditional = param1[14];
      }
   }
}
