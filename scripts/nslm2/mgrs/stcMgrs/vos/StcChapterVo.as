package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcChapterVo extends StcVoBase
   {
      
      public static const SORT:String = "sort";
      
      public static const KIND:String = "kind";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_chapter";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var name:String;
      
      public var sort:int;
      
      public var star_level_needed:String;
      
      public var reward_drop_id:String;
      
      public var description:String;
      
      public function StcChapterVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         name = param1[2];
         sort = param1[3];
         star_level_needed = param1[4];
         reward_drop_id = param1[5];
         description = param1[6];
      }
   }
}
