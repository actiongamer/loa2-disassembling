package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcCrossArenaMassVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_cross_arena_mass";
       
      
      public var id:int;
      
      public var interval:String;
      
      public function StcCrossArenaMassVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         interval = param1[1];
      }
   }
}
