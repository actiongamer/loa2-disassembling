package nslm2.modules.battles.battlefields.ctrls
{
   import nslm2.modules.scenes.ctrls.SceneCtrlBase;
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import proto.BgStagePlayerInfo;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.utils.Uint64Util;
   import flash.events.Event;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import proto.BgSceneMoveNotify;
   import nslm2.common.model.PlayerModel;
   import flash.geom.Point;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.modules.battles.battlefields.vos.BattlefieldPlayerDiedVo;
   import game.ui.commons.icons.BuffRenderS1UI;
   import nslm2.common.vo.BuffHasLayersVo;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.display.BitmapData;
   import away3d.entities.Entity;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.netease.protobuf.UInt64;
   import proto.BgPlayerStatusNotify;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.game.shared.component.NameTag3D;
   import nslm2.modules.battles.battlefields.vos.BattlefieldGatherVo;
   import morn.core.components.Label;
   import morn.core.utils.BitmapUtils;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   
   public class BattlefieldPlayerBaseCtrl extends SceneCtrlBase
   {
       
      
      public var player:ScenePlayer3D;
      
      protected var bgStagePlayerInfo:BgStagePlayerInfo;
      
      protected var _deathBuffImage3D:Image3D;
      
      protected var _noviceBuffImage3D:Image3D;
      
      protected var _buffRender:BuffRenderS1UI;
      
      protected var _noviceBuffRender:BuffRenderS1UI;
      
      protected var _playerTitleImage3D:Image3D;
      
      protected var _lastId:int;
      
      private var flagImg:Image3D;
      
      protected var _gatheringImage3D:NameTag3D;
      
      protected var _gathingId:int;
      
      private var cdCtr:TextCDCtrlS2;
      
      private var cdLabel:Label;
      
      private var cd3dLabel:NameTag3D;
      
      public function BattlefieldPlayerBaseCtrl()
      {
         super();
      }
      
      public function bind(param1:ScenePlayer3D) : BattlefieldPlayerBaseCtrl
      {
         player = param1;
         player.addEventListener("EVENT_CHNAGE_SPEED",speedChangeHandler);
         bgStagePlayerInfo = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(player.roleId));
         showHpBar(bgStagePlayerInfo);
         showDeathBuff(bgStagePlayerInfo.conDeathNum);
         showNoviceBuff(bgStagePlayerInfo.noviceBuffLayer);
         this.player.tag3DVBox.showBattlefieldSide(bgStagePlayerInfo.side);
         onUpdateFlagOwnder(null);
         return this;
      }
      
      protected function speedChangeHandler(param1:Event) : void
      {
         var _loc2_:Array = BattleFlagModel.ins.flagOwnerIdArr;
         if(_loc2_.indexOf(player.roleId.toString()) >= 0)
         {
            this.player.moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_BG_FLAG;
         }
      }
      
      public function showHpBar(param1:BgStagePlayerInfo) : void
      {
         this.player.tag3DVBox.showHpBar(param1.hpPercent / 100,hpBarSkin);
      }
      
      public function initScene(param1:Scene45Base) : BattlefieldPlayerBaseCtrl
      {
         this.init(param1);
         switchEventListeners(true);
         return this;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerDied",onDie);
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerRevived",onRevive);
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerPosChanged",onPosChanged);
            BattlefieldMsgs.ins.addEventListener("msgFightHpChanged",onHpChanged);
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerLeave",onLeave);
            BattlefieldMsgs.ins.addEventListener("msgFightConKill",onConCkill);
            BattlefieldMsgs.ins.addEventListener("msgCryBeginGather",onBeginGather);
            BattlefieldMsgs.ins.addEventListener("msgCryStopGather",onStopGather);
            BattlefieldMsgs.ins.addEventListener("msgCryMineDryUp",onMineDryUp);
            BattlefieldMsgs.ins.addEventListener("MSG_FLAG_OWNER_UPDATE",onUpdateFlagOwnder);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerDied",onDie);
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerRevived",onRevive);
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerPosChanged",onPosChanged);
            BattlefieldMsgs.ins.removeEventListener("msgFightHpChanged",onHpChanged);
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerLeave",onLeave);
            BattlefieldMsgs.ins.removeEventListener("msgFightConKill",onConCkill);
            BattlefieldMsgs.ins.removeEventListener("msgCryBeginGather",onBeginGather);
            BattlefieldMsgs.ins.removeEventListener("msgCryStopGather",onStopGather);
            BattlefieldMsgs.ins.removeEventListener("msgCryMineDryUp",onMineDryUp);
            BattlefieldMsgs.ins.removeEventListener("MSG_FLAG_OWNER_UPDATE",onUpdateFlagOwnder);
         }
      }
      
      protected function onUpdateFlagOwnder(param1:MzEvent) : void
      {
         var _loc2_:int = 0;
         var _loc4_:* = 0;
         var _loc3_:Array = BattleFlagModel.ins.flagOwnerIdArr;
         if(_loc3_.indexOf(player.roleId.toString()) >= 0)
         {
            _loc2_ = BattleFlagModel.ins.playerFlagDic.getValue(player.roleId.toString());
            _loc4_ = uint(BattleFlagModel.ins.flagResetCDDic.getValue(_loc2_));
            showFlagResetCD(_loc4_);
            this.player.moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_BG_FLAG;
            this.player.tag3DVBox.showBattlefieldFlag(bgStagePlayerInfo.side);
         }
         else
         {
            clearFlagResetCD();
            this.player.tag3DVBox.hideBattlefieldFlag();
            if(this.player.hasHorse)
            {
               this.player.moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_HORSE;
            }
            else
            {
               this.player.moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_WALK;
            }
         }
      }
      
      protected function get hpBarSkin() : String
      {
         return "png.a5.comps.progresses.progress_S13";
      }
      
      protected function onPosChanged(param1:MzEvent) : void
      {
         var _loc2_:BgSceneMoveNotify = param1.data;
         if(Uint64Util.equal(player.roleId,_loc2_.id))
         {
            if(PlayerModel.ins.isCurPlayer(_loc2_.id))
            {
               if(_loc2_.legal == false)
               {
                  this.player.stopRun();
                  this.player.pos2d = new Point(_loc2_.x,_loc2_.y);
               }
            }
            else
            {
               player.runTo(_loc2_.x,_loc2_.y);
            }
         }
      }
      
      protected function onHpChanged(param1:MzEvent) : void
      {
         var _loc2_:BgStagePlayerInfo = param1.data as BgStagePlayerInfo;
         if(Uint64Util.equal(_loc2_.playerInfo.baseInfo.id,player.roleId))
         {
            this.player.tag3DVBox.showHpBar(_loc2_.hpPercent / 100,hpBarSkin);
            if(_deathBuffImage3D)
            {
               _deathBuffImage3D.removeEventListener("mouseOver3d",deathBuffImageOver);
               _deathBuffImage3D.removeEventListener("mouseOut3d",deathBuffImageOut);
               _deathBuffImage3D.dispose();
               _deathBuffImage3D = null;
            }
         }
      }
      
      protected function onDie(param1:MzEvent) : void
      {
         var _loc2_:BattlefieldPlayerDiedVo = param1.data as BattlefieldPlayerDiedVo;
         if(Uint64Util.equal(_loc2_.playerId,player.roleId))
         {
            switchRoleVisible(false);
            if(_playerTitleImage3D)
            {
               _playerTitleImage3D.dispose();
               _playerTitleImage3D = null;
            }
            showDeathBuff(_loc2_.conDeathCount);
         }
      }
      
      protected function showDeathBuff(param1:int) : void
      {
         if(param1 <= 0)
         {
            if(_deathBuffImage3D)
            {
               _deathBuffImage3D.removeEventListener("mouseOver3d",deathBuffImageOver);
               _deathBuffImage3D.removeEventListener("mouseOut3d",deathBuffImageOut);
               _deathBuffImage3D.dispose();
            }
            if(_buffRender)
            {
               _buffRender.img_icon.removeEventListener("imageLoaded",onImageLoaded);
               _buffRender.dispose();
               _buffRender = null;
            }
            return;
         }
         _buffRender = new BuffRenderS1UI();
         var _loc2_:int = (DefindConsts.BG_DEATH_BUFF as String).split("|")[0];
         _buffRender.img_icon.addEventListener("imageLoaded",onImageLoaded);
         _buffRender.dataSource = new BuffHasLayersVo(_loc2_,param1);
      }
      
      protected function showNoviceBuff(param1:int) : void
      {
         if(param1 <= 0)
         {
            if(_noviceBuffImage3D)
            {
               _noviceBuffImage3D.removeEventListener("mouseOver3d",deathBuffImageOver);
               _noviceBuffImage3D.removeEventListener("mouseOut3d",deathBuffImageOut);
               _noviceBuffImage3D.dispose();
            }
            if(_noviceBuffRender)
            {
               _noviceBuffRender.img_icon.removeEventListener("imageLoaded",onImageLoaded);
               _noviceBuffRender.dispose();
               _noviceBuffRender = null;
            }
            return;
         }
         _noviceBuffRender = new BuffRenderS1UI();
         var _loc2_:int = (DefindConsts.BG_NOVICE_BUFF_ID as String).split("|")[0];
         _noviceBuffRender.img_icon.addEventListener("imageLoaded",onNoviceImageLoaded);
         _noviceBuffRender.dataSource = new BuffHasLayersVo(_loc2_,param1);
      }
      
      private function onImageLoaded(param1:Event) : void
      {
         if(_buffRender)
         {
            _buffRender.img_icon.removeEventListener("imageLoaded",onImageLoaded);
            _buffRender.commitMeasure();
            TimerManager.ins.doOnce(1000,drawImage);
         }
      }
      
      private function onNoviceImageLoaded(param1:Event) : void
      {
         if(_noviceBuffRender)
         {
            _noviceBuffRender.img_icon.removeEventListener("imageLoaded",onNoviceImageLoaded);
            _noviceBuffRender.commitMeasure();
            TimerManager.ins.doOnce(1000,drawNoviceImage);
         }
      }
      
      private function drawNoviceImage() : void
      {
         var _loc1_:* = null;
         if(_noviceBuffRender)
         {
            _loc1_ = new BitmapData(_noviceBuffRender.width,_noviceBuffRender.height);
            _loc1_.draw(_noviceBuffRender);
            if(_noviceBuffImage3D)
            {
               _noviceBuffImage3D.removeEventListener("mouseOver3d",noviceBuffImageOver);
               _noviceBuffImage3D.removeEventListener("mouseOut3d",noviceBuffImageOut);
               _noviceBuffImage3D.dispose();
            }
            _noviceBuffImage3D = new Image3D(null,_noviceBuffRender.width,_noviceBuffRender.height,0);
            _noviceBuffImage3D.addEventListener("mouseOver3d",noviceBuffImageOver);
            _noviceBuffImage3D.addEventListener("mouseOut3d",noviceBuffImageOut);
            _noviceBuffImage3D.showByBmd(_loc1_);
            _noviceBuffImage3D.ignoreCameraRotation = true;
            _noviceBuffImage3D.renderLayer = Entity.TOP_LAYER;
            _noviceBuffImage3D.mouseEnabled = true;
            _noviceBuffImage3D.y = 28;
            _noviceBuffImage3D.x = this.player.tag3DVBox.curSideImg.x - 32;
            this.player.tag3DVBox.boxIngoreRoScale.addChild(this._noviceBuffImage3D);
         }
      }
      
      private function drawImage() : void
      {
         var _loc1_:* = null;
         if(_buffRender)
         {
            _loc1_ = new BitmapData(_buffRender.width,_buffRender.height);
            _loc1_.draw(_buffRender);
            if(_deathBuffImage3D)
            {
               _deathBuffImage3D.removeEventListener("mouseOver3d",deathBuffImageOver);
               _deathBuffImage3D.removeEventListener("mouseOut3d",deathBuffImageOut);
               _deathBuffImage3D.dispose();
            }
            _deathBuffImage3D = new Image3D(null,_buffRender.width,_buffRender.height,0);
            _deathBuffImage3D.addEventListener("mouseOver3d",deathBuffImageOver);
            _deathBuffImage3D.addEventListener("mouseOut3d",deathBuffImageOut);
            _deathBuffImage3D.showByBmd(_loc1_);
            _deathBuffImage3D.ignoreCameraRotation = true;
            _deathBuffImage3D.renderLayer = Entity.TOP_LAYER;
            _deathBuffImage3D.mouseEnabled = true;
            _deathBuffImage3D.y = -8;
            _deathBuffImage3D.x = this.player.tag3DVBox.curSideImg.x - 32;
            this.player.tag3DVBox.boxIngoreRoScale.addChild(this._deathBuffImage3D);
         }
      }
      
      private function noviceBuffImageOver(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(_noviceBuffRender)
         {
            _loc2_ = (DefindConsts.BG_NOVICE_BUFF_ID as String).split("|")[0];
            _loc3_ = StcMgr.ins.getBuffVo(_loc2_);
            ObserverMgr.ins.sendNotice("msg_tooltip_show",LocaleMgr.ins.getStr(50500186,[_noviceBuffRender.layers,4 - _noviceBuffRender.layers,int(_noviceBuffRender.layers * _loc3_.init_effect_value1 * 100)]));
         }
      }
      
      private function noviceBuffImageOut(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide",null);
      }
      
      private function deathBuffImageOver(param1:Event) : void
      {
         if(_buffRender)
         {
            ObserverMgr.ins.sendNotice("msg_tooltip_show",LocaleMgr.ins.getStr(50500141,[_buffRender.layers,_buffRender.layers * 5]));
         }
      }
      
      private function deathBuffImageOut(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide",null);
      }
      
      protected function onRevive(param1:MzEvent) : void
      {
         var _loc2_:UInt64 = param1.data as UInt64;
         if(Uint64Util.equal(_loc2_,player.roleId))
         {
            switchRoleVisible(true);
            this.player.tag3DVBox.showHpBar(1,hpBarSkin);
         }
      }
      
      protected function onLeave(param1:MzEvent) : void
      {
         var _loc2_:UInt64 = param1.data as UInt64;
         if(Uint64Util.equal(player.roleId,_loc2_))
         {
            this.scene.removeOtherRole(_loc2_);
            this.dispose();
         }
      }
      
      protected function onConCkill(param1:MzEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:BgPlayerStatusNotify = param1.data as BgPlayerStatusNotify;
         if(Uint64Util.equal(player.roleId,_loc2_.killerId))
         {
            _loc3_ = BattlefieldUtil.getConKillTitleId(_loc2_.killerConKillNum);
            if(_lastId != _loc3_)
            {
               _lastId = _loc3_;
               if(_playerTitleImage3D)
               {
                  _playerTitleImage3D.dispose();
               }
               if(_loc3_ != 0)
               {
                  _playerTitleImage3D = new Image3D("__no3d/" + UrlLib.battlefieldPlayerTitle(_loc3_),111,30,0,true,false);
                  _playerTitleImage3D.ignoreCameraRotation = true;
                  _playerTitleImage3D.renderLayer = Entity.TOP_LAYER;
                  _playerTitleImage3D.mouseEnabled = true;
                  _playerTitleImage3D.y = 56;
                  this.player.tag3DVBox.boxIngoreRoScale.addChild(this._playerTitleImage3D);
               }
            }
         }
      }
      
      protected function onBeginGather(param1:MzEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:BattlefieldGatherVo = param1.data as BattlefieldGatherVo;
         _gathingId = _loc3_.gatherId;
         if(Uint64Util.equal(player.roleId,_loc3_.playerId))
         {
            if(_gatheringImage3D == null)
            {
               _gatheringImage3D = new NameTag3D();
               _gatheringImage3D.ignoreCameraRotation = true;
               _gatheringImage3D.renderLayer = Entity.TOP_LAYER;
               _gatheringImage3D.mouseEnabled = false;
               _gatheringImage3D.y = 21;
               _gatheringImage3D.x = 60;
               this.player.tag3DVBox.boxIngoreRoScale.addChild(this._gatheringImage3D);
            }
            _loc4_ = new Label();
            _loc4_.style = "渐变4";
            _loc4_.width = 128;
            _loc4_.height = 32;
            _loc4_.size = 14;
            if(BattlefieldModel.ins.curBattlefieldId == 1000)
            {
               _loc4_.text = LocaleMgr.ins.getStr(50500162);
            }
            else
            {
               _loc4_.text = LocaleMgr.ins.getStr(50500163);
            }
            _loc4_.commitMeasure();
            _loc2_ = new BitmapData(_loc4_.width,_loc4_.height,true,0);
            _loc2_.draw(_loc4_,null,null,null,null,true);
            _loc2_ = BitmapUtils.transparentCut(_loc2_);
            _gatheringImage3D.setBitmapData(_loc2_,true);
            _loc4_.dispose();
         }
      }
      
      protected function onStopGather(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = param1.data as BattlefieldGatherVo;
            if(_loc2_.gatherId != 0 && _gathingId == _loc2_.gatherId && Uint64Util.equal(player.roleId,_loc2_.playerId) || _loc2_.gatherId == 0 && Uint64Util.equal(player.roleId,_loc2_.playerId))
            {
               if(_gatheringImage3D)
               {
                  _gathingId = 0;
                  _gatheringImage3D.dispose();
                  _gatheringImage3D = null;
               }
            }
         }
         else if(_gatheringImage3D)
         {
            _gathingId = 0;
            _gatheringImage3D.dispose();
            _gatheringImage3D = null;
         }
      }
      
      private function onMineDryUp(param1:MzEvent) : void
      {
         var _loc2_:int = param1.data as int;
         if(_gathingId == _loc2_)
         {
            onStopGather(null);
         }
      }
      
      protected function switchRoleVisible(param1:Boolean) : void
      {
         this.player.visible = param1;
      }
      
      private function showFlagResetCD(param1:uint) : void
      {
         if(!cdCtr)
         {
            if(!cdLabel)
            {
               cdLabel = new Label();
            }
            if(!cd3dLabel)
            {
               cd3dLabel = new NameTag3D();
               player.tag3DVBox.boxIngoreRoScale.addChild(cd3dLabel);
               cd3dLabel.mouseChildren = false;
               cd3dLabel.mouseEnabled = false;
               cd3dLabel.y = 50;
               cd3dLabel.x = player.tag3DVBox._nameTag3D.width - 30;
            }
            cd3dLabel.setText(LocaleMgr.ins.getStr(50500165) + TimeUtils.isColonWithZero(param1 - ServerTimer.ins.second),"#06ff00");
            cd3dLabel.drawBitmap();
            cdCtr = new TextCDCtrlS2(cdLabel,changeCdFuntion,cdCompleteHandler);
            cdCtr.start(param1);
         }
      }
      
      private function changeCdFuntion(param1:int) : void
      {
         cd3dLabel.setText(LocaleMgr.ins.getStr(50500165) + TimeUtils.isColonWithZero(param1),"#06ff00");
         cd3dLabel.drawBitmap();
      }
      
      private function cdCompleteHandler() : void
      {
         clearFlagResetCD();
      }
      
      private function clearFlagResetCD() : void
      {
         if(cdLabel)
         {
            cdLabel.dispose();
            cdLabel = null;
         }
         if(cdCtr)
         {
            cdCtr.dispose();
            cdCtr = null;
         }
         if(cd3dLabel)
         {
            cd3dLabel.dispose();
            cd3dLabel = null;
         }
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(drawImage);
         switchEventListeners(false);
         clearFlagResetCD();
         bgStagePlayerInfo = null;
         this.player = null;
         super.dispose();
      }
   }
}
