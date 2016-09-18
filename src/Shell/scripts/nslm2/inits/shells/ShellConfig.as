package nslm2.inits.shells
{
   import com.mz.core.utils.LocalData;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.VerListMgr;
   
   public class ShellConfig
   {
      
      public static var mainLoadingArg:Array = null;
       
      
      public function ShellConfig()
      {
         super();
      }
      
      public static function testMainLoadingArg() : void
      {
         var _loc1_:String = LocalData.insCurPlayer.load("SHELL_MALL_LOADING_ARG_1",null);
         if(_loc1_)
         {
            mainLoadingArg = [_loc1_,LocalData.insCurPlayer.load("SHELL_MALL_LOADING_ARG_2",null)];
         }
      }
      
      public static function initMainLoadingArg() : void
      {
         if(ClientConfig.language == "tw")
         {
            mainLoadingArg = [ClientConfig.publishPath + VerListMgr.ins.addUrlVer("assets/" + ClientConfig.language + "/img/loading/" + "logo_" + ClientConfig.gameId + ".png"),ClientConfig.publishPath + VerListMgr.ins.addUrlVer("assets/" + ClientConfig.language + "/img/loading/" + "bg_" + ClientConfig.gameId + ".jpg")];
         }
         else
         {
            mainLoadingArg = [ClientConfig.publishPath + VerListMgr.ins.addUrlVer("assets/" + ClientConfig.language + "/img/loading/logo.png"),ClientConfig.publishPath + VerListMgr.ins.addUrlVer("assets/" + ClientConfig.language + "/img/loading/bg.jpg")];
         }
      }
   }
}
