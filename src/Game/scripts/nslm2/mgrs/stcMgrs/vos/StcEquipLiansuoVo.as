package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcEquipLiansuoVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_equip_liansuo";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var level:int;
      
      public var desc:String;
      
      public var add_growth:String;
      
      public var condition:int;
      
      public var condition2:int;
      
      public function StcEquipLiansuoVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         level = param1[2];
         desc = param1[3];
         add_growth = param1[4];
         condition = param1[5];
         condition2 = param1[6];
      }
   }
}
