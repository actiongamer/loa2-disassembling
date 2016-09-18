package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcYunbiaoVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "Id";
      
      public static const STC_NAME:String = "static_yunbiao";
       
      
      public var Id:int;
      
      public var quality:int;
      
      public var name:String;
      
      public var baseReward:String;
      
      public var otherReward:String;
      
      public var robBaseReward:String;
      
      public var robOtherReward:String;
      
      public var robCount:int;
      
      public var firstratio:String;
      
      public var refreshratio:Number;
      
      public var totaltime:int;
      
      public function StcYunbiaoVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         Id = param1[0];
         quality = param1[1];
         name = param1[2];
         baseReward = param1[3];
         otherReward = param1[4];
         robBaseReward = param1[5];
         robOtherReward = param1[6];
         robCount = param1[7];
         firstratio = param1[8];
         refreshratio = param1[9];
         totaltime = param1[10];
      }
   }
}
