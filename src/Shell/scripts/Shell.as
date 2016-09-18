package
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.display.DisplayObject;
   import flash.external.ExternalInterface;
   import com.junkbyte.console.Cc;
   import com.mz.core.logging.Log;
   import nslm2.modules.logModules.LCAppender;
   import com.mz.core.configs.ClientConfig;
   import flash.system.Capabilities;
   import com.mz.core.configs.EnvConfig;
   import nslm2.nets.imsdk.Base64;
   import flash.utils.ByteArray;
   import protoExtras.QQLoginExtra;
   import nslm2.modules.test.ServerAddressLib;
   import nslm2.modules.test.ServerAddressVo;
   import org.specter3d.utils.MD5;
   import com.mz.core.utils.LocalData;
   import nslm2.inits.shells.ShellConfig;
   import nslm2.modules.logModules.LogModuelAppender;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.events.Event;
   import morn.core.utils.BaUtil;
   import com.mz.core.mgrs.resMgrs.ZipBaVo;
   import com.mz.core.mgrs.VerListMgr;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import nslm2.common.configs.StcLanguageConfig;
   import nslm2.nets.sockets.SimpleServerEngine;
   import flash.text.TextFormat;
   import proto.ProtocolStatusRes;
   import flash.display.Loader;
   import flash.system.LoaderContext;
   import flash.system.ApplicationDomain;
   import flash.display.LoaderInfo;
   import flash.events.MouseEvent;
   import com.mz.core.utils.DisplayUtils;
   import flash.display.InteractiveObject;
   import morn.core.utils.URLUtils;
   import flash.events.TextEvent;
   import flash.system.Security;
   
   public class Shell extends Sprite
   {
       
      
      private var _disConnTip:TextField;
      
      private var _isPreloadMainLoadingPage:Boolean = false;
      
      private var _mainLoadingPage;
      
      private var _isCreateRoleCpl:Boolean = false;
      
      private var _isLoadedMainState:int = 0;
      
      private var _gameMain:DisplayObject;
      
      private var isfromIndex:Boolean = false;
      
      public function Shell()
      {
         var _loc1_:* = null;
         super();
         try
         {
            Security.allowDomain("*");
         }
         catch(err:Error)
         {
         }
         if(this.stage)
         {
            _loc1_ = this.loaderInfo.parameters;
            if(_loc1_ && _loc1_.hasOwnProperty("cdn"))
            {
               this.init(_loc1_);
            }
            else
            {
               this.init(null);
            }
            stage.addEventListener("resize",stageResize);
            try
            {
               ExternalInterface.call("findDimensions");
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      public function airInit(param1:Object) : void
      {
         init(param1);
         stage.addEventListener("resize",stageResize);
         try
         {
            ExternalInterface.call("findDimensions");
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public function init(param1:Object, param2:Boolean = false) : void
      {
         var _loc11_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         isfromIndex = param2;
         try
         {
         }
         catch(err:Error)
         {
         }
         Cc.startOnStage(this,"[[[]]]`");
         Cc.visible = false;
         Cc.x = 450;
         Cc.y = 100;
         Cc.config.maxLines = 400;
         Cc.config.sharedObjectName = null;
         Cc.config.commandLineAllowed = true;
         Cc.config.commandLineAutoScope = true;
         Cc.commandLine = true;
         Log.regUncatchError(this.loaderInfo);
         Log.addApender(new LCAppender());
         this.stage.scaleMode = "noScale";
         this.stage.align = "TL";
         ClientConfig.isMacOs = Capabilities.os.indexOf("Mac") > -1;
         if(param1 && param1.hasOwnProperty("cdn"))
         {
            ClientConfig.publishPath = param1["cdn"];
            EnvConfig.ins.weiDuan = param1["weiduan"];
            ClientConfig.chargeURL = param1["charge_url"];
            ClientConfig.mainPageURL = param1["favorite_url"];
            if(ClientConfig.publishPath.lastIndexOf("/") != ClientConfig.publishPath.length - 1)
            {
               ClientConfig.publishPath = ClientConfig.publishPath + "/";
            }
            ClientConfig.playId = param1["account"];
            ClientConfig.token = param1["token"];
            ClientConfig.serverIP = param1["status"];
            ClientConfig.serverPort = param1["port"];
            ClientConfig.district = param1["sid"];
            ClientConfig.version = param1["version"];
            ClientConfig.chatIP = param1["chatIP"];
            ClientConfig.ServerName = param1["sname"];
            ClientConfig.PlatName = param1["oname"];
            ClientConfig.battleReportUrl = param1["btlurl"];
            ClientConfig.adultFlag = param1["adult_flag"];
            ClientConfig.adInfo = param1["ad_info"];
            ClientConfig.userIP = param1["ip"];
            ClientConfig.time = param1["time"];
            ClientConfig.gameTime = param1["game_time"];
            ClientConfig.regTime = param1["rtime"];
            ClientConfig.qqParam = param1["other"];
            ClientConfig.fbInviteType = param1["fbInviteType"];
            ClientConfig.fbVerify = param1["verify"];
            ClientConfig.gameId = param1["game_id"];
            if(param1["lang"] != null)
            {
               ClientConfig.language = param1["lang"];
            }
            try
            {
               ClientConfig.reStartCallBack = param1["reStartCallBack"];
            }
            catch($err:Error)
            {
               Log.error(this,"reStartCallBack",$err,$err.getStackTrace());
            }
            EnvConfig.ins.ptId = param1["op_id"];
            if(param1.hasOwnProperty("fb_flag"))
            {
               ClientConfig.fb_flag = param1["fb_flag"];
            }
            if(EnvConfig.ins.ptId == 0)
            {
               EnvConfig.ins.ptId = 590;
            }
            if(param1.hasOwnProperty("airData"))
            {
               ClientConfig.airData = param1["airData"];
               if(ClientConfig.battleReportUrl.indexOf("http://") == -1)
               {
                  ClientConfig.battleReportUrl = "http:" + ClientConfig.battleReportUrl;
               }
            }
            if(param1.hasOwnProperty("shellY"))
            {
               EnvConfig.ins.shellY = param1["shellY"];
            }
            else
            {
               EnvConfig.ins.shellY = 0;
            }
            _loc11_ = param1["banben"];
            if(_loc11_)
            {
               if(_loc11_.indexOf("qq_") == 0)
               {
                  EnvConfig.ins.mode = 2201;
                  EnvConfig.ins.ptId = 82;
                  if(_loc11_ == "qq_test")
                  {
                     EnvConfig.ins.isQQTest = true;
                  }
                  EnvConfig.ins.zoneId = param1["op_sid"];
                  EnvConfig.ins.openId = ClientConfig.playId;
               }
               else if(_loc11_ == "qa")
               {
                  EnvConfig.ins.mode = 140;
               }
               else if(_loc11_ == "dev")
               {
                  EnvConfig.ins.mode = 131;
               }
               else
               {
                  EnvConfig.ins.mode = 130;
               }
            }
            else
            {
               EnvConfig.ins.mode = 150;
            }
            if(ClientConfig.qqParam)
            {
               _loc9_ = Base64.decodeToByteArray(ClientConfig.qqParam);
               _loc10_ = new QQLoginExtra();
               try
               {
                  _loc10_.readFromSlice(_loc9_,0);
               }
               catch($err:Error)
               {
                  Log.error(this,"qqLoginExtra",$err,$err.getStackTrace());
               }
            }
            if(_loc10_ && _loc10_.platform)
            {
               EnvConfig.ins.pf = _loc10_.platform;
               if(_loc10_.platform == "qzone")
               {
                  EnvConfig.ins.showQQRule = true;
               }
               else if(_loc10_.platform == "qqgame")
               {
                  EnvConfig.ins.isQQGame = true;
               }
               else if(_loc10_.platform.indexOf("*") > -1 && _loc10_.platform.indexOf("union") == 0)
               {
                  EnvConfig.ins.useQQ_LEAGUE = true;
               }
            }
            if(EnvConfig.ins.ptId == 82)
            {
               EnvConfig.ins.showQQModule = true;
            }
         }
         else
         {
            _loc7_ = ServerAddressLib.ins.getValue(0);
            if(_loc7_.publishPath)
            {
               ClientConfig.publishPath = _loc7_.publishPath;
            }
            else
            {
               ClientConfig.publishPath = "../../../publish/";
            }
            if(_loc7_.chat_ip)
            {
               ClientConfig.chatIP = _loc7_.chat_ip;
            }
            ClientConfig.playId = "ljx_y_1";
            ClientConfig.userIP = "192.168.1.1";
            ClientConfig.serverIP = _loc7_.ip;
            ClientConfig.serverPort = _loc7_.port;
            ClientConfig.district = uint(_loc7_.district);
            ClientConfig.adultFlag = 1;
            ClientConfig.adInfo = "1";
            ClientConfig.language = "tw";
            ClientConfig.gameId = _loc7_.gameid;
            ClientConfig.ServerName = "测试服";
            ClientConfig.PlatName = "游族官网";
            _loc8_ = _loc7_.token + ClientConfig.playId + ClientConfig.district.toString() + ClientConfig.time.toString() + ClientConfig.userIP + ClientConfig.adultFlag.toString() + ClientConfig.gameTime.toString() + ClientConfig.qqParam;
            ClientConfig.token = MD5.hash(_loc8_);
            _loc5_ = ClientConfig.token;
            ClientConfig.version = 9;
            EnvConfig.ins.shellY = 0;
            EnvConfig.ins.mode = 120;
            if(_loc7_.id == 0)
            {
               EnvConfig.ins.useStaticDevDEV = true;
            }
         }
         if(ClientConfig.airData != null)
         {
            EnvConfig.ins.weiDuan = 1;
         }
         CallJsMrg.ins.init(this);
         this.y = EnvConfig.ins.shellY;
         ClientConfig.showLog = LocalData.insCurPlayer.load("showLog",true);
         ClientConfig.IS_REFRESH_AUTO = LocalData.insCurPlayer.load("isRefreshAuto",false);
         ShellConfig.testMainLoadingArg();
         LocalData.insCurPlayer.save("isRefreshAuto",false);
         if(ClientConfig.showLog)
         {
            Log.debug(this,"Log默认开启","792");
            try
            {
               if(param1)
               {
                  Log.debug(this,JSON.stringify(param1),param1["op_id"]);
               }
               Log.debug(this,"EnvConfig.ins.ptId",EnvConfig.ins.ptId);
            }
            catch($err:Error)
            {
               Log.debug(this,$err,$err.getStackTrace());
            }
         }
         LogModuelAppender.ins;
         var _loc6_:int = LocalData.insCurPlayer.load("test net error",0);
         if(_loc6_)
         {
            Log.info(this,"test net error",_loc6_);
            _loc6_--;
            LocalData.insCurPlayer.save("test net error",_loc6_);
            disConnHandler();
         }
         else
         {
            if(isfromIndex)
            {
               ver_list_onCpl(null);
            }
            else
            {
               _loc4_ = new URLLoader();
               _loc4_.dataFormat = "binary";
               _loc4_.addEventListener("complete",ver_list_onCpl);
               _loc3_ = ClientConfig.publishPath + "ver_list.ba?v=" + ClientConfig.version;
               _loc4_.load(new URLRequest(_loc3_));
            }
            this.stage.addEventListener("mouseDown",stageMouseDown);
         }
      }
      
      private function ver_list_onCpl(param1:Event) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         if(!isfromIndex)
         {
            param1.currentTarget.removeEventListener("complete",ver_list_onCpl);
            _loc5_ = BaUtil.unzipOne(param1.currentTarget.data) as ZipBaVo;
            _loc2_ = _loc5_.ba.readUTFBytes(_loc5_.ba.length);
            VerListMgr.ins.init(_loc2_);
         }
         var _loc6_:ContextMenu = new ContextMenu();
         _loc6_.customItems.push(new ContextMenuItem("version-s:" + ClientConfig.version));
         _loc6_.customItems.push(new ContextMenuItem("version-c:" + VerListMgr.ins.getVer("shell.swf")));
         stage.showDefaultContextMenu = false;
         _loc6_.hideBuiltInItems();
         contextMenu = _loc6_;
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.addEventListener("complete",languageAry_onCpl);
         var _loc8_:String = ClientConfig.gameId;
         var _loc7_:String = "language_config";
         if(_loc8_ == "167")
         {
            _loc8_ = "162";
         }
         if(_loc8_ == "186")
         {
            _loc8_ = "160";
            _loc7_ = "bp_language_config";
         }
         var _loc3_:String = ClientConfig.publishPath + VerListMgr.ins.addUrlVer("assets/" + _loc8_ + "/stc/" + _loc7_ + ".xml");
         _loc4_.load(new URLRequest(_loc3_));
      }
      
      private function languageAry_onCpl(param1:Event) : void
      {
         var _loc2_:URLLoader = param1.currentTarget as URLLoader;
         _loc2_.removeEventListener("complete",languageAry_onCpl);
         var _loc3_:XML = XML(_loc2_.data);
         ClientConfig.languageAry = String(_loc3_.languageAry.@array).split(",");
         ClientConfig.languageCodeIdAry = String(_loc3_.languageAry.@codeIdAry).split(",");
         checkNeedCreateRole();
      }
      
      private function loadLangConfig() : void
      {
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener("complete",lanConfigComplete);
         var _loc1_:String = ClientConfig.publishPath + VerListMgr.ins.addUrlVer("assets/" + ClientConfig.language + "/stc/StcLanguage.xml");
         _loc2_.load(new URLRequest(_loc1_));
      }
      
      protected function lanConfigComplete(param1:Event) : void
      {
         param1.currentTarget.removeEventListener("complete",lanConfigComplete);
         if(_disConnTip)
         {
            return;
         }
         StcLanguageConfig.ins.parseXMl(XML(param1.currentTarget.data));
      }
      
      private function checkNeedCreateRole() : void
      {
         SimpleServerEngine.ins.addForbidenFun(addForbidenFun);
         SimpleServerEngine.ins.addOnceHandler(2001,createRoleComplete,login_err);
         SimpleServerEngine.ins.disConnHandler = disConnHandler;
         SimpleServerEngine.ins.init();
      }
      
      private function addForbidenFun() : void
      {
         this.removeChildren();
         _disConnTip = new TextField();
         _disConnTip.defaultTextFormat = new TextFormat(null,18,16777215,null,null,null,null,null,"center");
         _disConnTip.multiline = true;
         var _loc2_:String = "";
         var _loc3_:* = ClientConfig.language;
         if("tw" !== _loc3_)
         {
            if("cn" !== _loc3_)
            {
            }
            addr40:
            _loc2_ = "Sorry, your account has been banned. Please contact our customer service for more info.";
            var _loc1_:String = "<font color=\'#FF3300\' size=\'20\'>" + _loc2_ + "\n\n\n</font>";
            _disConnTip.htmlText = _loc1_;
            _disConnTip.width = 600;
            _disConnTip.height = 300;
            _disConnTip.x = (stage.stageWidth - _disConnTip.width) / 2;
            _disConnTip.y = (stage.stageHeight - _disConnTip.height) / 2;
            this.addChild(_disConnTip);
            return;
         }
         _loc2_ = "對不起，您的帳號已經被封禁，請聯繫客服瞭解詳情。";
         _loc2_ = "對不起，您的帳號已經被封禁，請聯繫客服瞭解詳情。";
         §§goto(addr40);
      }
      
      private function createRoleComplete(param1:Object) : void
      {
         _isCreateRoleCpl = true;
         SimpleServerEngine.ins.dispose();
         ShellConfig.initMainLoadingArg();
         loadLangConfig();
         if(isfromIndex)
         {
            _mainLoadingPage = ClientConfig.mainLoadingPage;
            _mainLoadingPage["imgPathArr"][0] = ShellConfig.mainLoadingArg[0];
            _mainLoadingPage["imgPathArr"][1] = ShellConfig.mainLoadingArg[1];
            _mainLoadingPage["init"]();
         }
         if(ClientConfig.mainLoadingPage)
         {
            checkIsReady();
         }
         else if(_isPreloadMainLoadingPage == false)
         {
            toLoadMainLoading();
         }
      }
      
      private function login_err(param1:ProtocolStatusRes) : void
      {
         SimpleServerEngine.ins.removeOnceHandler(2001);
         ShellConfig.initMainLoadingArg();
         loadLangConfig();
         if(isfromIndex)
         {
            _mainLoadingPage = ClientConfig.mainLoadingPage;
            _mainLoadingPage["imgPathArr"][0] = ShellConfig.mainLoadingArg[0];
            _mainLoadingPage["imgPathArr"][1] = ShellConfig.mainLoadingArg[1];
            _mainLoadingPage["init"]();
         }
         if(param1.errCode == 300002001)
         {
            createRole();
         }
      }
      
      private function createRole() : void
      {
         if(_disConnTip)
         {
            return;
         }
         _isCreateRoleCpl = true;
         createRoleLoadCpl();
      }
      
      private function createRoleLoadCpl() : void
      {
         toLoadMainLoading();
      }
      
      private function toLoadMainLoading() : void
      {
         if(ClientConfig.airData != null)
         {
            airLoadMainLoadingPage();
         }
         else if(isfromIndex)
         {
            checkIsReady();
         }
         else
         {
            loadMainLoadingPage();
         }
      }
      
      private function airLoadMainLoadingPage() : void
      {
         onMainPageLoaded = function(param1:Event):void
         {
            urlLoader.removeEventListener("complete",onMainPageLoaded);
            var _loc4_:ByteArray = urlLoader.data;
            VerListMgr.ins.saveFile("MainLoadingPage.swf",_loc4_);
            var _loc3_:Loader = new Loader();
            _loc3_.contentLoaderInfo.addEventListener("complete",mainLoading_loadCpl);
            var _loc2_:LoaderContext = new LoaderContext();
            _loc2_.allowCodeImport = true;
            _loc2_.applicationDomain = ApplicationDomain.currentDomain;
            _loc3_.loadBytes(_loc4_,_loc2_);
            urlLoader.close();
            urlLoader = null;
         };
         _isPreloadMainLoadingPage = true;
         var urlLoader:URLLoader = new URLLoader();
         urlLoader.dataFormat = "binary";
         urlLoader.addEventListener("complete",onMainPageLoaded);
         var $url:String = VerListMgr.ins.getAllUrl("MainLoadingPage.swf");
         urlLoader.load(new URLRequest($url));
         try
         {
            ExternalInterface.call("findDimensions");
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function loadMainLoadingPage() : void
      {
         var _loc1_:* = null;
         _isPreloadMainLoadingPage = true;
         var _loc2_:Loader = new Loader();
         _loc2_.contentLoaderInfo.addEventListener("complete",mainLoading_loadCpl);
         if(EnvConfig.ins.useBinFile)
         {
            _loc1_ = VerListMgr.ins.addUrlVer("MainLoadingPage.swf");
         }
         else
         {
            _loc1_ = ClientConfig.publishPath + VerListMgr.ins.addUrlVer("MainLoadingPage.swf");
         }
         _loc2_.load(new URLRequest(_loc1_),EnvConfig.ins.loaderContext);
         try
         {
            ExternalInterface.call("findDimensions");
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function mainLoading_loadCpl(param1:Event) : void
      {
         (param1.currentTarget as LoaderInfo).removeEventListener("complete",mainLoading_loadCpl);
         if(_disConnTip)
         {
            return;
         }
         _mainLoadingPage = (param1.currentTarget as LoaderInfo).content;
         _mainLoadingPage["imgPathArr"][0] = ShellConfig.mainLoadingArg[0];
         _mainLoadingPage["imgPathArr"][1] = ShellConfig.mainLoadingArg[1];
         _mainLoadingPage["init"]();
         ClientConfig.mainLoadingPage = _mainLoadingPage;
         checkIsReady();
      }
      
      private function checkIsReady() : void
      {
         if(_mainLoadingPage && _isLoadedMainState == 0)
         {
            if(ClientConfig.airData != null)
            {
               airLoadMain();
            }
            else
            {
               loadMain();
            }
         }
         if(_mainLoadingPage && _isCreateRoleCpl == true)
         {
            this.addChild(_mainLoadingPage as DisplayObject);
            _mainLoadingPage.show(0,StcLanguageConfig.ins.getLanguage(999000546));
            _mainLoadingPage.resize(stage.stageWidth,stage.stageHeight - EnvConfig.ins.shellY);
            checkMainIsReady();
         }
      }
      
      private function airLoadMain() : void
      {
         _isLoadedMainState = 1;
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener("complete",onMainLoaded);
         var _loc1_:String = VerListMgr.ins.getAllUrl("GameMain.swf");
         _loc2_.dataFormat = "binary";
         _loc2_.load(new URLRequest(_loc1_));
      }
      
      private function onMainLoaded(param1:Event) : void
      {
         var _loc4_:ByteArray = param1.currentTarget.data;
         VerListMgr.ins.saveFile("GameMain.swf",_loc4_);
         var _loc3_:Loader = new Loader();
         _loc3_.contentLoaderInfo.addEventListener("complete",loadGameMainComplete);
         _loc3_.contentLoaderInfo.addEventListener("progress",loadGameMainProgress);
         var _loc2_:LoaderContext = new LoaderContext();
         _loc2_.allowCodeImport = true;
         _loc2_.applicationDomain = ApplicationDomain.currentDomain;
         _loc3_.loadBytes(_loc4_,_loc2_);
      }
      
      private function loadMain() : void
      {
         var _loc1_:* = null;
         _isLoadedMainState = 1;
         var _loc2_:Loader = new Loader();
         _loc2_.contentLoaderInfo.addEventListener("complete",loadGameMainComplete);
         _loc2_.contentLoaderInfo.addEventListener("progress",loadGameMainProgress);
         if(EnvConfig.ins.useBinFile)
         {
            _loc1_ = VerListMgr.ins.addUrlVer("GameMain.swf");
         }
         else
         {
            _loc1_ = ClientConfig.publishPath + VerListMgr.ins.addUrlVer("GameMain.swf");
         }
         _loc2_.load(new URLRequest(_loc1_),EnvConfig.ins.loaderContext);
      }
      
      private function loadGameMainComplete(param1:Event) : void
      {
         (param1.currentTarget as LoaderInfo).removeEventListener("complete",loadGameMainComplete);
         (param1.currentTarget as LoaderInfo).removeEventListener("progress",loadGameMainProgress);
         if(_disConnTip)
         {
            return;
         }
         _isLoadedMainState = 2;
         _gameMain = (param1.currentTarget as LoaderInfo).content;
         checkMainIsReady();
      }
      
      private function loadGameMainProgress(param1:Event) : void
      {
         var _loc2_:* = null;
         if((_mainLoadingPage as DisplayObject).parent)
         {
            _loc2_ = param1.currentTarget as LoaderInfo;
            _mainLoadingPage.show(_loc2_.bytesLoaded / _loc2_.bytesTotal * 5,StcLanguageConfig.ins.getLanguage(999000546));
         }
      }
      
      private function checkMainIsReady() : void
      {
         if(_isLoadedMainState == 2 && _isCreateRoleCpl)
         {
            stage.removeEventListener("resize",stageResize);
            _mainLoadingPage = null;
            this.addChildAt(_gameMain,0);
         }
      }
      
      private function stageResize(param1:Event) : void
      {
         if(_mainLoadingPage)
         {
            _mainLoadingPage.resize(stage.stageWidth,stage.stageHeight - EnvConfig.ins.shellY);
         }
         onResizeDisConnTip();
      }
      
      private function stageMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(param1.altKey && param1.ctrlKey && param1.shiftKey)
         {
            if(ClientConfig.showLog == false)
            {
               ClientConfig.showLog = true;
               Log.debug(this,"Log开启");
            }
            else
            {
               Log.debug(this,"Log关闭");
               ClientConfig.showLog = false;
            }
            LocalData.insCurPlayer.save("showLog",ClientConfig.showLog);
         }
         else if(param1.altKey && param1.shiftKey)
         {
            _loc2_ = DisplayUtils.debug_parentTree(param1.target as InteractiveObject);
            Log.debug(_loc2_);
         }
      }
      
      private function disConnHandler() : void
      {
         if(_disConnTip)
         {
            return;
         }
         this.removeChildren();
         _disConnTip = new TextField();
         _disConnTip.defaultTextFormat = new TextFormat(null,18,16777215,null,null,null,null,null,"center");
         var _loc1_:String = "<font color=\'#FF3300\' size=\'20\'>" + StcLanguageConfig.ins.getLanguage(999000624) + "\n\n\n</font>";
         if(URLUtils.hadMainPage())
         {
            _loc1_ = _loc1_ + ("<font color=\'#FFFF00\'><a href=\'event:home\'><u>" + StcLanguageConfig.ins.getLanguage(999000625) + "</u></a></font>\n\n");
         }
         _loc1_ = _loc1_ + ("<font color=\'#FFFF00\'><a href=\'event:refresh\'><u>" + StcLanguageConfig.ins.getLanguage(999000626) + "</u></a></font>\n\n");
         _loc1_ = _loc1_ + ("<font color=\'#0066FF\'>" + StcLanguageConfig.ins.getLanguage(999000627) + "</font>\n");
         _disConnTip.htmlText = _loc1_;
         _disConnTip.width = 600;
         _disConnTip.height = 400;
         this.addChild(_disConnTip);
         _disConnTip.addEventListener("link",disConnTip_link);
         onResizeDisConnTip();
      }
      
      private function disConnTip_link(param1:TextEvent) : void
      {
         var _loc2_:String = param1.text;
         var _loc3_:* = _loc2_;
         if("home" !== _loc3_)
         {
            if("refresh" === _loc3_)
            {
               URLUtils.refreshCurPage();
            }
         }
         else
         {
            URLUtils.toMainPageSelf();
         }
      }
      
      private function onResizeDisConnTip(param1:Event = null) : void
      {
         if(_disConnTip)
         {
            _disConnTip.x = stage.stageWidth - _disConnTip.width >> 1;
            _disConnTip.y = stage.stageHeight - _disConnTip.textHeight >> 1;
         }
      }
   }
}
