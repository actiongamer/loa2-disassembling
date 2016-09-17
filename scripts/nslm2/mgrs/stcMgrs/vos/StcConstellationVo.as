package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcConstellationVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_constellation";
       
      
      public var id:int;
      
      public var name:String;
      
      public var map_id:int;
      
      public var sort:int;
      
      public var drop_id:int;
      
      public var descrip:String;
      
      public var npcgroup:int;
      
      public var player_lv:int;
      
      public var offset:String;
      
      public var drop_gold:int;
      
      public var stage:int;
      
      public var exp:int;
      
      public var recomability:int;
      
      public function StcConstellationVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         map_id = param1[2];
         sort = param1[3];
         drop_id = param1[4];
         descrip = param1[5];
         npcgroup = param1[6];
         player_lv = param1[7];
         offset = param1[8];
         drop_gold = param1[9];
         stage = param1[10];
         exp = param1[11];
         recomability = param1[12];
      }
   }
}
