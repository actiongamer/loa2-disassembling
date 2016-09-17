package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class Stc14DayTaskVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_14_day_task";
       
      
      public var id:int;
      
      public var name:String;
      
      public var des:String;
      
      public var loginreward:String;
      
      public var taskTitle:int;
      
      public var taskcontent:String;
      
      public var taskTitle_1:int;
      
      public var taskContent_1:String;
      
      public var vip0:String;
      
      public var vip1:String;
      
      public var vip2:String;
      
      public var vip3:String;
      
      public var vip4:String;
      
      public var vip5:String;
      
      public var vip6:String;
      
      public var vip7:String;
      
      public var vip8:String;
      
      public var vip9:String;
      
      public var vip10:String;
      
      public var vip11:String;
      
      public var vip12:String;
      
      public var vip13:String;
      
      public var vip14:String;
      
      public var vip15:String;
      
      public function Stc14DayTaskVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         des = param1[2];
         loginreward = param1[3];
         taskTitle = param1[4];
         taskcontent = param1[5];
         taskTitle_1 = param1[6];
         taskContent_1 = param1[7];
         vip0 = param1[8];
         vip1 = param1[9];
         vip2 = param1[10];
         vip3 = param1[11];
         vip4 = param1[12];
         vip5 = param1[13];
         vip6 = param1[14];
         vip7 = param1[15];
         vip8 = param1[16];
         vip9 = param1[17];
         vip10 = param1[18];
         vip11 = param1[19];
         vip12 = param1[20];
         vip13 = param1[21];
         vip14 = param1[22];
         vip15 = param1[23];
      }
   }
}
