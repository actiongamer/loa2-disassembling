package nslm2.modules.funnies.teamPKCS.preMatch
{
   import game.ui.teamPKCS.pre.TPKCpreSceneUI;
   import com.mz.core.interFace.IObserver;
   import flash.events.Event;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CteamArenaPreReportRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.CteamArenaInfoRes;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import proto.CteamArenaEnemyChangeNotify;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.funnies.pkCrossSer.AdvanceBuyBox;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.utils.ServerTimer;
   import org.manager.DateUtils;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.display.MovieClip;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import game.ui.battleResults.BattleWinWordUI;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import proto.CteamReport;
   import proto.CteamArenaFightRes;
   import proto.CteamPlayerInfoRes;
   import com.mz.core.utils.TextFieldUtil;
   import proto.MapKey32Value32;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import com.greensock.TweenLite;
   import proto.CteamBattle;
   import proto.CteamBattleHp;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class TPKCpreScene extends TPKCpreSceneUI implements IObserver
   {
       
      
      private var _scene3D:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreScene3D;
      
      private var buffLeft:int;
      
      private var buffRight:int;
      
      private var isInstantOver:Boolean = false;
      
      private var rankCtrl:nslm2.modules.funnies.teamPKCS.preMatch.TPKCRankCtrl;
      
      private var onfight:Boolean = false;
      
      private var changeFlag:Boolean = false;
      
      private var _awardvo:Array;
      
      private var _mc:MovieClip;
      
      private var _img_win:BattleWinWordUI;
      
      private var _battleReport:CteamReport;
      
      private var stage_num:int;
      
      private var left_win_times:int;
      
      private var right_win_times:int;
      
      private var _taskArr:Array;
      
      private var _currBattle:CteamBattle;
      
      private var _currHp:CteamBattleHp;
      
      private var _currWinUnit:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D;
      
      private var _currLossUnit:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D;
      
      public function TPKCpreScene()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         ServerEngine.ins.addAlwayHandler(5406,onChangeNotify);
         if(!rankCtrl)
         {
            rankCtrl = new nslm2.modules.funnies.teamPKCS.preMatch.TPKCRankCtrl(this);
            this.parts.push(rankCtrl);
         }
         this.btn_fight.label = LocaleMgr.ins.getStr(40710304);
         this.btn_change.label = LocaleMgr.ins.getStr(50800054);
         this.btn_changeOrder.label = LocaleMgr.ins.getStr(50800038);
         ObserverMgr.ins.regObserver(this);
         this.buff_left.skin = UrlLib.buffIcon(99999);
         this.buff_right.skin = UrlLib.buffIcon(99999);
         this.buff_num_left.mouseEvent = false;
         this.buff_num_right.mouseEvent = false;
         buff_left.toolTip = LocaleMgr.ins.getStr(50800058);
         buff_right.toolTip = LocaleMgr.ins.getStr(50800058);
         this.txt_fight_tip.visible = false;
         this.btn_fight_award.label = LocaleMgr.ins.getStr(41300099);
         this.list_match.itemRender = TPKCPreMatchRender;
         this.list_time_reward.itemRender = TPKCTaskRender;
         this.fight_time_tip.text = LocaleMgr.ins.getStr(50600008);
         enterScene();
         digiDayTxt.text = LocaleMgr.ins.getStr(999900271,[model.preDay]);
         this.txt_left_day.text = LocaleMgr.ins.getStr(50800047,[model.preDay]);
         this.right_small_title.text = LocaleMgr.ins.getStr(50800055);
         var _loc1_:Array = model.getPreDataParam();
         this.txt_time.text = LocaleMgr.ins.getStr(50800051,_loc1_);
         txt_fight_title.text = LocaleMgr.ins.getStr(41701000);
         tab.labels = LocaleMgr.ins.getStr(999900288);
      }
      
      private function enterScene() : void
      {
         if(_scene3D)
         {
            _scene3D.removeEventListener("EVT_PRE_BATTLE_RUN_COMPLETE",onMoveComp);
            _scene3D.removeEventListener("EVT_PRE_BATTLE_ONE_FIGHT_OVER",onOneFightOver);
            _scene3D.dispose();
         }
         _scene3D = new nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreScene3D();
         addChild(_scene3D);
         _scene3D.init();
         setMode(0);
         reqInfo();
         reqPersonalInfo();
         rankCtrl.reqData();
         _scene3D.addEventListener("EVT_PRE_BATTLE_RUN_COMPLETE",onMoveComp);
         _scene3D.addEventListener("EVT_PRE_BATTLE_ONE_FIGHT_OVER",onOneFightOver);
         isInstantOver = false;
      }
      
      protected function onOneFightOver(param1:Event) : void
      {
         var _loc2_:Object = list_match.getItem(this.stage_num);
         _loc2_.over = true;
         list_match.refreshItem(this.stage_num);
         if(_battleReport.battle.length > 0)
         {
            stage_num = Number(stage_num) + 1;
         }
         if(_currWinUnit.isSelf)
         {
            left_win_times = Number(left_win_times) + 1;
            buffProcess(true);
         }
         else
         {
            right_win_times = Number(right_win_times) + 1;
            buffProcess(false);
         }
         updateview();
         startOneFight();
      }
      
      private function buffProcess(param1:Boolean) : void
      {
         if(param1)
         {
            buffRight = Number(buffRight) + 1;
            buffLeft = Number(buffLeft) - 1;
         }
         else
         {
            buffRight = Number(buffRight) - 1;
            buffLeft = Number(buffLeft) + 1;
         }
         buffLeft = Math.max(0,buffLeft);
         buffRight = Math.max(0,buffRight);
         this.buff_num_left.text = buffLeft + "";
         this.buff_num_right.text = buffRight + "";
      }
      
      protected function onMoveComp(param1:Event) : void
      {
         if(isInstantOver)
         {
            _scene3D.fastPK(_currWinUnit,_currLossUnit,_currHp);
         }
         else
         {
            _scene3D.pk(_currWinUnit,_currLossUnit,_currHp);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["OPT_TPKC_CHANGE_ORDER_CLOSE","OPT_TPKC_OPEN_REPORT"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("OPT_TPKC_CHANGE_ORDER_CLOSE" !== _loc3_)
         {
            if("OPT_TPKC_OPEN_REPORT" === _loc3_)
            {
               ServerEngine.ins.send(5409,null,onReportRet);
            }
         }
         else
         {
            ServerEngine.ins.send(5405,null,chgSelfOrderRet);
         }
      }
      
      private function onReportRet(param1:CteamArenaPreReportRes) : void
      {
         ModuleMgr.ins.showOrCloseModule(42007,!!param1?param1.info:[]);
      }
      
      private function chgSelfOrderRet(param1:CteamArenaInfoRes) : void
      {
         TPKCModel.ins.preInfo = param1;
         updateSelf();
      }
      
      private function onChangeNotify(param1:CteamArenaEnemyChangeNotify) : void
      {
         changeFlag = false;
         TPKCModel.ins.preInfo.enemy = param1.info;
         TPKCModel.ins.preInfo.score = param1.score;
         TPKCModel.ins.preInfo.source = param1.source;
         if(param1.info && param1.info.leader)
         {
            updateEnemy();
         }
      }
      
      public function get model() : TPKCModel
      {
         return TPKCModel.ins;
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_right_dock !== _loc3_)
         {
            if(this.btn_left_dock !== _loc3_)
            {
               if(this.btn_dock_fight !== _loc3_)
               {
                  if(this.btn_change !== _loc3_)
                  {
                     if(this.btn_fight !== _loc3_)
                     {
                        if(this.btn_changeOrder !== _loc3_)
                        {
                           if(this.btn_addTime !== _loc3_)
                           {
                              if(this.btn_finish !== _loc3_)
                              {
                                 if(this.btn_fight_award === _loc3_)
                                 {
                                    ServerEngine.ins.send(5412,null,onTaskAwardOK,onTaskAwardErr);
                                 }
                              }
                              else if(onfight)
                              {
                                 instantOver();
                              }
                              else
                              {
                                 if(_mc)
                                 {
                                    DisplayUtils.removeSelf(_mc);
                                    _mc = null;
                                 }
                                 if(_img_win)
                                 {
                                    DisplayUtils.removeSelf(_img_win);
                                    _img_win = null;
                                 }
                                 enterScene();
                              }
                           }
                           else
                           {
                              if(canNotFight())
                              {
                                 return;
                              }
                              if(TimePriceUtil.curTimes(20) < int(VipModel.ins.getVipValue(11410)))
                              {
                                 AlertUtil.comfirm(new AdvanceBuyBox(20,11410,50600048,30121013,50600052,buyTimes_yes));
                              }
                              else
                              {
                                 AlertUtil.float(LocaleMgr.ins.getStr(50200108));
                              }
                           }
                        }
                        else
                        {
                           if(canNotFight())
                           {
                              return;
                           }
                           ModuleMgr.ins.showOrCloseModule(42005);
                        }
                     }
                     else if(TPKCModel.ins.isPreDay)
                     {
                        if(canNotFight())
                        {
                           return;
                        }
                        if(model.playerInfo.time <= 0)
                        {
                           ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500010)));
                           return;
                        }
                        if(onfight)
                        {
                           return;
                        }
                        onfight = true;
                        ServerEngine.ins.send(5402,null,onfightRet);
                     }
                     else
                     {
                        AlertUtil.alert(LocaleMgr.ins.getStr(50800046));
                     }
                  }
                  else
                  {
                     if(canNotFight())
                     {
                        return;
                     }
                     if(changeFlag)
                     {
                        return;
                     }
                     changeFlag = true;
                     ServerEngine.ins.send(5401);
                  }
               }
               else
               {
                  zoomInfoPanel_fight();
               }
            }
            else
            {
               zoomInfoPanel();
            }
         }
         else
         {
            zoomInfoPanel_right();
         }
      }
      
      private function canNotFight() : Boolean
      {
         var _loc1_:* = null;
         _loc1_ = ServerTimer.ins.date;
         if(_loc1_.hours < model.time_arr_pre[1] || _loc1_.hours >= model.time_arr_pre[2])
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50800051,model.getPreDataParam()));
            return true;
         }
         return false;
      }
      
      private function canGetTaskAward() : Boolean
      {
         var _loc2_:* = null;
         _awardvo = [];
         var _loc1_:Boolean = false;
         var _loc5_:int = 0;
         var _loc4_:* = _taskArr;
         for each(var _loc3_ in _taskArr)
         {
            if(_loc3_.win >= _loc3_.times && _loc3_.got == false)
            {
               _loc1_ = true;
               _loc2_ = list_time_reward.getCell(list_time_reward.getItemIndex(_loc3_)) as TPKCTaskRender;
               if(_loc2_)
               {
                  _awardvo.push(_loc2_.reward.dataSource);
               }
            }
         }
         return _loc1_;
      }
      
      private function onTaskAwardOK() : void
      {
         if(_awardvo)
         {
            FloatUtil.showGetItemsDisplayPanel(_awardvo);
         }
         reqPersonalInfo();
      }
      
      private function onTaskAwardErr() : void
      {
      }
      
      private function buyTimes_yes() : void
      {
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41300250)));
         reqPersonalInfo();
      }
      
      private function showWinEff() : void
      {
         var _loc1_:int = 0;
         _mc = ResMgr.ins.getRes("effect2d/battle/dgWinLogo.swf");
         _mc.alpha = 1;
         _mc.gotoAndStop(1);
         var _loc2_:* = 0.7;
         _mc.scaleY = _loc2_;
         _mc.scaleX = _loc2_;
         _mc.x = (this.width - _mc.width) / 2 + 236;
         _mc.y = (this.height - _mc.height) / 2 + 400;
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            _mc["star" + _loc1_].visible = false;
            _mc["star_bg" + _loc1_].visible = false;
            _loc1_++;
         }
         this.addChild(_mc);
         showWinTxt();
         TweenMax.to(_mc,0.7,{
            "frame":17,
            "ease":Linear.easeNone
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
      }
      
      private function onfightRet(param1:CteamArenaFightRes) : void
      {
         if(param1.info)
         {
            left_win_times = 0;
            right_win_times = 0;
            buffLeft = 0;
            buffRight = 0;
            this.buff_num_left.text = "0";
            this.buff_num_right.text = "0";
            stage_num = 0;
            this.list_match.dataSource = [];
            _battleReport = param1.info;
            setMode(1);
            startOneFight();
            updateview();
            this.btn_finish.label = LocaleMgr.ins.getStr(50800039);
         }
         else
         {
            onfight = false;
         }
      }
      
      private function updateview() : void
      {
         digiRoundTxt.text = LocaleMgr.ins.getStr(999900310,[stage_num + 1]);
         this.digi_left.value = left_win_times;
         this.digi_right.value = right_win_times;
      }
      
      private function reqInfo() : void
      {
         ServerEngine.ins.send(5405,null,onPreInfoRet);
      }
      
      private function reqPersonalInfo() : void
      {
         onPlayerInfoRet = function(param1:CteamPlayerInfoRes):void
         {
            model.playerInfo = param1;
            txt_fight_time.text = LocaleMgr.ins.getStr(50200002) + "：" + TextFieldUtil.htmlText2(param1.time,11137387) + "/" + int(VipModel.ins.getVipValue(11400));
            todayTimesReward(param1);
         };
         ServerEngine.ins.send(5411,null,onPlayerInfoRet);
      }
      
      private function todayTimesReward(param1:CteamPlayerInfoRes) : void
      {
         res = param1;
         getCanGet = function(param1:int):int
         {
            var _loc4_:int = 0;
            var _loc3_:* = res.reward;
            for each(var _loc2_ in res.reward)
            {
               if(_loc2_.key == param1)
               {
                  return _loc2_.value;
               }
            }
            return 0;
         };
         if(!_taskArr)
         {
            _taskArr = [];
            var str:Array = String(DefindConsts.CROSS_GROUP_BATTLE_TASK).split("|");
            var _loc4_:int = 0;
            var _loc3_:* = str;
            for each(ii in str)
            {
               var st:Array = ii.split(":");
               _taskArr.push({
                  "times":st[0],
                  "rewardd":st[1]
               });
            }
         }
         var _loc6_:int = 0;
         var _loc5_:* = _taskArr;
         for each(si in _taskArr)
         {
            si.win = res.win;
            si.got = getCanGet(si.times);
         }
         this.list_time_reward.dataSource = _taskArr;
         this.btn_fight_award.disabled = !canGetTaskAward();
      }
      
      private function onPreInfoRet(param1:CteamArenaInfoRes) : void
      {
         TPKCModel.ins.preInfo = param1;
         updateSelf();
         updateEnemy();
         rankCtrl.refreshTeamMember();
      }
      
      private function updateEnemy() : void
      {
         var _loc1_:CteamArenaInfoRes = TPKCModel.ins.preInfo;
         if(_loc1_ && _loc1_.enemy)
         {
            this.txt_r0.text = TPKConst.getDistName(_loc1_.enemy.op,_loc1_.enemy.dist,_loc1_.enemy.name);
            this.right_pow.text = GPKConst.powerToW(_loc1_.enemy.ability);
            _loc1_.enemy.member = TPKConst.setOrder(_loc1_.enemy.member,_loc1_.enemy.sort);
            _scene3D.changeEnemy(_loc1_.enemy.member);
            this.txt_r3.text = LocaleMgr.ins.getStr(50800057,[_loc1_.score,_loc1_.source]);
         }
         else
         {
            this.txt_r0.text = "";
            this.right_pow.text = "0";
            this.txt_r3.text = LocaleMgr.ins.getStr(50800057,[0,0]);
         }
      }
      
      private function updateSelf() : void
      {
         var _loc1_:CteamArenaInfoRes = TPKCModel.ins.preInfo;
         if(_loc1_ && _loc1_.our)
         {
            this.txt_l0.text = TPKConst.getDistName(_loc1_.our.op,_loc1_.our.dist,_loc1_.our.name);
            this.left_pow.text = GPKConst.powerToW(_loc1_.our.ability);
            _loc1_.our.member = TPKConst.setOrder(_loc1_.our.member,_loc1_.our.sort);
            _scene3D.changeSelf(_loc1_.our.member);
         }
         else
         {
            this.txt_l0.text = "";
            this.left_pow.text = "0";
         }
      }
      
      public function setMode(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         this.box_top.visible = param1 == 0;
         this.rank_panel.visible = param1 == 0;
         this.box_reward.visible = param1 == 0;
         this.box_bottom.visible = param1 == 0;
         this.box_fight_panel.visible = param1 == 1;
         this.btn_finish.visible = param1 == 1;
         this.box_fight_top.visible = param1 == 1;
         if(param1 == 0)
         {
            _loc3_ = [42014,42006,42007,42008,42009,42010].reverse();
            ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc3_,[],true,false));
         }
         else
         {
            _loc2_ = TPKCModel.ins.preInfo;
            txt_l_name.text = TPKConst.getDistName(_loc2_.our.op,_loc2_.our.dist,_loc2_.our.name);
            txt_r_name.text = TPKConst.getDistName(_loc2_.enemy.op,_loc2_.enemy.dist,_loc2_.enemy.name);
            this.txt_l_power.text = GPKConst.powerToW(_loc2_.our.ability);
            this.txt_r_power.text = GPKConst.powerToW(_loc2_.enemy.ability);
         }
      }
      
      protected function zoomInfoPanel_right(param1:MouseEvent = null) : void
      {
         if(box_reward.right == 0)
         {
            TweenLite.to(box_reward,0.2,{"right":-box_reward.width + btn_right_dock.width - 10});
            TweenLite.to(img_dock_right,0.2,{"rotation":0});
         }
         else
         {
            TweenLite.to(box_reward,0.2,{"right":0});
            TweenLite.to(img_dock_right,0.2,{"rotation":180});
         }
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
      
      protected function zoomInfoPanel_fight(param1:MouseEvent = null) : void
      {
         if(box_fight_panel.right >= 0)
         {
            TweenLite.to(box_fight_panel,0.2,{"right":-box_fight_panel.width + 11});
            TweenLite.to(img_dock_fight,0.2,{"rotation":0});
         }
         else
         {
            TweenLite.to(box_fight_panel,0.2,{"right":0});
            TweenLite.to(img_dock_fight,0.2,{"rotation":180});
         }
      }
      
      private function instantOver() : void
      {
         isInstantOver = true;
      }
      
      public function startOneFight() : void
      {
         var _loc1_:* = null;
         if(_battleReport.battle.length <= 0)
         {
            onfight = false;
            this.btn_finish.label = LocaleMgr.ins.getStr(10900033);
            _loc1_ = TPKCModel.ins.preInfo.our.id;
            if(Uint64Util.equal(_battleReport.winId,_loc1_))
            {
               showWinEff();
            }
            else
            {
               showLoseEff();
            }
            return;
         }
         _currBattle = _battleReport.battle.shift();
         _currHp = _battleReport.hp.shift();
         var _loc3_:UInt64 = _currBattle.winId;
         var _loc2_:UInt64 = _currBattle.loseId;
         _currWinUnit = _scene3D.getUnitById(_loc3_);
         _currLossUnit = _scene3D.getUnitById(_loc2_);
         if(_currWinUnit && _currLossUnit)
         {
            addMatchItem(_currBattle);
            if(isInstantOver)
            {
               onMoveComp(null);
            }
            else if(_currWinUnit.isSelf)
            {
               _scene3D.runToFightPos(_currWinUnit,_currLossUnit);
            }
            else
            {
               _scene3D.runToFightPos(_currLossUnit,_currWinUnit);
            }
         }
      }
      
      public function addMatchItem(param1:CteamBattle) : void
      {
         list_match.addItem({
            "da":param1,
            "over":false,
            "index":stage_num,
            "winnerSide":_currWinUnit.isSelf
         });
      }
      
      override public function dispose() : void
      {
         _scene3D.removeEventListener("EVT_PRE_BATTLE_RUN_COMPLETE",onMoveComp);
         _scene3D.removeEventListener("EVT_PRE_BATTLE_ONE_FIGHT_OVER",onMoveComp);
         ServerEngine.ins.removeAlwayHandler(5406,onChangeNotify);
         ObserverMgr.ins.unregObserver(this);
         if(_scene3D)
         {
            _scene3D.dispose();
         }
         super.dispose();
      }
   }
}
