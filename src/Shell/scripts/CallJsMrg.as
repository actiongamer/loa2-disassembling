package
{
   import flash.events.EventDispatcher;
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   import com.mz.core.logging.Log;
   import com.mz.core.configs.ClientConfig;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.events.Event;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.event.MzEvent;
   
   public class CallJsMrg extends EventDispatcher
   {
      
      private static var _ins:CallJsMrg;
       
      
      private var _fbInviteFun:Function;
      
      private var _inviteStatusFun:Function;
      
      private var _fansPageFun:Function;
      
      private var _dataStr:String;
      
      private var _instructorFunc:Function;
      
      public function CallJsMrg()
      {
         super();
      }
      
      public static function get ins() : CallJsMrg
      {
         if(_ins == null)
         {
            _ins = new CallJsMrg();
         }
         return _ins;
      }
      
      public function init(param1:Sprite) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("sendFriendList",sendFriendList);
            ExternalInterface.addCallback("inviteStatus",inviteStatus);
            ExternalInterface.addCallback("isLikeStatus",callBackIsLikes);
            ExternalInterface.addCallback("instructorRes",instructorRes);
         }
      }
      
      public function sendFriendList(param1:*) : void
      {
         if(_fbInviteFun != null)
         {
            _fbInviteFun(param1);
            _fbInviteFun = null;
            Log.info("调用JS --> invitable_friend 方法！");
         }
      }
      
      private function inviteStatus(param1:*) : void
      {
         if(_inviteStatusFun != null)
         {
            _inviteStatusFun(param1);
            _fbInviteFun = null;
            Log.info("调用JS --> invitable_friend 方法！");
         }
      }
      
      private function callBackIsLikes(param1:*) : void
      {
         Log.info("调用JS --> isLikes方法！返回");
         if(_fansPageFun != null)
         {
            _fansPageFun(param1);
            _fansPageFun = null;
            Log.info("调用JS --> isLikes方法！返回");
         }
      }
      
      private function instructorRes(param1:*) : void
      {
         Log.info("指导员有提问要处理！！！ 返回的数据是： " + param1 == null?"null":JSON.stringify(param1));
      }
      
      public function FBShare() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("jsFun","test");
         }
      }
      
      public function invitableFriends(param1:Function) : void
      {
         if(ExternalInterface.available)
         {
            _fbInviteFun = param1;
            ExternalInterface.call("invitable_friend");
            Log.info("调用JS --> invitable_friend 方法！");
         }
      }
      
      public function uInvite(param1:String, param2:String, param3:String, param4:String, param5:Function = null) : void
      {
         var _loc6_:* = null;
         if(ExternalInterface.available)
         {
            if(ClientConfig.gameId == "167")
            {
               _loc6_ = "1188125197865382";
            }
            else if(ClientConfig.gameId == "162")
            {
               _loc6_ = "631293037011685";
            }
            else
            {
               _loc6_ = "998533870240249";
            }
            _inviteStatusFun = param5;
            ExternalInterface.call("U2Invite",param1,param2,param3,_loc6_,param4);
         }
      }
      
      public function postFeed(param1:*) : void
      {
         var _loc4_:* = null;
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener("complete",onLoadedPostConplete);
         _loc2_.addEventListener("securityError",onPostError);
         _loc2_.addEventListener("ioError",onPostError);
         if(ClientConfig.gameId == "167")
         {
            _loc4_ = "https://gamesv2.gtarcade.com/open/angelsiizh/feed";
         }
         else if(ClientConfig.gameId == "162")
         {
            _loc4_ = "https://api.icantw.com/game/Facebook/feed";
         }
         else
         {
            _loc4_ = "https://gamesv2.gtarcade.com/open/angelsiiglobal/feed";
         }
         Log.info("向Facebook feed请求的路径是： " + _loc4_);
         var _loc3_:URLRequest = new URLRequest(_loc4_);
         _loc3_.method = "POST";
         _loc3_.data = param1;
         _loc2_.load(_loc3_);
      }
      
      private function onLoadedPostConplete(param1:Event) : void
      {
         param1.currentTarget.removeEventListener("complete",onLoadedPostConplete);
         param1.currentTarget.removeEventListener("securityError",onPostError);
         param1.currentTarget.removeEventListener("ioError",onPostError);
         var _loc2_:String = JSON.stringify(param1.currentTarget.data);
         Log.info("facebook --> POST --- > 成功！返回数据：" + _loc2_);
      }
      
      protected function onPostError(param1:Event) : void
      {
         var _loc2_:String = JSON.stringify(param1.currentTarget.data);
         Log.info("facebook --> POST --- > 失败！返回数据：" + _loc2_);
      }
      
      public function isLikes(param1:Function = null) : void
      {
         var _loc2_:* = null;
         if(ExternalInterface.available)
         {
            if(ClientConfig.gameId == "167")
            {
               _loc2_ = "1579390355714373";
            }
            else
            {
               _loc2_ = "1538307479825404";
            }
            _fansPageFun = param1;
            ExternalInterface.call("isLikes",_loc2_,null);
            Log.info("调用了JS的isLikes接口！ 参数fanpageId：" + _loc2_ + " 参数appsuId：null");
         }
      }
      
      public function onInstructorPost(param1:Object, param2:Function) : void
      {
         param1.lang = changeLang(param1.lang);
         _dataStr = JSON.stringify(param1);
         _instructorFunc = param2;
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.addEventListener("complete",onInstructorComplete);
         _loc3_.addEventListener("securityError",onInstructorError);
         _loc3_.addEventListener("ioError",onInstructorError);
         var _loc5_:String = "http://mod.gtarcade.com/modLogin";
         if(param1.isMod)
         {
            TimerManager.ins.doLoop(600000,onInstructorPostTime);
         }
         Log.info("向平台发送指导员上线数据路径是： " + _loc5_);
         Log.info("向平台发送指导员上线数据是： " + _dataStr);
         var _loc4_:URLRequest = new URLRequest(_loc5_);
         _loc4_.method = "POST";
         _loc4_.data = _dataStr;
         _loc3_.load(_loc4_);
      }
      
      private function onInstructorPostTime() : void
      {
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener("complete",onInstructorComplete);
         _loc2_.addEventListener("securityError",onInstructorError);
         _loc2_.addEventListener("ioError",onInstructorError);
         var _loc4_:String = "http://mod.gtarcade.com/modLogin";
         Log.info("向平台发送指导员定时检验在线数据路径是： " + _loc4_);
         Log.info("向平台发送指导员定时检验在线数据是： " + _dataStr);
         var _loc3_:URLRequest = new URLRequest(_loc4_);
         _loc3_.method = "POST";
         var _loc1_:Object = JSON.parse(_dataStr);
         if(_instructorFunc != null)
         {
            _loc1_.level = _instructorFunc();
         }
         _dataStr = JSON.stringify(_loc1_);
         _loc3_.data = _dataStr;
         _loc2_.load(_loc3_);
      }
      
      protected function onInstructorComplete(param1:Event) : void
      {
         Log.info("向平台发送指导员上线数据成功！");
      }
      
      protected function onInstructorError(param1:Event) : void
      {
         Log.info("向平台发送指导员上线数据错误！");
      }
      
      public function redInstructorGet(param1:Object) : void
      {
         param1.lang = changeLang(param1.lang);
         _dataStr = JSON.stringify(param1);
         if(param1.isMod)
         {
            TimerManager.ins.doLoop(180000,redPointTime);
         }
         else
         {
            TimerManager.ins.doOnce(180000,redPointTime);
         }
      }
      
      private function redPointTime() : void
      {
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener("complete",redPointComplete);
         _loc2_.addEventListener("securityError",redPointError);
         _loc2_.addEventListener("ioError",redPointError);
         var _loc4_:String = "http://mod.gtarcade.com/default";
         var _loc3_:URLRequest = new URLRequest(_loc4_);
         _loc3_.method = "POST";
         var _loc1_:Object = JSON.parse(_dataStr);
         if(_instructorFunc != null)
         {
            _loc1_.level = _instructorFunc();
         }
         _dataStr = JSON.stringify(_loc1_);
         Log.info("指导员一上线请求红点数据！发送的数据： " + _dataStr);
         _loc3_.data = _dataStr;
         _loc2_.load(_loc3_);
      }
      
      public function redPointComplete(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         Log.info("指导员一上线请求红点数据成功！返回的数据： " + param1.currentTarget.data);
         var _loc3_:Object = JSON.parse(param1.currentTarget.data);
         Log.info("count: " + _loc3_.count);
         if(_loc3_.count > 0)
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         dispatchEvent(new MzEvent("GM_RED_POINT",_loc2_));
      }
      
      protected function redPointError(param1:Event) : void
      {
         Log.info("指导员一上线请求数据错误！");
      }
      
      public function onInstructorJs(param1:Object) : void
      {
         param1.lang = changeLang(param1.lang);
         var _loc2_:String = JSON.stringify(param1);
         if(ClientConfig.airData != null)
         {
            Log.info("微端调用了JS的modIndex接口！ 参数data：" + _loc2_);
            ClientConfig.airData.callJS("modIndex",_loc2_);
         }
         if(ExternalInterface.available)
         {
            Log.info("调用了JS的modIndex接口！ 参数data：" + _loc2_);
            ExternalInterface.call("modIndex",_loc2_);
         }
      }
      
      public function changeLang(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if("en" !== _loc3_)
         {
            if("tw" !== _loc3_)
            {
               if("common" !== _loc3_)
               {
                  if("de" !== _loc3_)
                  {
                     if("fr" !== _loc3_)
                     {
                        if("es" !== _loc3_)
                        {
                           if("pt" !== _loc3_)
                           {
                              _loc2_ = "zh-cn";
                           }
                           else
                           {
                              _loc2_ = "pt-pt";
                           }
                        }
                        else
                        {
                           _loc2_ = "es-es";
                        }
                     }
                     else
                     {
                        _loc2_ = "fr-fr";
                     }
                  }
                  else
                  {
                     _loc2_ = "de-de";
                  }
               }
               else
               {
                  _loc2_ = "zh-cn";
               }
            }
            else
            {
               _loc2_ = "zh-zh";
            }
         }
         else
         {
            _loc2_ = "en-us";
         }
         return _loc2_;
      }
      
      public function bigPointCharge() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("showPayment");
         }
      }
      
      public function ruXpCharge() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("showPayment");
         }
      }
      
      public function japanCharge() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("purchaseCall",ClientConfig.playId,ClientConfig.district);
         }
      }
   }
}
