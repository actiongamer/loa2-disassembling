package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFamilyStageNodeVo extends StcVoBase
   {
      
      public static const CHAPTER_ID:String = "chapterid";
      
      public static const POSITION:String = "position";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_family_stage_node";
       
      
      public var id:int;
      
      public var chapterid:int;
      
      public var kind:int;
      
      public var name:String;
      
      public var icon:int;
      
      public var rewarddes:String;
      
      public var stageid:int;
      
      public var npcgroup:int;
      
      public var rewardtype1:int;
      
      public var rewardresid1:int;
      
      public var formularid1:int;
      
      public var rewardreslimit1:int;
      
      public var rewardtype2:int;
      
      public var rewardresid2:int;
      
      public var formularid2:int;
      
      public var rewardreslimit2:int;
      
      public var lastfight:String;
      
      public var killforfamily:String;
      
      public var position:String;
      
      public var tubiao:int;
      
      public var gongxian:int;
      
      public var killforfund:int;
      
      public var descript:String;
      
      public var sort:int;
      
      public function StcFamilyStageNodeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         chapterid = param1[1];
         kind = param1[2];
         name = param1[3];
         icon = param1[4];
         rewarddes = param1[5];
         stageid = param1[6];
         npcgroup = param1[7];
         rewardtype1 = param1[8];
         rewardresid1 = param1[9];
         formularid1 = param1[10];
         rewardreslimit1 = param1[11];
         rewardtype2 = param1[12];
         rewardresid2 = param1[13];
         formularid2 = param1[14];
         rewardreslimit2 = param1[15];
         lastfight = param1[16];
         killforfamily = param1[17];
         position = param1[18];
         tubiao = param1[19];
         gongxian = param1[20];
         killforfund = param1[21];
         descript = param1[22];
         sort = param1[23];
      }
   }
}
