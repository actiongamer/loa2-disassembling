package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeropracticeNanduVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_heropractice_nandu";
       
      
      public var id:int;
      
      public var type1:int;
      
      public var sort:int;
      
      public var locklevel:int;
      
      public var name:String;
      
      public var desc:String;
      
      public var bosssay:String;
      
      public var npcgroup:int;
      
      public var winreward:String;
      
      public var firstwin:String;
      
      public var stageid:int;
      
      public function StcHeropracticeNanduVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         type1 = param1[1];
         sort = param1[2];
         locklevel = param1[3];
         name = param1[4];
         desc = param1[5];
         bosssay = param1[6];
         npcgroup = param1[7];
         winreward = param1[8];
         firstwin = param1[9];
         stageid = param1[10];
      }
   }
}
