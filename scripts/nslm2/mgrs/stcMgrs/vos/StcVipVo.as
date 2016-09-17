package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcVipVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_vip";
       
      
      public var id:int;
      
      public var name:String;
      
      public var desc:String;
      
      public var is_show:int;
      
      public var vip_0:String;
      
      public var vip_1:String;
      
      public var vip_2:String;
      
      public var vip_3:String;
      
      public var vip_4:String;
      
      public var vip_5:String;
      
      public var vip_6:String;
      
      public var vip_7:String;
      
      public var vip_8:String;
      
      public var vip_9:String;
      
      public var vip_10:String;
      
      public var vip_11:String;
      
      public var vip_12:String;
      
      public var vip_13:String;
      
      public var vip_14:String;
      
      public var vip_15:String;
      
      public var sort:int;
      
      public function StcVipVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         desc = param1[2];
         is_show = param1[3];
         vip_0 = param1[4];
         vip_1 = param1[5];
         vip_2 = param1[6];
         vip_3 = param1[7];
         vip_4 = param1[8];
         vip_5 = param1[9];
         vip_6 = param1[10];
         vip_7 = param1[11];
         vip_8 = param1[12];
         vip_9 = param1[13];
         vip_10 = param1[14];
         vip_11 = param1[15];
         vip_12 = param1[16];
         vip_13 = param1[17];
         vip_14 = param1[18];
         vip_15 = param1[19];
         sort = param1[20];
      }
   }
}
