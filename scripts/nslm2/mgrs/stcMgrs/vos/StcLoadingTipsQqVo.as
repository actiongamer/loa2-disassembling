package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcLoadingTipsQqVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_loading_tips_qq";
       
      
      public var id:int;
      
      public var vip:String;
      
      public var lv:String;
      
      public var textid:int;
      
      public var trigger:String;
      
      public var weight:int;
      
      public function StcLoadingTipsQqVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         vip = param1[1];
         lv = param1[2];
         textid = param1[3];
         trigger = param1[4];
         weight = param1[5];
      }
   }
}
