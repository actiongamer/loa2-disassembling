package com.mz.core.configs
{
   public class ClientConfig
   {
      
      public static var isMacOs:Boolean = false;
      
      public static var enterMainCityDirectly:Boolean = false;
      
      public static var playId:String;
      
      private static var _firstBattle:int;
      
      public static var firstBattle_sub:int = 1;
      
      public static var isNewPlayer:Boolean = true;
      
      public static var token:String;
      
      public static var serverIP:String;
      
      public static var userIP:String = "";
      
      public static var serverPort:int;
      
      public static var district:uint;
      
      public static var version:int;
      
      public static var chatIP:String = "192.168.240.149";
      
      public static var chatPorts:String = "51709,8998,51730,17006,46829";
      
      public static var battleReportUrl:String = "http://192.168.220.125:4107/btl";
      
      public static var adultFlag:int = 1;
      
      public static var time:int;
      
      public static var gameTime:int;
      
      public static var ServerName:String;
      
      public static var PlatName:String;
      
      public static var hasRole:Boolean;
      
      public static var createRoleSex:int;
      
      public static var createRoleName:String = "Major";
      
      public static var adInfo:String;
      
      public static var airData:Object = null;
      
      public static var regTime:String;
      
      public static var configVoList:Object;
      
      public static var publishPath:String;
      
      public static var assetsURL:String;
      
      public static var cityScriptURL:String;
      
      public static var chapterScriptURL:String;
      
      public static var dgScriptURL:String;
      
      public static var chargeURL:String = "http://192.168.240.111:4007/";
      
      public static var mainPageURL:String = "";
      
      public static var languageAry:Array = ["en"];
      
      public static var languageCodeIdAry:Array = [999001141];
      
      public static var language:String = "en";
      
      public static var frameRate:int = 60;
      
      public static var frameRate_30:int = 30;
      
      public static var qqParam:String = "";
      
      public static var reStartCallBack:Function;
      
      private static var _msPerFrame:Number = NaN;
      
      public static var _driverInfo:String;
      
      public static var SCENE_MIN_W:int = 1000;
      
      public static var SCENE_MIN_H:int = 500;
      
      public static var SCENE_FIXED_W:int = 1500;
      
      public static var SCENE_FIXED_H:int = 900;
      
      public static var SCENE_FIXED_W_HALF:int = SCENE_FIXED_W / 2;
      
      public static var SCENE_FIXED_H_HALF:int = SCENE_FIXED_H / 2;
      
      public static var SCENE_SHAKE_GAP:int = 25;
      
      public static var BATTLE_SCENE_SHAKE_GAP:int = 300;
      
      public static var SCENE_BG_W:int = 1500;
      
      public static var SCENE_BG_H:int = 900;
      
      public static var smallMapScale:int = 16;
      
      public static var SCENE_BG_MARGIN:int = (SCENE_BG_W - SCENE_FIXED_W) / 2;
      
      public static const SCENE_TILE_WIDTH:int = 256;
      
      public static const SCENE_TILE_HEIGHT:int = 256;
      
      public static var shellData:Object;
      
      public static var mainLoadingPage;
      
      public static var showLog:Boolean = false;
      
      public static var IS_REFRESH_AUTO:Boolean = false;
      
      public static var fbInviteType:String;
      
      public static var fbVerify:String;
      
      public static var gameId:String;
      
      public static var fb_flag:String;
       
      
      public function ClientConfig()
      {
         super();
      }
      
      public static function get firstBattle() : int
      {
         return _firstBattle;
      }
      
      public static function set firstBattle(param1:int) : void
      {
         if(_firstBattle != param1)
         {
            _firstBattle = param1;
         }
      }
      
      public static function isChineseLang() : Boolean
      {
         return ClientConfig.language == "tw" || ClientConfig.language == "common";
      }
      
      public static function isRuLang() : Boolean
      {
         return ClientConfig.language == "ru";
      }
      
      public static function get msPerFrame() : Number
      {
         if(isNaN(_msPerFrame))
         {
            _msPerFrame = 1000 / frameRate;
         }
         return _msPerFrame;
      }
   }
}
