package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcEquipAddStarVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_equip_add_star";
       
      
      public var id:int;
      
      public var equipId:int;
      
      public var star:int;
      
      public var cost:String;
      
      public var addstrep:int;
      
      public var totalstep:int;
      
      public var property:String;
      
      public var extra_property:String;
      
      public var cost_red:String;
      
      public var addstepbyred:int;
      
      public function StcEquipAddStarVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         equipId = param1[1];
         star = param1[2];
         cost = param1[3];
         addstrep = param1[4];
         totalstep = param1[5];
         property = param1[6];
         extra_property = param1[7];
         cost_red = param1[8];
         addstepbyred = param1[9];
      }
   }
}
