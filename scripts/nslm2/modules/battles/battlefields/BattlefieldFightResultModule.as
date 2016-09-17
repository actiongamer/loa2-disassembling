package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldFightResult.BattlefieldFightResultModuleUI;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.modules.battles.battlefields.ctrls.BattlefieldFightResultRenderCtrl;
   import flash.display.MovieClip;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import com.mz.core.components.comp2d.BlackRim;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.battles.battle.FightStartEff2;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import nslm2.utils.Uint64Util;
   import com.greensock.TweenLite;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import morn.core.handlers.Handler;
   import game.ui.battleResults.BattleWinWordUI;
   import game.ui.battleResults.BattleCompleteWordUI;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.vos.BattlefieldPlayerDiedVo;
   import proto.BgSceneMoveNotify;
   import nslm2.utils.ServerTimer;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldFightResultModule extends BattlefieldFightResultModuleUI
   {
       
      
      private var _notify:FastBattleData;
      
      private var _leftRenderCtrl:BattlefieldFightResultRenderCtrl;
      
      private var _rightRenderCtrl:BattlefieldFightResultRenderCtrl;
      
      private var _mc:MovieClip;
      
      private var _textCDCtrl:TextCDCtrlS2;
      
      private var _rim:BlackRim;
      
      private var _openStamp:int;
      
      private var _img_win:BattleWinWordUI;
      
      private var _img_complete:BattleCompleteWordUI;
      
      private var winOrLostCallBackExecuted:Boolean;
      
      public function BattlefieldFightResultModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         _openStamp = ServerTimer.ins.second;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _leftRenderCtrl = new BattlefieldFightResultRenderCtrl().bind(this.render_left);
         this.parts.push(new BattlefieldFightResultRenderCtrl().bind(this.render_left));
         _leftRenderCtrl.isLeft = true;
         _rightRenderCtrl = new BattlefieldFightResultRenderCtrl().bind(this.render_right);
         this.parts.push(new BattlefieldFightResultRenderCtrl().bind(this.render_right));
         _notify = param1 as FastBattleData;
         if(PlayerModel.ins.isCurPlayer(_notify.fightData.target.playerId))
         {
            _leftRenderCtrl.setData(_notify.rightPlayerData,_notify.fightData.target);
            _rightRenderCtrl.setData(_notify.leftPlayerData,_notify.fightData.attacker);
         }
         else
         {
            _leftRenderCtrl.setData(_notify.leftPlayerData,_notify.fightData.attacker);
            _rightRenderCtrl.setData(_notify.rightPlayerData,_notify.fightData.target);
         }
         this.panelBg.titleImgId = this.moduleId;
         this.txt_autoLeave.visible = false;
         this.btn_leave.visible = false;
         this.mouseEvent = false;
         DisplayUtils.addChildFromGlobal(this.panelBg.bgCustom,img_bg);
         DisplayUtils.addChildFromGlobal(this.panelBg.bgCustom,render_left);
         DisplayUtils.addChildFromGlobal(this.panelBg.bgCustom,render_right);
         this.img_bg.skin = UrlLib.battlefieldUI("img_moduleBg");
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattleStart"));
         this.preShowCpl();
      }
      
      override public function moduleFadeIn(param1:Number = 0) : void
      {
         _rim = new BlackRim();
         _rim.hole = null;
         _rim.width = UIMgr.gameWidth;
         _rim.height = UIMgr.gameHeight;
         _rim.alpha = 0.7;
         _rim.draw();
         this.parent.addChildAt(_rim,0);
         this.moduleFadeInCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         new FightStartEff2(toEnd,null).go();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_leave === _loc2_)
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function toEnd() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         TweenMax.to(this.render_left.list_heroes,0.1,{
            "x":132,
            "yoyo":true,
            "repeat":1,
            "ease":Linear.easeIn,
            "onComplete":showResult
         });
         TweenMax.to(this.render_right.list_heroes,0.1,{
            "x":0,
            "yoyo":true,
            "repeat":1,
            "ease":Linear.easeIn
         });
      }
      
      private function showResult() : void
      {
         if(isDisposed)
         {
            return;
         }
         _leftRenderCtrl.toEnd();
         _rightRenderCtrl.toEnd();
         if(Uint64Util.equal(_leftRenderCtrl.playerData.playerId,_notify.fightData.winnerId))
         {
            if(_notify.isFamilyBoss)
            {
               TweenLite.delayedCall(0.5,showComplte,[true]);
            }
            else
            {
               TweenLite.delayedCall(0.5,showWin);
            }
         }
         else if(_notify.isFamilyBoss)
         {
            TweenLite.delayedCall(0.5,showComplte,[false]);
         }
         else
         {
            TweenLite.delayedCall(0.5,showLoss);
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return TimeUtils.hisColonFullAddZero(param1) + LocaleMgr.ins.getStr(50500112);
      }
      
      private function textCDCpl() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function showWin() : void
      {
         var _loc1_:int = 0;
         if(isDisposed)
         {
            return;
         }
         _mc = ResMgr.ins.getRes("effect2d/battle/dgWinLogo.swf");
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
         if(_notify != null && _notify.winCallBack != null)
         {
            Handler.execute(_notify.winCallBack);
         }
         winOrLostCallBackExecuted = true;
         showLeaveBtn();
      }
      
      private function showWinTxt() : void
      {
         _img_win = new BattleWinWordUI();
         _img_win.x = 262;
         _img_win.y = 178;
         _img_win.img_light.blendMode = "add";
         new ScaleTweenEff().init(_img_win,0.5,2,1,Elastic.easeInOut,false);
         this.addChild(_img_win);
      }
      
      private function showCompleteTxt() : void
      {
         _img_complete = new BattleCompleteWordUI();
         _img_complete.x = 262;
         _img_complete.y = 178;
         _img_complete.img_light.blendMode = "add";
         new ScaleTweenEff().init(_img_complete,0.5,2,1,Elastic.easeInOut,false);
         this.addChild(_img_complete);
      }
      
      private function showComplte(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(isDisposed)
         {
            return;
         }
         _mc = ResMgr.ins.getRes("effect2d/battle/dgWinLogo.swf");
         _mc.gotoAndStop(1);
         var _loc3_:* = 0.7;
         _mc.scaleY = _loc3_;
         _mc.scaleX = _loc3_;
         _mc.x = (this.width - _mc.width) / 2 + 236;
         _mc.y = (this.height - _mc.height) / 2 + 400;
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _mc["star" + _loc2_].visible = false;
            _mc["star_bg" + _loc2_].visible = false;
            _loc2_++;
         }
         this.addChild(_mc);
         showCompleteTxt();
         TweenMax.to(_mc,0.7,{
            "frame":17,
            "ease":Linear.easeNone
         });
         if(param1)
         {
            if(_notify != null && _notify.winCallBack != null)
            {
               Handler.execute(_notify.winCallBack);
            }
         }
         else if(_notify != null && _notify.loseCallBack != null)
         {
            Handler.execute(_notify.loseCallBack);
         }
         winOrLostCallBackExecuted = true;
         showLeaveBtn();
      }
      
      private function showLoss() : void
      {
         var _loc1_:* = null;
         if(isDisposed)
         {
            return;
         }
         _mc = ResMgr.ins.getRes("effect2d/battle/lossLogo.swf");
         _mc.gotoAndStop(1);
         var _loc2_:* = 0.7;
         _mc.scaleY = _loc2_;
         _mc.scaleX = _loc2_;
         _mc.x = (this.width - _mc.width) / 2;
         _mc.y = (this.height - _mc.height) / 2 - 100;
         this.addChild(_mc);
         TweenMax.to(_mc,1.1,{
            "frame":28,
            "ease":Linear.easeNone
         });
         if(_notify != null && _notify.loseCallBack != null)
         {
            Handler.execute(_notify.loseCallBack);
         }
         else if(_notify != null)
         {
            if(BattlefieldModel.ins.isInBattleScene)
            {
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerDied",new BattlefieldPlayerDiedVo(PlayerModel.ins.playerInfo.id,_openStamp,BattlefieldModel.ins.currentBgStagePlayerInfo.conDeathNum)));
               _loc1_ = new BgSceneMoveNotify();
               _loc1_.x = BattlefieldModel.ins.currentBgStagePlayerInfo.x;
               _loc1_.y = BattlefieldModel.ins.currentBgStagePlayerInfo.y;
               _loc1_.legal = false;
               _loc1_.id = PlayerModel.ins.playerInfo.id;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerPosChanged",_loc1_));
            }
         }
         winOrLostCallBackExecuted = true;
         showLeaveBtn();
      }
      
      private function showLeaveBtn() : void
      {
         if(isDisposed)
         {
            return;
         }
         this.txt_autoLeave.visible = true;
         this.btn_leave.visible = true;
         this.mouseEvent = true;
         _textCDCtrl = new TextCDCtrlS2(this.txt_autoLeave,textCDFormat,textCDCpl);
         this.parts.push(new TextCDCtrlS2(this.txt_autoLeave,textCDFormat,textCDCpl));
         _textCDCtrl.start(ServerTimer.ins.second + 5);
      }
      
      override public function dispose() : void
      {
         DisplayUtils.removeSelf(_rim);
         if(!winOrLostCallBackExecuted)
         {
            if(PlayerModel.ins.isCurPlayer(_notify.fightData.winnerId))
            {
               if(_notify.winCallBack != null)
               {
                  Handler.execute(_notify.winCallBack);
               }
            }
            else if(_notify.loseCallBack != null)
            {
               Handler.execute(_notify.loseCallBack);
            }
         }
         if(_notify.closeCallBack != null)
         {
            Handler.execute(_notify.closeCallBack);
         }
         _notify = null;
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattleEnd"));
         super.dispose();
      }
   }
}
