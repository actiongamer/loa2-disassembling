package nslm2.modules.funnies.guildPKCrossSer
{
   import game.ui.guildPKCrossSer.GPKCrossModuleUI;
   import flash.display.DisplayObjectContainer;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.pkCrossSer.AdvanceBuyBox;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.LocalData;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import proto.FamilyExpeInfoRes;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyExpeDataNotify;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.FamilyExpeTaskNotify;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.greensock.TweenLite;
   import nslm2.utils.TimeUtils;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.modules.foundations.mainToolBar.BottomIconRender;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.utils.ServerTimer;
   import nslm2.utils.RTools;
   import org.manager.DateUtils;
   import nslm2.utils.LabelUtils;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.configs.ClientConfig;
   import proto.FamilyExpeEnemyInfo;
   import nslm2.utils.Uint64Util;
   import morn.customs.components.Placeholder;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.modules.funnies.guildPKCrossSer.comp.GPKLeftRankCtrl;
   import flash.display.MovieClip;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import game.ui.battleResults.BattleWinWordUI;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import proto.FamilyExpeFamilyInfo;
   import proto.FamilyExpeChallengeInfoRes;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import proto.FamilyExpeFightReq;
   import proto.FamilyExpeFightRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.BgFightNotify;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
   import nslm2.common.model.PlayerModel;
   import morn.core.handlers.Handler;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   
   public class GPKCrossModule extends GPKCrossModuleUI
   {
      
      public static var effContainer:DisplayObjectContainer;
       
      
      private var textCD:TextCDCtrlS2;
      
      private var taskEff:BmcSpriteSheet;
      
      private var canNotGetTask:Boolean;
      
      private var taskCD:TextCDCtrlS2;
      
      private var scene3D:nslm2.modules.funnies.guildPKCrossSer.GPKScene3D;
      
      private var vipHintBox:VipHintBox;
      
      private var startBtn:BottomIconRender;
      
      private var _mc:MovieClip;
      
      private var _img_win:BattleWinWordUI;
      
      private var currPage:int = 1;
      
      private var allPage:int = 1;
      
      private var _isFight:Boolean;
      
      private var currChallenger:FamilyExpeEnemyInfo;
      
      private var rankCtrl:GPKLeftRankCtrl;
      
      public function GPKCrossModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_wdgx.text = LocaleMgr.ins.getStr(30610228);
         this.box_task.buttonMode = true;
         this.box_task.mouseChildren = false;
         this.box_task.visible = false;
         this.txt_time_desc.text = LocaleMgr.ins.getStr(50700027);
         effContainer = this;
         (btn_rewardIcon as TreasureBoxBaseRender).treasureType = 2;
         btn_rewardIcon.dataSource = new TreasureBoxVo([],1);
         txt_awardTitle.text = LocaleMgr.ins.getStr(50700028);
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(btn_left_dock !== _loc3_)
         {
            if(btn_addTimes !== _loc3_)
            {
               if(this.chk_fastfight === _loc3_)
               {
                  LocalData.insCurPlayer.save("local_data_GPK_fast_fight",chk_fastfight.selected);
                  updateChkLabel();
                  if(chk_fastfight.selected)
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(41300283));
                  }
                  else
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(41300284));
                  }
               }
            }
            else if(TimePriceUtil.curTimes(18) < int(VipModel.ins.getVipValue(11300)))
            {
               AlertUtil.comfirm(new AdvanceBuyBox(18,11300,50700030,30121013,50600052,buyTimes_yes));
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50200108));
            }
         }
         else
         {
            zoomInfoPanel();
         }
      }
      
      private function buyTimes_yes() : void
      {
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41300250)));
      }
      
      private function onStartNotify(param1:*) : void
      {
         res = param1;
         onStartInfoRet = function(param1:FamilyExpeInfoRes):void
         {
            model.info = param1;
            model.curTask = param1.task;
            inFightMode();
            updateUIState();
            updateTaskView();
         };
         ServerEngine.ins.send(4350,null,onStartInfoRet);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(4352,onStartNotify);
            ServerEngine.ins.addAlwayHandler(4360,surrendRet);
            ServerEngine.ins.addAlwayHandler(4362,onTaskNotify);
            ServerEngine.ins.addAlwayHandler(4370,onTimeNotify);
            this.box_task.addEventListener("click",onTaskClk);
            btn_rewardIcon.addEventListener("click",treasureBox_onClick);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(4352,onStartNotify);
            ServerEngine.ins.removeAlwayHandler(4360,surrendRet);
            ServerEngine.ins.removeAlwayHandler(4362,onTaskNotify);
            ServerEngine.ins.removeAlwayHandler(4370,onTimeNotify);
            this.box_task.removeEventListener("click",onTaskClk);
            btn_rewardIcon.removeEventListener("click",treasureBox_onClick);
         }
      }
      
      private function onTimeNotify(param1:FamilyExpeDataNotify) : void
      {
         model.info.residualTimes = param1.singleTimes;
         txt_my_times.text = LocaleMgr.ins.getStr(30610208) + TextFieldUtil.htmlText2(param1.singleTimes,11137387) + "/" + DefindConsts.FAMILY_EXPE_FIGHT_TIMES;
      }
      
      private function treasureBox_onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showOrCloseModule(40772);
      }
      
      private function onTaskNotify(param1:FamilyExpeTaskNotify) : void
      {
         model.curTask = param1;
         updateTaskView();
         ObserverMgr.ins.sendNotice("GPK_OPT_REFRESH_TASK_PANEL");
      }
      
      private function updateTaskView() : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc1_:int = 0;
         if(taskEff)
         {
            taskEff.dispose();
            taskEff = null;
         }
         if(taskCD)
         {
            taskCD.dispose();
         }
         var _loc2_:FamilyExpeTaskNotify = model.curTask;
         canNotGetTask = false;
         if(_loc2_)
         {
            if(_loc2_.taskId <= 0)
            {
               this.box_task.visible = false;
               return;
            }
            if(!this.box_task.visible)
            {
               this.box_task.visible = true;
               TweenLite.from(this.box_task,1,{"right":-230});
            }
            this.txt_task_title.text = LocaleMgr.ins.getStr(30610200);
            this.txt_task_info0.text = "";
            _loc4_ = model.taskInfo.desc.split("|");
            _loc3_ = LocaleMgr.ins.getStr(_loc4_[1]);
            var _loc5_:* = _loc2_.taskState;
            if(GPKConst.task_comp !== _loc5_)
            {
               if(GPKConst.task_fail !== _loc5_)
               {
                  if(GPKConst.task_no_comp !== _loc5_)
                  {
                     if(GPKConst.task_no_get === _loc5_)
                     {
                        if(isInFightMode())
                        {
                           this.txt_task_info.text = LocaleMgr.ins.getStr(50700021);
                           this.txt_st.text = "";
                           canNotGetTask = true;
                        }
                        else
                        {
                           this.txt_st.text = LocaleMgr.ins.getStr(50700014);
                           this.txt_task_info.text = LocaleMgr.ins.getStr(30610203);
                           if(!taskEff)
                           {
                              taskEff = new BmcSpriteSheet();
                              taskEff.init(130002,1,"all",true);
                              box_task.addChild(taskEff);
                           }
                        }
                     }
                  }
                  else
                  {
                     this.txt_task_info.text = _loc3_;
                     _loc1_ = model.getTaskTotalNum();
                     if(_loc1_ > 0)
                     {
                        this.txt_task_info.text = this.txt_task_info.text + (" (" + _loc2_.taskFinishNum + "/" + _loc1_ + ")");
                     }
                     if(!isInFightMode())
                     {
                        this.txt_st.text = LocaleMgr.ins.getStr(50700015);
                     }
                     else
                     {
                        this.txt_st.text = LocaleMgr.ins.getStr(50700016);
                        if(_loc2_.endStamp > 0)
                        {
                           starTaskCD(_loc2_.endStamp);
                        }
                     }
                  }
               }
               else
               {
                  this.txt_task_info.text = _loc3_;
                  _loc1_ = model.getTaskTotalNum();
                  if(_loc1_ > 0)
                  {
                     this.txt_task_info.text = this.txt_task_info.text + (" (" + _loc2_.taskFinishNum + "/" + _loc1_ + ")");
                  }
                  this.txt_st.text = LocaleMgr.ins.getStr(50700018);
               }
            }
            else
            {
               this.txt_task_info.text = _loc3_;
               _loc1_ = model.getTaskTotalNum();
               this.txt_st.text = LocaleMgr.ins.getStr(50700017);
               if(_loc1_ > 0)
               {
                  this.txt_task_info.text = this.txt_task_info.text + (" (" + _loc2_.taskFinishNum + "/" + _loc1_ + ")");
               }
            }
         }
      }
      
      private function starTaskCD(param1:uint) : void
      {
         if(taskCD)
         {
            taskCD.dispose();
         }
         param1 = param1 + 3;
         taskCD = new TextCDCtrlS2(this.txt_task_info0,taskCDFormat,taskCDCtrl_cpl);
         taskCD.start(param1);
      }
      
      private function taskCDFormat(param1:uint) : String
      {
         return LocaleMgr.ins.getStr(13323003) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1));
      }
      
      private function taskCDCtrl_cpl() : void
      {
      }
      
      private function onTaskClk(param1:MouseEvent) : void
      {
         if(!canNotGetTask)
         {
            ModuleMgr.ins.showOrCloseModule(40767);
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(4350,null,onFamilyInfoRet,onErr);
      }
      
      private function get model() : GPKCModel
      {
         return GPKCModel.ins;
      }
      
      private function onErr(param1:ProtocolStatusRes) : void
      {
         var _loc2_:Array = [];
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc2_,[],true,false));
         txt_big.text = LocaleMgr.ins.getStr(30610204);
         txt_small.text = "";
      }
      
      private function onFamilyInfoRet(param1:FamilyExpeInfoRes) : void
      {
         model.info = param1;
         moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         SoundMgr.ins.playBackSound("map_kfzb");
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         ModuleMgr.ins.showModule(10400);
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
         initScene3D();
         reUpdateAll();
         model.curTask = model.info.task;
         updateTaskView();
         if(!vipHintBox)
         {
            vipHintBox = new VipHintBox(10310,10,25);
            box_guild_times.addChild(vipHintBox);
         }
         else
         {
            vipHintBox.visible = true;
         }
         startBtn = new BottomIconRender();
         startBtn.dataSource = 40761;
         box_entry.addChild(startBtn);
         startBtn.x = 363;
         startBtn.y = 165;
         super.preShow(param1);
      }
      
      private function reUpdateAll() : void
      {
         if(model.info.status == 0)
         {
            entryMode();
         }
         else if(model.info.status == 1)
         {
            waitMode();
         }
         else if(model.info.status == 2)
         {
            if(model.info.isOpen)
            {
               inFightMode();
            }
            else
            {
               entryMode();
            }
         }
         else if(model.info.status == 3)
         {
            noQualifyMode();
         }
         updateUIState();
      }
      
      private function updateUIState() : void
      {
         this.box_entry.visible = model.info.status != 2;
         this.box_guild_times.visible = model.info.status == 2 || model.info.status == 1;
         this.box_top.visible = model.info.status == 2;
         this.box_pageUI.visible = box_top.visible;
         rank_panel.visible = this.box_top.visible;
         this.con_finalBox.visible = box_top.visible;
         btn_addTimes.visible = box_top.visible;
         this.chk_fastfight.visible = box_top.visible;
      }
      
      protected function zoomInfoPanel(param1:MouseEvent = null) : void
      {
         if(rank_panel.x >= 0)
         {
            TweenLite.to(rank_panel,0.2,{"x":-rank_panel.width + btn_left_dock.width});
            TweenLite.to(img_dock_left,0.2,{"rotation":180});
         }
         else
         {
            TweenLite.to(rank_panel,0.2,{"x":0});
            TweenLite.to(img_dock_left,0.2,{"rotation":0});
         }
      }
      
      private function noQualifyMode() : void
      {
         var _loc1_:Array = [];
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc1_,[],true,false));
         txt_big.text = LocaleMgr.ins.getStr(30610204);
         txt_small.text = "";
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(scene3D)
         {
            scene3D.dispose();
            scene3D = null;
         }
         if(textCD)
         {
            textCD.dispose();
         }
         if(taskCD)
         {
            taskCD.dispose();
         }
         if(taskEff)
         {
            taskEff.dispose();
            taskEff = null;
         }
         super.preClose(param1);
      }
      
      private function initScene3D() : void
      {
         scene3D = new nslm2.modules.funnies.guildPKCrossSer.GPKScene3D();
         this.addChild(scene3D);
         scene3D.init();
      }
      
      private function entryMode() : void
      {
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:* = null;
         var _loc6_:* = null;
         var _loc10_:* = null;
         var _loc1_:Number = NaN;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:Array = [40773,40761,40764,40771,40766,40770].reverse();
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc2_,[],true,false));
         if(ServerTimer.ins.second > model.info.rewardStamp && ServerTimer.ins.second < model.info.rewardStamp + 7200)
         {
            txt_big.text = LocaleMgr.ins.getStr(50700001);
            startAwardCd(model.info.rewardStamp + 7200);
         }
         else if(model.info.openStamp <= 0)
         {
            txt_big.text = LocaleMgr.ins.getStr(50600002);
            txt_small.text = "";
         }
         else
         {
            txt_big.text = LocaleMgr.ins.getStr(50700001);
            _loc4_ = GPKCModel.ins.openAry();
            _loc8_ = _loc4_[1];
            _loc7_ = _loc4_[2];
            _loc9_ = _loc4_[3];
            _loc11_ = String(DefindConsts.FAMILY_EXPE_TIME_INTVL).split("|");
            _loc6_ = LocaleMgr.ins.getStr(50500102) + "：" + _loc11_[0] + ":00~" + _loc11_[1] + ":00";
            _loc1_ = RTools.getTimestamp(_loc8_,_loc7_,_loc9_,0,0,0);
            _loc1_ = _loc1_ + (_loc4_[4] - 1) * 60 * 60 * 24 * 1000;
            _loc3_ = new DateUtils();
            _loc3_.time = _loc1_;
            _loc3_.time = _loc3_.time - DateUtils.timeZone * 3600 * 1000;
            _loc10_ = _loc8_ + "/" + _loc7_ + "/" + _loc9_ + "-" + _loc3_.fullYear + "/" + (_loc3_.month + 1) + "/" + _loc3_.date;
            _loc5_ = LocaleMgr.ins.getStr(60500002) + _loc10_ + " " + _loc6_;
            txt_small.text = _loc5_;
         }
      }
      
      private function startAwardCd(param1:uint) : void
      {
         if(textCD)
         {
            textCD.dispose();
         }
         textCD = new TextCDCtrlS2(this.txt_small,awardCDFormat,awardComp);
         textCD.start(param1);
      }
      
      private function awardCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50600051,[TextFieldUtil.htmlText2(TimeUtils.hisColonFullAddZero(param1),LabelUtils.cdColor(false))]);
      }
      
      private function awardComp() : void
      {
      }
      
      protected function detectSize() : void
      {
         if(UIMgr.gameHeight <= ClientConfig.SCENE_MIN_H + 100)
         {
            rankCtrl.setBigOrSmall(false);
         }
         else
         {
            rankCtrl.setBigOrSmall(true);
         }
      }
      
      private function waitMode() : void
      {
         var _loc1_:Array = [40773,40761,40764,40771,40766,40770].reverse();
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc1_,[],true,false));
         txt_big.text = LocaleMgr.ins.getStr(30610205);
         txt_small.text = LocaleMgr.ins.getStr(30610206);
         txt_my_times.text = LocaleMgr.ins.getStr(30610208) + TextFieldUtil.htmlText2(model.info.residualTimes,11137387) + "/" + DefindConsts.FAMILY_EXPE_FIGHT_TIMES;
         txt_guild_times.text = LocaleMgr.ins.getStr(30610209) + TextFieldUtil.htmlText2(model.info.self.residualTimes,11137387) + "/" + DefindConsts.FAMILY_EXPE_FAMILY_FIGHT_TIMES;
      }
      
      private function sortByPower(param1:FamilyExpeEnemyInfo, param2:FamilyExpeEnemyInfo) : int
      {
         var _loc3_:int = Uint64Util.compare(param1.baseInfo.ability,param2.baseInfo.ability);
         if(_loc3_ == 0)
         {
            return Uint64Util.compare(param1.baseInfo.id,param2.baseInfo.id);
         }
         return _loc3_;
      }
      
      private function updateChkLabel() : void
      {
         chk_fastfight.label = !!chk_fastfight.selected?LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740008):LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740009);
      }
      
      private function inFightMode() : void
      {
         var _loc11_:int = 0;
         var _loc8_:* = null;
         var _loc2_:* = null;
         var _loc9_:* = null;
         var _loc7_:* = null;
         var _loc6_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc3_:Array = [];
         _loc11_ = 0;
         while(_loc11_ < 6)
         {
            _loc8_ = this["pos" + _loc11_];
            _loc8_.visible = false;
            _loc3_.push(_loc8_);
            _loc11_++;
         }
         scene3D.initAvatars(_loc3_);
         model.info.enemyInfos.sort(sortByPower);
         model.info.enemyInfos.reverse();
         allPage = Math.ceil(model.info.enemyInfos.length / 6);
         if(model.currPage > 0)
         {
            this.currPage = model.currPage;
            updatePage(false);
            model.currPage = 0;
         }
         else
         {
            updatePage(false);
         }
         img_left_fbg.url = GuildUtil.getFlagBgUrl(self.flagBase);
         img_left_ficon.url = GuildUtil.getFlagIconUrl(self.flagIcon);
         img_right_fbg.url = GuildUtil.getFlagBgUrl(target.flagBase);
         img_right_ficon.url = GuildUtil.getFlagIconUrl(target.flagIcon);
         txt_gl_name.text = GPKConst.getDistStr(self.familyOpName,self.familyDist,self.familyName);
         txt_gl_rep.text = LocaleMgr.ins.getStr(41701006) + "：" + TextFieldUtil.htmlText2(self.reputation,11137387) + "     " + LocaleMgr.ins.getStr(40700033) + "：" + TextFieldUtil.htmlText2(self.rank <= 0?LocaleMgr.ins.getStr(11800104):self.rank,11137387);
         txt_gl_player_num.text = LocaleMgr.ins.getStr(30610207) + TextFieldUtil.htmlText2(self.avaiNum,11137387) + "/" + self.totalNum;
         txt_gr_name.text = GPKConst.getDistStr(target.familyOpName,target.familyDist,target.familyName);
         txt_gr_rep.text = LocaleMgr.ins.getStr(41701006) + "：" + TextFieldUtil.htmlText2(target.reputation,11137387) + "     " + LocaleMgr.ins.getStr(40700033) + "：" + TextFieldUtil.htmlText2(target.rank <= 0?LocaleMgr.ins.getStr(11800104):target.rank,11137387);
         txt_gr_player_num.text = LocaleMgr.ins.getStr(50700049) + TextFieldUtil.htmlText2(target.avaiNum,11137387) + "/" + target.totalNum;
         txt_my_times.text = LocaleMgr.ins.getStr(30610208) + TextFieldUtil.htmlText2(model.info.residualTimes,11137387) + "/" + DefindConsts.FAMILY_EXPE_FIGHT_TIMES;
         txt_guild_times.text = LocaleMgr.ins.getStr(30610209) + TextFieldUtil.htmlText2(model.info.self.residualTimes,11137387) + "/" + DefindConsts.FAMILY_EXPE_FAMILY_FIGHT_TIMES;
         pageBarUI2.btn_first.clickHandler = pageClickHandler;
         pageBarUI2.btn_last.clickHandler = pageClickHandler;
         pageBarUI2.btn_next.clickHandler = pageClickHandler;
         pageBarUI2.btn_prev.clickHandler = pageClickHandler;
         if(!rankCtrl)
         {
            rankCtrl = new GPKLeftRankCtrl(this);
            this.parts.push(rankCtrl);
         }
         detectSize();
         rankCtrl.reqData();
         _loc2_ = [40764,40765,40771,40766,40770,40773];
         var _loc1_:Boolean = false;
         if(model.info.result == GPKConst.result_loss)
         {
            _loc2_.unshift(40761);
            this.leftwinBox.visible = true;
            this.rightwinBox.visible = true;
            this.img_leftwin.skin = "png.uiGuildPKCrossSer.img_zkxx_loss";
            leftwinTxt.text = LocaleMgr.ins.getStr(999900119);
            leftwinTxt.style = "渐变灰";
            this.img_rightwin.skin = "png.uiGuildPKCrossSer.img_zkxx_win";
            rightwinTxt.text = LocaleMgr.ins.getStr(999900120);
            rightwinTxt.style = "渐变1";
            if(!model.battleFlag)
            {
               showLoseEff();
            }
            _loc1_ = true;
         }
         else if(model.info.result == GPKConst.result_win)
         {
            _loc2_.unshift(40761);
            this.leftwinBox.visible = true;
            this.rightwinBox.visible = true;
            this.img_leftwin.skin = "png.uiGuildPKCrossSer.img_zkxx_win";
            leftwinTxt.text = LocaleMgr.ins.getStr(999900120);
            leftwinTxt.style = "渐变1";
            this.img_rightwin.skin = "png.uiGuildPKCrossSer.img_zkxx_loss";
            rightwinTxt.text = LocaleMgr.ins.getStr(999900119);
            rightwinTxt.style = "渐变灰";
            if(!model.battleFlag)
            {
               showWinEff();
            }
            _loc1_ = true;
         }
         else
         {
            this.leftwinBox.visible = false;
            this.rightwinBox.visible = false;
            _loc2_.unshift(40768);
         }
         if(_loc1_)
         {
            if(ServerTimer.ins.second > model.info.nextFightStamp)
            {
               this.txt_top_cd.text = LocaleMgr.ins.getStr(30610206);
            }
            else
            {
               startCD(model.info.nextFightStamp);
            }
         }
         else
         {
            _loc9_ = String(DefindConsts.FAMILY_EXPE_TIME_INTVL).split("|");
            _loc7_ = new DateUtils();
            _loc7_.time = ServerTimer.ins.second * 1000;
            _loc6_ = _loc7_.fullYear;
            _loc5_ = _loc7_.month + 1;
            _loc4_ = _loc7_.hours;
            _loc10_ = _loc7_.date;
            startCD(RTools.getTimestamp(_loc6_,_loc5_,_loc10_,_loc9_[1],0,0) / 1000);
         }
         this.chk_fastfight.selected = LocalData.insCurPlayer.load("local_data_GPK_fast_fight",false);
         updateChkLabel();
         _loc2_.reverse();
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc2_,[],true,false));
         model.battleFlag = false;
      }
      
      private function isInFightMode() : Boolean
      {
         if(model.info.status == 2 && model.info.result != GPKConst.result_loss && model.info.result != GPKConst.result_win)
         {
            return true;
         }
         return false;
      }
      
      private function showWinEff() : void
      {
         comp = function():void
         {
            if(_mc)
            {
               DisplayUtils.removeSelf(_mc);
               DisplayUtils.removeSelf(_img_win);
            }
         };
         _mc = ResMgr.ins.getRes("effect2d/battle/dgWinLogo.swf");
         _mc.alpha = 1;
         _mc.gotoAndStop(1);
         var _loc1_:* = 0.7;
         _mc.scaleY = _loc1_;
         _mc.scaleX = _loc1_;
         _mc.x = (this.width - _mc.width) / 2 + 236;
         _mc.y = (this.height - _mc.height) / 2 + 400;
         var i:int = 0;
         while(i < 3)
         {
            _mc["star" + i].visible = false;
            _mc["star_bg" + i].visible = false;
            i = Number(i) + 1;
         }
         this.addChild(_mc);
         showWinTxt();
         TweenMax.to(_mc,0.7,{
            "frame":17,
            "ease":Linear.easeNone
         });
         TweenMax.to(_mc,0.5,{
            "alpha":0,
            "delay":1.5,
            "onComplete":comp
         });
      }
      
      private function showWinTxt() : void
      {
         _img_win = new BattleWinWordUI();
         _img_win.x = -129;
         _img_win.y = -105;
         _img_win.img_light.blendMode = "add";
         new ScaleTweenEff().init(_img_win,0.5,2,1,Elastic.easeInOut,false);
         _mc.addChild(_img_win);
      }
      
      private function showLoseEff() : void
      {
         comp = function():void
         {
            if(_mc)
            {
               DisplayUtils.removeSelf(_mc);
            }
         };
         _mc = ResMgr.ins.getRes("effect2d/battle/lossLogo.swf");
         _mc.alpha = 1;
         _mc.gotoAndStop(1);
         var _loc1_:* = 0.7;
         _mc.scaleY = _loc1_;
         _mc.scaleX = _loc1_;
         _mc.x = (this.width - _mc.width) / 2;
         _mc.y = (this.height - _mc.height) / 2 - 100;
         this.addChild(_mc);
         TweenMax.to(_mc,1.1,{
            "frame":28,
            "ease":Linear.easeNone
         });
         TweenMax.to(_mc,0.5,{
            "alpha":0,
            "delay":1.5,
            "onComplete":comp
         });
      }
      
      private function startCD(param1:uint) : void
      {
         if(textCD)
         {
            textCD.dispose();
         }
         param1 = param1 + 3;
         textCD = new TextCDCtrlS2(this.txt_top_cd,textCDFormat,txtCDCtrl_cpl);
         textCD.start(param1);
      }
      
      private function textCDFormat(param1:int) : String
      {
         if(model.info.result == GPKConst.result_loss)
         {
            return LocaleMgr.ins.getStr(30610210,[TextFieldUtil.htmlText2(TimeUtils.getSimpleTimeStr(param1),LabelUtils.cdColor(false))]);
         }
         if(model.info.result == GPKConst.result_win)
         {
            return LocaleMgr.ins.getStr(30610211,[TextFieldUtil.htmlText2(TimeUtils.getSimpleTimeStr(param1),LabelUtils.cdColor(false))]);
         }
         return LocaleMgr.ins.getStr(30610212,[TextFieldUtil.htmlText2(TimeUtils.getSimpleTimeStr(param1),LabelUtils.cdColor(false))]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         onStartInfoRet = function(param1:FamilyExpeInfoRes):void
         {
            model.info = param1;
            reUpdateAll();
         };
         ServerEngine.ins.send(4350,null,onStartInfoRet);
      }
      
      private function pageClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(pageBarUI2.btn_first !== _loc2_)
         {
            if(pageBarUI2.btn_last !== _loc2_)
            {
               if(pageBarUI2.btn_next !== _loc2_)
               {
                  if(pageBarUI2.btn_prev === _loc2_)
                  {
                     currPage = Number(currPage) - 1;
                  }
               }
               else
               {
                  currPage = Number(currPage) + 1;
               }
            }
            else
            {
               currPage = allPage;
            }
         }
         else
         {
            currPage = 1;
         }
         updatePage();
      }
      
      private function updatePage(param1:Boolean = true) : void
      {
         pageBarUI2.btn_prev.disabled = currPage <= 1;
         pageBarUI2.btn_first.disabled = currPage <= 1;
         pageBarUI2.btn_last.disabled = currPage >= allPage;
         pageBarUI2.btn_next.disabled = currPage >= allPage;
         var _loc2_:Array = model.info.enemyInfos.slice((currPage - 1) * 6);
         pageBarUI2.txt_pageNum.text = currPage + "/" + allPage;
         scene3D.changeEnemies(_loc2_,param1);
      }
      
      private function get self() : FamilyExpeFamilyInfo
      {
         return model.info.self;
      }
      
      private function get target() : FamilyExpeFamilyInfo
      {
         return model.info.target;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["GPK_OPT_OPEN_CHALLENGE_PANEL","GPK_OPT_FIGHT","GPK_OPT_SURRENDER","GPK_OPT_LOTTERY"];
      }
      
      public function onChallenInfoRet(param1:FamilyExpeChallengeInfoRes) : void
      {
         model.challengeInfo = param1;
         ModuleMgr.ins.showOrCloseModule(40761);
      }
      
      public function onChallengeError(param1:*) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         notifyType = param1;
         data = param2;
         sureSurrend = function():void
         {
            ServerEngine.ins.send(4356);
         };
         var _loc3_:* = notifyType;
         if("GPK_OPT_OPEN_CHALLENGE_PANEL" !== _loc3_)
         {
            if("GPK_OPT_FIGHT" !== _loc3_)
            {
               if("GPK_OPT_SURRENDER" !== _loc3_)
               {
                  if("GPK_OPT_LOTTERY" === _loc3_)
                  {
                     ModuleMgr.ins.showOrCloseModule(40762);
                  }
               }
               else if(GuildModel.ins.isPresident() || GuildModel.ins.isVP())
               {
                  AlertUtil.comfirm(LocaleMgr.ins.getStr(30610214),sureSurrend,null,null);
               }
               else
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(30610215));
               }
            }
            else
            {
               beginFight(data);
            }
         }
         else if(model.info && (model.info.status == 1 || model.info.status == 2) && model.info.isOpen)
         {
            if((model.info.result == GPKConst.result_loss || model.info.result == GPKConst.result_win) && ServerTimer.ins.second < model.info.nextFightStamp)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50700019,[TimeUtils.isColonWithZero(model.info.nextFightStamp - ServerTimer.ins.second)]));
               return;
            }
            if(GuildModel.ins.isPresident() || GuildModel.ins.isVP())
            {
               ServerEngine.ins.send(4353,null,onChallenInfoRet,onChallengeError);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(30610213));
            }
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300007016));
         }
      }
      
      private function surrendRet() : void
      {
         onStartInfoRet = function(param1:FamilyExpeInfoRes):void
         {
            model.info = param1;
            reUpdateAll();
         };
         ServerEngine.ins.send(4350,null,onStartInfoRet);
      }
      
      private function beginFight(param1:FamilyExpeEnemyInfo) : void
      {
         data = param1;
         confirmHandler = function():void
         {
            var _loc1_:* = null;
            if(_isFight)
            {
               return;
            }
            model.currPage = currPage;
            _isFight = true;
            currChallenger = data;
            if(isFastFight)
            {
               _loc1_ = new FamilyExpeFightReq();
               _loc1_.enemyId = data.baseInfo.id;
               _loc1_.kind = 1;
               ServerEngine.ins.send(4358,_loc1_,onfastFight,server_arenaChallenge_err);
            }
            else
            {
               _loc1_ = new FamilyExpeFightReq();
               _loc1_.enemyId = data.baseInfo.id;
               ServerEngine.ins.send(4358,_loc1_,server_arenaChallenge_cpl,server_arenaChallenge_err);
            }
            model.battleFlag = true;
         };
         if(model.info.residualTimes <= 0)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(30610234)));
            return;
         }
         if(isInFightMode())
         {
            if(data.hpPercent <= 0)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(30610231),confirmHandler,null,null);
               return;
            }
            var paramArr:Array = String(DefindConsts.FAMILY_EXPE_FIGHT_HP).split("|");
            if(data.fightCount >= 1)
            {
               var sa:int = paramArr[2] * data.fightCount;
               var sd:int = paramArr[0] - sa;
               if(sd < paramArr[1])
               {
                  sd = paramArr[1];
                  sa = paramArr[0] - sd;
               }
               AlertUtil.comfirm(LocaleMgr.ins.getStr(30610232,[sa,sd]),confirmHandler,null,null);
               return;
            }
         }
         return;
         §§push(confirmHandler());
      }
      
      private function get isFastFight() : Boolean
      {
         return this.chk_fastfight.selected;
      }
      
      private function onfastFight(param1:FamilyExpeFightRes, param2:ServerEvent) : void
      {
         _isFight = false;
         var _loc4_:BgFightNotify = new BgFightNotify();
         var _loc5_:FastBattleData = new FastBattleData();
         _loc4_.attacker = param1.attacker;
         _loc4_.target = param1.target;
         if(param1.btlResult == 1)
         {
            _loc4_.winnerId = param1.attacker.playerId;
         }
         else
         {
            _loc4_.winnerId = param1.target.playerId;
         }
         var _loc3_:FastBattlePlayerData = new FastBattlePlayerData();
         var _loc7_:FastBattlePlayerData = new FastBattlePlayerData();
         _loc3_.name = PlayerModel.ins.playerInfo.name;
         _loc3_.level = PlayerModel.ins.level;
         _loc3_.fightValue = Uint64Util.fromNumber(PlayerModel.ins.totalFightValue);
         _loc3_.playerId = PlayerModel.ins.playerInfo.id;
         _loc3_.npcID = PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId;
         _loc3_.miliRank = PlayerModel.ins.playerInfo.militaryrank;
         _loc3_.side = 1;
         var _loc6_:String = PlayerModel.ins.getFullNameWithDistName(currChallenger.baseInfo,true,false);
         _loc7_.name = _loc6_;
         _loc7_.fightValue = currChallenger.baseInfo.ability;
         _loc7_.level = currChallenger.baseInfo.lv;
         _loc7_.miliRank = currChallenger.baseInfo.militaryRank;
         _loc7_.side = 2;
         _loc7_.npcID = currChallenger.baseInfo.npcId;
         _loc5_.fightData = _loc4_;
         _loc5_.leftPlayerData = _loc3_;
         _loc5_.rightPlayerData = _loc7_;
         _loc5_.closeCallBack = new Handler(fastcloseHandler);
         ModuleMgr.ins.closeModule(50509);
         ModuleMgr.ins.showModule(50509,_loc5_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function fastcloseHandler(param1:Boolean = false) : void
      {
         surrendRet();
      }
      
      private function server_arenaChallenge_cpl(param1:FamilyExpeFightRes, param2:ServerEvent) : void
      {
         _isFight = false;
         model.con = param1.con;
         model.coin = param1.coin;
         model.hpPer = param1.hpPercent;
         ModuleMgr.ins.showModule(40201,BattleReportParamVo.createReportVo(param1.reportId,param1.btlResult,null,param2.dataNotifyCacheVo,6));
      }
      
      private function server_arenaChallenge_err(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         _isFight = false;
      }
   }
}
