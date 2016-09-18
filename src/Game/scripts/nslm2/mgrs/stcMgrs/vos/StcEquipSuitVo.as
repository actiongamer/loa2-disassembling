package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcEquipSuitVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_equip_suit";
       
      
      public var id:int;
      
      public var name:String;
      
      public var des_second:String;
      
      public var des_three:String;
      
      public var des_four:String;
      
      public var add_second:String;
      
      public var add_three:String;
      
      public var add_four:String;
      
      public function StcEquipSuitVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         des_second = param1[2];
         des_three = param1[3];
         des_four = param1[4];
         add_second = param1[5];
         add_three = param1[6];
         add_four = param1[7];
      }
   }
}
