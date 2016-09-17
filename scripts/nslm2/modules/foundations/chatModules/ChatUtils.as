package nslm2.modules.foundations.chatModules
{
   import proto.PublicTalkNotify;
   import com.netease.protobuf.UInt64;
   import proto.TalkContent;
   import nslm2.modules.foundations.chatModules.commons.ChatHeaderVo;
   import nslm2.common.vo.VipInfoVo;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.utils.LabelMed;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.modules.bag.itemModuels.ItemMsg;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import nslm2.modules.foundations.chatModules.historyPanels.ChatVipNameRender;
   import nslm2.utils.CheckFilterWords;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import flash.display.DisplayObject;
   import com.mz.core.utils.DisplayUtils;
   import flash.display.InteractiveObject;
   
   public class ChatUtils
   {
      
      public static const SplitStrUID:String = "$^@";
      
      public static const SplitStr:String = "^#@";
      
      public static const SplitStrReg:RegExp = /\^\#\@/g;
      
      public static const GM:Number = 1;
      
      public static const ZHIDAOYUAN:Number = 2;
      
      public static var lastStr:String;
       
      
      public function ChatUtils()
      {
         super();
      }
      
      public static function createRes(param1:int, param2:UInt64, param3:String, param4:String) : PublicTalkNotify
      {
         var _loc5_:PublicTalkNotify = new PublicTalkNotify();
         _loc5_.pindao = param1;
         _loc5_.playerId = param2;
         _loc5_.name = param3;
         _loc5_.content = new TalkContent();
         _loc5_.content.content = param4;
         return _loc5_;
      }
      
      public static function createWarnRes(param1:String) : PublicTalkNotify
      {
         var _loc2_:PublicTalkNotify = new PublicTalkNotify();
         _loc2_.pindao = 44;
         _loc2_.playerId = null;
         _loc2_.content = new TalkContent();
         _loc2_.content.content = param1;
         _loc2_.content.isNormal = false;
         return _loc2_;
      }
      
      public static function processMsg(param1:PublicTalkNotify) : ChatParseResultVo
      {
         var _loc3_:ChatHeaderVo = parseHeader(param1);
         var _loc2_:ChatParseResultVo = processContent(param1,_loc3_);
         return _loc2_;
      }
      
      public static function parseHeaderHTML(param1:PublicTalkNotify, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true, param5:VipInfoVo = null) : String
      {
         var _loc7_:ChatHeaderVo = parseHeader(param1,param2,param3,param4,param5);
         var _loc6_:ChatChannelVo = ChatConsts.ins.getChannelVo(param1.pindao);
         return TextFieldUtil.htmlText(_loc7_.htmlText,newTF(_loc6_.color));
      }
      
      private static function newTF(param1:uint) : TextFormat
      {
         var _loc2_:TextFormat = new TextFormat(null,null,param1);
         _loc2_.underline = false;
         _loc2_.letterSpacing = 0;
         return _loc2_;
      }
      
      private static function parseHeader(param1:PublicTalkNotify, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true, param5:VipInfoVo = null) : ChatHeaderVo
      {
         var _loc9_:int = 0;
         var _loc7_:* = null;
         var _loc8_:String = "";
         if(param5)
         {
            _loc8_ = LabelMed.vipParam(param5);
         }
         var _loc10_:ChatHeaderVo = new ChatHeaderVo();
         var _loc6_:ChatChannelVo = ChatConsts.ins.getChannelVo(param1.pindao);
         if(_loc6_)
         {
            if(param1.name)
            {
               _loc9_ = param1.gmType;
               if(Uint64Util.equal(param1.playerId,PlayerModel.ins.playerInfo.id))
               {
                  if(param1.content.sendPlayer)
                  {
                     _loc10_.text = LinkUtils.playerNameText(param1.name,_loc9_);
                  }
                  else
                  {
                     _loc10_.text = param1.name;
                  }
                  _loc10_.htmlText = _loc8_ + LinkUtils.getGMTypeHTML(_loc9_) + TextFieldUtil.htmlText2(param1.name,16046112,null);
               }
               else if(_loc6_.id == 7 || _loc6_.id == 8)
               {
                  _loc10_.text = LinkUtils.playerNameText(param1.name,_loc9_);
                  _loc10_.htmlText = TextFieldUtil.htmlText2(param1.name,16046112,null);
               }
               else
               {
                  _loc10_.text = LinkUtils.playerNameText(param1.name,_loc9_);
                  _loc10_.htmlText = _loc8_ + LinkUtils.playerName(param1.playerId,param1.name,0,16046112,null,_loc9_,param1.npcId);
               }
            }
            else
            {
               _loc10_.text = "";
               _loc10_.htmlText = "";
            }
            _loc7_ = "";
            if(param4)
            {
               if(_loc6_.id == 44)
               {
                  _loc7_ = "";
               }
               else if(_loc6_.id == 5)
               {
                  _loc7_ = "[" + LocaleMgr.ins.getStr(999000603) + "]";
               }
               else
               {
                  _loc7_ = "[" + _loc6_.name + "]";
               }
            }
            if(param2)
            {
               if(_loc10_.text)
               {
                  _loc10_.text = _loc7_ + " " + _loc10_.text + (!!param3?LocaleMgr.ins.getStr(999000604):"");
                  _loc10_.htmlText = _loc7_ + " " + _loc10_.htmlText + (!!param3?LocaleMgr.ins.getStr(999000604):"");
               }
               else
               {
                  _loc10_.text = _loc7_ + " ";
                  _loc10_.htmlText = _loc7_ + " ";
               }
            }
            else
            {
               _loc10_.text = _loc10_.text + _loc7_;
               _loc10_.htmlText = _loc10_.htmlText + _loc7_;
            }
         }
         return _loc10_;
      }
      
      public static function processContent(param1:PublicTalkNotify, param2:ChatHeaderVo = null) : ChatParseResultVo
      {
         var _loc3_:String = parseContent(param1,param2);
         var _loc4_:String = _loc3_.split("^#@")[0];
         var _loc5_:Array = ChatUtils.strToface(_loc3_);
         return new ChatParseResultVo(_loc4_,_loc5_);
      }
      
      private static function parseContent(param1:PublicTalkNotify, param2:ChatHeaderVo = null) : String
      {
         var _loc10_:* = null;
         var _loc3_:* = null;
         var _loc9_:* = null;
         var _loc18_:* = null;
         var _loc14_:* = null;
         var _loc25_:* = null;
         var _loc12_:* = null;
         var _loc4_:int = 0;
         var _loc23_:* = null;
         var _loc16_:* = null;
         var _loc22_:* = null;
         var _loc24_:int = 0;
         var _loc5_:* = null;
         var _loc6_:ChatChannelVo = ChatConsts.ins.getChannelVo(param1.pindao);
         var _loc7_:String = param1.content.content;
         _loc7_ = LocaleConsts.clearParamStr(_loc7_);
         var _loc17_:Array = String(_loc7_).split("^#@");
         var _loc11_:Array = [];
         var _loc15_:Array = [];
         var _loc8_:String = _loc17_[1];
         if(_loc8_ && _loc8_ != "")
         {
            if(_loc8_.indexOf("item") == 0)
            {
               _loc14_ = _loc8_.split(":");
               _loc10_ = new ItemMsg(Uint64Util.fromString(_loc14_[1]),Uint64Util.fromString(_loc14_[2]),_loc14_[3]);
            }
            else if(_loc8_.indexOf("TeamGuajiInvite") == 0)
            {
               _loc25_ = _loc8_.split(":");
               _loc9_ = Uint64Util.fromString(_loc25_[1]);
            }
            else if(_loc8_.indexOf("battlefieldInviteKind") == 0)
            {
               _loc12_ = _loc8_.split(":");
               _loc18_ = Uint64Util.fromString(_loc12_[1]);
            }
            else if(_loc8_.indexOf("baowu") == 0)
            {
               _loc14_ = _loc8_.split(":");
               _loc3_ = new ItemMsg(Uint64Util.fromString(_loc14_[1]),Uint64Util.fromString(_loc14_[2]),_loc14_[3]);
            }
            else
            {
               _loc15_ = _loc17_[1].split(",");
               _loc11_ = _loc17_[2].split(",");
            }
         }
         if(param2 && VipUtils.curVipLv(param1.content.sendPlayer))
         {
            _loc15_.splice(0,0,ChatVipNameRender);
            _loc4_ = param2.text.indexOf("]");
            _loc4_ = _loc4_ + 1;
            _loc11_.splice(0,0,_loc4_);
         }
         var _loc13_:int = !!param2?param2.text.length:0;
         var _loc20_:String = !!param2?param2.htmlText:"";
         var _loc19_:String = _loc17_[0];
         if(_loc10_)
         {
            if(param1.content.extraItem)
            {
               _loc23_ = LinkUtils.itemName(param1.content.extraItem);
            }
            else
            {
               _loc23_ = "";
            }
            _loc19_ = TextFieldUtil.htmlText(_loc20_,newTF(_loc6_.color)) + _loc23_;
            param1.content.isNormal = false;
         }
         else if(_loc3_)
         {
            if(param1.content.extraBaow)
            {
               _loc23_ = LinkUtils.treasureName(param1.content.extraBaow);
            }
            else
            {
               _loc23_ = "";
            }
            _loc19_ = TextFieldUtil.htmlText(_loc20_,newTF(_loc6_.color)) + _loc23_;
            param1.content.isNormal = false;
         }
         else if(_loc9_)
         {
            _loc16_ = LinkUtils.teamGuajiPublicInvite(_loc9_);
            _loc19_ = TextFieldUtil.htmlText(_loc20_,newTF(_loc6_.color)) + _loc16_;
            param1.content.isNormal = false;
         }
         else if(_loc18_)
         {
            _loc22_ = LinkUtils.battlefieldPublicInvite(_loc18_);
            _loc19_ = TextFieldUtil.htmlText(_loc20_,newTF(_loc6_.color)) + _loc22_;
            param1.content.isNormal = false;
         }
         else
         {
            if(param1.content.sendPlayer)
            {
               switch(int(param1.content.sendPlayer.gmType) - 1)
               {
                  case 0:
                     _loc24_ = 16723968;
                     break;
                  case 1:
                     _loc24_ = 458496;
               }
            }
            if(_loc6_.needCheckFilter)
            {
               _loc19_ = _loc20_ + CheckFilterWords.ins.filterWord_bak(_loc19_);
            }
            else
            {
               _loc19_ = _loc20_ + _loc19_;
            }
         }
         var _loc21_:int = 0;
         if(_loc11_.length != 0)
         {
            _loc21_ = 0;
            while(_loc21_ < _loc11_.length)
            {
               if(_loc15_[_loc21_] == ChatVipNameRender)
               {
                  _loc11_[_loc21_] = int(_loc11_[_loc21_]);
               }
               else
               {
                  _loc11_[_loc21_] = int(_loc11_[_loc21_]) + _loc13_;
               }
               _loc21_++;
            }
         }
         if(_loc10_ == null)
         {
            _loc19_ = TextFieldUtil.htmlText(_loc19_,newTF(!!_loc24_?_loc24_:uint(_loc6_.color)));
         }
         if(_loc11_.length > 0)
         {
            _loc19_ = _loc19_ + ("^#@" + _loc15_.join(",") + "^#@" + _loc11_.join(","));
            if(param2 && VipUtils.curVipLv(param1.content.sendPlayer))
            {
               _loc5_ = VipUtils.vipInfoVo(param1.content.sendPlayer);
               _loc19_ = _loc19_ + ("^#@" + param1.content.sendPlayer.id.toString() + "," + param1.content.sendPlayer.name + "," + _loc5_.curQQVip + "," + (!!_loc5_.isQQYear?1:0) + "," + (!!_loc5_.isQQLux?1:0));
            }
         }
         else
         {
            _loc19_ = _loc19_ + ("^#@" + "^#@");
         }
         return _loc19_;
      }
      
      public static function checkSendTxt(param1:String, param2:int) : String
      {
         var _loc3_:String = "";
         if(PlayerModel.ins.level < int(ChatModel.ins.chat_lv_limit))
         {
            _loc3_ = LocaleMgr.ins.getStr(999000223,[ChatModel.ins.chat_lv_limit]);
         }
         else
         {
            if(lastStr == param1)
            {
               _loc3_ = LocaleMgr.ins.getStr(999000224);
            }
            else if(param1.split("^#@")[0] == "" && (param1.split("^#@")[1] == null || param1.split("^#@")[1] == ""))
            {
               _loc3_ = getAlertEmptySendStr();
            }
            else if(ChatModel.ins.checkSendTimer(param2) == false)
            {
               _loc3_ = getAlertFrequentlySendStr();
            }
            else if(param2 == 4)
            {
               _loc3_ = LocaleMgr.ins.getStr(10500004);
            }
            else if(param2 == 3)
            {
               if(!IMClient2.guildIMClicentGid)
               {
                  if(!PlayerModel.ins.playerInfo.familyId)
                  {
                     _loc3_ = LocaleMgr.ins.getStr(10500003);
                  }
               }
            }
            else if(param2 == 7)
            {
               BattlefieldModel.ins.chatChannelId = "7";
               trace(BattlefieldModel.ins.chatChannelId);
               if(!BattlefieldModel.ins.chatChannelId)
               {
                  _loc3_ = LocaleMgr.ins.getStr(999000225);
               }
            }
            else if(param2 == 8)
            {
               PeakSportsModel.ins.chatChannelId = "8";
               trace(PeakSportsModel.ins.chatChannelId);
               if(!PeakSportsModel.ins.chatChannelId)
               {
                  _loc3_ = LocaleMgr.ins.getStr(999000225);
               }
            }
            lastStr = param1;
         }
         return _loc3_;
      }
      
      public static function getAlertFrequentlySendStr() : String
      {
         return LocaleMgr.ins.getStr(10500001);
      }
      
      public static function getAlertEmptySendStr() : String
      {
         return LocaleMgr.ins.getStr(999000226);
      }
      
      public static function faceToStr(param1:Array) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         param1.sortOn("index",16);
         var _loc3_:Array = [];
         var _loc2_:Array = [];
         _loc5_ = uint(0);
         while(_loc5_ < param1.length)
         {
            _loc3_.push(param1[_loc5_].src);
            _loc2_.push(int(param1[_loc5_].index) - _loc5_);
            _loc5_++;
         }
         _loc4_ = _loc3_.join(",") + "^#@" + _loc2_.join(",");
         return _loc4_;
      }
      
      public static function strToface(param1:String) : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:Array = [];
         var _loc4_:Array = [];
         var _loc7_:Array = [];
         var _loc9_:Array = param1.split("^#@");
         if(_loc9_[1] == "" || _loc9_[1] == null)
         {
            _loc5_ = [];
            _loc4_ = [];
         }
         else
         {
            _loc5_ = _loc9_[1].split(",");
            _loc4_ = _loc9_[2].split(",");
         }
         var _loc8_:int = 3;
         var _loc11_:int = 0;
         var _loc10_:* = _loc5_;
         for(_loc2_ in _loc5_)
         {
            if(_loc5_[_loc2_] == ChatVipNameRender)
            {
               if(_loc9_[_loc2_] && _loc9_[_loc8_])
               {
                  _loc3_ = _loc9_[_loc8_].split(",");
                  _loc7_.push({
                     "src":new ChatVipNameRender(_loc3_[2],int(_loc3_[3]),int(_loc3_[4])),
                     "index":_loc4_[_loc2_]
                  });
                  _loc8_++;
               }
            }
            else
            {
               if(_loc5_[_loc2_].indexOf("ui_ChannelChat_Face") == 0)
               {
                  _loc5_[_loc2_] = "png." + _loc5_[_loc2_];
               }
               _loc6_ = ReflectUtil.createDisplayObjectSmart(_loc5_[_loc2_]);
               DisplayUtils.mouseEnabled(_loc6_ as InteractiveObject,false);
               _loc7_.push({
                  "src":_loc6_,
                  "index":_loc4_[_loc2_]
               });
            }
         }
         return _loc7_;
      }
      
      public static function isGMTypeCanPriChat(param1:int) : Boolean
      {
         if(PlayerModel.ins.playerInfo.gmType == 1 || PlayerModel.ins.playerInfo.gmType == 2 || param1 == 1 || param1 == 2)
         {
            return true;
         }
         return false;
      }
      
      public static function formatTransformLocalToServer(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc3_:String = "";
         var _loc6_:Array = param1.split("^#@");
         var _loc7_:String = String(_loc6_[0]);
         var _loc4_:Array = _loc7_.split("");
         if(String(_loc6_[_loc6_.length - 1]) != "")
         {
            _loc2_ = String(_loc6_[_loc6_.length - 1]).split(",");
            _loc5_ = String(_loc6_[1]).split(",");
            _loc8_ = 0;
            while(_loc8_ < _loc2_.length)
            {
               _loc4_.insertAt(int(_loc2_[_loc8_]) + _loc8_,"___" + String(_loc5_[_loc8_]).split("png::ui_ChannelChat_Face")[1] + "___");
               _loc8_++;
            }
         }
         _loc3_ = _loc4_.join("");
         return _loc3_;
      }
      
      public static function formatTransformServerToLocal(param1:String) : String
      {
         var _loc4_:int = 0;
         var _loc10_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:String = "";
         var _loc6_:Array = param1.split("___");
         var _loc3_:Array = [];
         var _loc8_:Array = [];
         _loc10_ = 0;
         while(_loc10_ < _loc6_.length)
         {
            if(_loc10_ % 2 == 1)
            {
               if(int(_loc6_[_loc10_]) != 0 && int(_loc6_[_loc10_]) < 54)
               {
                  _loc5_ = 0;
                  while(_loc5_ < _loc10_)
                  {
                     _loc9_ = _loc9_ + String(_loc6_[_loc5_]).length;
                     _loc5_++;
                  }
                  _loc3_[_loc4_] = _loc9_;
                  _loc8_[_loc4_] = int(_loc6_[_loc10_]);
                  _loc6_[_loc10_] = "";
                  _loc4_++;
               }
            }
            _loc10_++;
         }
         _loc2_ = _loc6_.join("");
         var _loc7_:String = "^#@";
         _loc10_ = 0;
         while(_loc10_ < _loc3_.length)
         {
            _loc8_[_loc10_] = "png::ui_ChannelChat_Face" + _loc8_[_loc10_];
            _loc10_++;
         }
         _loc7_ = _loc7_ + _loc8_.join(",");
         _loc7_ = _loc7_ + "^#@";
         _loc7_ = _loc7_ + _loc3_.join(",");
         _loc2_ = _loc2_ + _loc7_;
         return _loc2_;
      }
      
      public static function xmlString(param1:String, param2:String, param3:int) : String
      {
         var _loc7_:int = 0;
         var _loc4_:String = "<xml>" + param1 + "</xml>";
         var _loc6_:XML = new XML(_loc4_);
         XML.prettyPrinting = false;
         XML.ignoreWhitespace = false;
         var _loc5_:String = "";
         _loc7_ = 0;
         while(_loc7_ < _loc6_.TEXTFORMAT.length())
         {
            if(_loc7_ == param3)
            {
               _loc6_.TEXTFORMAT[_loc7_].P[0].FONT[0] = new XML(param2);
            }
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc6_.TEXTFORMAT.length())
         {
            _loc5_ = _loc5_ + _loc6_.TEXTFORMAT[_loc7_].toString();
            _loc7_++;
         }
         return _loc5_;
      }
   }
}
