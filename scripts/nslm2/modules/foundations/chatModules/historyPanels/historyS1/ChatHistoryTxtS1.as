package nslm2.modules.foundations.chatModules.historyPanels.historyS1
{
   import com.riaidea.text.RichTextField;
   import proto.PublicTalkNotify;
   import flash.events.TextEvent;
   import org.specter3d.utils.MD5;
   import nslm2.utils.ServerTimer;
   import com.mz.core.configs.ClientConfig;
   import flash.net.URLRequest;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import flash.net.URLLoader;
   import nslm2.modules.foundations.chatModules.ChatParseResultVo;
   import flash.events.Event;
   import proto.TalkContent;
   import flash.text.TextFormat;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.logging.Log;
   import morn.core.components.Styles;
   import morn.customs.FilterLib;
   
   public class ChatHistoryTxtS1 extends RichTextField
   {
       
      
      public var res:PublicTalkNotify;
      
      private var id:int;
      
      private var oriAry:Array;
      
      private var nowAry:Array;
      
      private var changeedAry:Array;
      
      private var nowId:int;
      
      public function ChatHistoryTxtS1()
      {
         oriAry = [];
         nowAry = [];
         changeedAry = [];
         super();
         var _loc1_:TextFormat = new TextFormat(Styles.fontName,12,16777215);
         _loc1_.underline = true;
         _loc1_.letterSpacing = 0;
         _loc1_.leading = 6;
         this.autoScroll = true;
         this.html = true;
         this.type = "dynamic";
         this.defaultTextFormat = _loc1_;
         this.textfield.filters = [FilterLib.BORDER_BLACK];
         this.textfield.selectable = true;
         this.textfield.addEventListener("link",textEvent);
      }
      
      protected function textEvent(param1:TextEvent) : void
      {
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc2_:* = null;
         if(param1.text.split("|")[0] == "transform")
         {
            this.textfield.mouseEnabled = false;
            nowId = int(param1.text.split("|")[1]);
            _loc7_ = MD5.hash("fsladjfi$%#sajkdfh" + ServerTimer.ins.second);
            _loc4_ = ClientConfig.battleReportUrl.replace("btl","translate");
            _loc5_ = new URLRequest(_loc4_);
            _loc5_.method = "POST";
            _loc6_ = ClientConfig.language;
            if(_loc6_ == "common")
            {
               _loc6_ = "cn";
            }
            _loc5_.data = "text=" + encodeURI(ChatUtils.formatTransformLocalToServer(PublicTalkNotify(oriAry[nowId]).content.content)) + "&to=" + _loc6_ + "&time=" + ServerTimer.ins.second + "&verify=" + _loc7_;
            _loc3_ = new URLLoader(_loc5_);
            _loc3_.addEventListener("ioError",onError);
            _loc3_.addEventListener("securityError",onError);
            _loc3_.addEventListener("complete",transfromComplete);
            _loc3_.load(_loc5_);
         }
         else if(param1.text.split("|")[0] == "reset")
         {
            this.textfield.mouseEnabled = true;
            this.transClear();
            nowId = int(param1.text.split("|")[1]);
            _loc8_ = 0;
            while(_loc8_ < oriAry.length)
            {
               if(nowId == _loc8_)
               {
                  _loc2_ = oriAry[_loc8_].parseResultVoMsg;
                  changeedAry[_loc8_] = 0;
                  nowAry[_loc8_] = oriAry[_loc8_];
                  super.append(_loc2_.msg + getEndString(_loc8_,0,oriAry[_loc8_]),_loc2_.faceArr);
               }
               else
               {
                  _loc2_ = nowAry[_loc8_].parseResultVoMsg;
                  if(changeedAry[_loc8_] == 1)
                  {
                     super.append(_loc2_.msg + getEndString(_loc8_,1,nowAry[_loc8_]),_loc2_.faceArr);
                  }
                  else
                  {
                     super.append(_loc2_.msg + getEndString(_loc8_,0,nowAry[_loc8_]),_loc2_.faceArr);
                  }
               }
               _loc8_++;
            }
         }
      }
      
      protected function transfromComplete(param1:Event) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         this.textfield.mouseEnabled = true;
         var _loc4_:Object = JSON.parse(String(param1.target.data));
         var _loc3_:PublicTalkNotify = new PublicTalkNotify();
         _loc3_.content = new TalkContent();
         _loc3_.content.content = oriAry[nowId].content.content;
         _loc3_.content.content = ChatUtils.formatTransformServerToLocal(_loc4_.message);
         _loc3_.pindao = oriAry[nowId].pindao;
         _loc3_.name = oriAry[nowId].name;
         _loc3_.npcId = oriAry[nowId].npcId;
         _loc3_.playerId = oriAry[nowId].playerId;
         if(_loc3_.parseResultVoMsg == null)
         {
            _loc3_.parseResultVoMsg = ChatUtils.processMsg(_loc3_);
         }
         this.transClear();
         nowAry[nowId] = _loc3_;
         changeedAry[nowId] = 1;
         _loc5_ = 0;
         while(_loc5_ < nowAry.length)
         {
            _loc2_ = nowAry[_loc5_].parseResultVoMsg;
            if(nowId == _loc5_)
            {
               super.append(_loc2_.msg + getEndString(_loc5_,1,nowAry[_loc5_]),_loc2_.faceArr);
            }
            else if(changeedAry[_loc5_] == 0)
            {
               super.append(_loc2_.msg + getEndString(_loc5_,0,nowAry[_loc5_]),_loc2_.faceArr);
            }
            else
            {
               super.append(_loc2_.msg + getEndString(_loc5_,1,nowAry[_loc5_]),_loc2_.faceArr);
            }
            _loc5_++;
         }
      }
      
      override public function append(param1:String, param2:Array = null, param3:Boolean = false, param4:TextFormat = null, param5:Boolean = false) : void
      {
         if(param5)
         {
            param1 = param1 + getEndString(id,0,this.res);
         }
         super.append(param1,param2,param3,param4);
         if(this.res && this.res.content != null)
         {
            oriAry[id] = this.res;
            nowAry[id] = this.res;
            changeedAry[id] = 0;
            id = Number(id) + 1;
         }
      }
      
      private function getEndString(param1:int, param2:int, param3:PublicTalkNotify) : String
      {
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:String = "";
         if(FuncOpenAutoCtrl.checkOpen(900000) == false)
         {
            return _loc5_;
         }
         if(param3.content.isNormal == false)
         {
            return _loc5_;
         }
         if(Uint64Util.equal(param3.playerId,PlayerModel.ins.playerInfo.id) == false)
         {
            _loc6_ = "";
            _loc4_ = "";
            if(param2 == 1)
            {
               _loc6_ = LocaleMgr.ins.getStr(999001147);
               _loc4_ = "reset";
            }
            else
            {
               _loc6_ = LocaleMgr.ins.getStr(999001146);
               _loc4_ = "transform";
            }
            _loc5_ = "   <font color=\'#00ffff\'><a href=\'event:" + _loc4_ + "|" + param1 + "\'>" + _loc6_ + "</a></font>";
         }
         return _loc5_;
      }
      
      private function onError(param1:Event) : void
      {
         Log.warn("transform language log error",param1);
         this.textfield.mouseEnabled = true;
      }
      
      override public function clear() : void
      {
         super.clear();
         id = 0;
         oriAry = [];
         nowAry = [];
      }
   }
}
