package nslm2.modules.funnies.teamGuajiScenes.pvp
{
   import game.ui.teamGuajiScenes.pvp.RobTreasurePanelUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.common.ui.components.comps2d.TextCDCtrl;
   import nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob.AutoRobPanel;
   import nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob.FastRobPanel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.handlers.Handler;
   import proto.GJPvpInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.utils.ServerTimer;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.modules.foundations.activities.model.ActivityDropModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.LabelMed;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import com.mz.core.logging.Log;
   import nslm2.utils.TimeUtils;
   import proto.PlayerBaseInfo;
   import game.ui.teamGuajiScenes.pvp.PlayerStatusUI;
   import nslm2.utils.Uint64Util;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import proto.GuajiPvpAutoFightRes;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import proto.BgFightNotify;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.GuajiSaoDangRes;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.newerGuideModules.NGCompForUnit3D;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import com.netease.protobuf.UInt64;
   import flash.geom.Point;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.tooltipsModules.TooltipUtils;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   
   public class RobTreasurePieceModule extends RobTreasurePanelUI implements INewerGuideGetComp
   {
      
      private static const FAST_ROB_COUNT:int = 10;
       
      
      private var panel3D:UIPanel3D;
      
      private var playerAvatars:Array;
      
      private var PLAYER_POS_ARR:Array;
      
      private var EFF_POS_ARR:Array;
      
      private var protedtCD:TextCDCtrlS2;
      
      private var pvpCntCD:TextCDCtrlS2;
      
      private var buyPvPCntPanel:nslm2.modules.funnies.teamGuajiScenes.pvp.BuyPvPCntPanel;
      
      private var useItemPanel:nslm2.modules.funnies.teamGuajiScenes.pvp.PVPUseProtectItemPanel;
      
      private var model:TeamGuajiModel;
      
      private var service:TeamGuajiService;
      
      private var changeCD:TextCDCtrl;
      
      private var autoRobPanel:AutoRobPanel;
      
      private var fastRobPanel:FastRobPanel;
      
      private var fastRobCnt:int;
      
      private var ngFakeComp2D:NGCompForUnit3D;
      
      public function RobTreasurePieceModule()
      {
         playerAvatars = [];
         PLAYER_POS_ARR = [new Point(-224,-94),new Point(-76,-30),new Point(76,-30),new Point(214,-94)];
         EFF_POS_ARR = [new Point(179,300),new Point(304,243),new Point(484,243),new Point(621,300)];
         super();
         model = TeamGuajiModel.ins;
         service = TeamGuajiService.ins;
         panelBg.bgCustom.addChild(img_funBg);
         MornExpandUtil.addHandlerForBtnAll(this,btnCickHandler);
         txt_changeCD.visible = false;
         txt_see.selectable = false;
         txt_see.mouseEnabled = true;
         txt_see.toolTip = LocaleMgr.ins.getStr(41210136);
         TextFieldUtil.showLabelBottomModel(txt_see);
         TooltipUtils.preventHideByMouseDown(txt_see);
         this.addChild(new VipHintBox(10410,308,442));
         this.moduleFadeInType = 2;
         btn_fastRob.toolTip = LocaleMgr.ins.getStr(41300286,[DefindConsts.GJPVP_RAPID_VIP]);
      }
      
      private function btnCickHandler(param1:Button) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = param1;
         if(btn_addCnt !== _loc3_)
         {
            if(btn_mianZhan !== _loc3_)
            {
               if(btn_pieceBg !== _loc3_)
               {
                  if(btn_refresh !== _loc3_)
                  {
                     if(btn_position !== _loc3_)
                     {
                        if(btn_rank !== _loc3_)
                        {
                           if(sdBtn1 !== _loc3_)
                           {
                              if(sdBtn2 !== _loc3_)
                              {
                                 if(sdBtn3 !== _loc3_)
                                 {
                                    if(sdBtn4 !== _loc3_)
                                    {
                                       if(check_simpleFight !== _loc3_)
                                       {
                                          if(btn_fastRob === _loc3_)
                                          {
                                             if(PlayerModel.ins.vip < int(DefindConsts.GJPVP_RAPID_VIP))
                                             {
                                                AlertUtil.float(LocaleMgr.ins.getStr(41300287,[DefindConsts.GJPVP_RAPID_VIP]));
                                                return;
                                             }
                                             if(model.pvpCount < 1)
                                             {
                                                AlertUtil.float(LocaleMgr.ins.getStr(300008310));
                                                showBuyPvPCntPanel();
                                             }
                                             else
                                             {
                                                if(model.protectCD > 0)
                                                {
                                                   AlertUtil.comfirm(LocaleMgr.ins.getStr(41300248) + "\n" + LocaleMgr.ins.getStr(41300249,[txt_mzCD.text]),new Handler(doFastRob));
                                                   return;
                                                }
                                                doFastRob();
                                             }
                                          }
                                       }
                                       else
                                       {
                                          _loc2_ = check_simpleFight.selected;
                                          if(PlayerModel.ins.level < int(DefindConsts.GJPVP_JIANYI_LV))
                                          {
                                             AlertUtil.float(LocaleMgr.ins.getStr(41300288,[DefindConsts.GJPVP_JIANYI_LV]));
                                             check_simpleFight.selected = false;
                                             return;
                                          }
                                          check_simpleFight.label = !!check_simpleFight.selected?LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740008):LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740009);
                                          if(check_simpleFight.selected)
                                          {
                                             AlertUtil.float(LocaleMgr.ins.getStr(41300283));
                                          }
                                          else
                                          {
                                             AlertUtil.float(LocaleMgr.ins.getStr(41300284));
                                          }
                                       }
                                    }
                                    else
                                    {
                                       autoRob(3);
                                    }
                                 }
                                 else
                                 {
                                    autoRob(2);
                                 }
                              }
                              else
                              {
                                 autoRob(1);
                              }
                           }
                           else
                           {
                              autoRob(0);
                           }
                        }
                        else
                        {
                           ModuleMgr.ins.showModule(41221,null,ModuleMgr.ins.popLayer.curModuleId);
                        }
                     }
                     else
                     {
                        ModuleMgr.ins.showModule(40100,null,ModuleMgr.ins.popLayer.curModuleId);
                     }
                  }
                  else
                  {
                     refreshPlayers();
                  }
               }
               else
               {
                  ModuleMgr.ins.showModule(41217,null,ModuleMgr.ins.popLayer.curModuleId);
               }
            }
            else
            {
               showUseProtectItemPanel();
            }
         }
         else
         {
            AlertUtil.comfirm(new BuyRobCountView());
         }
      }
      
      private function doFastRob() : void
      {
         fastRobCnt = Math.min(model.pvpCount,10);
         service.requestFastRob(Math.min(model.pvpCount,10),showFastRobPanel);
      }
      
      private function autoRob(param1:int) : void
      {
         var _loc2_:* = null;
         if(model.pvpCount < 1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300008310));
            showBuyPvPCntPanel();
         }
         else
         {
            _loc2_ = model.crtPvPPlayers[param1];
            if(model.protectCD > 0)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(41300248) + "\n" + LocaleMgr.ins.getStr(41300249,[txt_mzCD.text]),new Handler(doAutoRob,[_loc2_]));
               return;
            }
            doAutoRob(_loc2_);
         }
      }
      
      private function doAutoRob(param1:GJPvpInfo) : void
      {
         model.crtAttackTarget = param1.info;
         showAutoRobPanel(param1);
      }
      
      private function showUseProtectItemPanel() : void
      {
         if(!useItemPanel)
         {
            useItemPanel = new nslm2.modules.funnies.teamGuajiScenes.pvp.PVPUseProtectItemPanel();
            useItemPanel.x = this.width - useItemPanel.width >> 1;
            useItemPanel.y = btn_mianZhan.y - useItemPanel.height - 20;
            useItemPanel.panelFadeIn();
         }
         useItemPanel.show();
         if(!this.contains(useItemPanel))
         {
            addChild(useItemPanel);
         }
      }
      
      private function showBuyPvPCntPanel() : void
      {
         AlertUtil.comfirm(new BuyRobCountView());
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:* = null;
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9041219);
         ObserverMgr.ins.regObserver(this);
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         panel3D.visible = false;
         if(!model.crtPvPPlayers.length)
         {
            TeamGuajiService.ins.changePvPPlayers();
         }
         else
         {
            updatePlayerList();
         }
         updatePvPCnt();
         updateMyRank();
         updateProtectCD();
         if(!pvpCntCD)
         {
            pvpCntCD = new TextCDCtrlS2(txt_addCD,addCntCDFormation,addCntCdEnd);
            if(TeamGuajiModel.ins.pvpCntAddCD - ServerTimer.ins.second > int(DefindConsts.GJPVP_CISHU_HUIFU))
            {
               TeamGuajiModel.ins.pvpCntAddCD = ServerTimer.ins.second + int(DefindConsts.GJPVP_CISHU_HUIFU);
            }
            pvpCntCD.start(TeamGuajiModel.ins.pvpCntAddCD);
         }
         var _loc4_:StcGuajiVo = StcMgr.ins.getGuajiVo(TeamGuajiService.ins.sceneInfo.curGuajiId);
         var _loc2_:int = _loc4_.pvp_drop;
         txt_getTip.text = LocaleMgr.ins.getStr(41300201,[" " + getItemLink(_loc2_)]);
         txt_see.x = txt_getTip.width + 36;
         check_simpleFight.selected = PlayerModel.ins.level >= int(DefindConsts.GJPVP_JIANYI_LV);
         check_simpleFight.label = !!check_simpleFight.selected?LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740008):LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740009);
         var _loc5_:Array = ActivityDropModel.ins.getActivityDropWealthArray(41219);
         if(_loc5_.length > 0)
         {
            _loc3_ = _loc5_[0];
            this.txt_otherDrop.text = LocaleMgr.ins.getStr(999000555) + LabelMed.wealthParam(_loc3_.kind,_loc3_.sid,_loc3_.count);
            this.box_otherDrop.visible = true;
         }
         else
         {
            this.txt_otherDrop.text = "";
            this.box_otherDrop.visible = false;
         }
         super.preShow();
      }
      
      private function getItemLink(param1:int) : String
      {
         var _loc3_:* = 0;
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         if(_loc2_ == null)
         {
            return "ERROR stcItem ID(" + param1 + ")";
         }
         _loc3_ = uint(ColorLib.qualityColor(_loc2_.quality));
         return TextFieldUtil.linkHtmlText(LocaleMgr.ins.getStr(_loc2_.name),new TextFormat(null,12,_loc3_),LinkUtils.evtString(4,param1));
      }
      
      private function addCntCdEnd() : void
      {
         TeamGuajiModel.ins.pvpCntAddCD = ServerTimer.ins.second + int(DefindConsts.GJPVP_CISHU_HUIFU);
         try
         {
            pvpCntCD.start(TeamGuajiModel.ins.pvpCntAddCD);
            return;
         }
         catch($err:Error)
         {
            Log.fatal(this,$err,$err.getStackTrace());
            return;
         }
      }
      
      private function addCntCDFormation(param1:int) : String
      {
         return TimeUtils.hisColonAddZero2(param1);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["guaji_update_pvp_playres","guaji_update_pvp_count","guaji_update_protect_cd","guaji_rob_success","update_my_rank"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guaji_update_pvp_playres" !== _loc3_)
         {
            if("guaji_update_pvp_count" !== _loc3_)
            {
               if("guaji_update_protect_cd" !== _loc3_)
               {
                  if("guaji_rob_success" !== _loc3_)
                  {
                     if("update_my_rank" !== _loc3_)
                     {
                     }
                     addr22:
                  }
                  addr19:
                  updateMyRank();
                  §§goto(addr22);
               }
               else
               {
                  updateProtectCD();
               }
               robSuccessHandler();
               §§goto(addr19);
            }
            else
            {
               updatePvPCnt();
            }
         }
         else
         {
            updatePlayerList();
         }
      }
      
      private function updatePlayerList() : void
      {
         var _loc10_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc11_:int = 0;
         var _loc5_:* = null;
         var _loc1_:* = null;
         if(playerAvatars.length)
         {
            while(playerAvatars.length)
            {
               _loc10_ = playerAvatars.pop();
               if(_loc10_)
               {
                  _loc10_.dispose();
                  _loc10_ = null;
               }
            }
         }
         var _loc9_:int = model.crtPvPPlayers.length;
         var _loc8_:StcGuajiVo = StcMgr.ins.getGuajiVo(TeamGuajiService.ins.sceneInfo.curGuajiId);
         var _loc7_:int = _loc8_.pvp_drop;
         var _loc2_:Array = [];
         list_canGet.dataSource = _loc2_;
         _loc11_ = 0;
         while(_loc11_ < _loc9_)
         {
            if(_loc11_ <= 4)
            {
               _loc3_ = model.crtPvPPlayers[_loc11_];
               _loc5_ = _loc3_.info;
               _loc10_ = new TeamGuajiPvPPlayer3D();
               _loc10_.initByPlayerInfo(_loc5_);
               panel3D.addChild3D(_loc10_);
               playerAvatars.push(_loc10_);
               _loc10_.pos2d = PLAYER_POS_ARR[_loc11_];
               _loc10_.addEventListener("unitMouseClick",playerClickHandler);
               _loc4_ = this["playerStatus" + (_loc11_ + 1)];
               if(_loc3_.isDead)
               {
                  if(model.crtAttackTarget && Uint64Util.equal(model.crtAttackTarget.id,_loc3_.info.id))
                  {
                     _loc3_.count = _loc3_.count - DefindConsts.GJPVP_QIANGDUO_NUM;
                     _loc3_.count = _loc3_.count < 0?0:_loc3_.count;
                     model.crtAttackTarget = null;
                  }
                  this["sdBtn" + (_loc11_ + 1)].visible = false;
                  _loc10_.die();
                  this["img_dead" + (_loc11_ + 1)].visible = true;
                  _loc6_++;
               }
               else
               {
                  if(_loc3_.probStatus == 0)
                  {
                     this["sdBtn" + (_loc11_ + 1)].visible = true;
                     this["sdBtn" + (_loc11_ + 1)].toolTip = LocaleMgr.ins.getStr(41300271);
                  }
                  else
                  {
                     this["sdBtn" + (_loc11_ + 1)].visible = false;
                  }
                  this["img_dead" + (_loc11_ + 1)].visible = false;
               }
               _loc1_ = new WealthVo();
               _loc1_.sid = _loc7_;
               _loc1_.kind = 20;
               _loc1_.count = _loc3_.count;
               _loc2_.push(_loc1_);
               _loc4_.txt_status.text = LocaleMgr.ins.getStr(41300204) + " " + LocaleMgr.ins.getStr(41300205 + _loc3_.probStatus);
               _loc11_++;
               continue;
            }
            break;
         }
         list_canGet.dataSource = _loc2_;
         box_deadImg.visible = true;
         box_status.visible = true;
         if(_loc6_ >= 4)
         {
            refreshPlayers();
         }
      }
      
      private function robSuccessHandler() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc9_:int = 0;
         var _loc3_:* = null;
         var _loc8_:* = null;
         var _loc7_:int = model.crtPvPPlayers.length;
         var _loc6_:StcGuajiVo = StcMgr.ins.getGuajiVo(TeamGuajiService.ins.sceneInfo.curGuajiId);
         var _loc5_:int = _loc6_.pvp_drop;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            if(_loc9_ <= 4)
            {
               _loc1_ = model.crtPvPPlayers[_loc9_];
               _loc3_ = _loc1_.info;
               _loc2_ = this["playerStatus" + (_loc9_ + 1)];
               _loc8_ = playerAvatars[_loc9_];
               if(_loc1_.isDead)
               {
                  if(model.crtAttackTarget && Uint64Util.equal(model.crtAttackTarget.id,_loc1_.info.id))
                  {
                     _loc1_.count = _loc1_.count - DefindConsts.GJPVP_QIANGDUO_NUM;
                     _loc1_.count = _loc1_.count < 0?0:_loc1_.count;
                     model.crtAttackTarget = null;
                  }
                  _loc4_++;
                  (list_canGet.dataSource[_loc9_] as WealthVo).count = _loc1_.count;
                  this["sdBtn" + (_loc9_ + 1)].visible = false;
                  _loc8_.die();
                  this["img_dead" + (_loc9_ + 1)].visible = true;
               }
               list_canGet.dataSource = list_canGet.dataSource;
               _loc9_++;
               continue;
            }
            break;
         }
         updateMyRank();
         if(_loc4_ >= 4)
         {
            refreshPlayers();
         }
      }
      
      private function playerClickHandler(param1:Event) : void
      {
         if(model.pvpCount < 1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300008310));
            showBuyPvPCntPanel();
            return;
         }
         var _loc2_:PlayerBaseInfo = (param1.currentTarget as TeamGuajiPvPPlayer3D).pvpPlayer;
         if(PlayerModel.ins.playerInfo.familyName && _loc2_.familyName == PlayerModel.ins.playerInfo.familyName)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(41300051,[_loc2_]),new Handler(doRob,[_loc2_]));
            return;
         }
         if(model.protectCD > 0)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(41300248) + "\n" + LocaleMgr.ins.getStr(41300249,[txt_mzCD.text]),new Handler(doRob,[_loc2_]));
            return;
         }
         doRob(_loc2_);
         if(ngFakeComp2D)
         {
            ngFakeComp2D.dispatchEvent(new MouseEvent("click",true,false));
            ngFakeComp2D.dispose();
            ngFakeComp2D = null;
         }
      }
      
      private function doRob(param1:PlayerBaseInfo) : void
      {
         model.crtAttackTarget = param1;
         if(check_simpleFight.selected)
         {
            TeamGuajiService.ins.reqeustPvPSimpleFight(param1.dist,param1.id,pvpSimpleFightHandler);
         }
         else
         {
            TeamGuajiService.ins.reqeustPvPFight(param1.dist,param1.id,pvpFightStart);
         }
      }
      
      private function pvpFightStart(param1:GuajiPvpAutoFightRes) : void
      {
         model.rankToday = param1.rank;
         model.robPieceCountToday = model.robPieceCountToday + param1.stealCount;
         model.showRobPanel = true;
         var _loc2_:BattleReportParamVo = BattleReportParamVo.createId(param1.reportId);
         _loc2_.type = 2;
         _loc2_.drops = param1.reward;
         _loc2_.robSuccess = param1.stealCount > 0;
         ModuleMgr.ins.showModule(40201,_loc2_);
         if(_loc2_.robSuccess)
         {
            TeamGuajiModel.ins.updateKilledPlayer();
         }
      }
      
      private function pvpSimpleFightHandler(param1:GuajiPvpAutoFightRes) : void
      {
         model.rankToday = param1.rank;
         model.robPieceCountToday = model.robPieceCountToday + param1.stealCount;
         var _loc4_:* = param1.stealCount > 0;
         var _loc3_:BgFightNotify = new BgFightNotify();
         var _loc5_:FastBattleData = new FastBattleData();
         _loc3_.attacker = param1.attacker;
         _loc3_.target = param1.target;
         if(param1.result == 1)
         {
            _loc3_.winnerId = param1.attacker.playerId;
         }
         else
         {
            _loc3_.winnerId = param1.target.playerId;
         }
         var _loc2_:FastBattlePlayerData = new FastBattlePlayerData();
         var _loc7_:FastBattlePlayerData = new FastBattlePlayerData();
         _loc2_.name = PlayerModel.ins.getSelfFullNameWithDistName(false);
         _loc2_.level = PlayerModel.ins.level;
         _loc2_.fightValue = Uint64Util.fromNumber(PlayerModel.ins.totalFightValue);
         _loc2_.playerId = PlayerModel.ins.playerInfo.id;
         _loc2_.npcID = PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId;
         _loc2_.miliRank = PlayerModel.ins.playerInfo.militaryrank;
         _loc2_.side = 1;
         var _loc6_:String = PlayerModel.ins.getFullNameWithDistName(model.crtAttackTarget,true,false);
         _loc7_.name = _loc6_;
         _loc7_.fightValue = model.crtAttackTarget.ability;
         _loc7_.level = model.crtAttackTarget.lv;
         _loc7_.miliRank = model.crtAttackTarget.militaryRank;
         _loc7_.side = 2;
         _loc7_.npcID = model.crtAttackTarget.npcId;
         _loc5_.fightData = _loc3_;
         _loc5_.leftPlayerData = _loc2_;
         _loc5_.rightPlayerData = _loc7_;
         _loc5_.loseCallBack = new Handler(fightWinHandler,[param1]);
         _loc5_.winCallBack = new Handler(fightWinHandler,[param1]);
         ModuleMgr.ins.showModule(50509,_loc5_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function fastFightEndHandler(param1:GuajiPvpAutoFightRes) : void
      {
      }
      
      private function fightWinHandler(param1:GuajiPvpAutoFightRes) : void
      {
         if(param1.reward && param1.reward.length)
         {
            TweenLite.delayedCall(0.8,FloatUtil.showGetItemsDisplayPanel,[WealthUtil.rewardArrToWealthVoArr(param1.reward)]);
         }
         var _loc2_:* = param1.stealCount > 0;
         if(_loc2_)
         {
            TeamGuajiModel.ins.updateKilledPlayer();
         }
      }
      
      private function updatePvPCnt() : void
      {
         var _loc1_:uint = !!TeamGuajiModel.ins.pvpCount?458496:16723968;
         txt_robCnt.text = TextFieldUtil.htmlText2(TeamGuajiModel.ins.pvpCount + "/" + DefindConsts.GJPVP_CISU_CEIL,_loc1_);
      }
      
      private function updateProtectCD() : void
      {
         if(TeamGuajiModel.ins.protectCD > 0)
         {
            if(!protedtCD)
            {
               protedtCD = new TextCDCtrlS2(txt_mzCD,getProtecteCDTxt,protectCdEndHandler);
            }
            protedtCD.start(TeamGuajiModel.ins.protectCD);
         }
         else
         {
            if(protedtCD)
            {
               protedtCD.dispose();
            }
            txt_mzCD.text = "";
         }
      }
      
      private function protectCdEndHandler() : void
      {
         model.protectCD = 0;
         txt_mzCD.text = "";
         protedtCD.stop();
         protedtCD = null;
      }
      
      private function getProtecteCDTxt(param1:int) : String
      {
         return TimeUtils.getSimpleTimeStr(param1);
      }
      
      private function refreshPlayers() : void
      {
         if(!changeCD)
         {
            changeCD = new TextCDCtrl(txt_changeCD,refreshCDFormation,clearRefreshCD);
         }
         changeCD.start(5);
         txt_changeCD.visible = true;
         btn_refresh.disabled = true;
         var _loc3_:int = 0;
         var _loc2_:* = playerAvatars;
         for each(var _loc1_ in playerAvatars)
         {
            _loc1_.visible = false;
         }
         box_deadImg.visible = false;
         box_status.visible = false;
         showRefreshEffect();
      }
      
      private function showRefreshEffect() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            _loc1_ = new BmcSpriteSheet();
            _loc1_.x = EFF_POS_ARR[_loc2_].x - 60;
            _loc1_.y = EFF_POS_ARR[_loc2_].y - 120;
            _loc1_.init(50200001);
            this.addChild(_loc1_);
            _loc2_++;
         }
         TweenLite.delayedCall(0.6,TeamGuajiService.ins.changePvPPlayers);
      }
      
      private function refreshCDFormation(param1:int) : String
      {
         return param1 + "";
      }
      
      private function clearRefreshCD() : void
      {
         btn_refresh.disabled = false;
         txt_changeCD.visible = false;
      }
      
      private function showAutoRobPanel(param1:GJPvpInfo) : void
      {
         if(!autoRobPanel)
         {
            autoRobPanel = new AutoRobPanel();
            autoRobPanel.addEventListener("close",closeAutoRobPanel);
         }
         autoRobPanel.show(param1);
         autoRobPanel.x = width - autoRobPanel.width >> 1;
         autoRobPanel.y = height - autoRobPanel.height >> 1;
         addChild(autoRobPanel);
         autoRobPanel.panelFadeIn();
      }
      
      protected function closeAutoRobPanel(param1:Event) : void
      {
         this.removeChild(autoRobPanel);
         autoRobPanel = null;
      }
      
      private function showFastRobPanel(param1:GuajiSaoDangRes) : void
      {
         if(!fastRobPanel)
         {
            fastRobPanel = new FastRobPanel();
            fastRobPanel.addEventListener("close",closeFastRobPanel);
         }
         if(param1 && param1.sdRwd && param1.sdRwd.length > 0)
         {
            fastRobPanel.show(param1.sdRwd);
            fastRobPanel.x = width - fastRobPanel.width >> 1;
            fastRobPanel.y = height - fastRobPanel.height >> 1;
            addChild(fastRobPanel);
            fastRobPanel.panelFadeIn();
         }
         model.rankToday = param1.rank;
         model.pvpCount = model.pvpCount - fastRobCnt;
      }
      
      protected function closeFastRobPanel(param1:Event) : void
      {
         this.removeChild(fastRobPanel);
         fastRobPanel = null;
      }
      
      private function updateCompPosition() : void
      {
         txt_myRank.x = txt1.x + txt1.width + 10;
      }
      
      private function updateMyRank() : void
      {
         if(TeamGuajiModel.ins.rankToday > 0)
         {
            txt_myRank.style = "渐变1";
            txt_myRank.size = 20;
            txt_myRank.text = TeamGuajiModel.ins.rankToday + "";
         }
         else
         {
            txt_myRank.size = 14;
            txt_myRank.y = 65;
            txt_myRank.text = LocaleMgr.ins.getStr(41300232);
         }
         updateCompPosition();
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this.panel3D.dispose();
         this.panel3D = null;
         if(ngFakeComp2D)
         {
            ngFakeComp2D.dispose();
            ngFakeComp2D = null;
         }
         super.preClose(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         panel3D.visible = true;
         NGUtil.checkModuleShow(this.moduleId);
         super.show(param1);
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = param1;
         if("unit3d" === _loc7_)
         {
            if(ngFakeComp2D)
            {
               ngFakeComp2D.dispose();
               ngFakeComp2D = null;
            }
            _loc7_ = 0;
            var _loc6_:* = playerAvatars;
            for each(var _loc4_ in playerAvatars)
            {
               if(_loc3_ == null || Uint64Util.compare(_loc4_.pvpPlayer.ability,_loc3_) == -1)
               {
                  _loc3_ = _loc4_.pvpPlayer.ability;
                  _loc5_ = _loc4_;
               }
            }
            if(_loc5_)
            {
               ngFakeComp2D = new NGCompForUnit3D(_loc5_,this,76,220,panel3D);
               return ngFakeComp2D;
            }
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      override public function dispose() : void
      {
         if(buyPvPCntPanel)
         {
            buyPvPCntPanel.dispose();
            buyPvPCntPanel = null;
         }
         if(useItemPanel)
         {
            useItemPanel.dispose();
            useItemPanel = null;
         }
         panelBg.dispose();
         super.dispose();
      }
   }
}
