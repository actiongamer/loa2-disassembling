package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcEquipAttrVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_equip_attr";
       
      
      public var id:int;
      
      public var itemid:int;
      
      public var active_condi_kind:int;
      
      public var active_condi_value:Number;
      
      public var attr_kind:int;
      
      public var attr_value:String;
      
      public var attr_name:String;
      
      public var attr_disc:String;
      
      public var active_disc:String;
      
      public var show_order:int;
      
      public function StcEquipAttrVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         itemid = param1[1];
         active_condi_kind = param1[2];
         active_condi_value = param1[3];
         attr_kind = param1[4];
         attr_value = param1[5];
         attr_name = param1[6];
         attr_disc = param1[7];
         active_disc = param1[8];
         show_order = param1[9];
      }
   }
}
