package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFadeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_fade";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var time:int;
      
      public var ease:String;
      
      public var offset_x:int;
      
      public var offset_y:int;
      
      public var alpha:String;
      
      public var scale_x:String;
      
      public var scale_y:String;
      
      public var value1:String;
      
      public var value2:String;
      
      public var value3:String;
      
      public var value4:String;
      
      public var value5:String;
      
      public function StcFadeVo()
      {
         super();
      }
      
      public function get list_offsetDelay() : int
      {
         return int(this.value1);
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         time = param1[2];
         ease = param1[3];
         offset_x = param1[4];
         offset_y = param1[5];
         alpha = param1[6];
         scale_x = param1[7];
         scale_y = param1[8];
         value1 = param1[9];
         value2 = param1[10];
         value3 = param1[11];
         value4 = param1[12];
         value5 = param1[13];
      }
   }
}
