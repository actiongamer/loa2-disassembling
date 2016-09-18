package nslm2.nets.imsdk
{
   public class UserInfo
   {
       
      
      public var sid:String;
      
      public var rid:String;
      
      public var lstChannel:Vector.<nslm2.nets.imsdk.ChannelInfo>;
      
      public var curseq:int;
      
      public function UserInfo()
      {
         lstChannel = new Vector.<nslm2.nets.imsdk.ChannelInfo>();
         super();
      }
   }
}
