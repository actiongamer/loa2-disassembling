package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import com.riaidea.text.RichTextField;
   import com.mz.core.interFace.IDispose;
   import proto.PublicTalkNotify;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.events.TextEvent;
   import org.specter3d.utils.MD5;
   import nslm2.utils.ServerTimer;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.chatModules.ChatParseResultVo;
   import flash.events.Event;
   import proto.TalkContent;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.logging.Log;
   import flash.text.TextFormat;
   import morn.core.components.Styles;
   import morn.customs.FilterLib;
   
   public class ChatHistoryRenderTxt extends RichTextField implements IDispose
   {
       
      
      public var oriRes:PublicTalkNotify;
      
      public var nowRes:PublicTalkNotify;
      
      public var changeed:int = 0;
      
      private var showHead:Boolean;
      
      private var changeSize:Function;
      
      private var urlLoader:URLLoader;
      
      private var urlRequest:URLRequest;
      
      public function ChatHistoryRenderTxt(param1:int)
      {
         super();
         var _loc2_:TextFormat = new TextFormat(Styles.fontName,12,16777215);
         _loc2_.underline = true;
         _loc2_.letterSpacing = 0;
         _loc2_.leading = 6;
         this.textfield.multiline = true;
         this.textfield.wordWrap = true;
         this.textfield.selectable = true;
         this.autoScroll = false;
         this.html = true;
         this.type = "dynamic";
         this.defaultTextFormat = _loc2_;
         this.textfield.filters = [FilterLib.BORDER_BLACK];
         this.setSize(param1,137);
         this.textfield.mouseWheelEnabled = false;
         this.textfield.addEventListener("link",textEvent);
         urlRequest = new URLRequest();
         urlRequest.method = "POST";
         urlLoader = new URLLoader();
         urlLoader.addEventListener("complete",transfromComplete);
         urlLoader.addEventListener("ioError",onError);
         urlLoader.addEventListener("securityError",onError);
      }
      
      protected function textEvent(param1:TextEvent) : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         if(param1.text == "transform")
         {
            this.textfield.mouseEnabled = false;
            _loc5_ = MD5.hash("fsladjfi$%#sajkdfh" + ServerTimer.ins.second);
            _loc3_ = ClientConfig.battleReportUrl.replace("btl","translate");
            _loc4_ = ClientConfig.language;
            if(_loc4_ == "common")
            {
               _loc4_ = "cn";
            }
            urlRequest.url = _loc3_;
            urlRequest.data = "text=" + encodeURI(ChatUtils.formatTransformLocalToServer(oriRes.content.content)) + "&to=" + _loc4_ + "&time=" + ServerTimer.ins.second + "&verify=" + _loc5_;
            urlLoader.load(urlRequest);
         }
         else if(param1.text == "reset")
         {
            this.setSize(212,137);
            this.textfield.mouseEnabled = true;
            this.transClear();
            _loc2_ = getResultVo(oriRes,showHead);
            changeed = 0;
            nowRes = oriRes;
            super.append(_loc2_.msg + getEndString(0,oriRes),_loc2_.faceArr);
            bgresize();
         }
      }
      
      protected function transfromComplete(param1:Event) : void
      {
         this.textfield.mouseEnabled = true;
         this.setSize(212,137);
         var _loc4_:Object = JSON.parse(String(param1.target.data));
         var _loc3_:PublicTalkNotify = new PublicTalkNotify();
         _loc3_.content = new TalkContent();
         _loc3_.content.content = oriRes.content.content;
         _loc3_.content.content = ChatUtils.formatTransformServerToLocal(_loc4_.message);
         _loc3_.pindao = oriRes.pindao;
         _loc3_.name = oriRes.name;
         _loc3_.npcId = oriRes.npcId;
         _loc3_.playerId = oriRes.playerId;
         if(_loc3_.parseResultVoMsg == null)
         {
            _loc3_.parseResultVoMsg = ChatUtils.processMsg(_loc3_);
         }
         this.transClear();
         nowRes = _loc3_;
         changeed = 1;
         var _loc2_:ChatParseResultVo = getResultVo(nowRes,showHead);
         super.append(_loc2_.msg + getEndString(1,nowRes),_loc2_.faceArr);
         bgresize();
      }
      
      public function dispose() : void
      {
         this.clear();
      }
      
      public function show(param1:PublicTalkNotify, param2:Boolean, param3:Function = null) : void
      {
         this.showHead = param2;
         this.changeSize = param3;
         this.oriRes = param1;
         this.clear();
         var _loc4_:ChatParseResultVo = getResultVo(param1,param2);
         this.append(_loc4_.msg,_loc4_.faceArr);
      }
      
      private function getResultVo(param1:PublicTalkNotify, param2:Boolean) : ChatParseResultVo
      {
         var _loc3_:* = null;
         if(param2)
         {
            if(param1.parseResultVoMsg == null)
            {
               param1.parseResultVoMsg = ChatUtils.processMsg(param1);
            }
            _loc3_ = param1.parseResultVoMsg;
         }
         else
         {
            if(param1.parseResultVoContent == null)
            {
               param1.parseResultVoContent = ChatUtils.processContent(param1);
            }
            _loc3_ = param1.parseResultVoContent;
         }
         return _loc3_;
      }
      
      private function getEndString(param1:int, param2:PublicTalkNotify) : String
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:String = "";
         if(FuncOpenAutoCtrl.checkOpen(900000) == false)
         {
            return _loc4_;
         }
         if(param2.content.isNormal == false)
         {
            return _loc4_;
         }
         if(Uint64Util.equal(param2.playerId,PlayerModel.ins.playerInfo.id) == false)
         {
            _loc5_ = "";
            _loc3_ = "";
            if(param1 == 1)
            {
               _loc5_ = LocaleMgr.ins.getStr(999001147);
               _loc3_ = "reset";
            }
            else
            {
               _loc5_ = LocaleMgr.ins.getStr(999001146);
               _loc3_ = "transform";
            }
            _loc4_ = "   <u><a href=\'event:" + _loc3_ + "\'>" + _loc5_ + "</a></u>";
         }
         return _loc4_;
      }
      
      private function onError(param1:Event) : void
      {
         Log.warn("transform language log error",param1);
         this.textfield.mouseEnabled = true;
      }
      
      override public function append(param1:String, param2:Array = null, param3:Boolean = false, param4:TextFormat = null, param5:Boolean = false) : void
      {
         param1 = param1 + getEndString(0,this.oriRes);
         super.append(param1,param2,param3,param4);
         bgresize();
      }
      
      private function bgresize() : void
      {
         this.setSize(this.textfield.textWidth + 6,textfield.textHeight + 4 + (this.textfield.numLines <= 1?-int(defaultTextFormat.leading):0));
         if(changeSize)
         {
            changeSize.apply();
         }
      }
   }
}
