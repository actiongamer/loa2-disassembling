package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcMengyueVo extends StcVoBase
   {
      
      public static const NODE:String = "node";
      
      public static const KIND:String = "kind";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_mengyue";
       
      
      public var id:int;
      
      public var node:int;
      
      public var kind:int;
      
      public var condition:String;
      
      public var attr:String;
      
      public var name:String;
      
      public var desc:String;
      
      public function StcMengyueVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         node = param1[1];
         kind = param1[2];
         condition = param1[3];
         attr = param1[4];
         name = param1[5];
         desc = param1[6];
      }
   }
}
