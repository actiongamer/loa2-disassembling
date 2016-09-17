package morn.customs.components
{
   import com.mz.core.interFace.IObserver;
   import morn.core.components.Image;
   import flash.display.DisplayObject;
   import morn.core.components.Label;
   import morn.core.components.List;
   import nslm2.common.vo.PlayerVo;
   import proto.GameFriendData;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.utils.WealthUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.LabelMed;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PlayerRender extends FadeView implements IObserver
   {
      
      public static const IMG_MASK:String = "img_mask";
      
      public static const IMG_ICON:String = "img_icon";
      
      public static const IMG_QUALITY:String = "img_quality";
      
      public static const TXT_LV:String = "txt_lv";
      
      public static const TXT_FIGHTVALUE:String = "txt_fightValue";
      
      public static const TXT_NAME:String = "txt_name";
      
      public static const LIST_TUPO:String = "list_tupo";
      
      public static const TXT_SIGNATUE:String = "txt_signatue";
      
      public static const TXT_OFFTIME:String = "txt_offtime";
      
      public static const TXT_SHENGJIELV:String = "txt_shengjielv";
       
      
      public var nameUseLink:Boolean = true;
      
      protected var _playerVo:PlayerVo;
      
      protected var _gameFriendData:GameFriendData;
      
      public function PlayerRender()
      {
         super();
         if(ref_img_mask)
         {
            ref_img_mask.cacheAsBitmap = true;
            ref_img_icon.cacheAsBitmap = true;
            this.ref_img_icon.mask = this.ref_img_mask;
         }
      }
      
      public function get ref_img_icon() : Image
      {
         return getRef("img_icon");
      }
      
      public function get ref_img_mask() : DisplayObject
      {
         return getRef("img_mask");
      }
      
      public function get ref_img_quality() : Image
      {
         return getRef("img_quality");
      }
      
      public function get ref_txt_lv() : Label
      {
         return getRef("txt_lv");
      }
      
      public function get ref_txt_fightValue() : Label
      {
         return getRef("txt_fightValue");
      }
      
      public function get ref_txt_name() : Label
      {
         return getRef("txt_name");
      }
      
      public function get ref_list_tupo() : List
      {
         return getRef("list_tupo");
      }
      
      public function get ref_txt_signatue() : Label
      {
         return getRef("txt_signatue");
      }
      
      public function get ref_txt_offtime() : Label
      {
         return getRef("txt_offtime");
      }
      
      public function get ref_txt_shengjielv() : Label
      {
         return getRef("txt_shengjielv");
      }
      
      protected function getRef(param1:String) : *
      {
         if(this.hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get playerVo() : PlayerVo
      {
         return _playerVo;
      }
      
      public function set playerVo(param1:PlayerVo) : void
      {
         this._playerVo = param1;
         this.validateObserver();
         this.validateTooltip();
         this.validateImgIcon();
         this.validateQuality();
         this.validateTxtName();
         this.validateTxtLv();
         this.validateTxtFightValue();
         this.validateTupoLv();
         this.validateTxtSignatue();
         this.validateTxtOfftime();
         this.validateTxtShengjielv();
      }
      
      public function get gameFriendData() : GameFriendData
      {
         return _gameFriendData;
      }
      
      public function set gameFriendData(param1:GameFriendData) : void
      {
         this._gameFriendData = param1;
         if(_gameFriendData)
         {
            this.playerVo = FriendUtils.gameFrienDataToPlayerVo(param1 as GameFriendData,false);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 is GameFriendData)
         {
            this.gameFriendData = param1 as GameFriendData;
         }
         else if(param1 is PlayerVo)
         {
            this.playerVo = param1 as PlayerVo;
         }
      }
      
      protected function validateObserver() : void
      {
         ObserverMgr.ins.regObserver(this);
      }
      
      protected function validateTooltip() : void
      {
         if(this.ref_img_icon != null)
         {
            if(playerVo && playerVo.name != null)
            {
               ref_img_icon.toolTip = this.playerVo.name + " " + LocaleConsts.lvStr(this.playerVo.level);
            }
            else
            {
               ref_img_icon.toolTip = null;
            }
         }
      }
      
      protected function tipMenu_onClick(param1:MouseEvent) : void
      {
         if(this.playerVo)
         {
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(102,this.playerVo));
         }
      }
      
      protected function validateImgIcon() : void
      {
         if(this.ref_img_icon != null)
         {
            if(playerVo && playerVo.headerIconUrl != null)
            {
               this.ref_img_icon.url = playerVo.headerIconUrl;
            }
            else
            {
               this.ref_img_icon.url = null;
            }
         }
      }
      
      private function validateQuality() : void
      {
         if(this.ref_img_quality)
         {
            if(playerVo && playerVo.quality != 0)
            {
               WealthUtil.changeQualitySkin(this.ref_img_quality,playerVo.quality);
               ref_img_quality.visible = true;
            }
            else
            {
               ref_img_quality.visible = false;
            }
         }
      }
      
      protected function validateTxtFightValue() : void
      {
         if(this.ref_txt_fightValue != null)
         {
            if(playerVo && isNaN(playerVo.fightValue) == false)
            {
               ref_txt_fightValue.visible = true;
               ref_txt_fightValue.text = LocaleConsts.fightValue(playerVo.fightValue);
            }
            else
            {
               ref_txt_fightValue.visible = false;
            }
         }
      }
      
      protected function validateTxtLv() : void
      {
         if(this.ref_txt_lv != null)
         {
            if(playerVo && playerVo.level != 0)
            {
               ref_txt_lv.visible = true;
               ref_txt_lv.text = LocaleConsts.lvStr(playerVo.level);
            }
            else
            {
               ref_txt_lv.visible = false;
            }
         }
      }
      
      protected function validateTxtName() : void
      {
         if(this.ref_txt_name != null)
         {
            if(playerVo && playerVo.name != null)
            {
               if(EnvConfig.ins.useServer == true && nameUseLink && Uint64Util.equal(playerVo.playerId,PlayerModel.ins.playerInfo.id) == false)
               {
                  this.ref_txt_name.text = LabelMed.vipParam(playerVo.vipInfoVo) + LinkUtils.playerName(playerVo.playerId,playerVo.name,playerVo.disID,ColorLib.qualityColor(playerVo.militaryQuality));
               }
               else if(ClientConfig.firstBattle != 1 && HeroInfoUtil.isPlayerHeroByBaseId(playerVo.baseId) == true)
               {
                  this.ref_txt_name.color = ColorLib.qualityColor(playerVo.militaryQuality);
                  this.ref_txt_name.text = LabelMed.vipParam(playerVo.vipInfoVo) + playerVo.name;
               }
               else
               {
                  this.ref_txt_name.color = ColorLib.qualityColor(playerVo.quality);
                  this.ref_txt_name.text = LabelMed.vipParam(playerVo.vipInfoVo) + playerVo.name;
               }
               this.ref_txt_name.visible = true;
            }
            else
            {
               this.ref_txt_name.visible = false;
            }
         }
      }
      
      protected function validateTupoLv() : void
      {
         var _loc1_:* = null;
         if(this.ref_list_tupo != null)
         {
            if(playerVo && playerVo.baseId != 0)
            {
               _loc1_ = StcMgr.ins.getNpcVo(this.playerVo.baseId);
               ref_list_tupo.visible = true;
               ref_list_tupo.dataSource = HeroInfoUtil.getTupoClipArr(_loc1_.tupo);
            }
            else
            {
               ref_list_tupo.visible = false;
            }
         }
      }
      
      protected function validateTxtSignatue() : void
      {
         if(this.ref_txt_signatue != null)
         {
            if(playerVo && playerVo.signatue)
            {
               this.ref_txt_signatue.text = playerVo.signatue;
               this.ref_txt_signatue.visible = true;
            }
            else
            {
               this.ref_txt_signatue.visible = false;
            }
         }
      }
      
      protected function validateTxtOfftime() : void
      {
         if(this.ref_txt_offtime != null)
         {
            if(playerVo)
            {
               ref_txt_offtime.text = LocaleConsts.offtime(playerVo.offtime);
               ref_txt_offtime.visible = true;
            }
            else
            {
               ref_txt_offtime.visible = false;
            }
         }
      }
      
      protected function validateTxtShengjielv() : void
      {
         if(this.ref_txt_shengjielv != null)
         {
            if(playerVo)
            {
               ref_txt_shengjielv.text = LocaleMgr.ins.getStr(30100005) + ":" + LocaleMgr.ins.getStr(7000 + playerVo.shengjieLv);
               ref_txt_shengjielv.visible = true;
            }
            else
            {
               ref_txt_shengjielv.visible = false;
            }
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_FRIEND_CHANGE_SIGNTUE","MSG_FRIEND_CHANGE_OFFTIME"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         if(this.playerVo == null)
         {
            return;
         }
         var _loc4_:* = param1;
         if("MSG_FRIEND_CHANGE_SIGNTUE" !== _loc4_)
         {
            if("MSG_FRIEND_CHANGE_OFFTIME" === _loc4_)
            {
               _loc3_ = param2 as GameFriendData;
               if(this.gameFriendData && Uint64Util.equal(_loc3_.id,this.playerVo.playerId))
               {
                  gameFriendData.offtime = _loc3_.offtime;
                  playerVo.offtime = _loc3_.offtime;
                  this.validateTxtOfftime();
               }
            }
         }
         else
         {
            _loc3_ = param2 as GameFriendData;
            if(this.gameFriendData && Uint64Util.equal(_loc3_.id,this.playerVo.playerId))
            {
               gameFriendData.signatue = _loc3_.signatue;
               playerVo.signatue = _loc3_.signatue;
               this.validateTxtSignatue();
            }
         }
      }
   }
}
