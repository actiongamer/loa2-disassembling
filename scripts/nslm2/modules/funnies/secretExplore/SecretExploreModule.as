package nslm2.modules.funnies.secretExplore
{
   import game.ui.secretExplore.SecretExploreModuleUI;
   import game.ui.secretExplore.SEWayPointUI;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.TweenMax;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.nets.sockets.ServerEngine;
   import proto.MjtxSomeCountNotify;
   import com.mz.core.utils.TextFieldUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.pkCrossSer.AdvanceBuyBox;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.LocalData;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGlobalPriceVo;
   import proto.MjtxOpenBoxRes;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import com.greensock.TweenLite;
   import proto.MjtxInfoRes;
   import game.ui.secretExplore.SEfaceUI;
   import nslm2.utils.PlayerVoUtils;
   import proto.GameFriendData;
   import proto.MjtxAutoFightRes;
   import proto.MjtxEnemyInfo;
   import proto.BgFightNotify;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import morn.core.handlers.Handler;
   import proto.MjtxAutoFightReq;
   import proto.MjtxFightStartReq;
   import proto.MjtxFightStartRes;
   import com.mz.core.utils.FilterUtil;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.mgrs.stcMgrs.vos.StcDropGroupVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.filters.BlurFilter;
   import nslm2.common.globals.GlobalRef;
   
   public class SecretExploreModule extends SecretExploreModuleUI
   {
       
      
      private var wp:SEWayPointUI;
      
      private var _pa:Array;
      
      private var fightIndex:int;
      
      private var _isFight:Boolean = false;
      
      private var _friendvo:GameFriendData;
      
      private var lineDic:Dictionary;
      
      private var lines;
      
      private var aEff:BmcSpriteSheet;
      
      private var boxEff:BmcSpriteSheet;
      
      public function SecretExploreModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.img_bg0.skin = UrlLib.secretUrl("img_bg0.jpg");
         var _loc1_:BlurFilter = new BlurFilter();
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.quality = 2;
         img_bg0.filters = [_loc1_];
         this.txt_title.text = LocaleMgr.ins.getStr(50700101);
         this.scoreSwapRedPoi.visible = false;
         this.box_rule.toolTip = LocaleMgr.ins.getStr(50700113);
         GlobalRef.icon_secretExplore_point = this.txt_rank;
      }
      
      private function initWayPoint() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         if(wp)
         {
            var _loc7_:int = 0;
            var _loc6_:* = lineDic;
            for each(var _loc1_ in lineDic)
            {
               this.lines.mc_mask.addChild(_loc1_);
            }
            DisplayUtils.removeSelf(lines);
            TweenMax.killTweensOf(this.wp.box_tips);
            wp.dispose();
         }
         wp = new SEWayPointUI();
         _loc7_ = 0;
         wp.centerY = _loc7_;
         wp.centerX = _loc7_;
         addChild(wp);
         wp.img_bg1.skin = UrlLib.secretUrl("img_bg1.png");
         wp.btn_next.label = LocaleMgr.ins.getStr(50700104);
         MornExpandUtil.addHandlerForBtnAll(wp,btn_handler);
         lines = ResMgr.ins.getRes("effect2d/secretExplore/line.swf");
         wp.img_line_bg.addChild(lines);
         Sprite(lines).mask = lines.mc_mask;
         boxTipsAni();
         lineDic = new Dictionary();
         _loc4_ = 0;
         while(_loc4_ < SEConst.way.length)
         {
            _loc3_ = SEConst.way[_loc4_];
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               _loc5_ = _loc3_[_loc2_];
               if(this.lines.mc_mask.hasOwnProperty("a" + _loc4_ + "b" + _loc5_))
               {
                  lineDic["a" + _loc4_ + "b" + _loc5_] = this.lines.mc_mask["a" + _loc4_ + "b" + _loc5_];
                  DisplayUtils.removeSelf(lineDic["a" + _loc4_ + "b" + _loc5_]);
               }
               else if(this.lines.mc_mask.hasOwnProperty("a" + _loc5_ + "b" + _loc4_))
               {
                  lineDic["a" + _loc5_ + "b" + _loc4_] = this.lines.mc_mask["a" + _loc5_ + "b" + _loc4_];
                  DisplayUtils.removeSelf(lineDic["a" + _loc5_ + "b" + _loc4_]);
               }
               _loc2_++;
            }
            _loc4_++;
         }
      }
      
      public function get pa() : Array
      {
         if(_pa == null)
         {
            _pa = String(DefindConsts.ADVENTURE_BOX_PRICE).split("|");
         }
         return _pa;
      }
      
      public function set pa(param1:Array) : void
      {
         _pa = param1;
      }
      
      private function get isFastFight() : Boolean
      {
         return this.chk_fastfight.selected;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(8607,timeNotify);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(8607,timeNotify);
         }
      }
      
      private function timeNotify(param1:MjtxSomeCountNotify) : void
      {
         model.info.fightCount = param1.fightCount;
         this.txt_times.text = TextFieldUtil.htmlText2(model.info.fightCount,11137387) + "/" + int(DefindConsts.ADVENTURE_DEFAULT_FIGHT_TIMES);
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         btn = param1;
         e = param2;
         openDiamondBox = function():void
         {
            ServerEngine.ins.send(8602,null,onBoxRet);
         };
         var _loc3_:* = btn;
         if(btn_left_dock !== _loc3_)
         {
            if(btn_buyTimes !== _loc3_)
            {
               if(wp.btn_next !== _loc3_)
               {
                  if(wp.btn_reward !== _loc3_)
                  {
                     if(this.chk_fastfight !== _loc3_)
                     {
                        if(this.btn_rank !== _loc3_)
                        {
                           if(this.btn_getSwap === _loc3_)
                           {
                              ModuleMgr.ins.showModule(50705,null);
                           }
                        }
                        else
                        {
                           ModuleMgr.ins.showModule(50704);
                        }
                     }
                     else
                     {
                        LocalData.insCurPlayer.save("local_data_SE_fast_fight",chk_fastfight.selected);
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
                  else if(canGetReward)
                  {
                     if(model.info.boxRwdCount <= 0)
                     {
                        ServerEngine.ins.send(8602,null,onBoxRet);
                     }
                     else if(model.info.boxRwdCount < pa.length)
                     {
                        ModuleMgr.ins.closeModule(96300);
                        AlertUtil.comfirm(LocaleMgr.ins.getStr(50700115,[getBoxPrice(model.info.boxRwdCount)]),openDiamondBox,null,null);
                     }
                     else
                     {
                        AlertUtil.float(LocaleMgr.ins.getStr(50700125));
                     }
                  }
                  else
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(50700107));
                  }
               }
               else if(model.info.boxRwdCount <= 0)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(50700122));
               }
               else
               {
                  if(model.info.phase >= 3)
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(50700127));
                     return;
                  }
                  ModuleMgr.ins.closeModule(96300);
                  AlertUtil.comfirm(LocaleMgr.ins.getStr(50700124),goNext,null,null);
               }
            }
            else if(TimePriceUtil.curTimes(19) < int(VipModel.ins.getVipValue(50700)))
            {
               AlertUtil.comfirm(new AdvanceBuyBox(19,50700,50600048,30121013,50600052,buyTimes_yes));
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
      
      private function getBoxPrice(param1:int) : Number
      {
         var _loc2_:StcGlobalPriceVo = StcMgr.ins.getGlobalPriceVo(String(pa[param1]).split(":")[2]);
         if(_loc2_)
         {
            return _loc2_.price;
         }
         return 0;
      }
      
      private function onBoxRet(param1:MjtxOpenBoxRes) : void
      {
         model.info.boxRwdCount++;
         var _loc2_:Array = WealthUtil.rewardArrToWealthVoArr(param1.rwd);
         FloatUtil.showGetItemsDisplayPanel(_loc2_);
         updateBox();
         updateNextBtn();
      }
      
      private function updateChkLabel() : void
      {
         chk_fastfight.label = !!chk_fastfight.selected?LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740008):LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740009);
      }
      
      private function get canGetReward() : Boolean
      {
         return uiToC(wp.f4).isfighted || uiToC(wp.f8).isfighted || uiToC(wp.f12).isfighted || uiToC(wp.f16).isfighted;
      }
      
      private function goNext() : void
      {
         onRet = function():void
         {
            fastcloseHandler(true);
         };
         ServerEngine.ins.send(8606,null,onRet);
      }
      
      private function buyTimes_yes() : void
      {
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41300250)));
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
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(8600,null,onInfoRet);
      }
      
      private function onInfoRet(param1:MjtxInfoRes) : void
      {
         model.info = param1;
         moduleServerCpl();
      }
      
      private function get model() : SEModel
      {
         return SEModel.ins;
      }
      
      private function uiToC(param1:SEfaceUI) : SEface
      {
         return param1 as SEface;
      }
      
      private function updateWay() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         uiToC(wp.f0).setSelf(PlayerVoUtils.curPlayerVo());
         _loc2_ = 0;
         while(_loc2_ < model.info.enemy.length)
         {
            _loc1_ = uiToC(wp["f" + (_loc2_ + 1)]);
            _loc1_.index = _loc2_;
            _loc1_.setEnemy(model.info.enemy[_loc2_]);
            _loc1_.unknowMode();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ <= model.info.enemy.length)
         {
            _loc1_ = uiToC(wp["f" + _loc2_]);
            if(_loc1_.isfighted)
            {
               openWay(_loc2_);
            }
            _loc2_++;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["OPT_SECRET_EXPLORE_FIGHT","OPT_SECRET_EXPLORE_HELP","OPT_SECRET_EXPLORE_CHOOSE_FRIEND","server_time_notice_5","OPT_SECRET_EXPLORE_RED_POINT_CHECK"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("OPT_SECRET_EXPLORE_FIGHT" !== _loc3_)
         {
            if("OPT_SECRET_EXPLORE_HELP" !== _loc3_)
            {
               if("OPT_SECRET_EXPLORE_CHOOSE_FRIEND" !== _loc3_)
               {
                  if("server_time_notice_5" !== _loc3_)
                  {
                     if("OPT_SECRET_EXPLORE_RED_POINT_CHECK" === _loc3_)
                     {
                        this.scoreSwapRedPoi.visible = model.canGetScoreReward;
                     }
                  }
                  else
                  {
                     fastcloseHandler(true);
                  }
               }
               else
               {
                  onFight(param2 as GameFriendData);
               }
            }
            else
            {
               fightIndex = param2 as int;
               ModuleMgr.ins.showModule(50703);
            }
         }
         else
         {
            fightIndex = param2 as int;
            onFight();
         }
      }
      
      private function starFastFight(param1:MjtxAutoFightRes) : void
      {
         _isFight = false;
         var _loc3_:MjtxEnemyInfo = uiToC(wp["f" + (fightIndex + 1)])._data;
         var _loc4_:BgFightNotify = new BgFightNotify();
         var _loc5_:FastBattleData = new FastBattleData();
         _loc4_.attacker = param1.attacker;
         _loc4_.target = param1.target;
         if(param1.result == 1)
         {
            _loc4_.winnerId = param1.attacker.playerId;
         }
         else
         {
            _loc4_.winnerId = param1.target.playerId;
         }
         var _loc2_:FastBattlePlayerData = new FastBattlePlayerData();
         var _loc7_:FastBattlePlayerData = new FastBattlePlayerData();
         if(_friendvo)
         {
            _loc2_.name = _friendvo.name;
            _loc2_.level = _friendvo.level;
            _loc2_.fightValue = _friendvo.ability;
            _loc2_.playerId = _friendvo.id;
            _loc2_.npcID = _friendvo.baseid;
         }
         else
         {
            _loc2_.name = PlayerModel.ins.playerInfo.name;
            _loc2_.level = PlayerModel.ins.level;
            _loc2_.fightValue = Uint64Util.fromNumber(PlayerModel.ins.totalFightValue);
            _loc2_.playerId = PlayerModel.ins.playerInfo.id;
            _loc2_.npcID = PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId;
            _loc2_.miliRank = PlayerModel.ins.playerInfo.militaryrank;
         }
         _loc2_.side = 1;
         var _loc6_:String = PlayerModel.ins.getFullNameWithDistName(_loc3_.baseInfo,true,false);
         _loc7_.name = _loc6_;
         _loc7_.fightValue = _loc3_.baseInfo.ability;
         _loc7_.level = _loc3_.baseInfo.lv;
         _loc7_.miliRank = _loc3_.baseInfo.militaryRank;
         _loc7_.side = 2;
         _loc7_.npcID = _loc3_.baseInfo.npcId;
         _loc5_.fightData = _loc4_;
         _loc5_.leftPlayerData = _loc2_;
         _loc5_.rightPlayerData = _loc7_;
         _loc5_.closeCallBack = new Handler(losehandler);
         _loc5_.loseCallBack = new Handler(losehandler);
         _loc5_.winCallBack = new Handler(fightWinHandler,[param1]);
         ModuleMgr.ins.closeModule(50509);
         ModuleMgr.ins.showModule(50509,_loc5_);
         TweenLite.delayedCall(1,fastcloseHandler);
      }
      
      private function fightWinHandler(param1:MjtxAutoFightRes) : void
      {
         if(param1.reward && param1.reward.length)
         {
            TweenLite.delayedCall(0.8,FloatUtil.showGetItemsDisplayPanel,[WealthUtil.rewardArrToWealthVoArr(param1.reward)]);
         }
      }
      
      private function losehandler() : void
      {
      }
      
      private function fastcloseHandler(param1:Boolean = false) : void
      {
         reset = param1;
         onRet = function(param1:MjtxInfoRes):void
         {
            if(reset)
            {
               initWayPoint();
            }
            model.info = param1;
            updateView();
            model.checkScoreCanGet();
         };
         ServerEngine.ins.send(8600,null,onRet);
      }
      
      private function onFight(param1:GameFriendData = null) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(model.info.fightCount <= 0)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(300004250)));
            return;
         }
         if(_isFight)
         {
            return;
         }
         _isFight = true;
         _friendvo = null;
         if(isFastFight)
         {
            _loc3_ = new MjtxAutoFightReq();
            if(param1)
            {
               _loc3_.friendId = param1.id;
               _friendvo = param1;
            }
            _loc3_.posId = fightIndex;
            ServerEngine.ins.send(8605,_loc3_,starFastFight,FastErrhandler);
         }
         else
         {
            _loc2_ = new MjtxFightStartReq();
            if(param1)
            {
               _loc2_.friendId = param1.id;
            }
            _loc2_.posId = fightIndex;
            ServerEngine.ins.send(8603,_loc2_,fightRet);
         }
      }
      
      private function FastErrhandler(param1:*) : void
      {
         _isFight = false;
      }
      
      private function fightRet(param1:MjtxFightStartRes) : void
      {
         _isFight = false;
         var _loc2_:SEBattleModuleParamVo = new SEBattleModuleParamVo();
         _loc2_.funcId = 50701;
         _loc2_.random = param1.random;
         _loc2_.player = param1.player;
         ModuleMgr.ins.showModule(50701,_loc2_);
      }
      
      private function openWay(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Array = SEConst.way[param1];
         if(param1 > 0)
         {
            _loc3_ = uiToC(wp["f" + param1]);
            _loc3_.fightedMode();
         }
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc5_];
            if(_loc4_ < 17)
            {
               _loc3_ = uiToC(wp["f" + _loc4_]);
               _loc3_.inFightMode();
            }
            if(lineDic["a" + param1 + "b" + _loc4_])
            {
               this.lines.mc_mask.addChild(lineDic["a" + param1 + "b" + _loc4_]);
            }
            else if(lineDic["a" + _loc4_ + "b" + param1])
            {
               this.lines.mc_mask.addChild(lineDic["a" + _loc4_ + "b" + param1]);
            }
            _loc5_++;
         }
      }
      
      private function upatePhase(param1:int) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            if(_loc2_ <= param1)
            {
               wp["img_l" + _loc2_].filters = [];
               if(_loc2_ - 1 >= 0)
               {
                  wp["img_a" + (_loc2_ - 1)].filters = [];
               }
            }
            else
            {
               wp["img_l" + _loc2_].filters = [FilterUtil.blackWhiteFilter()];
               if(_loc2_ - 1 >= 0)
               {
                  wp["img_a" + (_loc2_ - 1)].filters = [FilterUtil.blackWhiteFilter()];
               }
            }
            _loc2_++;
         }
      }
      
      override public function dispose() : void
      {
         TweenMax.killTweensOf(this.wp.box_tips);
         var _loc3_:int = 0;
         var _loc2_:* = lineDic;
         for each(var _loc1_ in lineDic)
         {
            this.lines.mc_mask.addChild(_loc1_);
         }
         DisplayUtils.removeSelf(lines);
         super.dispose();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         SoundMgr.ins.playBackSound("map_kfzb");
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         ModuleMgr.ins.showModule(10430);
         ModuleMgr.ins.showModule(10400);
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
         var _loc2_:Array = [50702,30810,32000].reverse();
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc2_,[],true,false));
         initWayPoint();
         this.chk_fastfight.selected = LocalData.insCurPlayer.load("local_data_SE_fast_fight",false);
         updateChkLabel();
         updateView();
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         new SEScoreRedChecker().go();
      }
      
      private function updateView() : void
      {
         this.txt_scoreValue.text = model.info.rank + "";
         var _loc3_:* = PlayerModel.ins.getWealthValue(34);
         this.txt_rank.text = _loc3_ == null?"0":_loc3_ + "";
         this.txt_times.text = TextFieldUtil.htmlText2(model.info.fightCount,11137387) + "/" + int(DefindConsts.ADVENTURE_DEFAULT_FIGHT_TIMES);
         upatePhase(model.info.phase);
         updateWay();
         var _loc5_:Array = String(String(DefindConsts.ADVENTURE_BOX_DROP).split("|")[1]).split(",");
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_drop_group","drop_group_id",int(_loc5_[model.info.phase]));
         var _loc4_:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = _loc1_;
         for each(var _loc6_ in _loc1_)
         {
            _loc4_ = _loc4_.concat(WealthUtil.dropBaseByGroupIdToWealthVoArr(_loc6_.id));
         }
         var _loc2_:SEBoxTipsVo = new SEBoxTipsVo();
         _loc2_.phase = model.info.phase;
         _loc2_.items = _loc4_;
         wp.btn_reward.toolTip = _loc2_;
         updateBox();
         updateNextBtn();
      }
      
      private function updateBox() : void
      {
         this.wp.txt_box_prompt.text = "";
         switchBoxEffect(false);
         if(canGetReward)
         {
            if(model.info.boxRwdCount <= 0)
            {
               switchBoxEffect(true);
            }
            else
            {
               if(model.info.boxRwdCount == 1 || model.info.boxRwdCount == 2)
               {
                  this.wp.txt_box_prompt.text = LocaleMgr.ins.getStr(50700129,[getBoxPrice(model.info.boxRwdCount)]);
               }
               wp.btn_reward.skin = "png.uiSecretExplore.img_box_open";
            }
         }
         else
         {
            wp.btn_reward.skin = "png.uiSecretExplore.img_box_close";
         }
         if(model.info.boxRwdCount >= pa.length)
         {
            wp.btn_reward.skin = "png.uiSecretExplore.img_box_empty";
         }
      }
      
      private function updateNextBtn() : void
      {
         if(model.info.boxRwdCount <= 0)
         {
            this.wp.btn_next.disabled = true;
            switchArrowEffect(false);
         }
         else
         {
            if(model.info.phase >= 3)
            {
               this.wp.btn_next.disabled = true;
               switchArrowEffect(false);
               return;
            }
            this.wp.btn_next.disabled = false;
            switchArrowEffect(true);
         }
      }
      
      private function switchArrowEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(aEff == null)
            {
               aEff = new BmcSpriteSheet();
               aEff.init(32000002,1,"all",true);
               aEff.x = -5;
               aEff.x = wp["img_l" + model.info.phase].x + 63;
               aEff.y = wp["img_l" + model.info.phase].y + 22;
               this.wp.addChild(aEff);
               wp["img_a" + model.info.phase].visible = false;
            }
         }
         else
         {
            wp["img_a" + Math.min(model.info.phase,2)].visible = true;
            if(aEff)
            {
               aEff.dispose();
               aEff = null;
            }
         }
      }
      
      private function switchBoxEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(boxEff == null)
            {
               boxEff = new BmcSpriteSheet();
               boxEff.init(32000003,1,"all",true);
               boxEff.x = -5;
               boxEff.x = wp.btn_reward.x + 69;
               boxEff.y = wp.btn_reward.y + 79;
               this.wp.addChild(boxEff);
            }
         }
         else if(boxEff)
         {
            boxEff.dispose();
            boxEff = null;
         }
      }
      
      private function boxTipsAni() : void
      {
         TweenMax.killTweensOf(this.wp.box_tips);
         TweenMax.to(this.wp.box_tips,2,{
            "alpha":0,
            "delay":4,
            "onComplete":onTweenComplete
         });
      }
      
      private function onTweenComplete() : void
      {
         TweenMax.killTweensOf(this.wp.box_tips);
         TweenMax.to(this.wp.box_tips,2,{
            "alpha":1,
            "delay":4,
            "onComplete":boxTipsAni
         });
      }
   }
}
