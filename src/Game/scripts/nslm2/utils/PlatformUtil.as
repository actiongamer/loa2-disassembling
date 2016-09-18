package nslm2.utils
{
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.configs.ClientConfig;
   
   public class PlatformUtil
   {
       
      
      public function PlatformUtil()
      {
         super();
      }
      
      public static function get isShowFaceBook() : Boolean
      {
         if(EnvConfig.ins.ptId == 592 && ClientConfig.gameId == "167" || EnvConfig.ins.ptId == 592 && ClientConfig.gameId == "160")
         {
            return true;
         }
         return false;
      }
      
      public static function get isShowFaceBookFenSiYe() : Boolean
      {
         if(EnvConfig.ins.ptId == 592 && ClientConfig.gameId == "167" || EnvConfig.ins.ptId == 592 && ClientConfig.gameId == "160" || (EnvConfig.ins.ptId == 2284 || EnvConfig.ins.ptId == 2283 || EnvConfig.ins.ptId == 2302))
         {
            return true;
         }
         return false;
      }
      
      public static function get isFeedShowFaceBook() : Boolean
      {
         if(EnvConfig.ins.ptId == 592 && ClientConfig.gameId == "167" || EnvConfig.ins.ptId == 592 && ClientConfig.gameId == "160" || ClientConfig.gameId == "162" && ClientConfig.fb_flag == "1" || EnvConfig.ins.showDevModule)
         {
            return true;
         }
         return false;
      }
   }
}
