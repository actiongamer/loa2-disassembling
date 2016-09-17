package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBgeloIntvlVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_bgelo_intvl";
       
      
      public var id:int;
      
      public var need_score:String;
      
      public function StcBgeloIntvlVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         need_score = param1[1];
      }
   }
}
