package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHorsejingtongVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_horsejingtong";
       
      
      public var id:int;
      
      public var desc:String;
      
      public var level:int;
      
      public var exp:int;
      
      public var singleexp:int;
      
      public var singlecost:String;
      
      public var prop:String;
      
      public var rank:int;
      
      public var skilltype:int;
      
      public var sort:int;
      
      public function StcHorsejingtongVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         desc = param1[1];
         level = param1[2];
         exp = param1[3];
         singleexp = param1[4];
         singlecost = param1[5];
         prop = param1[6];
         rank = param1[7];
         skilltype = param1[8];
         sort = param1[9];
      }
   }
}
