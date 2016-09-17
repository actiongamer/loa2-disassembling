package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFashionSynVo extends StcVoBase
   {
      
      public static const ITEM:String = "item";
      
      public static const ITEM_TYPE:String = "itemType";
      
      public static const SKILL:String = "skill";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_fashion_syn";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var item:int;
      
      public var prop:String;
      
      public var skill:int;
      
      public var costItem:String;
      
      public var extraCost:String;
      
      public var xilianCost:String;
      
      public var itemType:int;
      
      public var typeName:String;
      
      public var typeDesc:String;
      
      public function StcFashionSynVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         item = param1[2];
         prop = param1[3];
         skill = param1[4];
         costItem = param1[5];
         extraCost = param1[6];
         xilianCost = param1[7];
         itemType = param1[8];
         typeName = param1[9];
         typeDesc = param1[10];
      }
   }
}
