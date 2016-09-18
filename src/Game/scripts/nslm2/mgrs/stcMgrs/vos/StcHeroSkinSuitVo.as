package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeroSkinSuitVo extends StcVoBase
   {
      
      public static const NODE:String = "node";
      
      public static const NUM:String = "num";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_hero_skin_suit";
       
      
      public var id:int;
      
      public var node:int;
      
      public var num:int;
      
      public var attr:String;
      
      public var name:String;
      
      public var desc:String;
      
      public var total_name:String;
      
      public function StcHeroSkinSuitVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         node = param1[1];
         num = param1[2];
         attr = param1[3];
         name = param1[4];
         desc = param1[5];
         total_name = param1[6];
      }
   }
}
