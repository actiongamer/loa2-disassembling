package nslm2.nets.sockets
{
   public class ServerEvent extends SimpleServerEvent
   {
       
      
      public var dataNotifyCacheVo:nslm2.nets.sockets.DataNotifyCacheVo;
      
      public var heroNotifyCacheVo:nslm2.nets.sockets.HeroNotifyCacheVo;
      
      public function ServerEvent(param1:String)
      {
         super(param1);
      }
   }
}
