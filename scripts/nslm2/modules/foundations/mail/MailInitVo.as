package nslm2.modules.foundations.mail
{
   import com.netease.protobuf.UInt64;
   
   public class MailInitVo
   {
       
      
      public var id:UInt64;
      
      public var receiverNameArr:Array;
      
      public var title:String;
      
      public var content:String;
      
      public var kind:int;
      
      public var rewardArr:Array;
      
      public var senderName:String;
      
      public var senderTm:uint;
      
      public var status:uint;
      
      public function MailInitVo(param1:UInt64 = null, param2:Array = null, param3:int = 2, param4:String = "", param5:String = "", param6:Array = null, param7:String = "", param8:uint = 0, param9:uint = 0)
      {
         super();
         id = param1;
         receiverNameArr = param2;
         title = param4;
         kind = param3;
         content = param5;
         rewardArr = param6;
         senderName = param7;
         senderTm = param8;
         status = param9;
      }
   }
}
