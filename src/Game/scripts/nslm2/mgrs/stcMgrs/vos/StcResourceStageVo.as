package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcResourceStageVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_resource_stage";
       
      
      public var id:int;
      
      public var name:int;
      
      public var des:int;
      
      public var sceneid:int;
      
      public var bossid:int;
      
      public var iconid:int;
      
      public var stema:int;
      
      public var level:int;
      
      public var levelvip:int;
      
      public var types:int;
      
      public var basetype:int;
      
      public var baseid:int;
      
      public var maxreward:int;
      
      public var formula:int;
      
      public var extrareward:String;
      
      public function StcResourceStageVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         des = param1[2];
         sceneid = param1[3];
         bossid = param1[4];
         iconid = param1[5];
         stema = param1[6];
         level = param1[7];
         levelvip = param1[8];
         types = param1[9];
         basetype = param1[10];
         baseid = param1[11];
         maxreward = param1[12];
         formula = param1[13];
         extrareward = param1[14];
      }
   }
}
