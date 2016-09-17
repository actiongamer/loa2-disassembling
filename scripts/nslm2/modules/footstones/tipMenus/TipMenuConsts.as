package nslm2.modules.footstones.tipMenus
{
   import nslm2.common.vo.PlayerVo;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import morn.core.utils.StringUtils;
   import nslm2.modules.bag.itemModuels.BagConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tipMenus.handlers.ShowItemTipManueHandler;
   import nslm2.modules.footstones.tipMenus.handlers.StrenEquipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.StrenTreasureMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.StrenPetMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.StrenArtMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.EquipRecycleTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.EquipComposeTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.ViewOtherPlayerTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.CopyPlayerNameTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.AddFriendTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.DeleteFriendTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.PlayerPKHandler;
   import nslm2.modules.footstones.tipMenus.handlers.AddBlockFriendHandler;
   import nslm2.modules.footstones.tipMenus.handlers.RemoveBlockFriendHandler;
   import nslm2.modules.footstones.tipMenus.handlers.PrivChatHandler;
   import nslm2.modules.footstones.tipMenus.handlers.FriendGiveGiftHandler;
   import nslm2.modules.foundations.guildModule.menuHandler.GuildKickHandler;
   import nslm2.modules.roleInfos.tipMenuHandler.TakeOffEquipBtnHandler;
   import nslm2.modules.roleInfos.tipMenuHandler.SwapEquipBtnHandler;
   import nslm2.modules.footstones.tipMenus.handlers.SellTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.UseSingleTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.UseAllTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.UseBatchTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.UseGiveTipMenuHandler;
   import nslm2.modules.cultivates.roleTeam.tipMenuHandler.SwapYuanJunMenueHandler;
   import nslm2.modules.cultivates.roleTeam.tipMenuHandler.RemoveYuanJunHandler;
   import nslm2.modules.cultivates.roleTeam.tipMenuHandler.JumpToRoleInfoHandler;
   import nslm2.modules.footstones.tipMenus.handlers.RuneComposeTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.RuneRecycleTipMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.TeamGuajiInviteFriendHandler;
   import nslm2.modules.footstones.tipMenus.handlers.TeamGuajiInvitePublicHandler;
   import nslm2.modules.footstones.tipMenus.handlers.ShowGotWayHandler;
   import nslm2.modules.footstones.tipMenus.handlers.TreasureComoseHandler;
   import nslm2.modules.footstones.tipMenus.handlers.InviteJoinFamilyMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.BuyTreasureBoxMenuHandler;
   import nslm2.modules.footstones.tipMenus.handlers.PetComposeMeneHandler;
   import nslm2.modules.footstones.tipMenus.handlers.PetUpStarMenuHandler;
   
   public class TipMenuConsts
   {
      
      private static var _ins:nslm2.modules.footstones.tipMenus.TipMenuConsts;
      
      public static const KIND_PLAYER_ID:int = 102;
      
      public static const KIND_GUILD_OTHER_ROLE:int = 110;
      
      public static const KIND_ROLE_EQUIP:int = 103;
      
      public static const KIND_GUILD_OTHER_ROLE_KICK:int = 111;
      
      public static const KIND_ROLE_EQUIP_TREASURE:int = 112;
      
      public static const KIND_ROLE_EQUIP_1:int = 113;
      
      public static const KIND_YUANJUN:int = 114;
      
      public static const KIND_YUANJUN_REINFORCE:int = 122;
      
      public static const KIND_ROLE_EQUIP_TREASURE_1:int = 115;
      
      public static const KIND_RUNE:int = 116;
      
      public static const KIND_CROSS_SER:int = 117;
      
      public static const KIND_TEAM_GUAJI_INVITE:int = 120;
      
      public static const KIND_BAG_ITEM:int = 121;
      
      public static const KIND_GUILD_OTHER_ROLE_FRIEND:int = 1111;
      
      public static const KIND_GUILD_OTHER_ROLE_KICK_FRIEND:int = 1112;
      
      public static const KIND_PET:int = 123;
      
      public static const KIND_TEAM_PK_CROSS_INVITE:int = 124;
      
      public static const KIND_PET_BLESS:int = 125;
      
      public static const KIND_ART:int = 126;
      
      public static const KIND_CW_GUILD_OTHER_ROLE:int = 201;
      
      public static const KIND_CW_GUILD_OTHER_ROLE_KICK:int = 202;
      
      public static const KIND_CW_GUILD_OTHER_ROLE_FRIEND:int = 203;
      
      public static const KIND_CW_GUILD_OTHER_ROLE_KICK_FRIEND:int = 204;
      
      public static const TEAM_GUAJI_INVITE_FRIEND_MENU:int = 7;
      
      public static const TEAM_GUAJI_INVITE_PUBLIC_MENU:int = 8;
      
      public static const ICON_FIND:int = 1;
      
      public static const ICON_ADD_FRIEND:int = 2;
      
      public static const ICON_INVITE:int = 3;
      
      public static const ICON_COPY:int = 4;
      
      public static const ICON_ADD_GUILD:int = 5;
      
      public static const ICON_BLACK_LIST:int = 6;
      
      public static const ICON_PLAYER_PK:int = 7;
      
      public static const USE_TYPE_CANNOT:int = 0;
      
      public static const USE_TYPE_SINGLE:int = 1;
      
      public static const USE_TYPE_MULTI:int = 2;
      
      public static const USE_TYPE_GIVE:int = 3;
       
      
      private var kindLib:Object;
      
      private var configVoLib:Object;
      
      public var TIP_MENU_SHOW_ITEM:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_STRENTEH_EQUIP:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_STRENTEH_TREASURE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_STRENTEH_PET:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_STRENTEH_ART:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_EQUIP_DECOMPOSE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_EQUIP_COMPOSE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_VIEW_ROLE_INFO:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_COPY_NAME:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_ADD_FRIEND:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_DEL_FRIEND:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_PLAY_PK:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_BLOCK_PLAYER:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_DEL_BLOCK_PLAYER:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_PRIV_CHAT:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_FRIEND_GIVE_GIFT:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_GUILD_KICK:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_UNEQUIP:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_CHANGE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_SELL:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_USE_SINGLE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_USE_ALL:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_USE_BATCH:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_GIVE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_CHANGE_YUANJUN:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_REMOVE_YUANJUN:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_JUMP_TO_ROLE_INFO:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_RUNE_COMPOSE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_RUNE_RECYCLE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_GUAJI_INVITE_FRIEND:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_GUAJI_INVITE_PUBLIC:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_GET_WAY:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_TREAUSRE_COMPOSE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_INVITE_PLAYER:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_BUY_TREASURE_BOX:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_PET_COMPOSE:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public var TIP_MENU_PET_UP_STAR:nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
      
      public function TipMenuConsts()
      {
         kindLib = {};
         configVoLib = [];
         TIP_MENU_SHOW_ITEM = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000148),ShowItemTipManueHandler);
         TIP_MENU_STRENTEH_EQUIP = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000149),StrenEquipMenuHandler);
         TIP_MENU_STRENTEH_TREASURE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000149),StrenTreasureMenuHandler);
         TIP_MENU_STRENTEH_PET = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000149),StrenPetMenuHandler);
         TIP_MENU_STRENTEH_ART = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000149),StrenArtMenuHandler);
         TIP_MENU_EQUIP_DECOMPOSE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000150),EquipRecycleTipMenuHandler);
         TIP_MENU_EQUIP_COMPOSE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000151),EquipComposeTipMenuHandler);
         TIP_MENU_VIEW_ROLE_INFO = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000152),ViewOtherPlayerTipMenuHandler);
         TIP_MENU_COPY_NAME = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(4,LocaleMgr.ins.getStr(999000153),CopyPlayerNameTipMenuHandler);
         TIP_MENU_ADD_FRIEND = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(2,LocaleMgr.ins.getStr(999000154),AddFriendTipMenuHandler);
         TIP_MENU_DEL_FRIEND = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(6,LocaleMgr.ins.getStr(999000155),DeleteFriendTipMenuHandler);
         TIP_MENU_PLAY_PK = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(7,LocaleMgr.ins.getStr(999000156),PlayerPKHandler);
         TIP_MENU_BLOCK_PLAYER = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(6,LocaleMgr.ins.getStr(999000157),AddBlockFriendHandler);
         TIP_MENU_DEL_BLOCK_PLAYER = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(2,LocaleMgr.ins.getStr(999000158),RemoveBlockFriendHandler);
         TIP_MENU_PRIV_CHAT = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000159),PrivChatHandler);
         TIP_MENU_FRIEND_GIVE_GIFT = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(3,LocaleMgr.ins.getStr(999000160),FriendGiveGiftHandler);
         TIP_MENU_GUILD_KICK = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(6,LocaleMgr.ins.getStr(11000241),GuildKickHandler);
         TIP_MENU_UNEQUIP = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000161),TakeOffEquipBtnHandler);
         TIP_MENU_CHANGE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000162),SwapEquipBtnHandler);
         TIP_MENU_SELL = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000163),SellTipMenuHandler);
         TIP_MENU_USE_SINGLE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000164),UseSingleTipMenuHandler);
         TIP_MENU_USE_ALL = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000165),UseAllTipMenuHandler);
         TIP_MENU_USE_BATCH = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000166),UseBatchTipMenuHandler);
         TIP_MENU_GIVE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,"赠    送",UseGiveTipMenuHandler);
         TIP_MENU_CHANGE_YUANJUN = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000167),SwapYuanJunMenueHandler);
         TIP_MENU_REMOVE_YUANJUN = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000168),RemoveYuanJunHandler);
         TIP_MENU_JUMP_TO_ROLE_INFO = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(30815010),JumpToRoleInfoHandler);
         TIP_MENU_RUNE_COMPOSE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000169),RuneComposeTipMenuHandler);
         TIP_MENU_RUNE_RECYCLE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(30616024),RuneRecycleTipMenuHandler);
         TIP_MENU_GUAJI_INVITE_FRIEND = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(41210090),TeamGuajiInviteFriendHandler);
         TIP_MENU_GUAJI_INVITE_PUBLIC = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(41210091),TeamGuajiInvitePublicHandler);
         TIP_MENU_GET_WAY = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000170),ShowGotWayHandler);
         TIP_MENU_TREAUSRE_COMPOSE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(41300267),TreasureComoseHandler);
         TIP_MENU_INVITE_PLAYER = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(5,LocaleMgr.ins.getStr(999000171),InviteJoinFamilyMenuHandler);
         TIP_MENU_BUY_TREASURE_BOX = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(30610503),BuyTreasureBoxMenuHandler);
         TIP_MENU_PET_COMPOSE = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(32000041),PetComposeMeneHandler);
         TIP_MENU_PET_UP_STAR = new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(32000042),PetUpStarMenuHandler);
         super();
         kindLib[120] = [TIP_MENU_GUAJI_INVITE_FRIEND,TIP_MENU_GUAJI_INVITE_PUBLIC];
         kindLib[124] = [TIP_MENU_GUAJI_INVITE_FRIEND];
         kindLib[103] = [TIP_MENU_STRENTEH_EQUIP,TIP_MENU_CHANGE,TIP_MENU_UNEQUIP,TIP_MENU_SHOW_ITEM];
         kindLib[113] = [TIP_MENU_STRENTEH_EQUIP,new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000172),SwapEquipBtnHandler,true),TIP_MENU_UNEQUIP,TIP_MENU_SHOW_ITEM];
         kindLib[112] = [TIP_MENU_STRENTEH_TREASURE,TIP_MENU_CHANGE,TIP_MENU_UNEQUIP,TIP_MENU_SHOW_ITEM];
         kindLib[115] = [TIP_MENU_STRENTEH_TREASURE,new nslm2.modules.footstones.tipMenus.TipMenuConfigVo(1,LocaleMgr.ins.getStr(999000172),SwapEquipBtnHandler,true),TIP_MENU_UNEQUIP,TIP_MENU_SHOW_ITEM];
         kindLib[110] = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_ADD_FRIEND];
         kindLib[111] = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_ADD_FRIEND,TIP_MENU_GUILD_KICK];
         kindLib[1111] = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_PRIV_CHAT];
         kindLib[1112] = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_PRIV_CHAT,TIP_MENU_GUILD_KICK];
         kindLib[201] = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_ADD_FRIEND];
         kindLib[202] = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_ADD_FRIEND];
         kindLib[203] = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_PRIV_CHAT];
         kindLib[204] = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_PRIV_CHAT];
         kindLib[114] = [TIP_MENU_CHANGE_YUANJUN,TIP_MENU_REMOVE_YUANJUN];
         kindLib[122] = [TIP_MENU_JUMP_TO_ROLE_INFO,TIP_MENU_CHANGE_YUANJUN,TIP_MENU_REMOVE_YUANJUN];
         kindLib[116] = [TIP_MENU_RUNE_COMPOSE,TIP_MENU_RUNE_RECYCLE];
         kindLib[123] = [TIP_MENU_STRENTEH_PET,TIP_MENU_CHANGE,TIP_MENU_UNEQUIP];
         kindLib[126] = [TIP_MENU_STRENTEH_ART,TIP_MENU_CHANGE,TIP_MENU_UNEQUIP];
      }
      
      public static function get ins() : nslm2.modules.footstones.tipMenus.TipMenuConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.tipMenus.TipMenuConsts();
         }
         return _ins;
      }
      
      public function getMenuArr(param1:int, param2:*) : Array
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = param1;
         if(117 !== _loc6_)
         {
            if(102 !== _loc6_)
            {
               if(121 !== _loc6_)
               {
                  return kindLib[param1];
               }
               _loc5_ = param2 as WealthVo;
               return getItemTipMenu(_loc5_);
            }
            _loc3_ = param2 as PlayerVo;
            if(FriendService.ins.isFriend(_loc3_.playerId))
            {
               if(FriendService.ins.hadDonate(_loc3_.playerId) || ModuleMgr.ins.isShow(10621))
               {
                  _loc4_ = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_PRIV_CHAT,TIP_MENU_DEL_FRIEND,TIP_MENU_PLAY_PK];
               }
               else
               {
                  _loc4_ = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_PRIV_CHAT,TIP_MENU_FRIEND_GIVE_GIFT,TIP_MENU_DEL_FRIEND,TIP_MENU_PLAY_PK];
               }
            }
            else if(FriendService.ins.isBlock(_loc3_.playerId))
            {
               _loc4_ = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME,TIP_MENU_DEL_BLOCK_PLAYER];
            }
            else
            {
               if(SceneModel.ins.isCrossScene)
               {
                  _loc4_ = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME];
               }
               else
               {
                  _loc4_ = [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_ADD_FRIEND,TIP_MENU_COPY_NAME,TIP_MENU_BLOCK_PLAYER];
                  if(SceneModel.ins.canShowPvpOption())
                  {
                     _loc4_.push(TIP_MENU_PLAY_PK);
                  }
               }
               if(ChatUtils.isGMTypeCanPriChat(_loc3_.gmtype))
               {
                  _loc4_.splice(2,0,TIP_MENU_PRIV_CHAT);
               }
            }
            if(GuildModel.ins.checkHasAuthority(200))
            {
               _loc4_.push(TIP_MENU_INVITE_PLAYER);
            }
            return _loc4_;
         }
         return [TIP_MENU_VIEW_ROLE_INFO,TIP_MENU_COPY_NAME];
      }
      
      public function getItemTipMenu(param1:WealthVo) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Array = [];
         if(WealthUtil.isEquip(param1))
         {
            _loc4_.push(TIP_MENU_EQUIP_DECOMPOSE);
         }
         if(param1.stcItemVo.kind == 51)
         {
            _loc4_.push(TIP_MENU_EQUIP_COMPOSE);
         }
         if(param1.stcItemVo.kind == 72)
         {
            _loc4_.push(TIP_MENU_TREAUSRE_COMPOSE);
         }
         if(param1.stcItemVo.kind == 10 || param1.stcItemVo.kind == 12)
         {
            _loc4_.push(TIP_MENU_USE_SINGLE);
         }
         if(param1.stcItemVo.kind == 52)
         {
            if(!PetModel.ins.getPetInfo(int(param1.stcItemVo.extend_2)))
            {
               if(FuncOpenAutoCtrl.checkOpen(32000))
               {
                  _loc4_.push(TIP_MENU_PET_COMPOSE);
               }
            }
            else if(FuncOpenAutoCtrl.checkOpen(32030))
            {
               _loc4_.push(TIP_MENU_PET_UP_STAR);
            }
         }
         if(WealthUtil.isCanUseKind(param1.stcItemVo.kind))
         {
            if(param1.item.count == 1 || param1.stcItemVo.kind == 1000 || param1.stcItemVo.kind == 40)
            {
               _loc2_ = 1;
            }
            else
            {
               _loc2_ = 2;
            }
         }
         else
         {
            _loc2_ = 0;
         }
         if(WealthUtil.isCanSell(param1.stcItemVo.sell_price))
         {
            _loc3_ = true;
         }
         switch(int(_loc2_))
         {
            case 0:
               break;
            case 1:
               _loc4_.push(TIP_MENU_USE_SINGLE);
               break;
            case 2:
               _loc4_.push(TIP_MENU_USE_SINGLE);
               _loc4_.push(TIP_MENU_USE_BATCH);
               _loc4_.push(TIP_MENU_USE_ALL);
         }
         if(_loc3_)
         {
            _loc4_.push(TIP_MENU_SELL);
         }
         if(!StringUtils.isNull(param1.stcItemVo.get_point))
         {
            _loc4_.push(TIP_MENU_GET_WAY);
         }
         if(param1.stcItemVo.kind != 40)
         {
            _loc4_.push(TIP_MENU_SHOW_ITEM);
         }
         if(BagConsts.TREAUSRE_KEY_ID.indexOf(param1.sid) >= 0)
         {
            _loc4_.push(TIP_MENU_BUY_TREASURE_BOX);
         }
         return _loc4_;
      }
   }
}
