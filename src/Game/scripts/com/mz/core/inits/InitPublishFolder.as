package com.mz.core.inits
{
   import com.mz.core.configs.ClientConfig;
   import org.specter3d.loaders.AssetLib;
   
   public class InitPublishFolder
   {
       
      
      public function InitPublishFolder(param1:String)
      {
         super();
         ClientConfig.assetsURL = param1 + "assets/";
         Config.resPath = ClientConfig.assetsURL + "common/";
         ClientConfig.dgScriptURL = ClientConfig.assetsURL + "common/scripts/";
         ClientConfig.chapterScriptURL = ClientConfig.assetsURL + "common/scripts/chapter/";
         ClientConfig.cityScriptURL = ClientConfig.assetsURL + "common/scripts/city/";
         AssetLib.relativePath = ClientConfig.assetsURL + "common/3d/";
      }
   }
}
