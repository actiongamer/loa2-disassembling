package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFamilyExpeTaskVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_family_expe_task";
       
      
      public var id:int;
      
      public var desc:String;
      
      public var reward:String;
      
      public var continueStamp:int;
      
      public var kind:int;
      
      public var num:int;
      
      public var easy:int;
      
      public function StcFamilyExpeTaskVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         desc = param1[1];
         reward = param1[2];
         continueStamp = param1[3];
         kind = param1[4];
         num = param1[5];
         easy = param1[6];
      }
   }
}
