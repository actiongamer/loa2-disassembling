package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcNvshendianBuffVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "layer";
      
      public static const STC_NAME:String = "static_nvshendian_buff";
       
      
      public var layer:int;
      
      public var kind:int;
      
      public var buff_1:String;
      
      public var buff_2:String;
      
      public var buff_3:String;
      
      public var baoxiang:String;
      
      public var zhandoujiangli:String;
      
      public var jiage:String;
      
      public var showReward:String;
      
      public function StcNvshendianBuffVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         layer = param1[0];
         kind = param1[1];
         buff_1 = param1[2];
         buff_2 = param1[3];
         buff_3 = param1[4];
         baoxiang = param1[5];
         zhandoujiangli = param1[6];
         jiage = param1[7];
         showReward = param1[8];
      }
   }
}
