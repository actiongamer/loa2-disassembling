package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGonghuiZhiweiVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_gonghui_zhiwei";
       
      
      public var id:int;
      
      public var name:String;
      
      public var kind:int;
      
      public var next:int;
      
      public var exp:int;
      
      public var desc:String;
      
      public var reward:int;
      
      public var normalAuth:String;
      
      public var superAuth:String;
      
      public var zhiweitype:int;
      
      public function StcGonghuiZhiweiVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         kind = param1[2];
         next = param1[3];
         exp = param1[4];
         desc = param1[5];
         reward = param1[6];
         normalAuth = param1[7];
         superAuth = param1[8];
         zhiweitype = param1[9];
      }
   }
}
