package nslm2.inits
{
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import com.mz.core.configs.ClientConfig;
   import morn.core.utils.FontUtils;
   
   public class InitFontTask extends GetResTask
   {
       
      
      public function InitFontTask()
      {
         super(3,"ui/Fonts.swf");
      }
      
      override public function onComplete() : void
      {
         if(ClientConfig.isChineseLang() || ClientConfig.language == "ja")
         {
            FontUtils.ins.regFont("Em_YaHeiB","Microsoft YaHei Bold");
         }
         else
         {
            FontUtils.ins.regFont("Em_YaHeiB","Arial");
         }
         FontUtils.showFonts();
         super.onComplete();
      }
   }
}
