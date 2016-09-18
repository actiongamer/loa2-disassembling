package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFamilyStageChapterVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_family_stage_chapter";
       
      
      public var id:int;
      
      public var name:String;
      
      public var icon:int;
      
      public var sort:int;
      
      public var prechapter:int;
      
      public var reqlevel:int;
      
      public var dec:String;
      
      public var tuijianzhandouli:String;
      
      public var rbuffpool:String;
      
      public var showreward:String;
      
      public var relreward:String;
      
      public var anweijiang:String;
      
      public var rewardpos:String;
      
      public function StcFamilyStageChapterVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         icon = param1[2];
         sort = param1[3];
         prechapter = param1[4];
         reqlevel = param1[5];
         dec = param1[6];
         tuijianzhandouli = param1[7];
         rbuffpool = param1[8];
         showreward = param1[9];
         relreward = param1[10];
         anweijiang = param1[11];
         rewardpos = param1[12];
      }
   }
}
