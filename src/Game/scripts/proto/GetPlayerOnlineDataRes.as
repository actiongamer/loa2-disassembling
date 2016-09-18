package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetPlayerOnlineDataRes extends Message
   {
      
      public static const PLAYERINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.playerInfo","playerInfo",8 | 2,proto.PlayerInfoNotify);
      
      public static const SCENENOTIFY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.sceneNotify","sceneNotify",16 | 2,proto.EnterScenePlayerNotify);
      
      public static const LINESATE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.linesate","linesate",24 | 2,proto.ShowLineStateRes);
      
      public static const SETTING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.setting","setting",32 | 2,proto.SystemSettingsNotify);
      
      public static const TIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.time","time",40 | 2,proto.SystemTimeNotify);
      
      public static const FUNCTIONTIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.functionTime","functionTime",48 | 2,proto.FunctionTimesNotify);
      
      public static const PLAYERDATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.playerdata","playerdata",56 | 2,proto.PlayerDataNotify);
      
      public static const TASKINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.taskInfo","taskInfo",72 | 2,proto.TaskGetCurInfoRes);
      
      public static const SAINFOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.saInfos","saInfos",80 | 2,proto.GetSwapActionsRes);
      
      public static const COPENTM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.cOpenTm","cOpenTm",88 | 2,proto.CompeteOpenTimeRes);
      
      public static const GTB:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.gtb","gtb",96 | 2,proto.GetTimesBuyRes);
      
      public static const PTCPI:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.ptcpi","ptcpi",104 | 2,proto.PTChatPlayerInfoRes);
      
      public static const PVR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.pvr","pvr",112 | 2,proto.PanelViewRes);
      
      public static const PGSH:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.pgsh","pgsh",120 | 2,proto.PlayerGetSaddleHorsesRes);
      
      public static const CBR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.cbr","cbr",128 | 2,proto.ClothesBagRes);
      
      public static const CSBR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.csbr","csbr",136 | 2,proto.ClothesSkillBagRes);
      
      public static const LIR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.lir","lir",144 | 2,proto.LotteryInfoRes);
      
      public static const VGFCR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.vgfcr","vgfcr",152 | 2,proto.VipGetFirstChargeRes);
      
      public static const SINFOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.sInfos","sInfos",160 | 2,proto.GetStageInfosRes);
      
      public static const CSI:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.csi","csi",168 | 2,proto.CanSignInRes);
      
      public static const VMC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.vmc","vmc",176 | 2,proto.VipMonthCardRes);
      
      public static const BABELHISTOPSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetPlayerOnlineDataRes.babelHistopStar","babelHistopStar",184 | 0);
      
      public static const SEVENDAYCLOSESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetPlayerOnlineDataRes.sevenDayCloseStamp","sevenDayCloseStamp",192 | 0);
      
      public static const SERVER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.server","server",200 | 2,proto.ServerInfo);
      
      public static const SUPERSALEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.supersaleinfo","supersaleinfo",208 | 2,proto.SuperSaleInfoData);
      
      public static const OPENFUNDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.openfundinfo","openfundinfo",216 | 2,proto.OpenFundInfoData);
      
      public static const PRIVILEVELINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.privilevelinfo","privilevelinfo",224 | 2,proto.PriviLevelInfoData);
      
      public static const GIT360LEVELINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.git360levelinfo","git360levelinfo",232 | 2,proto.Gift360LevelInfoData);
      
      public static const SOUGOUINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.sougouinfo","sougouinfo",240 | 2,proto.SougouRewardInfoData);
      
      public static const DUOWANINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.duowaninfo","duowaninfo",248 | 2,proto.DuowanNewerCardInfoData);
      
      public static const VIPGIFT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.vipGift","vipGift",256 | 2,proto.GetVipInfoRes);
      
      public static const FUNCTIONACTION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.functionAction","functionAction",264 | 2,proto.FunctionActionNotify);
      
      public static const CARDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.cardInfo","cardInfo",272 | 2,proto.CardInfoNotify);
      
      public static const MOBILEBINDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.mobilebindinfo","mobilebindinfo",280 | 2,proto.MobileBindInfData);
      
      public static const WEIXININFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.weixininfo","weixininfo",288 | 2,proto.WeixinCheckInfData);
      
      public static const WEIDUAN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.weiduan","weiduan",296 | 2,proto.WeiDuanRewardInfo);
      
      public static const FOURTEENDAYCLOSESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetPlayerOnlineDataRes.fourteenDayCloseStamp","fourteenDayCloseStamp",304 | 0);
      
      public static const ACDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.acdInfo","acdInfo",312 | 2,proto.ActivityDropStaticNotify);
      
      public static const OPENCHAGEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.openchageinfo","openchageinfo",320 | 2,proto.OpenChallengeInfo);
      
      public static const VALENTINESPRING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.valentineSpring","valentineSpring",328 | 2,proto.ValentineSpringOpen);
      
      public static const JUEROADINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.jueroadinfo","jueroadinfo",336 | 2,proto.JueRoadInfoData);
      
      public static const XUNLEIJINZUAN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.xunleijinzuan","xunleijinzuan",344 | 2,proto.XunleiJinzuanInfoNotify);
      
      public static const LUCKTREEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.lucktreeinfo","lucktreeinfo",352 | 2,proto.LuckTreeInfoRes);
      
      public static const MINESWEEPINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.mineSweepInfo","mineSweepInfo",360 | 2,proto.MineSweepAllInfoRes);
      
      public static const FASHION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.fashion","fashion",368 | 2,proto.FashionListRes);
      
      public static const DRAGONBOATINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.dragonBoatInfo","dragonBoatInfo",376 | 2,proto.DragonBoatAllInfoRes);
      
      public static const CANGETSIGNINEXTRA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.canGetSignInExtra","canGetSignInExtra",8000 | 2,proto.CanGetSignInExtraRes);
      
      public static const BUYDOUBLEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GetPlayerOnlineDataRes.buydoubleinfo","buydoubleinfo",8008 | 2,proto.BuyDoublePanelRes);
       
      
      private var playerInfo$field:proto.PlayerInfoNotify;
      
      private var sceneNotify$field:proto.EnterScenePlayerNotify;
      
      private var linesate$field:proto.ShowLineStateRes;
      
      private var setting$field:proto.SystemSettingsNotify;
      
      private var time$field:proto.SystemTimeNotify;
      
      private var functionTime$field:proto.FunctionTimesNotify;
      
      private var playerdata$field:proto.PlayerDataNotify;
      
      private var taskInfo$field:proto.TaskGetCurInfoRes;
      
      private var saInfos$field:proto.GetSwapActionsRes;
      
      private var cOpenTm$field:proto.CompeteOpenTimeRes;
      
      private var gtb$field:proto.GetTimesBuyRes;
      
      private var ptcpi$field:proto.PTChatPlayerInfoRes;
      
      private var pvr$field:proto.PanelViewRes;
      
      private var pgsh$field:proto.PlayerGetSaddleHorsesRes;
      
      private var cbr$field:proto.ClothesBagRes;
      
      private var csbr$field:proto.ClothesSkillBagRes;
      
      private var lir$field:proto.LotteryInfoRes;
      
      private var vgfcr$field:proto.VipGetFirstChargeRes;
      
      private var sInfos$field:proto.GetStageInfosRes;
      
      private var csi$field:proto.CanSignInRes;
      
      private var vmc$field:proto.VipMonthCardRes;
      
      private var babelHistopStar$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sevenDayCloseStamp$field:uint;
      
      private var server$field:proto.ServerInfo;
      
      private var supersaleinfo$field:proto.SuperSaleInfoData;
      
      private var openfundinfo$field:proto.OpenFundInfoData;
      
      private var privilevelinfo$field:proto.PriviLevelInfoData;
      
      private var git360levelinfo$field:proto.Gift360LevelInfoData;
      
      private var sougouinfo$field:proto.SougouRewardInfoData;
      
      private var duowaninfo$field:proto.DuowanNewerCardInfoData;
      
      private var vipGift$field:proto.GetVipInfoRes;
      
      private var functionAction$field:proto.FunctionActionNotify;
      
      private var cardInfo$field:proto.CardInfoNotify;
      
      private var mobilebindinfo$field:proto.MobileBindInfData;
      
      private var weixininfo$field:proto.WeixinCheckInfData;
      
      private var weiduan$field:proto.WeiDuanRewardInfo;
      
      private var fourteenDayCloseStamp$field:uint;
      
      private var acdInfo$field:proto.ActivityDropStaticNotify;
      
      private var openchageinfo$field:proto.OpenChallengeInfo;
      
      private var valentineSpring$field:proto.ValentineSpringOpen;
      
      private var jueroadinfo$field:proto.JueRoadInfoData;
      
      private var xunleijinzuan$field:proto.XunleiJinzuanInfoNotify;
      
      private var lucktreeinfo$field:proto.LuckTreeInfoRes;
      
      private var mineSweepInfo$field:proto.MineSweepAllInfoRes;
      
      private var fashion$field:proto.FashionListRes;
      
      private var dragonBoatInfo$field:proto.DragonBoatAllInfoRes;
      
      private var canGetSignInExtra$field:proto.CanGetSignInExtraRes;
      
      private var buydoubleinfo$field:proto.BuyDoublePanelRes;
      
      public function GetPlayerOnlineDataRes()
      {
         super();
      }
      
      public function clearPlayerInfo() : void
      {
         playerInfo$field = null;
      }
      
      public function get hasPlayerInfo() : Boolean
      {
         return playerInfo$field != null;
      }
      
      public function set playerInfo(param1:proto.PlayerInfoNotify) : void
      {
         playerInfo$field = param1;
      }
      
      public function get playerInfo() : proto.PlayerInfoNotify
      {
         return playerInfo$field;
      }
      
      public function clearSceneNotify() : void
      {
         sceneNotify$field = null;
      }
      
      public function get hasSceneNotify() : Boolean
      {
         return sceneNotify$field != null;
      }
      
      public function set sceneNotify(param1:proto.EnterScenePlayerNotify) : void
      {
         sceneNotify$field = param1;
      }
      
      public function get sceneNotify() : proto.EnterScenePlayerNotify
      {
         return sceneNotify$field;
      }
      
      public function clearLinesate() : void
      {
         linesate$field = null;
      }
      
      public function get hasLinesate() : Boolean
      {
         return linesate$field != null;
      }
      
      public function set linesate(param1:proto.ShowLineStateRes) : void
      {
         linesate$field = param1;
      }
      
      public function get linesate() : proto.ShowLineStateRes
      {
         return linesate$field;
      }
      
      public function clearSetting() : void
      {
         setting$field = null;
      }
      
      public function get hasSetting() : Boolean
      {
         return setting$field != null;
      }
      
      public function set setting(param1:proto.SystemSettingsNotify) : void
      {
         setting$field = param1;
      }
      
      public function get setting() : proto.SystemSettingsNotify
      {
         return setting$field;
      }
      
      public function clearTime() : void
      {
         time$field = null;
      }
      
      public function get hasTime() : Boolean
      {
         return time$field != null;
      }
      
      public function set time(param1:proto.SystemTimeNotify) : void
      {
         time$field = param1;
      }
      
      public function get time() : proto.SystemTimeNotify
      {
         return time$field;
      }
      
      public function clearFunctionTime() : void
      {
         functionTime$field = null;
      }
      
      public function get hasFunctionTime() : Boolean
      {
         return functionTime$field != null;
      }
      
      public function set functionTime(param1:proto.FunctionTimesNotify) : void
      {
         functionTime$field = param1;
      }
      
      public function get functionTime() : proto.FunctionTimesNotify
      {
         return functionTime$field;
      }
      
      public function clearPlayerdata() : void
      {
         playerdata$field = null;
      }
      
      public function get hasPlayerdata() : Boolean
      {
         return playerdata$field != null;
      }
      
      public function set playerdata(param1:proto.PlayerDataNotify) : void
      {
         playerdata$field = param1;
      }
      
      public function get playerdata() : proto.PlayerDataNotify
      {
         return playerdata$field;
      }
      
      public function clearTaskInfo() : void
      {
         taskInfo$field = null;
      }
      
      public function get hasTaskInfo() : Boolean
      {
         return taskInfo$field != null;
      }
      
      public function set taskInfo(param1:proto.TaskGetCurInfoRes) : void
      {
         taskInfo$field = param1;
      }
      
      public function get taskInfo() : proto.TaskGetCurInfoRes
      {
         return taskInfo$field;
      }
      
      public function clearSaInfos() : void
      {
         saInfos$field = null;
      }
      
      public function get hasSaInfos() : Boolean
      {
         return saInfos$field != null;
      }
      
      public function set saInfos(param1:proto.GetSwapActionsRes) : void
      {
         saInfos$field = param1;
      }
      
      public function get saInfos() : proto.GetSwapActionsRes
      {
         return saInfos$field;
      }
      
      public function clearCOpenTm() : void
      {
         cOpenTm$field = null;
      }
      
      public function get hasCOpenTm() : Boolean
      {
         return cOpenTm$field != null;
      }
      
      public function set cOpenTm(param1:proto.CompeteOpenTimeRes) : void
      {
         cOpenTm$field = param1;
      }
      
      public function get cOpenTm() : proto.CompeteOpenTimeRes
      {
         return cOpenTm$field;
      }
      
      public function clearGtb() : void
      {
         gtb$field = null;
      }
      
      public function get hasGtb() : Boolean
      {
         return gtb$field != null;
      }
      
      public function set gtb(param1:proto.GetTimesBuyRes) : void
      {
         gtb$field = param1;
      }
      
      public function get gtb() : proto.GetTimesBuyRes
      {
         return gtb$field;
      }
      
      public function clearPtcpi() : void
      {
         ptcpi$field = null;
      }
      
      public function get hasPtcpi() : Boolean
      {
         return ptcpi$field != null;
      }
      
      public function set ptcpi(param1:proto.PTChatPlayerInfoRes) : void
      {
         ptcpi$field = param1;
      }
      
      public function get ptcpi() : proto.PTChatPlayerInfoRes
      {
         return ptcpi$field;
      }
      
      public function clearPvr() : void
      {
         pvr$field = null;
      }
      
      public function get hasPvr() : Boolean
      {
         return pvr$field != null;
      }
      
      public function set pvr(param1:proto.PanelViewRes) : void
      {
         pvr$field = param1;
      }
      
      public function get pvr() : proto.PanelViewRes
      {
         return pvr$field;
      }
      
      public function clearPgsh() : void
      {
         pgsh$field = null;
      }
      
      public function get hasPgsh() : Boolean
      {
         return pgsh$field != null;
      }
      
      public function set pgsh(param1:proto.PlayerGetSaddleHorsesRes) : void
      {
         pgsh$field = param1;
      }
      
      public function get pgsh() : proto.PlayerGetSaddleHorsesRes
      {
         return pgsh$field;
      }
      
      public function clearCbr() : void
      {
         cbr$field = null;
      }
      
      public function get hasCbr() : Boolean
      {
         return cbr$field != null;
      }
      
      public function set cbr(param1:proto.ClothesBagRes) : void
      {
         cbr$field = param1;
      }
      
      public function get cbr() : proto.ClothesBagRes
      {
         return cbr$field;
      }
      
      public function clearCsbr() : void
      {
         csbr$field = null;
      }
      
      public function get hasCsbr() : Boolean
      {
         return csbr$field != null;
      }
      
      public function set csbr(param1:proto.ClothesSkillBagRes) : void
      {
         csbr$field = param1;
      }
      
      public function get csbr() : proto.ClothesSkillBagRes
      {
         return csbr$field;
      }
      
      public function clearLir() : void
      {
         lir$field = null;
      }
      
      public function get hasLir() : Boolean
      {
         return lir$field != null;
      }
      
      public function set lir(param1:proto.LotteryInfoRes) : void
      {
         lir$field = param1;
      }
      
      public function get lir() : proto.LotteryInfoRes
      {
         return lir$field;
      }
      
      public function clearVgfcr() : void
      {
         vgfcr$field = null;
      }
      
      public function get hasVgfcr() : Boolean
      {
         return vgfcr$field != null;
      }
      
      public function set vgfcr(param1:proto.VipGetFirstChargeRes) : void
      {
         vgfcr$field = param1;
      }
      
      public function get vgfcr() : proto.VipGetFirstChargeRes
      {
         return vgfcr$field;
      }
      
      public function clearSInfos() : void
      {
         sInfos$field = null;
      }
      
      public function get hasSInfos() : Boolean
      {
         return sInfos$field != null;
      }
      
      public function set sInfos(param1:proto.GetStageInfosRes) : void
      {
         sInfos$field = param1;
      }
      
      public function get sInfos() : proto.GetStageInfosRes
      {
         return sInfos$field;
      }
      
      public function clearCsi() : void
      {
         csi$field = null;
      }
      
      public function get hasCsi() : Boolean
      {
         return csi$field != null;
      }
      
      public function set csi(param1:proto.CanSignInRes) : void
      {
         csi$field = param1;
      }
      
      public function get csi() : proto.CanSignInRes
      {
         return csi$field;
      }
      
      public function clearVmc() : void
      {
         vmc$field = null;
      }
      
      public function get hasVmc() : Boolean
      {
         return vmc$field != null;
      }
      
      public function set vmc(param1:proto.VipMonthCardRes) : void
      {
         vmc$field = param1;
      }
      
      public function get vmc() : proto.VipMonthCardRes
      {
         return vmc$field;
      }
      
      public function clearBabelHistopStar() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         babelHistopStar$field = new uint();
      }
      
      public function get hasBabelHistopStar() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set babelHistopStar(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         babelHistopStar$field = param1;
      }
      
      public function get babelHistopStar() : uint
      {
         return babelHistopStar$field;
      }
      
      public function clearSevenDayCloseStamp() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         sevenDayCloseStamp$field = new uint();
      }
      
      public function get hasSevenDayCloseStamp() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set sevenDayCloseStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         sevenDayCloseStamp$field = param1;
      }
      
      public function get sevenDayCloseStamp() : uint
      {
         return sevenDayCloseStamp$field;
      }
      
      public function clearServer() : void
      {
         server$field = null;
      }
      
      public function get hasServer() : Boolean
      {
         return server$field != null;
      }
      
      public function set server(param1:proto.ServerInfo) : void
      {
         server$field = param1;
      }
      
      public function get server() : proto.ServerInfo
      {
         return server$field;
      }
      
      public function clearSupersaleinfo() : void
      {
         supersaleinfo$field = null;
      }
      
      public function get hasSupersaleinfo() : Boolean
      {
         return supersaleinfo$field != null;
      }
      
      public function set supersaleinfo(param1:proto.SuperSaleInfoData) : void
      {
         supersaleinfo$field = param1;
      }
      
      public function get supersaleinfo() : proto.SuperSaleInfoData
      {
         return supersaleinfo$field;
      }
      
      public function clearOpenfundinfo() : void
      {
         openfundinfo$field = null;
      }
      
      public function get hasOpenfundinfo() : Boolean
      {
         return openfundinfo$field != null;
      }
      
      public function set openfundinfo(param1:proto.OpenFundInfoData) : void
      {
         openfundinfo$field = param1;
      }
      
      public function get openfundinfo() : proto.OpenFundInfoData
      {
         return openfundinfo$field;
      }
      
      public function clearPrivilevelinfo() : void
      {
         privilevelinfo$field = null;
      }
      
      public function get hasPrivilevelinfo() : Boolean
      {
         return privilevelinfo$field != null;
      }
      
      public function set privilevelinfo(param1:proto.PriviLevelInfoData) : void
      {
         privilevelinfo$field = param1;
      }
      
      public function get privilevelinfo() : proto.PriviLevelInfoData
      {
         return privilevelinfo$field;
      }
      
      public function clearGit360levelinfo() : void
      {
         git360levelinfo$field = null;
      }
      
      public function get hasGit360levelinfo() : Boolean
      {
         return git360levelinfo$field != null;
      }
      
      public function set git360levelinfo(param1:proto.Gift360LevelInfoData) : void
      {
         git360levelinfo$field = param1;
      }
      
      public function get git360levelinfo() : proto.Gift360LevelInfoData
      {
         return git360levelinfo$field;
      }
      
      public function clearSougouinfo() : void
      {
         sougouinfo$field = null;
      }
      
      public function get hasSougouinfo() : Boolean
      {
         return sougouinfo$field != null;
      }
      
      public function set sougouinfo(param1:proto.SougouRewardInfoData) : void
      {
         sougouinfo$field = param1;
      }
      
      public function get sougouinfo() : proto.SougouRewardInfoData
      {
         return sougouinfo$field;
      }
      
      public function clearDuowaninfo() : void
      {
         duowaninfo$field = null;
      }
      
      public function get hasDuowaninfo() : Boolean
      {
         return duowaninfo$field != null;
      }
      
      public function set duowaninfo(param1:proto.DuowanNewerCardInfoData) : void
      {
         duowaninfo$field = param1;
      }
      
      public function get duowaninfo() : proto.DuowanNewerCardInfoData
      {
         return duowaninfo$field;
      }
      
      public function clearVipGift() : void
      {
         vipGift$field = null;
      }
      
      public function get hasVipGift() : Boolean
      {
         return vipGift$field != null;
      }
      
      public function set vipGift(param1:proto.GetVipInfoRes) : void
      {
         vipGift$field = param1;
      }
      
      public function get vipGift() : proto.GetVipInfoRes
      {
         return vipGift$field;
      }
      
      public function clearFunctionAction() : void
      {
         functionAction$field = null;
      }
      
      public function get hasFunctionAction() : Boolean
      {
         return functionAction$field != null;
      }
      
      public function set functionAction(param1:proto.FunctionActionNotify) : void
      {
         functionAction$field = param1;
      }
      
      public function get functionAction() : proto.FunctionActionNotify
      {
         return functionAction$field;
      }
      
      public function clearCardInfo() : void
      {
         cardInfo$field = null;
      }
      
      public function get hasCardInfo() : Boolean
      {
         return cardInfo$field != null;
      }
      
      public function set cardInfo(param1:proto.CardInfoNotify) : void
      {
         cardInfo$field = param1;
      }
      
      public function get cardInfo() : proto.CardInfoNotify
      {
         return cardInfo$field;
      }
      
      public function clearMobilebindinfo() : void
      {
         mobilebindinfo$field = null;
      }
      
      public function get hasMobilebindinfo() : Boolean
      {
         return mobilebindinfo$field != null;
      }
      
      public function set mobilebindinfo(param1:proto.MobileBindInfData) : void
      {
         mobilebindinfo$field = param1;
      }
      
      public function get mobilebindinfo() : proto.MobileBindInfData
      {
         return mobilebindinfo$field;
      }
      
      public function clearWeixininfo() : void
      {
         weixininfo$field = null;
      }
      
      public function get hasWeixininfo() : Boolean
      {
         return weixininfo$field != null;
      }
      
      public function set weixininfo(param1:proto.WeixinCheckInfData) : void
      {
         weixininfo$field = param1;
      }
      
      public function get weixininfo() : proto.WeixinCheckInfData
      {
         return weixininfo$field;
      }
      
      public function clearWeiduan() : void
      {
         weiduan$field = null;
      }
      
      public function get hasWeiduan() : Boolean
      {
         return weiduan$field != null;
      }
      
      public function set weiduan(param1:proto.WeiDuanRewardInfo) : void
      {
         weiduan$field = param1;
      }
      
      public function get weiduan() : proto.WeiDuanRewardInfo
      {
         return weiduan$field;
      }
      
      public function clearFourteenDayCloseStamp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         fourteenDayCloseStamp$field = new uint();
      }
      
      public function get hasFourteenDayCloseStamp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set fourteenDayCloseStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         fourteenDayCloseStamp$field = param1;
      }
      
      public function get fourteenDayCloseStamp() : uint
      {
         return fourteenDayCloseStamp$field;
      }
      
      public function clearAcdInfo() : void
      {
         acdInfo$field = null;
      }
      
      public function get hasAcdInfo() : Boolean
      {
         return acdInfo$field != null;
      }
      
      public function set acdInfo(param1:proto.ActivityDropStaticNotify) : void
      {
         acdInfo$field = param1;
      }
      
      public function get acdInfo() : proto.ActivityDropStaticNotify
      {
         return acdInfo$field;
      }
      
      public function clearOpenchageinfo() : void
      {
         openchageinfo$field = null;
      }
      
      public function get hasOpenchageinfo() : Boolean
      {
         return openchageinfo$field != null;
      }
      
      public function set openchageinfo(param1:proto.OpenChallengeInfo) : void
      {
         openchageinfo$field = param1;
      }
      
      public function get openchageinfo() : proto.OpenChallengeInfo
      {
         return openchageinfo$field;
      }
      
      public function clearValentineSpring() : void
      {
         valentineSpring$field = null;
      }
      
      public function get hasValentineSpring() : Boolean
      {
         return valentineSpring$field != null;
      }
      
      public function set valentineSpring(param1:proto.ValentineSpringOpen) : void
      {
         valentineSpring$field = param1;
      }
      
      public function get valentineSpring() : proto.ValentineSpringOpen
      {
         return valentineSpring$field;
      }
      
      public function clearJueroadinfo() : void
      {
         jueroadinfo$field = null;
      }
      
      public function get hasJueroadinfo() : Boolean
      {
         return jueroadinfo$field != null;
      }
      
      public function set jueroadinfo(param1:proto.JueRoadInfoData) : void
      {
         jueroadinfo$field = param1;
      }
      
      public function get jueroadinfo() : proto.JueRoadInfoData
      {
         return jueroadinfo$field;
      }
      
      public function clearXunleijinzuan() : void
      {
         xunleijinzuan$field = null;
      }
      
      public function get hasXunleijinzuan() : Boolean
      {
         return xunleijinzuan$field != null;
      }
      
      public function set xunleijinzuan(param1:proto.XunleiJinzuanInfoNotify) : void
      {
         xunleijinzuan$field = param1;
      }
      
      public function get xunleijinzuan() : proto.XunleiJinzuanInfoNotify
      {
         return xunleijinzuan$field;
      }
      
      public function clearLucktreeinfo() : void
      {
         lucktreeinfo$field = null;
      }
      
      public function get hasLucktreeinfo() : Boolean
      {
         return lucktreeinfo$field != null;
      }
      
      public function set lucktreeinfo(param1:proto.LuckTreeInfoRes) : void
      {
         lucktreeinfo$field = param1;
      }
      
      public function get lucktreeinfo() : proto.LuckTreeInfoRes
      {
         return lucktreeinfo$field;
      }
      
      public function clearMineSweepInfo() : void
      {
         mineSweepInfo$field = null;
      }
      
      public function get hasMineSweepInfo() : Boolean
      {
         return mineSweepInfo$field != null;
      }
      
      public function set mineSweepInfo(param1:proto.MineSweepAllInfoRes) : void
      {
         mineSweepInfo$field = param1;
      }
      
      public function get mineSweepInfo() : proto.MineSweepAllInfoRes
      {
         return mineSweepInfo$field;
      }
      
      public function clearFashion() : void
      {
         fashion$field = null;
      }
      
      public function get hasFashion() : Boolean
      {
         return fashion$field != null;
      }
      
      public function set fashion(param1:proto.FashionListRes) : void
      {
         fashion$field = param1;
      }
      
      public function get fashion() : proto.FashionListRes
      {
         return fashion$field;
      }
      
      public function clearDragonBoatInfo() : void
      {
         dragonBoatInfo$field = null;
      }
      
      public function get hasDragonBoatInfo() : Boolean
      {
         return dragonBoatInfo$field != null;
      }
      
      public function set dragonBoatInfo(param1:proto.DragonBoatAllInfoRes) : void
      {
         dragonBoatInfo$field = param1;
      }
      
      public function get dragonBoatInfo() : proto.DragonBoatAllInfoRes
      {
         return dragonBoatInfo$field;
      }
      
      public function clearCanGetSignInExtra() : void
      {
         canGetSignInExtra$field = null;
      }
      
      public function get hasCanGetSignInExtra() : Boolean
      {
         return canGetSignInExtra$field != null;
      }
      
      public function set canGetSignInExtra(param1:proto.CanGetSignInExtraRes) : void
      {
         canGetSignInExtra$field = param1;
      }
      
      public function get canGetSignInExtra() : proto.CanGetSignInExtraRes
      {
         return canGetSignInExtra$field;
      }
      
      public function clearBuydoubleinfo() : void
      {
         buydoubleinfo$field = null;
      }
      
      public function get hasBuydoubleinfo() : Boolean
      {
         return buydoubleinfo$field != null;
      }
      
      public function set buydoubleinfo(param1:proto.BuyDoublePanelRes) : void
      {
         buydoubleinfo$field = param1;
      }
      
      public function get buydoubleinfo() : proto.BuyDoublePanelRes
      {
         return buydoubleinfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPlayerInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,playerInfo$field);
         }
         if(hasSceneNotify)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,sceneNotify$field);
         }
         if(hasLinesate)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,linesate$field);
         }
         if(hasSetting)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,setting$field);
         }
         if(hasTime)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,time$field);
         }
         if(hasFunctionTime)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,functionTime$field);
         }
         if(hasPlayerdata)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,playerdata$field);
         }
         if(hasTaskInfo)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_MESSAGE(param1,taskInfo$field);
         }
         if(hasSaInfos)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,saInfos$field);
         }
         if(hasCOpenTm)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_MESSAGE(param1,cOpenTm$field);
         }
         if(hasGtb)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_MESSAGE(param1,gtb$field);
         }
         if(hasPtcpi)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_MESSAGE(param1,ptcpi$field);
         }
         if(hasPvr)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_MESSAGE(param1,pvr$field);
         }
         if(hasPgsh)
         {
            WriteUtils.writeTag(param1,2,15);
            WriteUtils.write$TYPE_MESSAGE(param1,pgsh$field);
         }
         if(hasCbr)
         {
            WriteUtils.writeTag(param1,2,16);
            WriteUtils.write$TYPE_MESSAGE(param1,cbr$field);
         }
         if(hasCsbr)
         {
            WriteUtils.writeTag(param1,2,17);
            WriteUtils.write$TYPE_MESSAGE(param1,csbr$field);
         }
         if(hasLir)
         {
            WriteUtils.writeTag(param1,2,18);
            WriteUtils.write$TYPE_MESSAGE(param1,lir$field);
         }
         if(hasVgfcr)
         {
            WriteUtils.writeTag(param1,2,19);
            WriteUtils.write$TYPE_MESSAGE(param1,vgfcr$field);
         }
         if(hasSInfos)
         {
            WriteUtils.writeTag(param1,2,20);
            WriteUtils.write$TYPE_MESSAGE(param1,sInfos$field);
         }
         if(hasCsi)
         {
            WriteUtils.writeTag(param1,2,21);
            WriteUtils.write$TYPE_MESSAGE(param1,csi$field);
         }
         if(hasVmc)
         {
            WriteUtils.writeTag(param1,2,22);
            WriteUtils.write$TYPE_MESSAGE(param1,vmc$field);
         }
         if(hasBabelHistopStar)
         {
            WriteUtils.writeTag(param1,0,23);
            WriteUtils.write$TYPE_UINT32(param1,babelHistopStar$field);
         }
         if(hasSevenDayCloseStamp)
         {
            WriteUtils.writeTag(param1,0,24);
            WriteUtils.write$TYPE_UINT32(param1,sevenDayCloseStamp$field);
         }
         if(hasServer)
         {
            WriteUtils.writeTag(param1,2,25);
            WriteUtils.write$TYPE_MESSAGE(param1,server$field);
         }
         if(hasSupersaleinfo)
         {
            WriteUtils.writeTag(param1,2,26);
            WriteUtils.write$TYPE_MESSAGE(param1,supersaleinfo$field);
         }
         if(hasOpenfundinfo)
         {
            WriteUtils.writeTag(param1,2,27);
            WriteUtils.write$TYPE_MESSAGE(param1,openfundinfo$field);
         }
         if(hasPrivilevelinfo)
         {
            WriteUtils.writeTag(param1,2,28);
            WriteUtils.write$TYPE_MESSAGE(param1,privilevelinfo$field);
         }
         if(hasGit360levelinfo)
         {
            WriteUtils.writeTag(param1,2,29);
            WriteUtils.write$TYPE_MESSAGE(param1,git360levelinfo$field);
         }
         if(hasSougouinfo)
         {
            WriteUtils.writeTag(param1,2,30);
            WriteUtils.write$TYPE_MESSAGE(param1,sougouinfo$field);
         }
         if(hasDuowaninfo)
         {
            WriteUtils.writeTag(param1,2,31);
            WriteUtils.write$TYPE_MESSAGE(param1,duowaninfo$field);
         }
         if(hasVipGift)
         {
            WriteUtils.writeTag(param1,2,32);
            WriteUtils.write$TYPE_MESSAGE(param1,vipGift$field);
         }
         if(hasFunctionAction)
         {
            WriteUtils.writeTag(param1,2,33);
            WriteUtils.write$TYPE_MESSAGE(param1,functionAction$field);
         }
         if(hasCardInfo)
         {
            WriteUtils.writeTag(param1,2,34);
            WriteUtils.write$TYPE_MESSAGE(param1,cardInfo$field);
         }
         if(hasMobilebindinfo)
         {
            WriteUtils.writeTag(param1,2,35);
            WriteUtils.write$TYPE_MESSAGE(param1,mobilebindinfo$field);
         }
         if(hasWeixininfo)
         {
            WriteUtils.writeTag(param1,2,36);
            WriteUtils.write$TYPE_MESSAGE(param1,weixininfo$field);
         }
         if(hasWeiduan)
         {
            WriteUtils.writeTag(param1,2,37);
            WriteUtils.write$TYPE_MESSAGE(param1,weiduan$field);
         }
         if(hasFourteenDayCloseStamp)
         {
            WriteUtils.writeTag(param1,0,38);
            WriteUtils.write$TYPE_UINT32(param1,fourteenDayCloseStamp$field);
         }
         if(hasAcdInfo)
         {
            WriteUtils.writeTag(param1,2,39);
            WriteUtils.write$TYPE_MESSAGE(param1,acdInfo$field);
         }
         if(hasOpenchageinfo)
         {
            WriteUtils.writeTag(param1,2,40);
            WriteUtils.write$TYPE_MESSAGE(param1,openchageinfo$field);
         }
         if(hasValentineSpring)
         {
            WriteUtils.writeTag(param1,2,41);
            WriteUtils.write$TYPE_MESSAGE(param1,valentineSpring$field);
         }
         if(hasJueroadinfo)
         {
            WriteUtils.writeTag(param1,2,42);
            WriteUtils.write$TYPE_MESSAGE(param1,jueroadinfo$field);
         }
         if(hasXunleijinzuan)
         {
            WriteUtils.writeTag(param1,2,43);
            WriteUtils.write$TYPE_MESSAGE(param1,xunleijinzuan$field);
         }
         if(hasLucktreeinfo)
         {
            WriteUtils.writeTag(param1,2,44);
            WriteUtils.write$TYPE_MESSAGE(param1,lucktreeinfo$field);
         }
         if(hasMineSweepInfo)
         {
            WriteUtils.writeTag(param1,2,45);
            WriteUtils.write$TYPE_MESSAGE(param1,mineSweepInfo$field);
         }
         if(hasFashion)
         {
            WriteUtils.writeTag(param1,2,46);
            WriteUtils.write$TYPE_MESSAGE(param1,fashion$field);
         }
         if(hasDragonBoatInfo)
         {
            WriteUtils.writeTag(param1,2,47);
            WriteUtils.write$TYPE_MESSAGE(param1,dragonBoatInfo$field);
         }
         if(hasCanGetSignInExtra)
         {
            WriteUtils.writeTag(param1,2,1000);
            WriteUtils.write$TYPE_MESSAGE(param1,canGetSignInExtra$field);
         }
         if(hasBuydoubleinfo)
         {
            WriteUtils.writeTag(param1,2,1001);
            WriteUtils.write$TYPE_MESSAGE(param1,buydoubleinfo$field);
         }
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc51_:uint = 0;
         var _loc45_:uint = 0;
         var _loc47_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc39_:uint = 0;
         var _loc34_:uint = 0;
         var _loc27_:uint = 0;
         var _loc42_:uint = 0;
         var _loc9_:uint = 0;
         var _loc36_:uint = 0;
         var _loc33_:uint = 0;
         var _loc29_:uint = 0;
         var _loc24_:uint = 0;
         var _loc41_:uint = 0;
         var _loc43_:uint = 0;
         var _loc10_:uint = 0;
         var _loc16_:uint = 0;
         var _loc35_:uint = 0;
         var _loc8_:uint = 0;
         var _loc40_:uint = 0;
         var _loc38_:uint = 0;
         var _loc7_:uint = 0;
         var _loc26_:uint = 0;
         var _loc22_:uint = 0;
         var _loc17_:uint = 0;
         var _loc4_:uint = 0;
         var _loc12_:uint = 0;
         var _loc5_:uint = 0;
         var _loc28_:uint = 0;
         var _loc25_:uint = 0;
         var _loc50_:uint = 0;
         var _loc37_:uint = 0;
         var _loc15_:uint = 0;
         var _loc46_:uint = 0;
         var _loc23_:uint = 0;
         var _loc21_:uint = 0;
         var _loc30_:uint = 0;
         var _loc11_:uint = 0;
         var _loc44_:uint = 0;
         var _loc48_:uint = 0;
         var _loc32_:uint = 0;
         var _loc20_:uint = 0;
         var _loc18_:uint = 0;
         var _loc31_:uint = 0;
         var _loc6_:uint = 0;
         var _loc19_:uint = 0;
         var _loc49_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc52_:* = _loc3_ >> 3;
            if(1 !== _loc52_)
            {
               if(2 !== _loc52_)
               {
                  if(3 !== _loc52_)
                  {
                     if(4 !== _loc52_)
                     {
                        if(5 !== _loc52_)
                        {
                           if(6 !== _loc52_)
                           {
                              if(7 !== _loc52_)
                              {
                                 if(9 !== _loc52_)
                                 {
                                    if(10 !== _loc52_)
                                    {
                                       if(11 !== _loc52_)
                                       {
                                          if(12 !== _loc52_)
                                          {
                                             if(13 !== _loc52_)
                                             {
                                                if(14 !== _loc52_)
                                                {
                                                   if(15 !== _loc52_)
                                                   {
                                                      if(16 !== _loc52_)
                                                      {
                                                         if(17 !== _loc52_)
                                                         {
                                                            if(18 !== _loc52_)
                                                            {
                                                               if(19 !== _loc52_)
                                                               {
                                                                  if(20 !== _loc52_)
                                                                  {
                                                                     if(21 !== _loc52_)
                                                                     {
                                                                        if(22 !== _loc52_)
                                                                        {
                                                                           if(23 !== _loc52_)
                                                                           {
                                                                              if(24 !== _loc52_)
                                                                              {
                                                                                 if(25 !== _loc52_)
                                                                                 {
                                                                                    if(26 !== _loc52_)
                                                                                    {
                                                                                       if(27 !== _loc52_)
                                                                                       {
                                                                                          if(28 !== _loc52_)
                                                                                          {
                                                                                             if(29 !== _loc52_)
                                                                                             {
                                                                                                if(30 !== _loc52_)
                                                                                                {
                                                                                                   if(31 !== _loc52_)
                                                                                                   {
                                                                                                      if(32 !== _loc52_)
                                                                                                      {
                                                                                                         if(33 !== _loc52_)
                                                                                                         {
                                                                                                            if(34 !== _loc52_)
                                                                                                            {
                                                                                                               if(35 !== _loc52_)
                                                                                                               {
                                                                                                                  if(36 !== _loc52_)
                                                                                                                  {
                                                                                                                     if(37 !== _loc52_)
                                                                                                                     {
                                                                                                                        if(38 !== _loc52_)
                                                                                                                        {
                                                                                                                           if(39 !== _loc52_)
                                                                                                                           {
                                                                                                                              if(40 !== _loc52_)
                                                                                                                              {
                                                                                                                                 if(41 !== _loc52_)
                                                                                                                                 {
                                                                                                                                    if(42 !== _loc52_)
                                                                                                                                    {
                                                                                                                                       if(43 !== _loc52_)
                                                                                                                                       {
                                                                                                                                          if(44 !== _loc52_)
                                                                                                                                          {
                                                                                                                                             if(45 !== _loc52_)
                                                                                                                                             {
                                                                                                                                                if(46 !== _loc52_)
                                                                                                                                                {
                                                                                                                                                   if(47 !== _loc52_)
                                                                                                                                                   {
                                                                                                                                                      if(1000 !== _loc52_)
                                                                                                                                                      {
                                                                                                                                                         if(1001 !== _loc52_)
                                                                                                                                                         {
                                                                                                                                                            super.readUnknown(param1,_loc3_);
                                                                                                                                                         }
                                                                                                                                                         else
                                                                                                                                                         {
                                                                                                                                                            if(_loc49_ != 0)
                                                                                                                                                            {
                                                                                                                                                               throw new IOError("Bad data format: GetPlayerOnlineDataRes.buydoubleinfo cannot be set twice.");
                                                                                                                                                            }
                                                                                                                                                            _loc49_++;
                                                                                                                                                            this.buydoubleinfo = new proto.BuyDoublePanelRes();
                                                                                                                                                            ReadUtils.read$TYPE_MESSAGE(param1,this.buydoubleinfo);
                                                                                                                                                         }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                         if(_loc19_ != 0)
                                                                                                                                                         {
                                                                                                                                                            throw new IOError("Bad data format: GetPlayerOnlineDataRes.canGetSignInExtra cannot be set twice.");
                                                                                                                                                         }
                                                                                                                                                         _loc19_++;
                                                                                                                                                         this.canGetSignInExtra = new proto.CanGetSignInExtraRes();
                                                                                                                                                         ReadUtils.read$TYPE_MESSAGE(param1,this.canGetSignInExtra);
                                                                                                                                                      }
                                                                                                                                                   }
                                                                                                                                                   else
                                                                                                                                                   {
                                                                                                                                                      if(_loc6_ != 0)
                                                                                                                                                      {
                                                                                                                                                         throw new IOError("Bad data format: GetPlayerOnlineDataRes.dragonBoatInfo cannot be set twice.");
                                                                                                                                                      }
                                                                                                                                                      _loc6_++;
                                                                                                                                                      this.dragonBoatInfo = new proto.DragonBoatAllInfoRes();
                                                                                                                                                      ReadUtils.read$TYPE_MESSAGE(param1,this.dragonBoatInfo);
                                                                                                                                                   }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                   if(_loc31_ != 0)
                                                                                                                                                   {
                                                                                                                                                      throw new IOError("Bad data format: GetPlayerOnlineDataRes.fashion cannot be set twice.");
                                                                                                                                                   }
                                                                                                                                                   _loc31_++;
                                                                                                                                                   this.fashion = new proto.FashionListRes();
                                                                                                                                                   ReadUtils.read$TYPE_MESSAGE(param1,this.fashion);
                                                                                                                                                }
                                                                                                                                             }
                                                                                                                                             else
                                                                                                                                             {
                                                                                                                                                if(_loc18_ != 0)
                                                                                                                                                {
                                                                                                                                                   throw new IOError("Bad data format: GetPlayerOnlineDataRes.mineSweepInfo cannot be set twice.");
                                                                                                                                                }
                                                                                                                                                _loc18_++;
                                                                                                                                                this.mineSweepInfo = new proto.MineSweepAllInfoRes();
                                                                                                                                                ReadUtils.read$TYPE_MESSAGE(param1,this.mineSweepInfo);
                                                                                                                                             }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                             if(_loc20_ != 0)
                                                                                                                                             {
                                                                                                                                                throw new IOError("Bad data format: GetPlayerOnlineDataRes.lucktreeinfo cannot be set twice.");
                                                                                                                                             }
                                                                                                                                             _loc20_++;
                                                                                                                                             this.lucktreeinfo = new proto.LuckTreeInfoRes();
                                                                                                                                             ReadUtils.read$TYPE_MESSAGE(param1,this.lucktreeinfo);
                                                                                                                                          }
                                                                                                                                       }
                                                                                                                                       else
                                                                                                                                       {
                                                                                                                                          if(_loc32_ != 0)
                                                                                                                                          {
                                                                                                                                             throw new IOError("Bad data format: GetPlayerOnlineDataRes.xunleijinzuan cannot be set twice.");
                                                                                                                                          }
                                                                                                                                          _loc32_++;
                                                                                                                                          this.xunleijinzuan = new proto.XunleiJinzuanInfoNotify();
                                                                                                                                          ReadUtils.read$TYPE_MESSAGE(param1,this.xunleijinzuan);
                                                                                                                                       }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                       if(_loc48_ != 0)
                                                                                                                                       {
                                                                                                                                          throw new IOError("Bad data format: GetPlayerOnlineDataRes.jueroadinfo cannot be set twice.");
                                                                                                                                       }
                                                                                                                                       _loc48_++;
                                                                                                                                       this.jueroadinfo = new proto.JueRoadInfoData();
                                                                                                                                       ReadUtils.read$TYPE_MESSAGE(param1,this.jueroadinfo);
                                                                                                                                    }
                                                                                                                                 }
                                                                                                                                 else
                                                                                                                                 {
                                                                                                                                    if(_loc44_ != 0)
                                                                                                                                    {
                                                                                                                                       throw new IOError("Bad data format: GetPlayerOnlineDataRes.valentineSpring cannot be set twice.");
                                                                                                                                    }
                                                                                                                                    _loc44_++;
                                                                                                                                    this.valentineSpring = new proto.ValentineSpringOpen();
                                                                                                                                    ReadUtils.read$TYPE_MESSAGE(param1,this.valentineSpring);
                                                                                                                                 }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                 if(_loc11_ != 0)
                                                                                                                                 {
                                                                                                                                    throw new IOError("Bad data format: GetPlayerOnlineDataRes.openchageinfo cannot be set twice.");
                                                                                                                                 }
                                                                                                                                 _loc11_++;
                                                                                                                                 this.openchageinfo = new proto.OpenChallengeInfo();
                                                                                                                                 ReadUtils.read$TYPE_MESSAGE(param1,this.openchageinfo);
                                                                                                                              }
                                                                                                                           }
                                                                                                                           else
                                                                                                                           {
                                                                                                                              if(_loc30_ != 0)
                                                                                                                              {
                                                                                                                                 throw new IOError("Bad data format: GetPlayerOnlineDataRes.acdInfo cannot be set twice.");
                                                                                                                              }
                                                                                                                              _loc30_++;
                                                                                                                              this.acdInfo = new proto.ActivityDropStaticNotify();
                                                                                                                              ReadUtils.read$TYPE_MESSAGE(param1,this.acdInfo);
                                                                                                                           }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                           if(_loc21_ != 0)
                                                                                                                           {
                                                                                                                              throw new IOError("Bad data format: GetPlayerOnlineDataRes.fourteenDayCloseStamp cannot be set twice.");
                                                                                                                           }
                                                                                                                           _loc21_++;
                                                                                                                           this.fourteenDayCloseStamp = ReadUtils.read$TYPE_UINT32(param1);
                                                                                                                        }
                                                                                                                     }
                                                                                                                     else
                                                                                                                     {
                                                                                                                        if(_loc23_ != 0)
                                                                                                                        {
                                                                                                                           throw new IOError("Bad data format: GetPlayerOnlineDataRes.weiduan cannot be set twice.");
                                                                                                                        }
                                                                                                                        _loc23_++;
                                                                                                                        this.weiduan = new proto.WeiDuanRewardInfo();
                                                                                                                        ReadUtils.read$TYPE_MESSAGE(param1,this.weiduan);
                                                                                                                     }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                     if(_loc46_ != 0)
                                                                                                                     {
                                                                                                                        throw new IOError("Bad data format: GetPlayerOnlineDataRes.weixininfo cannot be set twice.");
                                                                                                                     }
                                                                                                                     _loc46_++;
                                                                                                                     this.weixininfo = new proto.WeixinCheckInfData();
                                                                                                                     ReadUtils.read$TYPE_MESSAGE(param1,this.weixininfo);
                                                                                                                  }
                                                                                                               }
                                                                                                               else
                                                                                                               {
                                                                                                                  if(_loc15_ != 0)
                                                                                                                  {
                                                                                                                     throw new IOError("Bad data format: GetPlayerOnlineDataRes.mobilebindinfo cannot be set twice.");
                                                                                                                  }
                                                                                                                  _loc15_++;
                                                                                                                  this.mobilebindinfo = new proto.MobileBindInfData();
                                                                                                                  ReadUtils.read$TYPE_MESSAGE(param1,this.mobilebindinfo);
                                                                                                               }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                               if(_loc37_ != 0)
                                                                                                               {
                                                                                                                  throw new IOError("Bad data format: GetPlayerOnlineDataRes.cardInfo cannot be set twice.");
                                                                                                               }
                                                                                                               _loc37_++;
                                                                                                               this.cardInfo = new proto.CardInfoNotify();
                                                                                                               ReadUtils.read$TYPE_MESSAGE(param1,this.cardInfo);
                                                                                                            }
                                                                                                         }
                                                                                                         else
                                                                                                         {
                                                                                                            if(_loc50_ != 0)
                                                                                                            {
                                                                                                               throw new IOError("Bad data format: GetPlayerOnlineDataRes.functionAction cannot be set twice.");
                                                                                                            }
                                                                                                            _loc50_++;
                                                                                                            this.functionAction = new proto.FunctionActionNotify();
                                                                                                            ReadUtils.read$TYPE_MESSAGE(param1,this.functionAction);
                                                                                                         }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                         if(_loc25_ != 0)
                                                                                                         {
                                                                                                            throw new IOError("Bad data format: GetPlayerOnlineDataRes.vipGift cannot be set twice.");
                                                                                                         }
                                                                                                         _loc25_++;
                                                                                                         this.vipGift = new proto.GetVipInfoRes();
                                                                                                         ReadUtils.read$TYPE_MESSAGE(param1,this.vipGift);
                                                                                                      }
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      if(_loc28_ != 0)
                                                                                                      {
                                                                                                         throw new IOError("Bad data format: GetPlayerOnlineDataRes.duowaninfo cannot be set twice.");
                                                                                                      }
                                                                                                      _loc28_++;
                                                                                                      this.duowaninfo = new proto.DuowanNewerCardInfoData();
                                                                                                      ReadUtils.read$TYPE_MESSAGE(param1,this.duowaninfo);
                                                                                                   }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                   if(_loc5_ != 0)
                                                                                                   {
                                                                                                      throw new IOError("Bad data format: GetPlayerOnlineDataRes.sougouinfo cannot be set twice.");
                                                                                                   }
                                                                                                   _loc5_++;
                                                                                                   this.sougouinfo = new proto.SougouRewardInfoData();
                                                                                                   ReadUtils.read$TYPE_MESSAGE(param1,this.sougouinfo);
                                                                                                }
                                                                                             }
                                                                                             else
                                                                                             {
                                                                                                if(_loc12_ != 0)
                                                                                                {
                                                                                                   throw new IOError("Bad data format: GetPlayerOnlineDataRes.git360levelinfo cannot be set twice.");
                                                                                                }
                                                                                                _loc12_++;
                                                                                                this.git360levelinfo = new proto.Gift360LevelInfoData();
                                                                                                ReadUtils.read$TYPE_MESSAGE(param1,this.git360levelinfo);
                                                                                             }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             if(_loc4_ != 0)
                                                                                             {
                                                                                                throw new IOError("Bad data format: GetPlayerOnlineDataRes.privilevelinfo cannot be set twice.");
                                                                                             }
                                                                                             _loc4_++;
                                                                                             this.privilevelinfo = new proto.PriviLevelInfoData();
                                                                                             ReadUtils.read$TYPE_MESSAGE(param1,this.privilevelinfo);
                                                                                          }
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          if(_loc17_ != 0)
                                                                                          {
                                                                                             throw new IOError("Bad data format: GetPlayerOnlineDataRes.openfundinfo cannot be set twice.");
                                                                                          }
                                                                                          _loc17_++;
                                                                                          this.openfundinfo = new proto.OpenFundInfoData();
                                                                                          ReadUtils.read$TYPE_MESSAGE(param1,this.openfundinfo);
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       if(_loc22_ != 0)
                                                                                       {
                                                                                          throw new IOError("Bad data format: GetPlayerOnlineDataRes.supersaleinfo cannot be set twice.");
                                                                                       }
                                                                                       _loc22_++;
                                                                                       this.supersaleinfo = new proto.SuperSaleInfoData();
                                                                                       ReadUtils.read$TYPE_MESSAGE(param1,this.supersaleinfo);
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    if(_loc26_ != 0)
                                                                                    {
                                                                                       throw new IOError("Bad data format: GetPlayerOnlineDataRes.server cannot be set twice.");
                                                                                    }
                                                                                    _loc26_++;
                                                                                    this.server = new proto.ServerInfo();
                                                                                    ReadUtils.read$TYPE_MESSAGE(param1,this.server);
                                                                                 }
                                                                              }
                                                                              else
                                                                              {
                                                                                 if(_loc7_ != 0)
                                                                                 {
                                                                                    throw new IOError("Bad data format: GetPlayerOnlineDataRes.sevenDayCloseStamp cannot be set twice.");
                                                                                 }
                                                                                 _loc7_++;
                                                                                 this.sevenDayCloseStamp = ReadUtils.read$TYPE_UINT32(param1);
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              if(_loc38_ != 0)
                                                                              {
                                                                                 throw new IOError("Bad data format: GetPlayerOnlineDataRes.babelHistopStar cannot be set twice.");
                                                                              }
                                                                              _loc38_++;
                                                                              this.babelHistopStar = ReadUtils.read$TYPE_UINT32(param1);
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           if(_loc40_ != 0)
                                                                           {
                                                                              throw new IOError("Bad data format: GetPlayerOnlineDataRes.vmc cannot be set twice.");
                                                                           }
                                                                           _loc40_++;
                                                                           this.vmc = new proto.VipMonthCardRes();
                                                                           ReadUtils.read$TYPE_MESSAGE(param1,this.vmc);
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        if(_loc8_ != 0)
                                                                        {
                                                                           throw new IOError("Bad data format: GetPlayerOnlineDataRes.csi cannot be set twice.");
                                                                        }
                                                                        _loc8_++;
                                                                        this.csi = new proto.CanSignInRes();
                                                                        ReadUtils.read$TYPE_MESSAGE(param1,this.csi);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     if(_loc35_ != 0)
                                                                     {
                                                                        throw new IOError("Bad data format: GetPlayerOnlineDataRes.sInfos cannot be set twice.");
                                                                     }
                                                                     _loc35_++;
                                                                     this.sInfos = new proto.GetStageInfosRes();
                                                                     ReadUtils.read$TYPE_MESSAGE(param1,this.sInfos);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  if(_loc16_ != 0)
                                                                  {
                                                                     throw new IOError("Bad data format: GetPlayerOnlineDataRes.vgfcr cannot be set twice.");
                                                                  }
                                                                  _loc16_++;
                                                                  this.vgfcr = new proto.VipGetFirstChargeRes();
                                                                  ReadUtils.read$TYPE_MESSAGE(param1,this.vgfcr);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               if(_loc10_ != 0)
                                                               {
                                                                  throw new IOError("Bad data format: GetPlayerOnlineDataRes.lir cannot be set twice.");
                                                               }
                                                               _loc10_++;
                                                               this.lir = new proto.LotteryInfoRes();
                                                               ReadUtils.read$TYPE_MESSAGE(param1,this.lir);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            if(_loc43_ != 0)
                                                            {
                                                               throw new IOError("Bad data format: GetPlayerOnlineDataRes.csbr cannot be set twice.");
                                                            }
                                                            _loc43_++;
                                                            this.csbr = new proto.ClothesSkillBagRes();
                                                            ReadUtils.read$TYPE_MESSAGE(param1,this.csbr);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc41_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: GetPlayerOnlineDataRes.cbr cannot be set twice.");
                                                         }
                                                         _loc41_++;
                                                         this.cbr = new proto.ClothesBagRes();
                                                         ReadUtils.read$TYPE_MESSAGE(param1,this.cbr);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc24_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: GetPlayerOnlineDataRes.pgsh cannot be set twice.");
                                                      }
                                                      _loc24_++;
                                                      this.pgsh = new proto.PlayerGetSaddleHorsesRes();
                                                      ReadUtils.read$TYPE_MESSAGE(param1,this.pgsh);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc29_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: GetPlayerOnlineDataRes.pvr cannot be set twice.");
                                                   }
                                                   _loc29_++;
                                                   this.pvr = new proto.PanelViewRes();
                                                   ReadUtils.read$TYPE_MESSAGE(param1,this.pvr);
                                                }
                                             }
                                             else
                                             {
                                                if(_loc33_ != 0)
                                                {
                                                   throw new IOError("Bad data format: GetPlayerOnlineDataRes.ptcpi cannot be set twice.");
                                                }
                                                _loc33_++;
                                                this.ptcpi = new proto.PTChatPlayerInfoRes();
                                                ReadUtils.read$TYPE_MESSAGE(param1,this.ptcpi);
                                             }
                                          }
                                          else
                                          {
                                             if(_loc36_ != 0)
                                             {
                                                throw new IOError("Bad data format: GetPlayerOnlineDataRes.gtb cannot be set twice.");
                                             }
                                             _loc36_++;
                                             this.gtb = new proto.GetTimesBuyRes();
                                             ReadUtils.read$TYPE_MESSAGE(param1,this.gtb);
                                          }
                                       }
                                       else
                                       {
                                          if(_loc9_ != 0)
                                          {
                                             throw new IOError("Bad data format: GetPlayerOnlineDataRes.cOpenTm cannot be set twice.");
                                          }
                                          _loc9_++;
                                          this.cOpenTm = new proto.CompeteOpenTimeRes();
                                          ReadUtils.read$TYPE_MESSAGE(param1,this.cOpenTm);
                                       }
                                    }
                                    else
                                    {
                                       if(_loc42_ != 0)
                                       {
                                          throw new IOError("Bad data format: GetPlayerOnlineDataRes.saInfos cannot be set twice.");
                                       }
                                       _loc42_++;
                                       this.saInfos = new proto.GetSwapActionsRes();
                                       ReadUtils.read$TYPE_MESSAGE(param1,this.saInfos);
                                    }
                                 }
                                 else
                                 {
                                    if(_loc27_ != 0)
                                    {
                                       throw new IOError("Bad data format: GetPlayerOnlineDataRes.taskInfo cannot be set twice.");
                                    }
                                    _loc27_++;
                                    this.taskInfo = new proto.TaskGetCurInfoRes();
                                    ReadUtils.read$TYPE_MESSAGE(param1,this.taskInfo);
                                 }
                              }
                              else
                              {
                                 if(_loc34_ != 0)
                                 {
                                    throw new IOError("Bad data format: GetPlayerOnlineDataRes.playerdata cannot be set twice.");
                                 }
                                 _loc34_++;
                                 this.playerdata = new proto.PlayerDataNotify();
                                 ReadUtils.read$TYPE_MESSAGE(param1,this.playerdata);
                              }
                           }
                           else
                           {
                              if(_loc39_ != 0)
                              {
                                 throw new IOError("Bad data format: GetPlayerOnlineDataRes.functionTime cannot be set twice.");
                              }
                              _loc39_++;
                              this.functionTime = new proto.FunctionTimesNotify();
                              ReadUtils.read$TYPE_MESSAGE(param1,this.functionTime);
                           }
                        }
                        else
                        {
                           if(_loc14_ != 0)
                           {
                              throw new IOError("Bad data format: GetPlayerOnlineDataRes.time cannot be set twice.");
                           }
                           _loc14_++;
                           this.time = new proto.SystemTimeNotify();
                           ReadUtils.read$TYPE_MESSAGE(param1,this.time);
                        }
                     }
                     else
                     {
                        if(_loc13_ != 0)
                        {
                           throw new IOError("Bad data format: GetPlayerOnlineDataRes.setting cannot be set twice.");
                        }
                        _loc13_++;
                        this.setting = new proto.SystemSettingsNotify();
                        ReadUtils.read$TYPE_MESSAGE(param1,this.setting);
                     }
                  }
                  else
                  {
                     if(_loc47_ != 0)
                     {
                        throw new IOError("Bad data format: GetPlayerOnlineDataRes.linesate cannot be set twice.");
                     }
                     _loc47_++;
                     this.linesate = new proto.ShowLineStateRes();
                     ReadUtils.read$TYPE_MESSAGE(param1,this.linesate);
                  }
               }
               else
               {
                  if(_loc45_ != 0)
                  {
                     throw new IOError("Bad data format: GetPlayerOnlineDataRes.sceneNotify cannot be set twice.");
                  }
                  _loc45_++;
                  this.sceneNotify = new proto.EnterScenePlayerNotify();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.sceneNotify);
               }
            }
            else
            {
               if(_loc51_ != 0)
               {
                  throw new IOError("Bad data format: GetPlayerOnlineDataRes.playerInfo cannot be set twice.");
               }
               _loc51_++;
               this.playerInfo = new proto.PlayerInfoNotify();
               ReadUtils.read$TYPE_MESSAGE(param1,this.playerInfo);
            }
         }
      }
   }
}
