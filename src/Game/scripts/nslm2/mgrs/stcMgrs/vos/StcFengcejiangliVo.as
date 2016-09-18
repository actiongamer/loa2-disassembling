package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFengcejiangliVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "account";
      
      public static const STC_NAME:String = "static_fengcejiangli";
       
      
      public var account:String;
      
      public var level:int;
      
      public function StcFengcejiangliVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         account = param1[0];
         level = param1[1];
      }
   }
}
