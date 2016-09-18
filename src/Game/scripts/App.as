package
{
   import flash.display.Stage;
   import morn.core.managers.AssetManager;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.managers.RenderManager;
   import morn.core.managers.DragManager;
   import morn.core.managers.MassLoaderManager;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.mz.core.interFace.ILocaleMgr;
   import com.mz.core.interFace.ILabelMed;
   import com.mz.core.configs.ClientConfig;
   import flash.display.Sprite;
   import morn.customs.expands.MornExpandUtil;
   import morn.customs.MornExpandConsts1;
   import morn.core.handlers.Handler;
   import morn.core.components.View;
   import com.mz.core.configs.EnvConfig;
   import global.GlobalManager;
   import com.mz.core.logging.Log;
   import com.mz.core.mgrs.VerListMgr;
   import flash.utils.ByteArray;
   
   public class App
   {
      
      public static var stage:Stage;
      
      public static var asset:AssetManager = new AssetManager();
      
      public static var timer:TimerManager = TimerManager.ins;
      
      public static var render:RenderManager = new RenderManager();
      
      public static var drag:DragManager = new DragManager();
      
      public static var mloader:MassLoaderManager = new MassLoaderManager();
      
      public static var module:UIMgr = UIMgr.ins;
      
      public static var observer:ObserverMgr = ObserverMgr.ins;
      
      public static var resMgr:ResMgr = ResMgr.ins;
      
      public static var localeMgr:ILocaleMgr;
      
      public static var labelMed:ILabelMed;
      
      public static var isInit:Boolean = false;
      
      public static var language:String = "common";
      
      public static const TW:String = "tw";
      
      public static const EN:String = "en";
      
      public static const FR:String = "fr";
      
      public static const DE:String = "de";
      
      public static const ES:String = "es";
      
      public static const PT:String = "pt";
      
      public static const RU:String = "ru";
      
      public static const PL:String = "pl";
      
      public static const IT:String = "it";
      
      public static const TR:String = "tr";
      
      public static const JA:String = "ja";
      
      public static const CN:String = "common";
      
      public static var languageAry:Array = ["en","tw","common","fr","de","es","pt","ru","pl","it","tr","ja"];
      
      public static var languageCodeIdAry:Array = [999001141,999001142,999001143,999001145,999001144,999001146,999001147,999001148,999001149,999001150,999001151];
      
      public static var gameId:String;
      
      public static var stcLang:String = "en";
      
      public static var AIR_PATH:String = "assets/common/";
       
      
      public function App()
      {
         super();
      }
      
      public static function setGameId(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
               gameId = "dev";
               stcLang = "dev";
               break;
            case 1:
               gameId = "160";
               stcLang = "en";
               break;
            case 2:
               gameId = "162";
               stcLang = "tw";
               break;
            case 3:
               gameId = "181";
               stcLang = "ru";
               break;
            case 4:
               gameId = "187";
               stcLang = "ja";
         }
         ClientConfig.gameId = gameId;
      }
      
      public static function init(param1:Sprite) : void
      {
         stage = param1.stage;
         if(isInit)
         {
            return;
         }
         isInit = true;
         stage.scaleMode = "noScale";
         stage.align = "TL";
         stage.stageFocusRect = false;
         stage.tabChildren = false;
         MornExpandUtil.registerCustomComponents(MornExpandConsts1.customCompClassArr);
         var _loc3_:Object = stage.loaderInfo.parameters;
         if(_loc3_ != null)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _loc3_;
            for(var _loc2_ in _loc3_)
            {
               if(Config[_loc2_] != null)
               {
                  Config[_loc2_] = _loc3_[_loc2_];
               }
            }
         }
         if(Config.uiPath)
         {
            App.mloader.loadDB(Config.uiPath,1,new Handler(onUIloadComplete));
         }
      }
      
      private static function onUIloadComplete(param1:*) : void
      {
         View.xmlMap = param1;
      }
      
      public static function getResPath(param1:String) : String
      {
         if(/stc\/static/g.test(param1))
         {
            if(/stc\/static_language/g.test(param1))
            {
               param1 = ClientConfig.assetsURL + ClientConfig.language + "/" + param1;
            }
            else if(EnvConfig.ins.useStaticDevDEV)
            {
               param1 = ClientConfig.assetsURL + "dev" + "/" + param1;
            }
            else
            {
               param1 = ClientConfig.assetsURL + GlobalManager.getgameIdPath(ClientConfig.gameId) + "/" + param1;
            }
         }
         else if(GlobalManager.checkPublishGolbal(param1))
         {
            if(!(/^http:\/\//g.test(param1) || /^https:\/\//g.test(param1)))
            {
               param1 = ClientConfig.assetsURL + ClientConfig.language + "/" + param1;
            }
         }
         else if(!(/^http:\/\//g.test(param1) || /^https:\/\//g.test(param1)))
         {
            param1 = Config.resPath + param1;
         }
         if(param1.indexOf("https://fbcdn-profile-") != -1)
         {
            Log.info("处理FB_不加版本号： " + param1);
         }
         else
         {
            param1 = VerListMgr.ins.addUrlVer(param1);
         }
         return param1;
      }
      
      public static function getAirResPath(param1:String) : String
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc6_:Boolean = /^http:\/\//g.test(param1);
         var _loc4_:String = "";
         if(/stc\/static/g.test(param1))
         {
            if(/stc\/static_language/g.test(param1))
            {
               _loc4_ = Config.resPath.replace("common",ClientConfig.language);
            }
            else
            {
               _loc4_ = Config.resPath.replace("common",GlobalManager.getgameIdPath(ClientConfig.gameId));
            }
         }
         else if(GlobalManager.checkPublishGolbal(param1))
         {
            _loc4_ = Config.resPath.replace("common",ClientConfig.language);
         }
         else
         {
            _loc4_ = Config.resPath;
         }
         var _loc5_:String = !!_loc6_?param1:_loc4_ + param1;
         if(_loc6_ == false && ClientConfig.airData != null)
         {
            _loc3_ = VerListMgr.ins.getVer(_loc5_);
            _loc2_ = ClientConfig.airData.checkFile(AIR_PATH + param1,_loc3_);
            if(_loc2_ != null)
            {
               return _loc2_;
            }
         }
         _loc5_ = VerListMgr.ins.addUrlVer(_loc5_);
         return _loc5_;
      }
      
      public static function airSaveFile(param1:String, param2:ByteArray) : void
      {
         var _loc3_:int = 0;
         if(ClientConfig.airData != null)
         {
            if(/stc\/static/g.test(param1))
            {
               if(/stc\/static_language/g.test(param1))
               {
                  AIR_PATH = "assets/" + language + "/";
               }
               else
               {
                  AIR_PATH = "assets/" + GlobalManager.getgameIdPath(ClientConfig.gameId) + "/";
               }
            }
            else if(GlobalManager.checkPublishGolbal(param1))
            {
               if(!(/^http:\/\//g.test(param1) || /^https:\/\//g.test(param1)))
               {
                  AIR_PATH = "assets/" + language + "/";
               }
            }
            else if(!(/^http:\/\//g.test(param1) || /^https:\/\//g.test(param1)))
            {
               AIR_PATH = "assets/common/";
            }
            param1 = AIR_PATH + param1;
            _loc3_ = VerListMgr.ins.getVer(param1);
            ClientConfig.airData.setFileVersion(param1,_loc3_,param2);
         }
      }
   }
}
