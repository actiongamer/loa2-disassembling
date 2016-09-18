package nslm2.nets.sockets
{
   public class ServerConsts
   {
      
      public static const FLAG_ERR:int = 2;
      
      public static const SERVICE_LOGIN:int = 3;
      
      public static const SERVICE_NORMAL:int = 5;
      
      private static var _ins:nslm2.nets.sockets.ServerConsts;
       
      
      public var autoFloatCMDDic:Object;
      
      public var blockAutoRefreshCMDDict:Object;
      
      public var autoDisplayCMDDic:Object;
      
      public function ServerConsts()
      {
         autoFloatCMDDic = {};
         blockAutoRefreshCMDDict = {};
         autoDisplayCMDDic = {};
         super();
      }
      
      public static function get ins() : nslm2.nets.sockets.ServerConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.nets.sockets.ServerConsts();
         }
         return _ins;
      }
      
      public function init() : void
      {
         autoFloatCMDDic[0] = 1;
         autoFloatCMDDic[7069] = 1;
         autoDisplayCMDDic[4022] = 1;
         blockAutoRefreshCMDDict[7433] = 1;
         blockAutoRefreshCMDDict[8156] = 1;
         blockAutoRefreshCMDDict[8008] = 1;
         blockAutoRefreshCMDDict[8301] = 1;
         blockAutoRefreshCMDDict[4021] = 1;
         blockAutoRefreshCMDDict[5330] = 1;
         blockAutoRefreshCMDDict[5331] = 1;
         blockAutoRefreshCMDDict[8057] = 1;
         blockAutoRefreshCMDDict[8061] = 1;
         blockAutoRefreshCMDDict[3025] = 1;
         blockAutoRefreshCMDDict[6301] = 1;
         blockAutoRefreshCMDDict[4031] = 1;
         blockAutoRefreshCMDDict[5225] = 1;
         blockAutoRefreshCMDDict[3025] = 1;
         blockAutoRefreshCMDDict[7518] = 1;
      }
   }
}
