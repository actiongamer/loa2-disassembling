package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.DisplayObjectContainer;
   import nslm2.nets.sockets.SimpleServerEngine;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.configs.ClientConfig;
   import proto.ProtocolStatusRes;
   import nslm2.common.configs.StcLanguageConfig;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.mgrs.VerListMgr;
   import com.mz.core.net.LoaderTask;
   import flash.display.DisplayObject;
   import proto.RandomNameReq;
   import proto.RandomNameRes;
   import morn.core.utils.StringUtils;
   import proto.CreatePlayerReq;
   import flash.system.Capabilities;
   import flash.events.Event;
   
   public class CreateRoleTask extends TaskBase
   {
       
      
      private var _parent:DisplayObjectContainer;
      
      private var _loadCplHandler:Function;
      
      private var dis;
      
      public var regexp:RegExp;
      
      private var createRolePageType:int = 1;
      
      public var currentSex:int;
      
      private var randomNameArr:Array;
      
      private var curRandomName:String = "";
      
      private var leaveFrame:int = 1;
      
      private var autoSend:Boolean = false;
      
      public function CreateRoleTask(param1:DisplayObjectContainer, param2:Function = null)
      {
         super();
         _parent = param1;
         _loadCplHandler = param2;
      }
      
      override public function exec() : void
      {
         super.exec();
         SimpleServerEngine.ins.addAlwayHandler(2002,cplhandler,errHandler);
         loadCreateRolePage();
      }
      
      private function cplhandler(param1:Object) : void
      {
         dis["enterHandler"] = null;
         _parent.stage.removeEventListener("resize",onResize);
         DisplayUtils.removeSelf(dis);
         ClientConfig.hasRole = true;
         SimpleServerEngine.ins.removeAlwayHandler(2002,null,errHandler);
         dis["dispose"]();
         if(_parent && _parent.stage)
         {
            _parent.stage.removeEventListener("mouseDown",onMouseDown);
            _parent.stage.removeEventListener("keyUp",onKeyUp);
            _parent.stage.removeEventListener("enterFrame",onFrame);
         }
         onComplete();
      }
      
      private function errHandler(param1:ProtocolStatusRes) : void
      {
         var _loc2_:String = StcLanguageConfig.ins.getLanguage(param1.errCode);
         if(!_loc2_)
         {
            _loc2_ = param1.errCode + "";
         }
      }
      
      private function loadCreateRolePage() : void
      {
         var _loc1_:* = null;
         createRolePageType = 5;
         var _loc2_:String = "CreateRolePage" + createRolePageType + ".swf";
         if(EnvConfig.ins.useBinFile)
         {
            _loc1_ = VerListMgr.ins.addUrlVer(_loc2_);
         }
         else
         {
            _loc1_ = ClientConfig.publishPath + VerListMgr.ins.addUrlVer(_loc2_);
         }
         new LoaderTask(_loc1_,EnvConfig.ins.loaderContext).changeNeedStop(false).addHandlers(load_cpl).exec();
      }
      
      private function load_cpl(param1:LoaderTask) : void
      {
         regexp = /^[Ё-өÀ-ÿ一-龥A-Za-z0-9_]+$/;
         dis = param1.loader.content;
         dis["enterHandler"] = enterHandler;
         dis["randomName"] = randomName;
         dis["textArr"] = [StcLanguageConfig.ins.getLanguage(1),StcLanguageConfig.ins.getLanguage(2),StcLanguageConfig.ins.getLanguage(3),StcLanguageConfig.ins.getLanguage(10000007),StcLanguageConfig.ins.getLanguage(10000008)];
         dis["imgPathArr"] = [];
         dis["imgPathArr"][3] = ClientConfig.publishPath + VerListMgr.ins.addUrlVer("assets/common/img/loading/logo.png");
         dis["enterNotice"] = StcLanguageConfig.ins.userNames;
         dis["ServerName"] = ClientConfig.ServerName;
         dis["Sid"] = ClientConfig.district;
         dis["platName"] = ClientConfig.PlatName;
         dis.showQQRule = EnvConfig.ins.showQQRule;
         dis["lang"] = ClientConfig.language;
         dis["init"]();
         if(_loadCplHandler)
         {
            _loadCplHandler.call();
            _loadCplHandler = null;
         }
      }
      
      public function showCreateRolePage() : void
      {
         _parent.addChildAt(dis as DisplayObject,_parent.getChildIndex(ClientConfig.mainLoadingPage) + 1);
         _parent.stage.addEventListener("resize",onResize);
         if(_parent && _parent.stage)
         {
            _parent.stage.addEventListener("mouseDown",onMouseDown);
            _parent.stage.addEventListener("keyUp",onKeyUp);
            onKeyUp();
            _parent.stage.addEventListener("enterFrame",onFrame);
         }
         _parent.stage.frameRate = 26;
         onResize();
      }
      
      public function randomName(param1:int) : void
      {
         var _loc2_:* = null;
         if(ClientConfig.language != "tw")
         {
            return;
         }
         if(randomNameArr && randomNameArr.length > 0 && currentSex == param1)
         {
            getNextRandomName();
         }
         else
         {
            currentSex = param1;
            _loc2_ = new RandomNameReq();
            _loc2_.sex = param1;
            SimpleServerEngine.ins.send(2004,_loc2_,server_randomName);
         }
      }
      
      private function server_randomName(param1:RandomNameRes) : void
      {
         randomNameArr = param1.names;
         getNextRandomName();
      }
      
      private function getNextRandomName() : void
      {
         curRandomName = randomNameArr.pop();
      }
      
      private function enterHandler(param1:String, param2:int, param3:int, param4:Boolean, param5:Boolean) : void
      {
         var _loc9_:* = null;
         if(EnvConfig.ins.showDevModule && param4)
         {
            ClientConfig.enterMainCityDirectly = true;
         }
         if(EnvConfig.ins.showDevModule && param5)
         {
            param1 = ClientConfig.playId;
         }
         if(param1 == "")
         {
            return;
            §§push(dis["onError"](StcLanguageConfig.ins.getLanguage(10000006)));
         }
         else
         {
            var _loc8_:int = StringUtils.byteLen(param1);
            var _loc10_:int = 2;
            var _loc6_:int = 12;
            if(ClientConfig.language == "ru")
            {
               _loc9_ = /^[Ё-ө]/;
               if(_loc9_.test(param1) == true)
               {
                  _loc10_ = 4;
                  _loc6_ = 24;
               }
            }
            if(_loc8_ < _loc10_ || _loc8_ > _loc6_)
            {
               return;
               §§push(dis["onError"](StcLanguageConfig.ins.getLanguage(10000003)));
            }
            else if(regexp.test(param1) == false)
            {
               return;
               §§push(dis["onError"](StcLanguageConfig.ins.getLanguage(10000010)));
            }
            else
            {
               var _loc7_:CreatePlayerReq = new CreatePlayerReq();
               _loc7_.name = param1;
               _loc7_.fashion = param3;
               _loc7_.job = param2;
               _loc7_.sex = param2;
               _loc7_.flashVersion = Capabilities.version;
               _loc7_.weiduan = EnvConfig.ins.weiDuan;
               _loc7_.createkind = createRolePageType;
               _loc7_.osInfo = Capabilities.os;
               _loc7_.resolution = Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY;
               _loc7_.lang = ClientConfig.language;
               _loc7_.fbInviteType = ClientConfig.fbInviteType;
               _loc7_.verify = ClientConfig.fbVerify;
               _loc7_.opId = EnvConfig.ins.ptId;
               ClientConfig.createRoleSex = param2;
               ClientConfig.createRoleName = param1;
               SimpleServerEngine.ins.send(2002,_loc7_);
               return;
            }
         }
      }
      
      private function onMouseDown(... rest) : void
      {
         onKeyUp();
      }
      
      private function onKeyUp(... rest) : void
      {
         if(EnvConfig.ins.ptId == 15)
         {
            leaveFrame = _parent.stage.frameRate * 60;
         }
         else
         {
            leaveFrame = _parent.stage.frameRate * 30;
         }
      }
      
      private function onFrame(param1:Event) : void
      {
      }
      
      private function onResize(param1:Event = null) : void
      {
      }
   }
}
