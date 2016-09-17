package nslm2.modules.foundations.mainToolBar
{
   import game.ui.mainToolBar.BottomIconRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import morn.core.components.Label;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.MouseEvent;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.arenas.ArenaService;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   import nslm2.modules.funnies.arenas.ArenaUtil;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.types.FunctionType;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   import morn.customs.FilterLib;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS3;
   import nslm2.utils.WealthUtil;
   import nslm2.common.globals.GlobalRef;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.TweenLite;
   
   public class BottomIconRender extends BottomIconRenderUI implements IObserver
   {
      
      public static var WW:int = 65;
      
      public static const HH:int = 78;
      
      public static const durationGap:Number = 0.1;
      
      public static const duration:Number = 0.2;
       
      
      private var rollMed:RoleGrowFilterMed;
      
      private var _timerLabel:Label;
      
      private var _cntDown:int;
      
      public var redPointArr:Vector.<nslm2.modules.foundations.mainToolBar.RedPointVo>;
      
      public var newArr:Vector.<int>;
      
      private var _bottomEff:BmcSpriteSheet;
      
      public var isVertical:Boolean = false;
      
      public var tempPos:int = -1;
      
      public var newPos:int = -1;
      
      public var useFade:Boolean;
      
      public function BottomIconRender()
      {
         if(ClientConfig.isChineseLang())
         {
            WW = 65;
         }
         else
         {
            WW = 75;
         }
         super();
         this.img_redPoi.visible = true;
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.buttonMode = true;
         rollMed = new RoleGrowFilterMed(this,null);
         this.parts.push(new RoleGrowFilterMed(this,null));
         this.addEventListener("click",icon_click);
         box_wealth.visible = false;
      }
      
      private function onTimer() : void
      {
         _cntDown = Number(_cntDown) - 1;
         _timerLabel.num = _cntDown;
         if(_cntDown == 0)
         {
            TimerManager.ins.clearTimer(onTimer);
            this.removeChild(_timerLabel);
            _timerLabel.dispose();
            _timerLabel = null;
         }
      }
      
      private function icon_click(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:StcFunctionVo = StcMgr.ins.getFunctionVo(this.moduleId);
         if(_loc2_ && _loc2_.canEnter == false)
         {
            AlertUtil.floadNoOpenModule();
            return;
         }
         var _loc4_:* = this.moduleId;
         if(13333 !== _loc4_)
         {
            if(50221 !== _loc4_)
            {
               if(41224 !== _loc4_)
               {
                  if(11306 !== _loc4_)
                  {
                     if(50240 !== _loc4_)
                     {
                        if(40714 !== _loc4_)
                        {
                           if(50244 !== _loc4_)
                           {
                              if(50245 !== _loc4_)
                              {
                                 if(50220 !== _loc4_)
                                 {
                                    if(50251 !== _loc4_)
                                    {
                                       if(42009 !== _loc4_)
                                       {
                                          if(40761 !== _loc4_)
                                          {
                                             if(40762 !== _loc4_)
                                             {
                                                if(40768 !== _loc4_)
                                                {
                                                   if(50251 !== _loc4_)
                                                   {
                                                      if(40771 !== _loc4_)
                                                      {
                                                         if(40773 !== _loc4_)
                                                         {
                                                            if(50249 !== _loc4_)
                                                            {
                                                               if(50246 !== _loc4_)
                                                               {
                                                                  if(50248 !== _loc4_)
                                                                  {
                                                                     if(50247 !== _loc4_)
                                                                     {
                                                                        if(42005 !== _loc4_)
                                                                        {
                                                                           if(42006 !== _loc4_)
                                                                           {
                                                                              if(42010 !== _loc4_)
                                                                              {
                                                                                 if(42013 !== _loc4_)
                                                                                 {
                                                                                    if(42007 !== _loc4_)
                                                                                    {
                                                                                       if(50280 !== _loc4_)
                                                                                       {
                                                                                          if(50210 !== _loc4_)
                                                                                          {
                                                                                             if(41502 !== _loc4_)
                                                                                             {
                                                                                                if(41501 !== _loc4_)
                                                                                                {
                                                                                                   if(10623 !== _loc4_)
                                                                                                   {
                                                                                                      if(41213 !== _loc4_)
                                                                                                      {
                                                                                                         if(41212 !== _loc4_)
                                                                                                         {
                                                                                                            if(41210 !== _loc4_)
                                                                                                            {
                                                                                                               if(FunctionType.ALL_SHOP_ARR.indexOf(this.moduleId) != -1)
                                                                                                               {
                                                                                                                  if(50350 == this.moduleId)
                                                                                                                  {
                                                                                                                     ModuleMgr.ins.showOrCloseModule(ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                  }
                                                                                                                  ModuleMgr.ins.showOrCloseModule(60300,new ShopOpenVo(this.moduleId),ModuleMgr.ins.popLayer.curModuleId);
                                                                                                               }
                                                                                                               else if(FunctionType.MYSTERY_SHOP_ARR.indexOf(this.moduleId) != -1)
                                                                                                               {
                                                                                                                  ModuleMgr.ins.showOrCloseModule(60310,this.moduleId,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                               }
                                                                                                               else
                                                                                                               {
                                                                                                                  if(50340 == this.moduleId)
                                                                                                                  {
                                                                                                                     ModuleMgr.ins.showOrCloseModule(ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                  }
                                                                                                                  ModuleMgr.ins.showOrCloseModule(this.moduleId);
                                                                                                               }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                               _loc3_ = ServerTimer.ins.date.hours;
                                                                                                               if(_loc3_ <= 22 && _loc3_ >= 10)
                                                                                                               {
                                                                                                                  if(EnvConfig.ins.showDevModule && param1.altKey)
                                                                                                                  {
                                                                                                                     if(TeamGuajiService.ins.curPlayerTeamInfo)
                                                                                                                     {
                                                                                                                        ModuleMgr.ins.showOrCloseModule(10624);
                                                                                                                     }
                                                                                                                     else
                                                                                                                     {
                                                                                                                        ModuleMgr.ins.showOrCloseModule(10623);
                                                                                                                     }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                     ModuleMgr.ins.showOrCloseModule(this.moduleId);
                                                                                                                  }
                                                                                                               }
                                                                                                               else
                                                                                                               {
                                                                                                                  ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210608)));
                                                                                                               }
                                                                                                            }
                                                                                                         }
                                                                                                         else
                                                                                                         {
                                                                                                            if(ModuleMgr.ins.isShow(41212))
                                                                                                            {
                                                                                                               NGUtil.checkModuleShow(41212);
                                                                                                            }
                                                                                                            if(TeamGuajiModel.ins.isGuaji && ModuleMgr.ins.isShow(41212))
                                                                                                            {
                                                                                                               AlertUtil.float(LocaleMgr.ins.getStr(41210618));
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                               ModuleMgr.ins.showModule(41212,TeamGuajiModel.ins.isGuaji);
                                                                                                            }
                                                                                                         }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                         ModuleMgr.ins.showOrCloseModule(50900,41213);
                                                                                                      }
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      guajiTeamPanelHandler();
                                                                                                   }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                   ObserverMgr.ins.sendNotice("SHENYUAN_PASS_FLOOR");
                                                                                                }
                                                                                             }
                                                                                             else
                                                                                             {
                                                                                                ObserverMgr.ins.sendNotice("SHENYUAN_OPEN_FRIENT_ASSIT");
                                                                                             }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             ModuleMgr.ins.showOrCloseModule(12201,new HelpAndRuleParam(LocaleMgr.ins.getStr(9100000 + 50210),LocaleMgr.ins.getStr(50200014)),ModuleMgr.ins.popLayer.curModuleId);
                                                                                          }
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          ModuleMgr.ins.showOrCloseModule(50900,50280);
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       ObserverMgr.ins.sendNotice("OPT_TPKC_OPEN_REPORT");
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    ObserverMgr.ins.sendNotice("OPT_TPKC_ENTER_LAST_FINAL_VIEW");
                                                                                 }
                                                                              }
                                                                              else
                                                                              {
                                                                                 ModuleMgr.ins.showOrCloseModule(42010);
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              ModuleMgr.ins.showOrCloseModule(42006);
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           ModuleMgr.ins.showOrCloseModule(42005);
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        ModuleMgr.ins.showOrCloseModule(50247);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     ModuleMgr.ins.showOrCloseModule(50248);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  ModuleMgr.ins.showOrCloseModule(50246);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               ModuleMgr.ins.showOrCloseModule(50249,0);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            ModuleMgr.ins.showOrCloseModule(40773);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         ModuleMgr.ins.showOrCloseModule(40771);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      ObserverMgr.ins.sendNotice("OPT_SHOW_REWARD");
                                                   }
                                                }
                                                else
                                                {
                                                   ObserverMgr.ins.sendNotice("GPK_OPT_SURRENDER");
                                                }
                                             }
                                             else
                                             {
                                                ObserverMgr.ins.sendNotice("GPK_OPT_LOTTERY");
                                             }
                                          }
                                          else
                                          {
                                             ObserverMgr.ins.sendNotice("GPK_OPT_OPEN_CHALLENGE_PANEL");
                                          }
                                       }
                                       else
                                       {
                                          ObserverMgr.ins.sendNotice("OPT_TPKC_OPEN_RANK_REWARD");
                                       }
                                    }
                                    else
                                    {
                                       ObserverMgr.ins.sendNotice("OPT_SHOW_REWARD");
                                    }
                                 }
                                 else
                                 {
                                    ArenaUtil.ins.showChangeSigatue();
                                 }
                              }
                              else
                              {
                                 if(_cntDown != 0)
                                 {
                                    AlertUtil.float(_cntDown + LocaleMgr.ins.getStr(999000301));
                                    return;
                                 }
                                 _timerLabel = new Label();
                                 _cntDown = 5;
                                 _timerLabel.autoSize = "center";
                                 _timerLabel.x = (this.width >> 1) - 13;
                                 _timerLabel.y = (this.height >> 1) - 24;
                                 _timerLabel.num = _cntDown;
                                 _timerLabel.style = "不足禁止红";
                                 _timerLabel.size = 40;
                                 TimerManager.ins.doLoop(1000,onTimer);
                                 this.addChild(_timerLabel);
                                 ObserverMgr.ins.sendNotice("OPT_CHANGE_ENEMY");
                              }
                           }
                        }
                        addr138:
                        ModuleMgr.ins.showOrCloseModule(60300,new ShopOpenVo(this.moduleId),ModuleMgr.ins.popLayer.curModuleId);
                     }
                     addr137:
                     §§goto(addr138);
                  }
                  addr136:
                  §§goto(addr137);
               }
               §§goto(addr136);
            }
            else
            {
               if(_cntDown != 0)
               {
                  AlertUtil.float(_cntDown + LocaleMgr.ins.getStr(999000301));
                  return;
               }
               _timerLabel = new Label();
               _cntDown = 5;
               _timerLabel.autoSize = "center";
               _timerLabel.x = (this.width >> 1) - 13;
               _timerLabel.y = (this.height >> 1) - 24;
               _timerLabel.num = _cntDown;
               _timerLabel.style = "不足禁止红";
               _timerLabel.size = 40;
               TimerManager.ins.doLoop(1000,onTimer);
               this.addChild(_timerLabel);
               ArenaService.ins.changeArenaPlayer();
            }
         }
         else
         {
            if(EnvConfig.ins.showDevModule && param1.altKey)
            {
               ModuleMgr.ins.showOrCloseModule(13336,22000);
               return;
            }
            if(NpcFuncService.ins.isOpenTime(13336))
            {
               ModuleMgr.ins.showOrCloseModule(13336);
            }
            else if(NpcFuncService.ins.isOpenTime(13333))
            {
               ModuleMgr.ins.showOrCloseModule(13333);
            }
            else
            {
               AlertUtil.floadFuncTimeIsExpire();
               ObserverMgr.ins.sendNotice("updateIconBar");
            }
         }
      }
      
      private function guajiTeamPanelHandler() : void
      {
         if(TeamGuajiService.ins.curPlayerTeamInfo)
         {
            ModuleMgr.ins.showOrCloseModule(10624);
         }
         else
         {
            ModuleMgr.ins.showOrCloseModule(10623);
         }
      }
      
      public function get moduleId() : int
      {
         return this.dataSource as int;
      }
      
      public function set moduleId(param1:int) : void
      {
         this.dataSource = param1;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.moduleId > 0)
         {
            FuncOpenAutoCtrl.updateFuncBtnStateTip(this.moduleId,this.stateIcon);
            ObserverMgr.ins.regObserver(this);
            this.toolTip = LocaleMgr.ins.getStr(9000000 + this.moduleId);
            this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId);
            _loc2_ = LocaleMgr.ins.getStr(9000000 + this.moduleId);
            if(_loc2_.indexOf("\n") != -1)
            {
               this.txt_names.y = 37;
               this.txt_names.height = 40;
               this.txt_names.text = _loc2_;
            }
            else
            {
               this.txt_names.y = 53;
               this.txt_names.height = 22;
               this.txt_names.text = _loc2_;
            }
            if(ClientConfig.isRuLang() && this.moduleId == 50249)
            {
               this.x = -10;
               this.txt_names.y = 37;
               this.txt_names.height = 40;
               this.txt_names.wordWrap = true;
               this.txt_names.multiline = true;
            }
            rollMed.glowFilter = FilterLib.BORDER_YELLOW;
            if(FunctionType.ALL_SHOP_ARR.indexOf(moduleId) != -1)
            {
               this.box_alert.visible = true;
               (this.box_alert as TaskAlertRenderS3).show(moduleId);
            }
            else
            {
               this.box_alert.visible = false;
            }
            var _loc3_:* = moduleId;
            if(41224 !== _loc3_)
            {
               if(50240 !== _loc3_)
               {
                  if(11306 !== _loc3_)
                  {
                     if(50504 !== _loc3_)
                     {
                        if(50244 !== _loc3_)
                        {
                           if(40766 !== _loc3_)
                           {
                              if(42008 !== _loc3_)
                              {
                                 if(50702 !== _loc3_)
                                 {
                                    if(32105 === _loc3_)
                                    {
                                       box_wealth.visible = true;
                                       GlobalRef.bottom_icon_SecretExplore = wealthRender;
                                       wealthRender.dataSource = WealthUtil.createStcVo(42);
                                    }
                                 }
                                 else
                                 {
                                    box_wealth.visible = true;
                                    GlobalRef.bottom_icon_SecretExplore = wealthRender;
                                    wealthRender.dataSource = WealthUtil.createStcVo(33);
                                 }
                              }
                              else
                              {
                                 box_wealth.visible = true;
                                 GlobalRef.bottom_icon_tpkcCoin = wealthRender;
                                 wealthRender.dataSource = WealthUtil.createStcVo(19);
                              }
                           }
                           else
                           {
                              box_wealth.visible = true;
                              GlobalRef.bottom_icon_GPKCoin = wealthRender;
                              wealthRender.dataSource = WealthUtil.createStcVo(18);
                           }
                        }
                        else
                        {
                           box_wealth.visible = true;
                           GlobalRef.bottom_icon_pkcrossCoin = wealthRender;
                           wealthRender.dataSource = WealthUtil.createStcVo(17);
                        }
                     }
                     else
                     {
                        box_wealth.visible = true;
                        wealthRender.dataSource = WealthUtil.createStcVo(14);
                     }
                  }
                  else
                  {
                     box_wealth.visible = true;
                     GlobalRef.bottom_icon_shenYuanCoin = wealthRender;
                     wealthRender.dataSource = WealthUtil.createStcVo(12);
                  }
               }
               else
               {
                  box_wealth.visible = true;
                  GlobalRef.bottom_icon_arena_coin = wealthRender;
                  wealthRender.dataSource = WealthUtil.createStcVo(5);
               }
            }
            else
            {
               box_wealth.visible = true;
               wealthRender.dataSource = WealthUtil.createStcVo(7);
               GlobalRef.bottom_icon_guaji_coin = wealthRender;
            }
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
            this.toolTip = null;
            rollMed.glowFilter = null;
         }
         this.validateRedPoint();
      }
      
      public function validateRedPoint() : void
      {
         var _loc1_:* = null;
         this.img_redPoi.visible = false;
         this.img_new.visible = false;
         this.countPoint.visible = false;
         if(redPointArr)
         {
            if(this.moduleId > 0)
            {
               _loc1_ = ArrayUtil.findByAttr(redPointArr,"moduleID",moduleId);
               if(_loc1_)
               {
                  if(_loc1_.count > 0)
                  {
                     this.countPoint.visible = true;
                     this.countPoint.txt_count.text = _loc1_.count + "";
                     this.img_redPoi.visible = false;
                  }
                  else
                  {
                     this.countPoint.visible = false;
                     this.img_redPoi.visible = true;
                  }
               }
               if(moduleId == 9900004)
               {
                  this.img_redPoi.visible = false;
                  if(_loc1_)
                  {
                     playBottomEff();
                  }
                  else
                  {
                     stopBottomEff();
                  }
               }
            }
         }
         if(this.img_redPoi.visible == false && newArr)
         {
            if(this.moduleId > 0)
            {
               if(newArr.indexOf(this.moduleId) != -1)
               {
                  this.img_new.visible = true;
               }
            }
         }
      }
      
      private function playBottomEff() : void
      {
         if(_bottomEff == null)
         {
            _bottomEff = new BmcSpriteSheet();
            _bottomEff.x = 6;
            _bottomEff.y = -8;
            _bottomEff.init(115004,1,"all",true);
            this.addChild(_bottomEff);
         }
         else
         {
            _bottomEff.gotoAndPlay(1);
         }
      }
      
      private function stopBottomEff() : void
      {
         if(_bottomEff)
         {
            DisplayUtils.removeSelf(_bottomEff);
            _bottomEff.dispose();
            _bottomEff = null;
         }
      }
      
      public function tweenTemp(param1:Boolean) : void
      {
         if(isVertical)
         {
            TweenLite.to(this,!!useFade?!!param1?0:0.2:0,{
               "y":0,
               "onComplete":tweenTempCpl
            });
         }
         else
         {
            TweenLite.to(this,!!useFade?!!param1?0:0.2:0,{
               "x":-WW * 0,
               "onComplete":tweenTempCpl
            });
         }
      }
      
      private function tweenTempCpl() : void
      {
         if(this.newPos == -1)
         {
            this.dispose();
         }
         else if(isVertical)
         {
            TweenLite.to(this,!!useFade?0.1 * (newPos + 1):0,{"y":-78 * (newPos + 1)});
         }
         else
         {
            TweenLite.to(this,!!useFade?0.1 * (newPos + 1):0,{"x":-WW * (newPos + 1)});
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_changeBottomShopWealth","MSG_UPDATE_FUNCTION_NEW"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_changeBottomShopWealth" !== _loc3_)
         {
            if("MSG_UPDATE_FUNCTION_NEW" === _loc3_)
            {
               FuncOpenAutoCtrl.updateFuncBtnStateTip(this.moduleId,this.stateIcon);
            }
         }
         else
         {
            wealthRender.refreshData();
         }
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(onTimer);
         if(_timerLabel)
         {
            DisplayUtils.removeSelf(_timerLabel);
            _timerLabel = null;
         }
         rollMed = null;
         redPointArr = null;
         newArr = null;
         super.dispose();
      }
   }
}
