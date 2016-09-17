package nslm2.modules.globalModules.facebook.control
{
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import flash.net.URLLoader;
   import com.mz.core.configs.ClientConfig;
   import flash.net.URLRequest;
   import com.mz.core.logging.Log;
   import flash.events.Event;
   import morn.core.components.Label;
   import com.greensock.TimelineLite;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.AlertUtil;
   
   public class FBBtnControl
   {
      
      private static var _instance:nslm2.modules.globalModules.facebook.control.FBBtnControl;
       
      
      public function FBBtnControl()
      {
         super();
         if(_instance)
         {
            return;
            §§push(trace("FBBtnControl单类不能自己初始化！"));
         }
         else
         {
            return;
         }
      }
      
      public static function get instance() : nslm2.modules.globalModules.facebook.control.FBBtnControl
      {
         if(_instance == null)
         {
            _instance = new nslm2.modules.globalModules.facebook.control.FBBtnControl();
         }
         return _instance;
      }
      
      public function reqFaceBookFeed(param1:StcFacebookFeedVo, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         if(param1)
         {
            _loc4_ = new URLLoader();
            _loc4_.addEventListener("complete",urlLoaderCpl);
            _loc4_.addEventListener("ioError",urlLoaderError);
            _loc4_.addEventListener("securityError",urlLoaderError);
            _loc3_ = ClientConfig.battleReportUrl.replace("btl","facebookshare");
            _loc6_ = new URLRequest(_loc3_);
            _loc6_.method = "POST";
            _loc5_ = "description=" + param2 + "&";
            _loc5_ = _loc5_ + ("icon=" + param1.icon + "&");
            _loc5_ = _loc5_ + ("link=" + encodeURI(param1.link) + "&");
            _loc5_ = _loc5_ + ("picture=" + encodeURI(param1.picture1) + "&");
            _loc5_ = _loc5_ + ("feedId=" + param1.ID + "&");
            _loc5_ = _loc5_ + ("feedType=" + param1.feedType + "&");
            _loc5_ = _loc5_ + ("serverid=" + ClientConfig.district + "&");
            _loc5_ = _loc5_ + ("myuid=" + ClientConfig.playId + "&");
            _loc5_ = _loc5_ + ("name=" + param1.name + "&");
            _loc5_ = _loc5_ + ("caption=" + encodeURI(param1.caption));
            _loc6_.data = _loc5_;
            _loc4_.load(_loc6_);
            Log.info("URL: -->" + _loc3_);
            Log.info("dataStr: -->" + _loc5_);
            Log.info("facebook --> 向服务器HTTP请求已发送！");
         }
      }
      
      private function urlLoaderCpl(param1:Event) : void
      {
         event = param1;
         event.currentTarget.removeEventListener("complete",urlLoaderCpl);
         event.currentTarget.removeEventListener("ioError",urlLoaderError);
         event.currentTarget.removeEventListener("securityError",urlLoaderError);
         if(event.currentTarget == null || event.currentTarget.data == null || event.currentTarget.data == "")
         {
            Log.info("facebook --> 向服务器HTTP请求CPL！但是数据不对！");
            return;
         }
         var obj:* = JSON.parse(event.currentTarget.data);
         if(obj.errCode == 0)
         {
            Log.info("FaceBook分享请求数据错误！");
         }
         else
         {
            Log.info("facebook --> 向服务器HTTP请求CPL！");
            Log.info("服务器返回数据为： " + obj.message);
            CallJsMrg.ins.postFeed(obj.message);
            if(ClientConfig.firstBattle == 1)
            {
               var text:Label = new Label(LocaleMgr.ins.getStr(999000750));
               text.align = "center";
               text.width = 500;
               text.height = 30;
               text.style = "渐变橙";
               text.size = 25;
               text.alpha = 0.5;
               text.x = UIMgr.stage.stageWidth - text.width >> 1;
               text.y = UIMgr.stage.stageHeight - text.height >> 1;
               UIMgr.layer2D.addChild(text);
               var _loc3_:Boolean = false;
               text.mouseChildren = _loc3_;
               text.mouseEnabled = _loc3_;
               var tl:TimelineLite = new TimelineLite();
               tl.to(text,0.5,{
                  "y":text.y - 30,
                  "alpha":1
               });
               tl.to(text,1,{"alpha":0.5});
               tl.to(text,0.5,{
                  "y":text.y - 30,
                  "alpha":0
               });
               tl.call(function():*
               {
                  var /*UnknownSlot*/:* = function():void
                  {
                     DisplayUtils.removeSelf(text);
                  };
                  return function():void
                  {
                     DisplayUtils.removeSelf(text);
                  };
               }());
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000750));
            }
         }
      }
      
      private function urlLoaderError(param1:Event) : void
      {
         Log.info("facebook --> 向服务器HTTP请求ERROR！ --> " + param1.type);
      }
   }
}
