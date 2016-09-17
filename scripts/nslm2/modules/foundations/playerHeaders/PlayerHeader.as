package nslm2.modules.foundations.playerHeaders
{
   import game.ui.playerHeaders.PlayerHeaderUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.mainCities.MainCityModuleParam;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.configs.ClientConfig;
   import morn.core.components.Button;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import nslm2.utils.LabelMed;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.event.WealthChangeEvent;
   import nslm2.common.model.CardInfoModel;
   import flash.geom.Point;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mediators.RollHighLightMediator;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mediators.RollMediator;
   
   public class PlayerHeader extends PlayerHeaderUI implements INewerGuideCheckHandler
   {
       
      
      private var _updateFightValueDelay:Boolean;
      
      private var isFightValueChanged:Boolean;
      
      private var oldValue:int;
      
      private var eff_diamond:BmcSpriteSheet;
      
      private var eff_gold:BmcSpriteSheet;
      
      private var eff_stamina:BmcSpriteSheet;
      
      private var eff_stren:BmcSpriteSheet;
      
      private var stageIdArr:Array;
      
      public function PlayerHeader()
      {
         stageIdArr = [10000,10001,10002];
         super();
         this.img_headerIcon.addEventListener("click",headerIcon_onClick);
         this.img_headerIcon.buttonMode = true;
         BmcSpriteSheet.preload(new <int>[20100001,20100000,20100002,20100003,20100004]);
         this.txt_gold.wealthVo = WealthUtil.countVo(1);
         eff_gold = new BmcSpriteSheet();
         eff_gold.x = txt_gold.x - 15;
         eff_gold.y = txt_gold.y - 16;
         eff_gold.init(20100001,1,"all",false,1,0);
         addChild(eff_gold);
         this.txt_diamond.isPlayerDiamond = true;
         this.txt_diamond.wealthVo = WealthUtil.countVo(3);
         eff_diamond = new BmcSpriteSheet();
         eff_diamond.x = txt_diamond.x - 20;
         eff_diamond.y = txt_diamond.y - 15;
         eff_diamond.init(20100000,1,"all",false,1,0);
         addChild(eff_diamond);
         this.small_diamond.wealthVo = WealthUtil.countVo(3);
         this.small_diamond_bind.wealthVo = WealthUtil.countVo(4);
         this.txt_diamond.addEventListener("REFRESH",onDiamondRefresh);
         this.txt_stamina.wealthVo = WealthUtil.countVo(2);
         eff_stamina = new BmcSpriteSheet();
         eff_stamina.x = txt_stamina.x - 19;
         eff_stamina.y = txt_stamina.y - 16;
         eff_stamina.init(20100002,1,"all",false,1,0,endHandler);
         addChild(eff_stamina);
         img_vip.buttonMode = true;
         txt_vip.buttonMode = true;
         txt_vip.addEventListener("click",onZhengXing);
         img_vip.addEventListener("click",onZhengXing);
         img_bg.addEventListener("click",onZhengXing);
         eff_stren = new BmcSpriteSheet();
         eff_stren.x = figthValueBox.x;
         eff_stren.y = figthValueBox.y - 23;
         eff_stren.init(20100004,1,"all",true,1,0);
         DisplayUtils.addChildBelow(eff_stren,this.figthValueBox);
         this.btn_addStamina.toolTip = LocaleMgr.ins.getStr(999000329);
         this.txt_zhen1.addEventListener("click",onZhengXing);
         this.txt_zhen2.addEventListener("click",onZhengXing);
         this.txt_zhen3.addEventListener("click",onZhengXing);
         this.box_renzheng.buttonMode = true;
         this.box_renzheng.addEventListener("click",this.box_renzheng_click);
         this.box_renzheng.parts.push(new RollHighLightMediator(this.box_renzheng,this.box_renzheng));
         validateBoxVipAuth();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         var _loc1_:WealthVo = new WealthVo();
         _loc1_.kind = 10;
         _loc1_.useStcCount = true;
         this.btn_level.toolTip = _loc1_;
         if(EnvConfig.ins.hideForBS)
         {
            this.img_vip.visible = false;
            this.txt_vip.visible = false;
            this.btn_addMoney.visible = false;
         }
         this.txt_vip.value = PlayerModel.ins.vip;
         this.parts.push(new RollMediator(this.img_bg,onRoll));
         this.txt_zhen1.visible = false;
         this.txt_zhen2.visible = false;
         this.txt_zhen3.visible = false;
         this.tab_city.visible = false;
         tab_city.labels = LocaleMgr.ins.getStr(999000330);
         tab_city.selectedIndex = 0;
         tab_city.userChangeHandler = tab_city_handler;
         this.txt_stamina.txt_num.addEventListener("change",wealthRender_onResize);
         this.txt_stamina.txt_num.addEventListener("resize",wealthRender_onResize);
         btn_fScreen.addEventListener("click",clickFullScreenHandler);
         btn_mScreen.addEventListener("click",clickFullScreenHandler);
         GlobalRef.playerHeader_icon_fullscreen = btn_fScreen;
         App.stage.addEventListener("keyDown",onKeyboardEscEventHandler);
      }
      
      protected function onDiamondRefresh(param1:Event) : void
      {
         this.small_diamond.wealthVo = WealthUtil.countVo(3);
         this.small_diamond_bind.refreshData();
      }
      
      private function onKeyboardEscEventHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 27)
         {
            App.stage.displayState = "normal";
            btn_fScreen.visible = true;
            btn_mScreen.visible = false;
         }
      }
      
      private function clickFullScreenHandler(param1:MouseEvent) : void
      {
         if(App.stage.displayState == "normal")
         {
            App.stage.displayState = "fullScreenInteractive";
            btn_mScreen.visible = true;
            btn_fScreen.visible = false;
         }
         else
         {
            App.stage.displayState = "normal";
            btn_fScreen.visible = true;
            btn_mScreen.visible = false;
         }
      }
      
      private function wealthRender_onResize(param1:Event) : void
      {
         this.btn_addStamina.x = this.txt_stamina.x + this.txt_stamina.txt_num.x + this.txt_stamina.txt_num.textField.textWidth + 4 + 2;
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(this.box_vip,0.2,{"y":-5});
         }
         else
         {
            TweenLite.to(this.box_vip,0.2,{"y":0});
         }
      }
      
      private function overVip(param1:Event) : void
      {
         TweenLite.to(this.img_vip,0.5,{"y":41});
         TweenLite.to(this.txt_vip,0.5,{"y":42});
      }
      
      private function outVip(param1:Event) : void
      {
         TweenLite.to(this.img_vip,0.5,{"y":46});
         TweenLite.to(this.txt_vip,0.5,{"y":47});
      }
      
      public function doEff() : void
      {
         eff_gold.init(20100001,1,"all",false,1,0);
         eff_diamond.init(20100000,1,"all",false,1,0);
         eff_stamina.init(20100002,1,"all",false,1,0);
      }
      
      public function endHandler() : void
      {
         TweenLite.delayedCall(1,startLoop);
      }
      
      public function startLoop() : void
      {
         TimerManager.ins.doOnce(3000,doEff);
      }
      
      private function tab_city_handler(param1:int) : void
      {
         var _loc2_:int = stageIdArr[param1];
         ModuleMgr.ins.showModule(40500,new MainCityModuleParam(_loc2_));
      }
      
      private function onZhengXing(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.currentTarget;
         if(this.txt_zhen1 !== _loc2_)
         {
            if(this.txt_zhen2 !== _loc2_)
            {
               if(this.txt_zhen3 !== _loc2_)
               {
                  if(this.img_vip !== _loc2_)
                  {
                     if(this.txt_vip !== _loc2_)
                     {
                        if(this.img_bg !== _loc2_)
                        {
                        }
                     }
                     addr23:
                     ModuleMgr.ins.showModule(10800,1);
                  }
                  §§goto(addr23);
               }
               else
               {
                  AlertUtil.alert("ccc");
               }
            }
            else
            {
               AlertUtil.alert("bbb");
            }
         }
         else
         {
            AlertUtil.alert("aaa");
         }
      }
      
      private function validateBoxVipAuth() : void
      {
         var _loc1_:Boolean = false;
         if(EnvConfig.ins.ptId == 590 || EnvConfig.ins.ptId == 82)
         {
            if(PlayerModel.ins.vip >= 7)
            {
               _loc1_ = true;
            }
         }
         else if(EnvConfig.ins.ptId == 15)
         {
            _loc1_ = true;
         }
         if(ClientConfig.isChineseLang())
         {
            _loc1_ = false;
         }
         this.box_renzheng.visible = false;
      }
      
      private function box_renzheng_click(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(60600);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_addStamina !== _loc3_)
         {
            if(this.btn_addMoney === _loc3_)
            {
               if(param2.altKey && param2.ctrlKey)
               {
                  VipModel.ins.showPopWin();
               }
               else
               {
                  VipModel.ins.gotoCharge();
               }
            }
         }
         else
         {
            AlertUtil.lackStamina(false);
         }
      }
      
      private function headerIcon_onClick(param1:MouseEvent) : void
      {
         if(EnvConfig.ins.showDevModule && param1.ctrlKey && param1.altKey)
         {
            ModuleMgr.ins.showModule(90310);
         }
         else if(!(EnvConfig.ins.showDevModule && param1.ctrlKey))
         {
            if(EnvConfig.ins.showQaModule && param1.altKey)
            {
               ModuleMgr.ins.showModule(90300);
            }
            else
            {
               ModuleMgr.ins.showModule(30810);
            }
         }
      }
      
      private function updatePlayerFigthValue() : void
      {
         isFightValueChanged = true;
         if(!_updateFightValueDelay)
         {
            if(PlayerModel.ins.totalFightValue - (this.figthValueBox as FightValueBox).tweenValue > 0)
            {
               NewerAlertModel.ins.checkFightValueUp();
            }
            (this.figthValueBox as FightValueBox).tweenValue = PlayerModel.ins.totalFightValue;
            isFightValueChanged = false;
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.btn_level.text = String(PlayerModel.ins.level);
         this.txt_name.text = LabelMed.vipParam(PlayerModel.ins.vipInfoVo) + PlayerModel.ins.playerInfo.name;
         this.txt_name.color = ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank));
         (this.figthValueBox as FightValueBox).value = PlayerModel.ins.totalFightValue;
         this.img_headerIcon.url = UrlLib.playerHeaderIcon(PlayerModel.ins.sex);
         this.img_vipredpoint.visible = VipModel.ins.haveGiftsToBuy();
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         refreshCardInfo();
         this.btn_level.text = String(PlayerModel.ins.level);
         GlobalRef.playerHeader = this;
         GlobalRef.playerHeader_icon_gold = this.txt_gold;
         GlobalRef.playerHeader_icon_diamond = this.txt_diamond;
         GlobalRef.playerHeader_icon_military = this.render_military.img_militaryIcon;
         GlobalRef.playerHeader_icon_stamina = this.txt_stamina;
         this.txt_vip.value = PlayerModel.ins.vip;
         NGUtil.checkModuleShow(this.moduleId);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["wealthChange","msg_chat_history_show_kind_change","role_info_update_fight_value","lock_total_fight_value_change","evtChangePlayerNameColor","PLAYER_VIP_UP","refreshHeaderRedPoint","MSG_VIP_CHANGE","MSG_CARD_INFO_CHANGED"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("MSG_VIP_CHANGE" !== _loc4_)
         {
            if("wealthChange" !== _loc4_)
            {
               if("msg_chat_history_show_kind_change" !== _loc4_)
               {
                  if("role_info_update_fight_value" !== _loc4_)
                  {
                     if("evtChangePlayerNameColor" !== _loc4_)
                     {
                        if("lock_total_fight_value_change" !== _loc4_)
                        {
                           if("PLAYER_VIP_UP" !== _loc4_)
                           {
                              if("refreshHeaderRedPoint" !== _loc4_)
                              {
                                 if("MSG_CARD_INFO_CHANGED" === _loc4_)
                                 {
                                    refreshCardInfo();
                                 }
                              }
                              else
                              {
                                 this.img_vipredpoint.visible = VipModel.ins.haveGiftsToBuy();
                              }
                           }
                           else
                           {
                              this.txt_vip.value = PlayerModel.ins.vip;
                              this.validateBoxVipAuth();
                           }
                        }
                        else
                        {
                           updateFightValueDelay = param2;
                        }
                     }
                     else
                     {
                        this.txt_name.color = ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank));
                     }
                  }
                  else
                  {
                     updatePlayerFigthValue();
                  }
               }
               else
               {
                  switch((int(param2 as int)) - 1)
                  {
                     case 0:
                        this.alpha = 1;
                        break;
                     case 1:
                        this.alpha = 0.3;
                  }
               }
            }
            else
            {
               _loc3_ = param2 as WealthChangeEvent;
               if(_loc3_.wealthType == 1010)
               {
                  this.btn_level.text = String(PlayerModel.ins.level);
               }
            }
         }
         else
         {
            this.txt_name.text = LabelMed.vipParam(PlayerModel.ins.vipInfoVo) + PlayerModel.ins.playerInfo.name;
         }
      }
      
      private function refreshCardInfo() : void
      {
         var _loc2_:Array = CardInfoModel.ins.getIdArr();
         var _loc1_:int = _loc2_.length;
         this.list_card.repeatY = Math.ceil(_loc1_ / 4);
         this.list_card.dataSource = _loc2_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function set updateFightValueDelay(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(_updateFightValueDelay != param1)
         {
            _updateFightValueDelay = param1;
            if(!_updateFightValueDelay)
            {
               if(isFightValueChanged)
               {
                  if(PlayerModel.ins.totalFightValue != oldValue)
                  {
                     _loc3_ = PlayerModel.ins.totalFightValue - oldValue;
                     _loc2_ = new Point(UIMgr.stage.stageWidth >> 1,UIMgr.gameHeight - 200);
                     AlertUtil.showTotalFightPowerChangeTip(_loc3_,floatCompleteHandler,DisplayUtils.globarCenter(this.figthValueBox),_loc2_);
                  }
                  if(PlayerModel.ins.totalFightValue > oldValue)
                  {
                     NewerAlertModel.ins.checkFightValueUp();
                  }
               }
            }
            else
            {
               oldValue = PlayerModel.ins.totalFightValue;
            }
         }
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 20030))
         {
            if(VipModel.ins.firstCharge == true || VipModel.ins.haveGetVip0Gift())
            {
               return 0;
            }
            GlobalRef.chapterModuleShowAgainVo = null;
         }
         return 1;
      }
      
      private function floatCompleteHandler() : void
      {
         (this.figthValueBox as FightValueBox).tweenValue = PlayerModel.ins.totalFightValue;
      }
   }
}
