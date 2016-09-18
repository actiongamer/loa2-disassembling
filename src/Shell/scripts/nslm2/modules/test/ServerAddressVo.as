package nslm2.modules.test
{
   public class ServerAddressVo
   {
      
      public static const ID:String = "id";
      
      public static const AUTHOR_CN:String = "author_cn";
      
      public static const IP:String = "ip";
      
      public static const PORT:String = "port";
      
      public static const DISTRICT:String = "district";
       
      
      public var id:int;
      
      public var author_cn:String;
      
      public var ip:String;
      
      public var port:int;
      
      public var district:String;
      
      public var token:String = "123456";
      
      public var chat_ip:String;
      
      public var publishPath:String;
      
      public var lang:String = "en";
      
      public var gameid:String = "160";
      
      public function ServerAddressVo(param1:int, param2:String, param3:String, param4:int, param5:String, param6:String = "en", param7:* = "160")
      {
         super();
         this.id = param1;
         this.author_cn = param2;
         this.ip = param3;
         this.port = param4;
         this.district = param5;
         this.lang = param6;
         this.gameid = param7;
      }
   }
}
