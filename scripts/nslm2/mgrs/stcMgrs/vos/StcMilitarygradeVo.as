package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcMilitarygradeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_militarygrade";
       
      
      public var id:int;
      
      public var name:String;
      
      public var icon:int;
      
      public var color:int;
      
      public function StcMilitarygradeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         icon = param1[2];
         color = param1[3];
      }
   }
}
