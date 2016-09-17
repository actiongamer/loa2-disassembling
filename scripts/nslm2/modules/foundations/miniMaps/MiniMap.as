package nslm2.modules.foundations.miniMaps
{
   import game.ui.miniMaps.MiniMapUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.logging.Log;
   import nslm2.utils.RTools;
   import flash.events.MouseEvent;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.foundations.mainToolBar.RedPointVo;
   import nslm2.modules.foundations.mainToolBar.BottomIconBarTopRightTime;
   import nslm2.modules.foundations.mainToolBar.BottomIconBarTopRight;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import morn.core.utils.NumberUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import flash.display.DisplayObject;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.foundations.miniNotice.MiniNoticeModel;
   import proto.FunctionActionInfo;
   import com.mz.core.event.MzEvent;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   import com.greensock.TweenLite;
   import com.mz.core.utils.LocalData;
   import morn.customs.FilterLib;
   import flash.filters.GlowFilter;
   import nslm2.modules.foundations.mainToolBar.BottomIconRenderTopRight;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import game.ui.miniMaps.MiniMapBtnUI;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import nslm2.modules.foundations.setting.service.SettingService;
   import nslm2.mgrs.SoundMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.mainCities.MainCityModuleParam;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import morn.core.utils.URLUtils;
   import nslm2.modules.globalModules.changeLanguage.LanguageChangeModule;
   import morn.core.utils.DelayCall;
   import nslm2.modules.globalModules.changeLanguage.LanguageSelectItem;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.sales.model.SalesModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.utils.FunctionDelegate;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.scenes.commons.SceneModel;
   import flash.geom.Point;
   import com.mz.core.geom.PoiAndRoVo;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import nslm2.modules.funnies.abilityRankModule.model.AbilityRankModel;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.modules.foundations.miniTasks.vo.HintVo;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.greensock.easing.Cubic;
   import org.specter3d.loaders.AssetLib;
   import flash.display.BitmapData;
   import com.mz.core.utils.MathUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.geom.Rectangle;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.modules.foundations.mail.MailModel;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.funnies.renZhengs.WeiXinAndPhones.RenZhengService;
   import nslm2.utils.PlatformUtil;
   import nslm2.common.globals.GlobalRef;
   
   public class MiniMap extends MiniMapUI implements INewerGuideGetComp
   {
       
      
      private var btnSoundSkin:String;
      
      private var mailRedPoint:RedPoint;
      
      private var gmRedPoint:RedPoint;
      
      private var mapScale:Number = 8;
      
      private var effMail:BmcSpriteSheet;
      
      private var effGm:BmcSpriteSheet;
      
      private var redPointArr:Vector.<RedPointVo>;
      
      private const HINT_BOX_ARR:Array = [LocaleMgr.ins.getStr(621001),LocaleMgr.ins.getStr(621002),LocaleMgr.ins.getStr(621009),LocaleMgr.ins.getStr(621010),LocaleMgr.ins.getStr(621005)];
      
      private var scaleBtnBool:Boolean = false;
      
      private var _iconTimeBar:BottomIconBarTopRightTime;
      
      private var curForeshowModuleList:Array;
      
      public var iconBarRef_moduleIdArr:Array;
      
      private var lastModuleIdArr:Array;
      
      private var initY:int = 0;
      
      private var lastHeight:Number = 0;
      
      private const TWEEN_HEIGHT:int = 800;
      
      private var _singleLineShowNum:int;
      
      private var _leftGap:int = 380;
      
      private var _rightGap:int = 256;
      
      private const MOVE_HEIGHT_MAX:int = 780;
      
      private const MOVE_HEIGHT_MIN:int = 730;
      
      private var scaleBtnFilterBreath:GlowFilterBreathCtrl;
      
      private var _openSound:Boolean = true;
      
      private var _openSee:Boolean = true;
      
      public var npcArr:Array;
      
      public var pointArr:Array;
      
      private var hintListArr:Array;
      
      private var isTempHint:Boolean = false;
      
      private var isInGuide:Boolean = false;
      
      private var _lookAtPoi:Point;
      
      public function MiniMap()
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         redPointArr = new Vector.<RedPointVo>();
         curForeshowModuleList = [];
         lastModuleIdArr = [];
         npcArr = [];
         pointArr = [];
         _lookAtPoi = new Point(0,0);
         super();
         this.top = 3;
         this.right = 3;
         this.box_map.mask = this.g_mask;
         this.img_role.smoothing = true;
         this.img_map.smoothing = true;
         img_map.autoSize = true;
         this.layer_pois.cancelMeasure();
         this.layer_pois.graphics.clear();
         initBtn(btn_language,900200);
         initBtn(btn_setting,10900);
         initBtn(btn_sound,96020);
         initBtn(btn_see,SettingModel.ins.otherPlayers == 0?96040:96042);
         initBtn(btn_newVersion,96050);
         initBtn(btn_mail,10700);
         initBtn(btn_friends,10600);
         initBtn(btn_rank,11800);
         initBtn(btn_gift,96030);
         initBtn(btn_battlefield,50500);
         initBtn(btn_gm,13200);
         initBtn(btn_auction,30610);
         btn_gonglue.addEventListener("click",btnClicked);
         this.img_worldmap.addEventListener("click",this.btnClicked);
         this.parts.push(new RoleGrowFilterMed(this.img_worldmap,FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(7))));
         var _loc3_:StcStageVo = StcMgr.ins.getStageVo(SceneModel.ins.sceneId);
         this.txt_cityname.text = LocaleMgr.ins.getStr(_loc3_.name);
         setOpenSound(LocalData.getIns(ClientConfig.playId).load("OPEN_SOUND",true) && SettingModel.ins.mainVolume > 0);
         SoundMgr.ins.openBack = _openSound;
         SoundMgr.ins.openTexiao = _openSound;
         MailModel.ins.addEventListener("mailHasNew",newMail);
         mailRedPoint = new RedPoint();
         mailRedPoint.right = -2;
         mailRedPoint.top = -2;
         mailRedPoint.visible = false;
         this.btn_mail.addChild(mailRedPoint);
         effMail = new BmcSpriteSheet();
         effMail.x = btn_mail.x - 19;
         effMail.y = btn_mail.y - 18;
         effMail.init(115003,1,"all",true,1,0);
         effMail.visible = false;
         DisplayUtils.addChildBelow(effMail,btn_mail);
         CallJsMrg.ins.addEventListener("GM_RED_POINT",newGm);
         gmRedPoint = new RedPoint();
         gmRedPoint.right = -2;
         gmRedPoint.top = -2;
         gmRedPoint.visible = false;
         this.btn_gm.addChild(gmRedPoint);
         effGm = new BmcSpriteSheet();
         effGm.x = btn_mail.x - 19;
         effGm.y = btn_mail.y - 18;
         effGm.init(115003,1,"all",true,1,0);
         effGm.visible = false;
         DisplayUtils.addChildBelow(effGm,btn_gm);
         StcFunctionVo;
         this.txt_systemTime.toolTip = ServerTimer.ins.serverTimeTooltip;
         time_onLoop();
         TimerManager.ins.doLoop(1000,this.time_onLoop);
         if(EnvConfig.ins.hideForBS)
         {
            btn_gift.visible = false;
            btn_setting.visible = false;
            btn_newVersion.visible = false;
         }
         this.iconBarRef_moduleIdArr = [60500,11500,13100,13300,60100,60763,60560,60800,900400,60810];
         if(EnvConfig.ins.ptId == 15)
         {
            this.iconBarRef_moduleIdArr.push(60510);
         }
         else if(EnvConfig.ins.ptId == 590)
         {
            this.iconBarRef_moduleIdArr.push(60510);
         }
         else if(EnvConfig.ins.ptId == 2303 || EnvConfig.ins.ptId == 2284 || EnvConfig.ins.ptId == 2283 || EnvConfig.ins.ptId == 2302)
         {
            this.iconBarRef_moduleIdArr.push(60510);
         }
         if(EnvConfig.ins.ptId == 590 || EnvConfig.ins.ptId == 610)
         {
            this.iconBarRef_moduleIdArr.push(60520);
         }
         else
         {
            if(EnvConfig.ins.ptId != 15)
            {
               btn_gm.visible = false;
            }
            btn_gonglue.visible = false;
         }
         this.iconBarRef_moduleIdArr.push(60530);
         this.iconBarRef_moduleIdArr.push(60200);
         this.iconBarRef_moduleIdArr.push(60540);
         this.iconBarRef_moduleIdArr.push(13333);
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
            case 1:
               this.iconBarRef_moduleIdArr.push(60710);
               this.iconBarRef_moduleIdArr.push(60721);
         }
         if(EnvConfig.ins.ptId == 590 && EnvConfig.ins.vipType != 2 && EnvConfig.ins.vipType != 1)
         {
            if(RenZhengService.ins.mobileBindInfoData && RenZhengService.ins.weixinInfo)
            {
               this.iconBarRef_moduleIdArr.push(60760);
            }
         }
         this.iconBarRef_moduleIdArr.push(13310);
         this.iconBarRef_moduleIdArr.push(13320);
         this.iconBarRef_moduleIdArr.push(13400);
         this.iconBarRef_moduleIdArr.push(13350);
         this.iconBarRef_moduleIdArr.push(13355);
         this.iconBarRef_moduleIdArr.push(900500);
         this.iconBarRef_moduleIdArr.push(13386);
         this.iconBarRef_moduleIdArr.push(900600);
         if(PlatformUtil.isFeedShowFaceBook)
         {
            this.iconBarRef_moduleIdArr.push(88001);
         }
         if(PlatformUtil.isShowFaceBookFenSiYe || EnvConfig.ins.ptId == 590 && ClientConfig.gameId == "160")
         {
            Log.info("添加了FB粉丝页点赞功能");
            this.iconBarRef_moduleIdArr.push(90001);
         }
         if((EnvConfig.ins.ptId == 590 || EnvConfig.ins.ptId == 592) && ClientConfig.language == "en")
         {
            this.iconBarRef_moduleIdArr.push(90002);
         }
         this.iconBarRef.redPointArr = redPointArr;
         this.iconBarRef_moduleIdArr.push(80100);
         this.iconBarRef_moduleIdArr.push(13376);
         curForeshowModuleList = ActivityModel.ins.getForeshowFuncIds();
         if(curForeshowModuleList.length > 0)
         {
            this.iconBarRef_moduleIdArr = this.iconBarRef_moduleIdArr.concat(curForeshowModuleList);
         }
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < 3)
         {
            _loc1_ = new HintVo();
            _loc1_.id = _loc4_;
            _loc1_.text = HINT_BOX_ARR[_loc4_];
            _loc2_.push(_loc1_);
            _loc4_++;
         }
         hintListArr = _loc2_.sortOn("id").concat();
         scaleBtnBool = false;
         if(scaleBtnBool)
         {
            this.hint_list.dataSource = hintListArr.slice(0,1);
         }
         else
         {
            this.hint_list.dataSource = hintListArr;
         }
         GlobalRef.hint_list = this.hint_list;
         scaleBtn.addEventListener("click",scaleBtnClick);
         this.img_map.addEventListener("click",onClickMiniMap);
         this.box_tips.visible = false;
         btn_gonglue.visible = false;
         btn_gm.visible = getGmBtnVisible();
      }
      
      public static function getGmBtnVisible() : Boolean
      {
         var _loc1_:Boolean = true;
         if(!(EnvConfig.ins.ptId == 590 || EnvConfig.ins.ptId == 610))
         {
            if(EnvConfig.ins.ptId != 15)
            {
               _loc1_ = false;
            }
         }
         if(ClientConfig.gameId == "160")
         {
            _loc1_ = false;
         }
         Log.info("EnvConfig.ins.ptId = " + EnvConfig.ins.ptId + "\nClientConfig.gameId = " + ClientConfig.gameId + "\nClientConfig.publishPath = " + ClientConfig.publishPath);
         if((EnvConfig.ins.ptId == 590 || EnvConfig.ins.ptId == 592) && ClientConfig.gameId == "160" && RTools.isAppointServer())
         {
            _loc1_ = true;
            Log.info("btn_gm.visible = true");
         }
         return _loc1_;
      }
      
      public static function onBtnGMClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         Log.info("ClientConfig.gameId：" + ClientConfig.gameId + "\n" + "EnvConfig.ins.ptId:" + EnvConfig.ins.ptId + "\n" + "ClientConfig.publishPath:" + ClientConfig.publishPath);
         if((EnvConfig.ins.ptId == 590 || EnvConfig.ins.ptId == 592) && ClientConfig.gameId == "160" && RTools.isAppointServer() || ClientConfig.gameId == "167")
         {
            _loc2_ = {};
            _loc2_.account = ClientConfig.playId;
            _loc2_.gameId = ClientConfig.gameId;
            _loc2_.serverId = ClientConfig.district;
            _loc2_.role = PlayerModel.ins.playerInfo.name;
            _loc2_.level = PlayerModel.ins.level;
            _loc2_.lang = ClientConfig.language;
            _loc2_.isMod = PlayerModel.ins.playerInfo.gmType == 2?true:false;
            _loc2_.opId = EnvConfig.ins.ptId;
            CallJsMrg.ins.onInstructorJs(_loc2_);
            return;
         }
         if(param1.ctrlKey && EnvConfig.ins.showQaModule)
         {
            ModuleMgr.ins.showModule(13310);
            return;
         }
         if(param1.altKey && EnvConfig.ins.showQaModule)
         {
            ModuleMgr.ins.showModule(13300);
            return;
         }
         if(ClientConfig.isChineseLang())
         {
            ModuleMgr.ins.showModule(13201,null,ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            ModuleMgr.ins.showModule(13200,null);
         }
      }
      
      public function get iconBarRef() : BottomIconBarTopRight
      {
         return this.iconBar as BottomIconBarTopRight;
      }
      
      public function get iconBarTimeRef() : BottomIconBarTopRightTime
      {
         if(_iconTimeBar == null)
         {
            _iconTimeBar = new BottomIconBarTopRightTime();
            _iconTimeBar.x = this.iconBarRef.x;
            _iconTimeBar.y = this.iconBarRef.y + 64;
            DisplayUtils.addChildBelow(_iconTimeBar,iconBarRef);
         }
         return _iconTimeBar;
      }
      
      private function updateForeshowIcons() : void
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = ActivityModel.ins.getForeshowFuncIds();
         if(ArrayUtil.equal(curForeshowModuleList,_loc3_))
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < curForeshowModuleList.length)
         {
            _loc1_ = curForeshowModuleList[_loc4_];
            if(_loc3_.indexOf(_loc1_) < 0)
            {
               _loc2_ = iconBarRef_moduleIdArr.indexOf(_loc1_);
               iconBarRef_moduleIdArr.splice(_loc2_,1);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc1_ = _loc3_[_loc4_];
            if(curForeshowModuleList.indexOf(_loc1_) < 0)
            {
               iconBarRef_moduleIdArr.push(_loc1_);
            }
            _loc4_++;
         }
         curForeshowModuleList = _loc3_;
         resetIconBar();
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         if(NumberUtil.isNumber(param1))
         {
            return this.getIconByModuleId(int(param1)) as Component;
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 20029))
         {
            if(VipModel.ins.firstCharge == true)
            {
               return 0;
            }
         }
         return 1;
      }
      
      private function getIconByModuleId(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = this.iconBarRef.btnSmallLib[param1];
         return _loc2_;
      }
      
      private function resetIconBar() : void
      {
         var $moduleIdArr:Array = iconBarRef_moduleIdArr.filter(function(param1:int, ... rest):Boolean
         {
            return FuncOpenAutoCtrl.checkOpen(param1);
         });
         if(!ArrayUtil.compareArrIsSame(lastModuleIdArr,$moduleIdArr))
         {
            lastModuleIdArr = $moduleIdArr;
            iconBarRef.moduleIdArr = $moduleIdArr;
         }
         this.btn_battlefield.visible = FuncOpenAutoCtrl.checkOpen(50500);
         this.btn_auction.visible = FuncOpenAutoCtrl.checkOpen(30610);
         if(EnvConfig.ins.showDevModule == false)
         {
            this.btn_language.visible = FuncOpenAutoCtrl.checkOpen(900200);
         }
         if(ClientConfig.gameId == "167")
         {
            this.btn_language.visible = true;
         }
         resetTimeIconBar();
         changeAllLinePos();
      }
      
      private function resetTimeIconBar() : void
      {
         var $moduleIdArr:Array = MiniNoticeModel.ins.getTodayEventArr().filter(function(param1:FunctionActionInfo, ... rest):Boolean
         {
            return FuncOpenAutoCtrl.checkOpen(param1.funcid);
         });
         iconBarTimeRef.moduleIdArr = $moduleIdArr;
      }
      
      private function changeAllLinePos() : void
      {
         changeMainLinePos();
         changeTimeLinePos();
      }
      
      private function changeMainLinePos() : void
      {
         iconBarRef.singleLineShowNum = _singleLineShowNum;
      }
      
      private function changeTimeLinePos() : void
      {
         var _loc1_:int = (iconBarRef.moduleIdArr.length - 1) / _singleLineShowNum;
         iconBarTimeRef.y = iconBarRef.y + 64 * (_loc1_ + 1);
         iconBarTimeRef.singleLineShowNum = _singleLineShowNum;
      }
      
      private function newMail(param1:MzEvent) : void
      {
         if(param1.data as Boolean)
         {
            mailRedPoint.visible = true;
            effMail.visible = true;
         }
         else
         {
            mailRedPoint.visible = false;
            effMail.visible = false;
         }
      }
      
      private function newGm(param1:MzEvent) : void
      {
         Log.info("小红点是否显示：" + param1.data);
         if(param1.data as Boolean)
         {
            gmRedPoint.visible = true;
            effGm.visible = true;
         }
         else
         {
            gmRedPoint.visible = false;
            effGm.visible = false;
         }
      }
      
      override protected function onResize(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         super.onResize(param1);
         if(this.visible == false || stage == null)
         {
            return;
         }
         if(UIMgr.gameHeight < 800 && (lastHeight >= 800 || lastHeight == 0))
         {
            TweenLite.killTweensOf(this.hint_box);
         }
         else if(UIMgr.gameHeight >= 800 && lastHeight < 800)
         {
            TweenLite.killTweensOf(this.hint_box);
            TweenLite.to(this.hint_box,0,{"x":-40});
         }
         if(UIMgr.gameHeight < 730)
         {
            this.hint_box.y = initY + 730 - 780;
         }
         else if(UIMgr.gameHeight >= 730 && UIMgr.gameHeight < 780)
         {
            this.hint_box.y = initY + UIMgr.gameHeight - 780;
         }
         else if(UIMgr.gameHeight >= 780)
         {
            this.hint_box.y = initY;
         }
         if(UIMgr.gameHeight < 730 && (lastHeight >= 730 || lastHeight == 0))
         {
            if(scaleBtnBool == false)
            {
               _loc2_ = NGUtil.curStcVo && NGUtil.curStcVo.comp_id && NGUtil.curStcVo.comp_id.indexOf("npcGroupId") >= 0;
               if(_loc2_ == false)
               {
                  setHintHeight(true,true);
               }
            }
            if(lastHeight == 0)
            {
               if(PlayerModel.ins.level <= 5 && LocalData.insCurPlayer.load("HAS_CLICK_MINIMAP_SCALE_BTN",false) == false)
               {
                  _loc3_ = FilterLib.BORDER_YELLOW;
                  scaleBtn.filters = [_loc3_];
                  scaleBtnFilterBreath = new GlowFilterBreathCtrl(_loc3_,8,2,1);
                  scaleBtnFilterBreath.addHandler(changeScaleBtnFilters);
               }
            }
         }
         else if(UIMgr.gameHeight >= 730 && lastHeight < 730)
         {
            if(isTempHint && scaleBtnBool)
            {
               setHintHeight(false);
            }
         }
         lastHeight = UIMgr.gameHeight;
         _singleLineShowNum = Math.floor((UIMgr.gameWidth - _leftGap - _rightGap) / BottomIconRenderTopRight.WW);
         iconBarRef.singleLineShowNum = _singleLineShowNum;
         changeAllLinePos();
      }
      
      private function changeScaleBtnFilters(param1:Array) : void
      {
         scaleBtn.filters = param1;
      }
      
      private function time_onLoop() : void
      {
         txt_systemTime.text = TimeUtils.hiWithZero(ServerTimer.ins.date);
      }
      
      private function initBtn(param1:MiniMapBtnUI, param2:int) : void
      {
         param1.addEventListener("click",btnClicked);
         this.setBtnFuncId(param1,param2);
      }
      
      private function setBtnFuncId(param1:MiniMapBtnUI, param2:int) : void
      {
         (param1 as MiniMapBtn).funcId = param2;
      }
      
      public function get openSound() : Boolean
      {
         return _openSound;
      }
      
      public function set openSound(param1:Boolean) : void
      {
         if(param1 == _openSound)
         {
            return;
         }
         _openSound = param1;
         if(!param1)
         {
            SettingModel.ins.mainVolume = 0;
         }
         else
         {
            if(SettingModel.ins.mainVolume > 0)
            {
               §§push(1);
            }
            else
            {
               var _loc2_:int = 100;
               SettingModel.ins.mainVolume = _loc2_;
               §§push(_loc2_);
            }
            §§pop();
         }
         SettingService.ins.save(19,SettingModel.ins.mainVolume);
         setOpenSound(param1);
         LocalData.getIns(ClientConfig.playId).save("OPEN_SOUND",_openSound);
      }
      
      private function setOpenSound(param1:Boolean) : void
      {
         _openSound = param1;
         SoundMgr.ins.openBack = _openSound;
         SoundMgr.ins.openTexiao = _openSound;
         setBtnFuncId(this.btn_sound,!!param1?96020:96022);
      }
      
      public function get openSee() : Boolean
      {
         if(SettingModel.ins.otherPlayers == 0)
         {
            _openSee = true;
         }
         else
         {
            _openSee = false;
         }
         return _openSee;
      }
      
      public function set openSee(param1:Boolean) : void
      {
         if(param1 == _openSee)
         {
            return;
         }
         _openSee = param1;
         if(param1)
         {
            SettingModel.ins.otherPlayers = 0;
         }
         else
         {
            SettingModel.ins.otherPlayers = 1;
         }
         SettingService.ins.save(12,SettingModel.ins.otherPlayers);
         setBtnFuncId(this.btn_see,!!param1?96040:96042);
         ObserverMgr.ins.sendNotice("MSG_SEE_OTHER_PLAYERS_SWITCH",param1);
      }
      
      private function btnClicked(param1:MouseEvent) : void
      {
         e = param1;
         var _loc2_:* = e.currentTarget;
         if(img_worldmap !== _loc2_)
         {
            if(btn_mail !== _loc2_)
            {
               if(btn_sound !== _loc2_)
               {
                  if(btn_see !== _loc2_)
                  {
                     if(btn_setting !== _loc2_)
                     {
                        if(btn_newVersion !== _loc2_)
                        {
                           if(btn_friends !== _loc2_)
                           {
                              if(btn_rank !== _loc2_)
                              {
                                 if(btn_gift !== _loc2_)
                                 {
                                    if(btn_battlefield !== _loc2_)
                                    {
                                       if(btn_gm !== _loc2_)
                                       {
                                          if(btn_auction !== _loc2_)
                                          {
                                             if(btn_gonglue !== _loc2_)
                                             {
                                                if(btn_language === _loc2_)
                                                {
                                                   if(LanguageChangeModule.instance.parent == null)
                                                   {
                                                      addChild(LanguageChangeModule.instance);
                                                      LanguageChangeModule.instance.x = btn_language.x - LanguageChangeModule.instance.width;
                                                      LanguageChangeModule.instance.y = btn_language.y + 30;
                                                      DelayCall(function():void
                                                      {
                                                         App.stage.addEventListener("click",onClick);
                                                      });
                                                   }
                                                }
                                             }
                                             else
                                             {
                                                URLUtils.openWindow("http://tieba.baidu.com/p/4301645617");
                                             }
                                          }
                                          else
                                          {
                                             if(e.altKey && EnvConfig.ins.showQaModule)
                                             {
                                                ModuleMgr.ins.showModule(50520);
                                                return;
                                             }
                                             ModuleMgr.ins.showModule(30610);
                                          }
                                       }
                                       else
                                       {
                                          onBtnGMClick(e);
                                          if(PlayerModel.ins.playerInfo.gmType != 2)
                                          {
                                             gmRedPoint.visible = false;
                                             effGm.visible = false;
                                          }
                                       }
                                    }
                                    else if(BattlefieldModel.ins.startStamp == 0)
                                    {
                                       ModuleMgr.ins.showModule(50500,null,ModuleMgr.ins.popLayer.curModuleId);
                                    }
                                    else
                                    {
                                       BattlefieldUtil.showEnterConfirm();
                                    }
                                 }
                                 else if(e.ctrlKey && e.altKey && e.shiftKey)
                                 {
                                    ModuleMgr.ins.showModule(60760);
                                 }
                                 else
                                 {
                                    ModuleMgr.ins.showModule(96030);
                                 }
                              }
                              else if(e.ctrlKey && EnvConfig.ins.showDevModule)
                              {
                                 ModuleMgr.ins.showModule(40500,new MainCityModuleParam(33000));
                              }
                              else if(!(e.altKey && EnvConfig.ins.showDevModule))
                              {
                                 ModuleMgr.ins.showModule(11800,0);
                              }
                           }
                           else if(e.ctrlKey && EnvConfig.ins.showDevModule)
                           {
                              ModuleMgr.ins.showModule(10623);
                           }
                           else if(e.altKey && EnvConfig.ins.showDevModule)
                           {
                              ModuleMgr.ins.showModule(10540);
                           }
                           else
                           {
                              ModuleMgr.ins.showModule(10600);
                           }
                        }
                        else
                        {
                           ModuleMgr.ins.showModule(96050);
                        }
                     }
                     else if(EnvConfig.ins.showDevModule && e.altKey)
                     {
                        ModuleMgr.ins.showModule(60300);
                     }
                     else if(EnvConfig.ins.showDevModule && e.ctrlKey)
                     {
                        ModuleMgr.ins.showModule(60100);
                     }
                     else
                     {
                        ModuleMgr.ins.showModule(10900);
                     }
                  }
                  else if(EnvConfig.ins.showDevModule && e.altKey)
                  {
                     ModuleMgr.ins.showModule(30900);
                  }
                  else
                  {
                     this.openSee = !this.openSee;
                  }
               }
               else
               {
                  if(EnvConfig.ins.showDevModule && e.altKey)
                  {
                     ModuleMgr.ins.showModule(30121);
                  }
                  this.openSound = !this.openSound;
               }
            }
            else
            {
               ModuleMgr.ins.showModule(10700);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(10450);
            showWorldMapTips(false);
         }
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         if(!(param1.target is LanguageSelectItem))
         {
            App.stage.removeEventListener("click",onClick);
            LanguageChangeModule.instance.parent.removeChild(LanguageChangeModule.instance);
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         npcArr = null;
         super.show(param1);
         this.validateFuncCount();
         this.resetIconBar();
         if(VipModel.ins.canGetFavoriteReward)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60520,true));
         }
         if(VipModel.ins.canGetFirstChargeReward)
         {
            NpcFuncService.ins.changeCount(60200,1);
         }
         if(VipModel.ins.silverDay == -1 || VipModel.ins.goldDay == -1)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60530,true));
         }
         if(SalesModel.ins.cangetBenefit)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60540,true));
         }
         initY = 350;
         this.onResize(null);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_VIP_CHANGE","MAIN_CITY_SCENE_45_INIT_CPL","msg_refresh_small_map","msg_scene_camera_change","msg_player_hero_CHANGE_POS","msg_other_players_VISIBLE","msg_sound_MUTE","msg_add_NPC","MSG_NPC_FUNC_VO_CHANGE","PLAYER_LEVEL_UP","msg_update_icon_bar_visible","MSG_SWITCH_MODULE_REN_POINT","sevenday_notice_event_not_avail","MSG_SWITCH_MINIMAP_HINTBOX_VISIBLE","updateIconBar","msg_open_new_city","time_notice_hour","ablili_rank_hide","task_notice_auto_track","MSG_FUNCTION_ACTION_CHANGED","op_activity_static_update"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc10_:int = 0;
         var _loc6_:* = null;
         var _loc9_:* = null;
         super.handleNotices(param1,param2);
         var _loc11_:* = param1;
         if("MSG_VIP_CHANGE" !== _loc11_)
         {
            if("MAIN_CITY_SCENE_45_INIT_CPL" !== _loc11_)
            {
               if("msg_refresh_small_map" !== _loc11_)
               {
                  if("msg_scene_camera_change" !== _loc11_)
                  {
                     if("msg_player_hero_CHANGE_POS" !== _loc11_)
                     {
                        if("msg_other_players_VISIBLE" !== _loc11_)
                        {
                           if("msg_sound_MUTE" !== _loc11_)
                           {
                              if("msg_add_NPC" !== _loc11_)
                              {
                                 if("MSG_NPC_FUNC_VO_CHANGE" !== _loc11_)
                                 {
                                    if("PLAYER_LEVEL_UP" !== _loc11_)
                                    {
                                       if("updateIconBar" !== _loc11_)
                                       {
                                          if("msg_update_icon_bar_visible" !== _loc11_)
                                          {
                                             if("MSG_SWITCH_MODULE_REN_POINT" !== _loc11_)
                                             {
                                                if("sevenday_notice_event_not_avail" !== _loc11_)
                                                {
                                                   if("MSG_SWITCH_MINIMAP_HINTBOX_VISIBLE" !== _loc11_)
                                                   {
                                                      if("msg_open_new_city" !== _loc11_)
                                                      {
                                                         if("time_notice_hour" !== _loc11_)
                                                         {
                                                            if("ablili_rank_hide" !== _loc11_)
                                                            {
                                                               if("MSG_FUNCTION_ACTION_CHANGED" !== _loc11_)
                                                               {
                                                                  if("op_activity_static_update" !== _loc11_)
                                                                  {
                                                                     if("task_notice_auto_track" === _loc11_)
                                                                     {
                                                                        if(isInGuide && scaleBtnBool == false && UIMgr.gameHeight < 730)
                                                                        {
                                                                           setHintHeight(true,true);
                                                                        }
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     resetIconBar();
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  resetTimeIconBar();
                                                               }
                                                            }
                                                            else
                                                            {
                                                               AbilityRankModel.ins.activityStartTime = 0;
                                                               resetIconBar();
                                                            }
                                                         }
                                                         else
                                                         {
                                                            updateForeshowIcons();
                                                         }
                                                      }
                                                      else
                                                      {
                                                         showWorldMapTips(true);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      this.hint_box.visible = param2;
                                                   }
                                                }
                                                else
                                                {
                                                   resetIconBar();
                                                }
                                             }
                                             else
                                             {
                                                _loc6_ = param2 as SwitchModuleRedPointMsg;
                                                if(_loc6_.vis)
                                                {
                                                   _loc9_ = ArrayUtil.findByAttr(redPointArr,"moduleID",_loc6_.moduleId);
                                                   if(!_loc9_)
                                                   {
                                                      _loc9_ = new RedPointVo(_loc6_.moduleId,_loc6_.count);
                                                      redPointArr.push(_loc9_);
                                                   }
                                                   _loc9_.count = _loc6_.count;
                                                }
                                                else
                                                {
                                                   ArrayUtil.removeItemByAttr(redPointArr,"moduleID",_loc6_.moduleId);
                                                }
                                                this.iconBarRef.validateRedPoint();
                                             }
                                          }
                                          else
                                          {
                                             iconBar.visible = param2;
                                          }
                                       }
                                       else
                                       {
                                          resetIconBar();
                                       }
                                    }
                                    else
                                    {
                                       validateFuncCount();
                                       resetIconBar();
                                    }
                                 }
                                 else
                                 {
                                    _loc10_ = param2;
                                    validateFuncCount(_loc10_);
                                 }
                              }
                              else
                              {
                                 _loc3_ = param2 as SceneNpc3D;
                                 if(!npcArr)
                                 {
                                    npcArr = [];
                                 }
                                 npcArr.push(_loc3_);
                              }
                           }
                           else if(SettingModel.ins.mainVolume == 0)
                           {
                              this.openSound = false;
                           }
                           else
                           {
                              this.openSound = true;
                           }
                        }
                        else if(SettingModel.ins.otherPlayers == 0)
                        {
                           this.openSee = true;
                        }
                        else
                        {
                           this.openSee = false;
                        }
                     }
                     else
                     {
                        _loc7_ = param2 as PoiAndRoVo;
                        _loc5_ = _loc7_.poi;
                        this.img_role.x = _loc5_.x / mapScale;
                        this.img_role.y = _loc5_.y / mapScale;
                        this.img_role.rotation = -_loc7_.ro;
                     }
                  }
                  else
                  {
                     lookAtPoi = param2 as Point;
                  }
               }
               else if(this.moduleInfo && this.moduleInfo.isShow)
               {
                  _loc8_ = param2 as int;
                  _loc4_ = UrlLib.sceneSmallJpg(_loc8_);
                  AppGlobalContext.QueueLoader.loadOne(new ResourceVo(_loc4_),FunctionDelegate.create(loadSmallCpl,_loc4_),"default_group");
                  this.txt_cityname.text = LocaleMgr.ins.getStr(StcMgr.ins.getStageVo(SceneModel.ins.sceneId).name);
               }
            }
            else
            {
               this.addNpcLabel();
            }
         }
         else
         {
            resetIconBar();
         }
      }
      
      private function validateFuncCount(param1:int = -1) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:Array = [];
         var _loc10_:int = 0;
         var _loc9_:* = pointArr;
         for each(var _loc4_ in pointArr)
         {
            _loc3_ = StcMgr.ins.getStageNpcRelationVo(int(_loc4_.name)).subFuncIdArr;
            updateHintBox(_loc6_,LocaleMgr.ins.getStr(StcMgr.ins.getStageNpcRelationVo(int(_loc4_.name)).name),int(_loc4_.name));
            if(param1 != -1 && _loc3_.indexOf(param1) > -1)
            {
               _loc4_.skin = "png.uiMiniMap.感叹号";
               _loc4_.anchorY = 0.8;
               (_loc4_.getChildAt(1) as Label).y = -13 - (_loc4_.getChildAt(1) as Label).height;
            }
            else
            {
               var _loc8_:int = 0;
               var _loc7_:* = _loc3_;
               for each(var _loc2_ in _loc3_)
               {
                  _loc5_ = NpcFuncService.ins.getVo(_loc2_);
                  if(_loc5_ && _loc5_.isLock == false)
                  {
                     if(_loc5_.count)
                     {
                        _loc4_.skin = "png.uiMiniMap.感叹号";
                        _loc4_.anchorY = 0.8;
                        (_loc4_.getChildAt(1) as Label).y = -13 - (_loc4_.getChildAt(1) as Label).height;
                        break;
                     }
                  }
               }
            }
         }
         this.hint_box.visible = true;
         hintListArr = _loc6_.sortOn("id").concat();
         if(scaleBtnBool)
         {
            this.hint_list.dataSource = hintListArr.slice(0,1);
         }
         else
         {
            this.hint_list.dataSource = hintListArr;
         }
      }
      
      public function addNpcLabel() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         while(pointArr.length > 0)
         {
            DisplayUtils.removeSelf(pointArr.pop());
         }
         pointArr = [];
         var _loc4_:Array = [];
         var _loc9_:int = 0;
         var _loc8_:* = npcArr;
         for each(var _loc1_ in npcArr)
         {
            _loc3_ = StcMgr.ins.getStageNpcRelationVo(_loc1_.npcGroupId);
            if(_loc3_.mount_func != 40501)
            {
               _loc2_ = LocaleMgr.ins.getStr(_loc3_.name);
               _loc5_ = new Image();
               _loc5_.skin = "png.uiMiniMap.圆点";
               _loc5_.anchorX = 0.5;
               _loc5_.anchorY = 0.5;
               _loc5_.x = _loc1_.pos2d.x / mapScale;
               _loc5_.y = _loc1_.pos2d.y / mapScale;
               _loc6_ = new Label();
               _loc5_.name = _loc1_.npcGroupId.toString();
               _loc5_.buttonMode = true;
               updateHintBox(_loc4_,_loc2_,_loc1_.npcGroupId);
               _loc5_.toolTip = _loc2_;
               _loc6_.width = 65;
               _loc6_.wordWrap = true;
               _loc6_.multiline = true;
               _loc6_.align = "center";
               _loc6_.autoSize = "none";
               _loc6_.text = _loc2_;
               _loc6_.x = -_loc6_.width / 2;
               _loc6_.y = -5 - _loc6_.height;
               if(ClientConfig.isRuLang())
               {
                  if(_loc3_.display_npc == 503)
                  {
                     _loc6_.x = 3;
                     _loc6_.y = -_loc6_.height / 2;
                  }
               }
               this.box_map.addChild(_loc5_);
               _loc5_.addChild(_loc6_);
               changeNpcIcon(_loc5_,_loc3_);
               pointArr.push(_loc5_);
               _loc5_.addEventListener("click",onClickMiniMap);
            }
         }
         var _loc7_:int = this.hint_list.height;
         this.hint_box.visible = true;
         hintListArr = _loc4_.sortOn("id").concat();
         if(scaleBtnBool)
         {
            this.hint_list.dataSource = hintListArr.slice(0,1);
         }
         else
         {
            this.hint_list.dataSource = hintListArr;
         }
         if(this.hint_list.height - _loc7_ > 0)
         {
            this.img_hint.height = 145 + (this.hint_list.height - _loc7_) * 145 / 95;
            this.img_hint.y = -14.2105263157895;
         }
      }
      
      private function isSummon(param1:HintVo, param2:int, param3:*) : Boolean
      {
         if(param1.text == HINT_BOX_ARR[0])
         {
            return true;
         }
         return false;
      }
      
      private function isSingle(param1:HintVo, param2:int, param3:*) : Boolean
      {
         if(param1.text == HINT_BOX_ARR[1])
         {
            return true;
         }
         return false;
      }
      
      private function isTeam(param1:HintVo, param2:int, param3:*) : Boolean
      {
         if(param1.text == HINT_BOX_ARR[2])
         {
            return true;
         }
         return false;
      }
      
      private function isGlobal(param1:HintVo, param2:int, param3:*) : Boolean
      {
         if(param1.text == HINT_BOX_ARR[3])
         {
            return true;
         }
         return false;
      }
      
      private function isShopHero(param1:HintVo, param2:int, param3:*) : Boolean
      {
         if(param1.text == HINT_BOX_ARR[4])
         {
            return true;
         }
         return false;
      }
      
      private function updateHintBox(param1:Array, param2:String, param3:int) : void
      {
         var _loc4_:* = null;
         if(param2.indexOf(HINT_BOX_ARR[0]) != -1)
         {
            _loc4_ = new HintVo();
            _loc4_.id = 0;
            _loc4_.text = HINT_BOX_ARR[0];
            _loc4_.npgRelationId = param3;
            _loc4_.avail_count = getFuncCount(param3);
            if(!param1.some(isSummon))
            {
               param1.push(_loc4_);
            }
         }
         else if(param2.indexOf(HINT_BOX_ARR[1]) != -1)
         {
            _loc4_ = new HintVo();
            _loc4_.id = 2;
            _loc4_.text = HINT_BOX_ARR[1];
            _loc4_.npgRelationId = param3;
            _loc4_.avail_count = getFuncCount(param3);
            if(!param1.some(isSingle))
            {
               param1.push(_loc4_);
            }
         }
         else if(param2.indexOf(HINT_BOX_ARR[2]) != -1)
         {
            _loc4_ = new HintVo();
            _loc4_.id = 3;
            _loc4_.text = HINT_BOX_ARR[2];
            _loc4_.npgRelationId = param3;
            _loc4_.avail_count = getFuncCount(param3);
            if(!param1.some(isTeam))
            {
               param1.push(_loc4_);
            }
         }
         else if(param2.indexOf(HINT_BOX_ARR[3]) != -1)
         {
            _loc4_ = new HintVo();
            _loc4_.id = 4;
            _loc4_.text = HINT_BOX_ARR[3];
            _loc4_.npgRelationId = param3;
            _loc4_.avail_count = getFuncCount(param3);
            if(!param1.some(isGlobal))
            {
               param1.push(_loc4_);
            }
         }
         else if(param2.indexOf(HINT_BOX_ARR[4]) != -1)
         {
            _loc4_ = new HintVo();
            _loc4_.id = 1;
            _loc4_.text = HINT_BOX_ARR[4];
            _loc4_.npgRelationId = param3;
            _loc4_.avail_count = ShopModel.ins.getLeftFreeRefreshTimes(60310 + 100000);
            TweenLite.killDelayedCallsTo(addShopTimes);
            TweenLite.delayedCall(ShopModel.ins.getNextTimeToAddFreeTimes(60310 + 100000) - ServerTimer.ins.second,addShopTimes);
            if(!param1.some(isShopHero))
            {
               param1.push(_loc4_);
            }
         }
      }
      
      private function addShopTimes() : void
      {
         if(!ModuleMgr.ins.isShow(60310))
         {
            ShopModel.ins.addFreeRefreshTimes(60310 + 100000);
         }
      }
      
      private function getFuncCount(param1:int) : int
      {
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:* = null;
         var _loc4_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(param1);
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         var _loc7_:Array = _loc4_.subFuncIdArr;
         var _loc5_:int = _loc7_.length;
         _loc9_ = 0;
         while(_loc9_ < _loc5_)
         {
            _loc8_ = _loc7_[_loc9_];
            _loc6_ = NpcFuncService.ins.getVo(_loc8_);
            if(_loc6_ && _loc6_.canOpen && !_loc6_.isLock)
            {
               _loc2_ = _loc2_ + _loc6_.count;
            }
            _loc9_++;
         }
         return _loc2_;
      }
      
      private function changeNpcIcon(param1:Image, param2:StcStageNpcRelationVo) : void
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = param2.subFuncIdArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ = param2.subFuncIdArr[_loc7_];
            _loc3_ = NpcFuncService.ins.getVo(_loc6_);
            if(_loc3_ && _loc3_.isLock == false)
            {
               if(_loc3_.count)
               {
                  param1.skin = "png.uiMiniMap.感叹号";
                  param1.anchorY = 0.8;
                  (param1.getChildAt(1) as Label).y = -13 - (param1.getChildAt(1) as Label).height;
                  break;
               }
            }
            _loc7_++;
         }
      }
      
      private function scaleBtnClick(param1:MouseEvent) : void
      {
         scaleBtnBool = !scaleBtnBool;
         this.isTempHint = isTempHint;
         hintHeight(scaleBtnBool);
         if(scaleBtnFilterBreath)
         {
            scaleBtnFilterBreath.dispose();
            scaleBtn.filters = null;
            LocalData.insCurPlayer.save("HAS_CLICK_MINIMAP_SCALE_BTN",true,true);
         }
      }
      
      public function setHintHeight(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false) : void
      {
         this.isTempHint = param2;
         this.isInGuide = param3;
         if(param1 != scaleBtnBool)
         {
            hintHeight(param1);
            scaleBtnBool = param1;
         }
      }
      
      private function hintHeight(param1:Boolean) : void
      {
         bool = param1;
         TweenLite.killTweensOf(img_hint);
         TweenLite.killTweensOf(img_suofang);
         if(bool)
         {
            hint_list.array = hintListArr.slice(0,1);
            TweenLite.to(img_hint,0.1,{
               "height":72,
               "onComplete":function():void
               {
                  TweenLite.killTweensOf(img_hint);
               }
            });
            TweenLite.to(img_suofang,0.2,{
               "rotation":180,
               "onComplete":function():void
               {
                  TweenLite.killTweensOf(img_suofang);
               }
            });
         }
         else
         {
            TweenLite.to(img_hint,0.3,{
               "height":182,
               "ease":Cubic.easeOut,
               "onComplete":function():void
               {
                  var _loc1_:* = null;
                  var _loc2_:int = 0;
                  hint_list.array = hintListArr;
                  _loc2_ = 0;
                  while(_loc2_ < hintListArr.length)
                  {
                     _loc1_ = hint_list.getCell(_loc2_) as MiniMapHintRender;
                     if(_loc1_)
                     {
                        _loc1_.tweenLineDataSource = hintListArr[_loc2_];
                     }
                     _loc2_++;
                  }
                  TweenLite.killTweensOf(img_hint);
               }
            });
            TweenLite.to(img_suofang,0.2,{
               "rotation":0,
               "onComplete":function():void
               {
                  TweenLite.killTweensOf(img_suofang);
               }
            });
         }
      }
      
      public function onClickMiniMap(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.target;
         if(this.img_map !== _loc3_)
         {
            ObserverMgr.ins.sendNotice("task_notice_auto_track",param1.target.name);
         }
         else if(img_map.bitmapData)
         {
            _loc2_ = new Point(box_map.mouseX * mapScale,box_map.mouseY * mapScale);
            ObserverMgr.ins.sendNotice("MSG_MINIMAP_POS_CHANGE",_loc2_);
            if(EnvConfig.ins.showDebugModule)
            {
               Log.debug(this,"SceneClickPoi:",_loc2_);
            }
         }
      }
      
      public function get lookAtPoi() : Point
      {
         return _lookAtPoi;
      }
      
      public function set lookAtPoi(param1:Point) : void
      {
         if(_lookAtPoi != param1)
         {
            _lookAtPoi = param1;
            validateLookAtPoi();
         }
      }
      
      private function loadSmallCpl(param1:String) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:BitmapData = AssetLib.getBitmapData(param1);
         if(_loc2_)
         {
            img_map.bitmapData = _loc2_;
            if(_loc2_.width >= g_mask.width && _loc2_.height >= g_mask.height)
            {
               mapScale = 8;
               this.img_map.scale = 1;
            }
            else
            {
               _loc3_ = Math.max(g_mask.width / _loc2_.width,g_mask.height / _loc2_.height);
               mapScale = 8 / _loc3_;
               this.img_map.scale = _loc3_ * 4 / 3;
               addNpcLabel();
            }
            validateLookAtPoi();
         }
      }
      
      private function validateLookAtPoi() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(img_map.bitmapData)
         {
            _loc1_ = g_mask.x + g_mask.width / 2 - _lookAtPoi.x / mapScale;
            _loc2_ = g_mask.y + g_mask.height / 2 - _lookAtPoi.y / mapScale;
            _loc1_ = MathUtil.maxMin(_loc1_,g_mask.x,g_mask.x - (img_map.bitmapData.width * img_map.scale - g_mask.width));
            _loc2_ = MathUtil.maxMin(_loc2_,g_mask.y,g_mask.y - (img_map.bitmapData.height * img_map.scale - g_mask.height));
            box_map.x = _loc1_;
            box_map.y = _loc2_;
         }
      }
      
      private function showWorldMapTips(param1:Boolean) : void
      {
         box_tips.visible = param1;
         if(param1)
         {
            TimerManager.ins.doLoop(5000,showMapTip);
         }
         else
         {
            TimerManager.ins.clearTimer(showMapTip);
         }
      }
      
      private function showMapTip() : void
      {
         box_tips.y = 74;
         box_tips.alpha = 1;
         TweenLite.from(box_tips,0.5,{
            "y":60,
            "alpha":0
         });
      }
      
      override public function preClose(param1:Object = null) : void
      {
         TimerManager.ins.clearTimer(fadeView_fadeInCpl);
         switchEventListeners(false);
         img_map.bitmapData = null;
         npcArr = null;
         this.preCloseCpl();
      }
      
      override protected function get bounds() : Rectangle
      {
         return new Rectangle(this.x,this.y,this.width,this.height);
      }
   }
}
