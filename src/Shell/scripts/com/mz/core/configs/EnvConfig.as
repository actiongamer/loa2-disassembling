package com.mz.core.configs
{
   import flash.system.LoaderContext;
   import flash.system.ApplicationDomain;
   import com.mz.core.utils.LocalData;
   import com.mz.core.logging.Log;
   import com.mz.core.logging.appenders.TraceAppender;
   
   public class EnvConfig
   {
      
      private static var _ins:com.mz.core.configs.EnvConfig;
      
      public static const PT_ALL:int = 0;
      
      public static const PT_ID_GTA:int = 590;
      
      public static const PT_ID_GTA_FB:int = 592;
      
      public static const PT_ID_ICAN:int = 610;
      
      public static const PT_ID_101XP:int = 686;
      
      public static const PT_ID_BIGPOINT:int = 2303;
      
      public static const PT_ID_BIGPOINT_PL:int = 2283;
      
      public static const PT_ID_BIGPOINT_IT:int = 2284;
      
      public static const PT_ID_BIGPOINT_TR:int = 2302;
      
      public static const PT_ID_JAPAN:int = 2306;
      
      public static const PT_ID_TENCENT:int = 82;
      
      public static const PT_ID_360:int = 69;
      
      public static const PT_ID_FENGXING:int = 120;
      
      public static const PT_ID_DUOWAN:int = 33;
      
      public static const PT_ID_SOUGOU:int = 166;
      
      public static const PT_ID_XUNLEI:int = 15;
      
      public static const PT_ID_FEIHUO:int = 2212;
      
      public static const PT_ID_YAODOU:int = 361;
      
      public static const PT_ID_PLU:int = 31;
      
      public static const PT_ID_QIDIAN:int = 117;
      
      public static const PT_ID_SHUN_WANG:int = 90;
      
      public static const PT_ID_YOUZU:int = 90;
      
      public static const PT_ID_YOUZU_FB:int = 90;
      
      public static const WEI_DUAN_SOUGOU_DATING:int = 1;
      
      public static const WEI_DUAN_SOUGOU_DENGLUQI:int = 16601;
      
      public static const WEI_DUAN_SOUGOU_INPUT:int = 16602;
      
      public static const VIP_TYPE_NONE:int = 0;
      
      public static const VIP_TYPE_YELLOW:int = 1;
      
      public static const VIP_TYPE_BLUE:int = 2;
      
      public static const MODE_AIR_DEBUG_NO_SERVER:int = 222;
      
      public static const MODE_AIR_DEV_NO_SERVER:int = 232;
      
      public static const MODE_AIR_LOCAL:int = 220;
      
      public static const MODE_AIR_DEV:int = 230;
      
      public static const MODE_LOCAL:int = 120;
      
      public static const MODE_LOCAL_NO_SERVER:int = 122;
      
      public static const MODE_DEV:int = 130;
      
      public static const MODE_DEV_DEV:int = 131;
      
      public static const MODE_QA:int = 140;
      
      public static const MODE_PROD:int = 150;
      
      public static const MODE_QQ:int = 2201;
      
      public static const MODE_QQ_DEBUG:int = 2202;
      
      public static const MODE_PROD_DEBUG:int = 5100;
      
      public static const SIMPLE_GM:String = "SIMPLE_GM";
       
      
      public var shellY:int = 0;
      
      public var useMipMap:Boolean = true;
      
      public var simpleGM:Boolean = false;
      
      public var testAuthor:int = 0;
      
      public var useStaticDev:Boolean = false;
      
      public var useStaticDevDEV:Boolean = false;
      
      public var showCPUStatus:Boolean = false;
      
      public var showGPUStatus:Boolean = false;
      
      public var useAtf:Boolean = true;
      
      public var useZipBaAct:Boolean = true;
      
      private var _useServer:Boolean = false;
      
      public var hideForBS:Boolean = false;
      
      private var _showScript:Boolean = true;
      
      public var scriptSayList:Boolean = true;
      
      private var _traceMouseClick:Boolean = false;
      
      public var useCiteTarget:Boolean = false;
      
      public var autoRemoveCite:Boolean = true;
      
      private var _showDebugModule:Boolean = false;
      
      public var showQaModule:Boolean = false;
      
      public var showDevModule:Boolean = false;
      
      private var _battleUseSocketEngine:Boolean;
      
      public var _useBinFile:Boolean = false;
      
      public var ptId:int = 590;
      
      public var weiDuan:int;
      
      public var useQQ_LEAGUE:Boolean = false;
      
      public var pf:String;
      
      public var showQQRule:Boolean = false;
      
      public var isQQGame:Boolean = false;
      
      public var showQQModule:Boolean = false;
      
      public var zoneId:String;
      
      public var openId:String;
      
      public var isQQTest:Boolean = false;
      
      public var firstBattleType:int = 1;
      
      public var vipType:int;
      
      private var _loaderContext:LoaderContext;
      
      private var _mode:int;
      
      public function EnvConfig()
      {
         super();
         mode = 130;
      }
      
      public static function get ins() : com.mz.core.configs.EnvConfig
      {
         if(_ins == null)
         {
            _ins = new com.mz.core.configs.EnvConfig();
         }
         return _ins;
      }
      
      public function get useServer() : Boolean
      {
         return _useServer;
      }
      
      public function get showScript() : Boolean
      {
         return _showScript;
      }
      
      public function get traceMouseClick() : Boolean
      {
         return _traceMouseClick;
      }
      
      public function set showDebugModule(param1:Boolean) : void
      {
         _showDebugModule = param1;
      }
      
      public function get showDebugModule() : Boolean
      {
         return _showDebugModule;
      }
      
      public function get battleUseSocketEngine() : Boolean
      {
         return _battleUseSocketEngine;
      }
      
      public function get useBinFile() : Boolean
      {
         return _useBinFile;
      }
      
      public function get loaderContext() : LoaderContext
      {
         return _loaderContext;
      }
      
      public function get mode() : int
      {
         return _mode;
      }
      
      public function set mode(param1:int) : void
      {
         _mode = param1;
         _loaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.showQQModule = false;
         var _loc2_:* = param1;
         if(220 !== _loc2_)
         {
            if(230 !== _loc2_)
            {
               if(222 !== _loc2_)
               {
                  if(232 !== _loc2_)
                  {
                     if(120 !== _loc2_)
                     {
                        if(5100 !== _loc2_)
                        {
                           if(122 !== _loc2_)
                           {
                              if(130 !== _loc2_)
                              {
                                 if(131 !== _loc2_)
                                 {
                                    if(140 !== _loc2_)
                                    {
                                       if(150 !== _loc2_)
                                       {
                                          if(2202 !== _loc2_)
                                          {
                                             if(2201 === _loc2_)
                                             {
                                                this._useBinFile = false;
                                                this._useServer = true;
                                                this._showDebugModule = false;
                                                this.showDevModule = false;
                                                this.showQaModule = false;
                                                this._traceMouseClick = false;
                                                this.useStaticDev = false;
                                                this.showQQModule = true;
                                             }
                                          }
                                          else
                                          {
                                             this._useBinFile = true;
                                             this._useServer = true;
                                             this._showDebugModule = true;
                                             this.showDevModule = true;
                                             this.showQaModule = true;
                                             this._traceMouseClick = true;
                                             this.useStaticDev = true;
                                             this.showQQModule = true;
                                          }
                                       }
                                       else
                                       {
                                          this._useBinFile = false;
                                          this._useServer = true;
                                          this._showDebugModule = false;
                                          this.showDevModule = false;
                                          this.showQaModule = false;
                                          this._traceMouseClick = false;
                                          this.useStaticDev = false;
                                       }
                                    }
                                    else
                                    {
                                       this._useBinFile = false;
                                       this._useServer = true;
                                       this._showDebugModule = false;
                                       this.showDevModule = false;
                                       this.showQaModule = true;
                                       this._traceMouseClick = false;
                                       this.useStaticDev = false;
                                    }
                                 }
                                 else
                                 {
                                    this._useBinFile = false;
                                    this._useServer = true;
                                    this._showDebugModule = false;
                                    this.showDevModule = true;
                                    this.showQaModule = true;
                                    this._traceMouseClick = false;
                                    this.useStaticDev = true;
                                    this.useStaticDevDEV = true;
                                 }
                              }
                              else
                              {
                                 this._useBinFile = false;
                                 this._useServer = true;
                                 this._showDebugModule = false;
                                 this.showDevModule = true;
                                 this.showQaModule = true;
                                 this._traceMouseClick = false;
                                 this.useStaticDev = true;
                              }
                           }
                           else
                           {
                              showCPUStatus = true;
                              this._useBinFile = true;
                              this._useServer = false;
                              this._showDebugModule = true;
                              this.showDevModule = true;
                              this.showQaModule = true;
                              this._traceMouseClick = true;
                              this.useStaticDev = true;
                           }
                        }
                        else
                        {
                           showCPUStatus = true;
                           this._useBinFile = false;
                           this._useServer = true;
                           this._showDebugModule = true;
                           this.showDevModule = true;
                           this.showQaModule = true;
                           this._traceMouseClick = true;
                           this.showGPUStatus = true;
                           this.useStaticDev = false;
                        }
                     }
                     else
                     {
                        showCPUStatus = true;
                        this._useBinFile = true;
                        this._useServer = true;
                        this._showDebugModule = true;
                        this.showDevModule = true;
                        this.showQaModule = true;
                        this._traceMouseClick = true;
                        this.showGPUStatus = true;
                        this.useStaticDev = true;
                     }
                  }
                  else
                  {
                     showCPUStatus = true;
                     this._showScript = true;
                     this.scriptSayList = true;
                     this._useBinFile = false;
                     this._useServer = false;
                     this._showDebugModule = true;
                     this.showDevModule = true;
                     this.showQaModule = true;
                     this._traceMouseClick = true;
                     this.useStaticDev = true;
                  }
               }
               else
               {
                  showCPUStatus = true;
                  this.scriptSayList = true;
                  this._useBinFile = false;
                  this._useServer = false;
                  this._showDebugModule = true;
                  this.showDevModule = true;
                  this.showQaModule = true;
                  this._traceMouseClick = true;
                  this.useStaticDev = true;
               }
            }
            else
            {
               _showScript = true;
               this.scriptSayList = true;
               this._useBinFile = false;
               this._useServer = true;
               this._showDebugModule = false;
               this.showDevModule = true;
               this.showQaModule = true;
               this._traceMouseClick = false;
               this.useStaticDev = true;
            }
         }
         else
         {
            showCPUStatus = true;
            _showScript = true;
            this.scriptSayList = true;
            this._useBinFile = false;
            this._useServer = true;
            this._showDebugModule = true;
            this.showDevModule = true;
            this.showQaModule = true;
            this._traceMouseClick = true;
            this.showGPUStatus = true;
            this.useStaticDev = true;
         }
         simpleGM = _showDebugModule || showDevModule || LocalData.insCurPlayer.load("SIMPLE_GM",false);
         if(this.showDebugModule)
         {
            Log.addApender(TraceAppender.ins);
         }
         else
         {
            Log.removeApender(TraceAppender.ins);
         }
      }
   }
}
