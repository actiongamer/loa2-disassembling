package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcMilitaryrankVo extends StcVoBase
   {
      
      public static const SEQ:String = "seq";
      
      public static const KIND:String = "kind";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_militaryrank";
       
      
      public var id:int;
      
      public var name:String;
      
      public var kind:int;
      
      public var prop:String;
      
      public var cond:String;
      
      public var icon:int;
      
      public var grade:int;
      
      public var seq:int;
      
      public function StcMilitaryrankVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         kind = param1[2];
         prop = param1[3];
         cond = param1[4];
         icon = param1[5];
         grade = param1[6];
         seq = param1[7];
      }
   }
}
