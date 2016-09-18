package nslm2.modules.battles.battle
{
   import nslm2.modules.fightPlayer.UnitVo;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import org.specter3d.display.Specter3D;
   import game.ui.fightPlayers.UnitView2DUI;
   import com.greensock.TweenMax;
   import com.greensock.TimelineLite;
   import flash.utils.Dictionary;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.battles.battle.text.TextAniQueue;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import nslm2.utils.TransformUtil;
   import nslm2.modules.battles.battle.text.TextView;
   import flash.geom.Vector3D;
   import away3d.events.AnimatorEvent;
   import nslm2.modules.battles.battle.show.BodyFade;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.SoundMgr;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.enum.AnimationEnum;
   import com.greensock.TweenLite;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillEffectVo;
   import nslm2.modules.battles.battle.show.RotBack;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.battles.battle.show.EffSelfBillboard;
   import org.specter3d.utils.DelayTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.battle.show.EffSelf;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import nslm2.modules.battles.battle.show.ShowBase;
   import com.mz.core.event.MzEvent;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import org.specter3d.display.avatar2.data.AvatarEffectVO;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.logging.Log;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.modules.fightPlayer.FactoryUtil;
   
   public class Player extends GameObject
   {
       
      
      private var _unitVo:UnitVo;
      
      private var _avatarBody:AvatarBody3D;
      
      private var _avatar:Specter3D;
      
      private var _objId:int;
      
      private var _state2d:UnitView2DUI;
      
      private var _tw:TweenMax;
      
      private var _tl:TimelineLite;
      
      public var selfEffDic:Dictionary;
      
      public var unitView:UnitView;
      
      public var aimList:Array;
      
      public var whoLockMe:nslm2.modules.battles.battle.Player = null;
      
      public var _lockTarget:nslm2.modules.battles.battle.Player;
      
      private var _textAniQueue:TextAniQueue;
      
      public var isConfuse:Boolean = false;
      
      public var isDizzy:Boolean = false;
      
      public var buffEffDic:Dictionary;
      
      public var summonPlayId:int = -1;
      
      private var _lastSoundName:String;
      
      private var _chainNode:nslm2.modules.battles.battle.Player = null;
      
      private var _chainParam:Object = null;
      
      private var _isDead:Boolean = false;
      
      private var _dieType:int;
      
      private var _delayTimer:DelayTimer;
      
      private var _tarId:int;
      
      private var _lastSkillId:int;
      
      private var _canFire:Boolean = false;
      
      private var _isChangeLook:Boolean = false;
      
      public function Player(param1:UnitView)
      {
         super();
         this.unitView = param1;
         _unitVo = param1.vo;
         _avatarBody = param1.avatarBody;
         _avatar = param1.avatarBox;
         _state2d = param1.state2d;
         _objId = FPUtil.genBattleId(unitVo.isAttack,unitVo.posId);
         aimList = [];
         init();
         selfEffDic = new Dictionary();
         buffEffDic = new Dictionary();
         action = "std_2";
         _state2d.list_icon.visible = false;
         TweenLite.killTweensOf(_avatarBody);
         if(!_avatarBody.visible)
         {
            _avatarBody.visible = true;
         }
         if(!param1.shadow.visible)
         {
            param1.shadow.visible = true;
         }
         if(this.unitView.shadow.alpha != 1)
         {
            this.unitView.shadow.alpha = 1;
         }
         if(_avatarBody.alpha != 1)
         {
            _avatarBody.alpha = 1;
         }
      }
      
      public function get layer2D() : DisplayObjectContainer
      {
         return _state2d.parent;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get avatar() : Specter3D
      {
         return _avatar;
      }
      
      public function get isSummonNpc() : Boolean
      {
         return summonPlayId > 0;
      }
      
      public function get isAttack() : Boolean
      {
         return unitVo.isAttack == 1;
      }
      
      public function aimTo(param1:Point) : void
      {
         unitVo.rotation = MathUtil.roWith2Point(unitVo.xy,param1);
         validateRo();
      }
      
      public function validateRo() : void
      {
         TransformUtil.setBattleOri(avatar,avatarBody,unitVo);
      }
      
      public function get avatarBody() : AvatarBody3D
      {
         return _avatarBody;
      }
      
      public function get unitVo() : UnitVo
      {
         return _unitVo;
      }
      
      private function playTextQueue(param1:TextView, param2:DisplayObjectContainer, param3:Number, param4:Number, param5:Boolean = false) : void
      {
         if(!_textAniQueue)
         {
            _textAniQueue = new TextAniQueue();
         }
         _textAniQueue.play(param1,param2,param3,param4,param5);
      }
      
      public function init() : void
      {
         _state2d.visible = false;
         _state2d.bar_hp.visible = true;
         _state2d.txt_name.visible = true;
         var _loc1_:Vector3D = TransformUtil.fight2Dto3D(_unitVo.oriXY.x,_unitVo.oriXY.y);
         _avatar.position = _loc1_;
         _avatarBody.action = "std_2";
         validateStateBar();
      }
      
      public function onActionComplete(param1:AnimatorEvent) : void
      {
         var _loc2_:AvatarBody3D = param1.currentTarget as AvatarBody3D;
         _loc2_.removeEventListener("animator_complete",onActionComplete);
         if(inSkillAct)
         {
            if(!_isDead)
            {
               this.action = "std_2";
            }
            return;
         }
         var _loc3_:* = action;
         if("immune" !== _loc3_)
         {
            if("enter" !== _loc3_)
            {
               if("std_4" !== _loc3_)
               {
                  if("relive" !== _loc3_)
                  {
                     if("hurt_3" !== _loc3_)
                     {
                        if("hurt_1" !== _loc3_)
                        {
                           if("dodge" !== _loc3_)
                           {
                              if("hurt_1" !== _loc3_)
                              {
                                 if("hurt_4" !== _loc3_)
                                 {
                                    if("win" !== _loc3_)
                                    {
                                       if("dead" === _loc3_)
                                       {
                                          if(_dieType == 1)
                                          {
                                             _avatarBody.visible = false;
                                             addToTimeline(FPUtil.getRebornConfigById(modelName));
                                          }
                                          else
                                          {
                                             new BodyFade().start(this,{
                                                "action":"BodyFade",
                                                "dur":30,
                                                "frame":90
                                             });
                                          }
                                       }
                                    }
                                    else
                                    {
                                       this.action = "std_2";
                                    }
                                 }
                                 else if(!_isDead)
                                 {
                                    this.action = "relive";
                                 }
                              }
                              addr107:
                              return;
                           }
                           addr30:
                           if(!_isDead)
                           {
                              this.action = "std_2";
                           }
                           §§goto(addr107);
                        }
                        addr29:
                        §§goto(addr30);
                     }
                     addr28:
                     §§goto(addr29);
                  }
                  addr27:
                  §§goto(addr28);
               }
               addr26:
               §§goto(addr27);
            }
            addr25:
            §§goto(addr26);
         }
         §§goto(addr25);
      }
      
      public function playTexiaoSound(param1:String) : void
      {
         if(!StringUtils.isNull(_lastSoundName))
         {
            SoundMgr.ins.clearTexiao(_lastSoundName);
         }
         _lastSoundName = "battle/" + param1;
         SoundMgr.ins.playTexiaoSound(_lastSoundName);
      }
      
      public function set action(param1:String) : void
      {
         if(!avatarBody)
         {
            return;
         }
         if(!_avatarBody.visible)
         {
            _avatarBody.visible = true;
            _avatarBody.effectsVisible = true;
         }
         var _loc4_:* = param1;
         if("hurt_1" === _loc4_)
         {
            if(_avatarBody.action == "hurt_1")
            {
               avatarBody.action = "std_2";
               avatarBody.animatorPlay("hurt_1",null,133);
            }
         }
         if(param1 == "std_2")
         {
            if(isDizzy)
            {
               param1 = "std_2";
            }
         }
         if(param1 == action)
         {
            return;
         }
         if(!_isDead && (param1 == "std_2" || param1.indexOf("skill") != -1))
         {
            resetBodyPos();
         }
         if(inSkillAct)
         {
            var _loc6_:int = 0;
            var _loc5_:* = selfEffDic;
            for(var _loc3_ in selfEffDic)
            {
               if(selfEffDic[_loc3_] == 1)
               {
                  _loc3_.dispose();
                  delete selfEffDic[_loc3_];
               }
            }
         }
         var _loc2_:Boolean = AnimationEnum.getLoop(param1);
         if(!_loc2_)
         {
            _avatarBody.addEventListener("animator_complete",onActionComplete);
         }
         _avatarBody.action = param1;
      }
      
      private function resetBodyPos() : void
      {
         if(_avatarBody.position.x != 0 || _avatarBody.position.y != 0 || _avatarBody.position.z != 0)
         {
            TweenLite.killTweensOf(this.avatarBody);
            _avatarBody.position = new Vector3D();
            unitView.shadow.position = _avatarBody.position;
         }
      }
      
      public function get action() : String
      {
         return _avatarBody.action;
      }
      
      public function doAbsorb(param1:int) : void
      {
         showFightTxt(0,6);
         var _loc2_:StcSkillEffectVo = StcMgr.ins.getSkillEffectVo(param1);
         if(_loc2_)
         {
            playerHurtEffect(_loc2_.hit_effect);
         }
      }
      
      public function moveTo(param1:int, param2:int, param3:Number) : void
      {
         TweenLite.to(this,FPUtil.fixFrame(param3),{
            "x":param1,
            "y":param2,
            "useFrames":false,
            "onComplete":onMoveCmp
         });
      }
      
      private function onMoveCmp() : void
      {
         avatarBody.y = 0;
         if(inPosition())
         {
            new RotBack().start(this,null);
            action = "std_2";
         }
         else if(isConfuse)
         {
            if(int(tarId / 1000) == int(objId / 1000))
            {
               if(this.isAttack)
               {
                  this.unitVo.rotation = 180;
               }
               else
               {
                  this.unitVo.rotation = 0;
               }
            }
            this.validateRo();
         }
      }
      
      public function initChainEff(param1:Object) : void
      {
         _chainNode = this;
         _chainParam = param1;
      }
      
      public function chainEffShow(param1:nslm2.modules.battles.battle.Player) : void
      {
         if(!_chainNode || !_chainParam)
         {
            return;
         }
         var _loc2_:Lightning = new Lightning();
         _loc2_.init(_chainNode,param1,_chainParam);
         _loc2_.startup();
         _chainNode = param1;
      }
      
      private function get isWinAct() : Boolean
      {
         if(gm.vo)
         {
            return gm.vo.isWinAct;
         }
         return true;
      }
      
      override public function shutdown() : void
      {
         if(!_isDead && isWinAct)
         {
            if(gm.battleReuslt == 1 && isAttack)
            {
               this.action = "win";
            }
            else if(gm.battleReuslt == 2 && !isAttack)
            {
               this.action = "win";
            }
         }
         resetLook();
         clearBuff();
         super.shutdown();
         _state2d.visible = false;
         _textAniQueue = null;
         TimerManager.ins.clearTimer(checkFireBtn);
         if(_delayTimer)
         {
            _delayTimer.dispose();
         }
         TweenLite.killTweensOf(this);
         disposeAllSelfEff();
      }
      
      private function clearVo() : void
      {
         _avatarBody = null;
         unitView = null;
         _avatar = null;
         _unitVo = null;
      }
      
      public function disposeAllSelfEff() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = selfEffDic;
         for(var _loc1_ in selfEffDic)
         {
            _loc1_.dispose();
            delete selfEffDic[_loc1_];
         }
      }
      
      public function doDie(param1:int = 0) : void
      {
         _dieType = param1;
         TimerManager.ins.clearTimer(checkFireBtn);
         _isDead = true;
         this.unitVo.dispatchEvent(new BattleEvent("FIGHT_REFRESH_FIRE_BTN",false));
         if(inSkillAct)
         {
            disposeAllSelfEff();
         }
      }
      
      private function get modelName() : String
      {
         return StcMgr.ins.getModelVo(int(unitVo.stcNpcVo.model_id)).name;
      }
      
      public function dieAct() : void
      {
         TweenLite.killDelayedCallsTo(dieAct);
         resetBodyPos();
         if(gm.vo.isDeadFall && !isAttack)
         {
            addToTimeline(FPUtil.getDieFallById(modelName),true);
         }
         else
         {
            addToTimeline(FPUtil.getDieConfigById(modelName),true);
         }
      }
      
      public function isBoss() : Boolean
      {
         return unitVo.stcNpcVo && unitVo.stcNpcVo.kind == 12;
      }
      
      public function reborn(param1:Number, param2:Number) : void
      {
         _isDead = false;
         updateHpBarValue(param1,param2);
      }
      
      public function get inSkillAct() : Boolean
      {
         return this.action.indexOf("skill") != -1;
      }
      
      public function doHurt(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc8_:* = null;
         var _loc11_:* = null;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc9_:StcSkillEffectVo = StcMgr.ins.getSkillEffectVo(param4);
         if(param3 == 1)
         {
            showFightTxt(param1,1);
         }
         else
         {
            if(param3 == 2)
            {
               showFightTxt(0,5);
            }
            showFightTxt(param1,0);
         }
         if(_isDead)
         {
            delayDead();
         }
         if(_loc9_)
         {
            _loc7_ = StcMgr.ins.getSkillVo(_loc9_.skill_id);
            _loc10_ = _loc7_.under_attack_action;
            _loc11_ = _loc10_.split("|");
            _loc6_ = _loc7_.attack_time_point.split("|");
            if(!inSkillAct)
            {
               if(param2 < _loc11_.length)
               {
                  _loc8_ = _loc11_[param2];
               }
               else
               {
                  _loc8_ = _loc11_[0];
               }
               if(isBoss())
               {
                  _loc8_ = "1";
               }
               if(_isDead && isLastHit(param2,_loc6_,_loc9_.target))
               {
                  dieAct();
               }
               else if(_loc8_ == "1" && param3 == 2)
               {
                  this.action = "hurt_1";
               }
               else
               {
                  _loc5_ = _loc7_.node_id;
                  addToTimeline(FPUtil.getHurtConfigById(_loc8_,_loc5_));
               }
            }
            else if(_isDead && isLastHit(param2,_loc6_,_loc9_.target))
            {
               dieAct();
            }
         }
         else if(_isDead)
         {
            dieAct();
         }
         if(_loc9_)
         {
            playerHurtEffect(_loc9_.hit_effect);
         }
         if(_loc9_ && !StringUtils.isNull(_loc9_.hit_music))
         {
            SoundMgr.ins.playTexiaoSound("battle/hit/" + _loc9_.hit_music);
         }
      }
      
      private function delayDead() : void
      {
         TweenLite.killDelayedCallsTo(dieAct);
         TweenLite.delayedCall(FPUtil.fixFrame(30),dieAct);
      }
      
      private function isLastHit(param1:int, param2:Array, param3:int) : Boolean
      {
         if([23,17].indexOf(param3) != -1)
         {
            return true;
         }
         return param1 >= param2.length - 1;
      }
      
      public function playerHurtEffect(param1:String) : void
      {
         new EffSelfBillboard().start(this,{
            "action":"EffSelfBillboard",
            "name":param1,
            "speed":1,
            "frame":1,
            "topLayer":true
         });
      }
      
      public function doBigSkillEffect() : void
      {
         playerHurtEffect("100030");
      }
      
      public function updateHpBarValue(param1:Number, param2:Number) : void
      {
         _unitVo.hp_max = param2;
         _unitVo.hp = param1;
         new HPTween(_state2d.bar_hp.bar);
         _state2d.bar_hp.value = _unitVo.hp / _unitVo.hp_max;
         if(isBoss())
         {
            return;
         }
         _state2d.visible = true;
         if(_delayTimer)
         {
            _delayTimer.dispose();
         }
         _delayTimer = new DelayTimer(3000,hideHpBar);
      }
      
      private function hideHpBar() : void
      {
         _state2d.visible = false;
         _delayTimer = null;
      }
      
      public function set x(param1:Number) : void
      {
         _unitVo.xy.x = param1;
         _avatar.position = TransformUtil.fight2Dto3D(param1,_unitVo.xy.y);
         validateStateBar();
      }
      
      public function set y(param1:Number) : void
      {
         _unitVo.xy.y = param1;
         _avatar.position = TransformUtil.fight2Dto3D(_unitVo.xy.x,param1);
         validateStateBar();
      }
      
      public function get x() : Number
      {
         return _unitVo.xy.x;
      }
      
      public function get y() : Number
      {
         return _unitVo.xy.y;
      }
      
      public function test_text() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < 10)
         {
            _loc1_ = new TextView();
            _loc1_.setNum(_loc3_,2);
            _loc2_ = TransformUtil.stage3Dto2D(_avatar.scenePosition,this._state2d.parent);
            playTextQueue(_loc1_,_state2d.parent,_loc2_.x,_loc2_.y);
            _loc3_++;
         }
      }
      
      public function showFightTxt(param1:int, param2:uint) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         switch(int(param2))
         {
            case 0:
               if(param1 == 0)
               {
                  return;
               }
               _loc3_ = new TextView();
               _loc3_.setNum(param1,param2);
               _loc4_ = TransformUtil.stage3Dto2D(_avatar.scenePosition,this._state2d.parent);
               playTextQueue(_loc3_,_state2d.parent,_loc4_.x,_loc4_.y,false);
               break;
            case 1:
            case 2:
            case 3:
               if(param1 == 0)
               {
                  return;
               }
               _loc3_ = new TextView();
               _loc3_.setNum(param1,param2);
               _loc4_ = TransformUtil.stage3Dto2D(_avatar.scenePosition,this._state2d.parent);
               playTextQueue(_loc3_,_state2d.parent,_loc4_.x,_loc4_.y,true);
               break;
            case 4:
            case 5:
            case 6:
            case 7:
               _loc3_ = new TextView();
               _loc3_.setType(param2);
               _loc4_ = TransformUtil.stage3Dto2D(_avatar.scenePosition,this._state2d.parent);
               playTextQueue(_loc3_,_state2d.parent,_loc4_.x,_loc4_.y);
         }
      }
      
      public function showBuffTxt(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         _loc2_ = new TextView();
         _loc2_.setText("battle_buff_" + param1);
         _loc3_ = TransformUtil.stage3Dto2D(_avatar.scenePosition,this._state2d.parent);
         playTextQueue(_loc2_,_state2d.parent,_loc3_.x,_loc3_.y);
      }
      
      public function showSkillTxt(param1:String, param2:int = 12) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc3_ = new TextView();
         _loc3_.setText2(param1,param2);
         _loc4_ = TransformUtil.stage3Dto2D(_avatar.scenePosition,this._state2d.parent);
         playTextQueue(_loc3_,_state2d.parent,_loc4_.x,_loc4_.y);
      }
      
      private function validateStateBar() : void
      {
         var _loc1_:Vector3D = TransformUtil.stage3Dto2D(_avatar.scenePosition,this._state2d.parent);
         _state2d.x = _loc1_.x;
         _state2d.y = _loc1_.y - 180;
      }
      
      override public function setFreeze(param1:Boolean) : void
      {
         super.setFreeze(param1);
         if(_isFreeze)
         {
            _avatarBody.addMethod(FPUtil.getDarkMethod());
            _avatarBody.playbackSpeed = 0;
            if(_tl)
            {
               _tl.paused(true);
            }
         }
         else
         {
            _avatarBody.removeMethod(FPUtil.getDarkMethod());
            _avatarBody.playbackSpeed = FPUtil.playSpeed();
            if(_tl)
            {
               _tl.paused(false);
            }
         }
         selfEffDicFreeze(_isFreeze);
      }
      
      private function selfEffDicFreeze(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            var _loc4_:int = 0;
            var _loc3_:* = selfEffDic;
            for(_loc2_ in selfEffDic)
            {
               _loc2_.addMethod(FPUtil.getDarkMethod());
               _loc2_.playSpeed = 0;
            }
         }
         else
         {
            var _loc6_:int = 0;
            var _loc5_:* = selfEffDic;
            for(_loc2_ in selfEffDic)
            {
               _loc2_.removeMethod(FPUtil.getDarkMethod());
               _loc2_.playSpeed = FPUtil.playSpeed();
            }
         }
      }
      
      public function setAllSelfEffSpeed(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = selfEffDic;
         for(_loc2_ in selfEffDic)
         {
            _loc2_.playSpeed = param1;
         }
      }
      
      public function get tarId() : int
      {
         return _tarId;
      }
      
      public function set tarId(param1:int) : void
      {
         _tarId = param1;
      }
      
      public function doSkillFront(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         disposeAllSelfEff();
         _lastSkillId = param1;
         _tarId = param2 < 0?1:param2;
         var _loc5_:Array = FPUtil.getFrontConfigById(param1);
         if(!_loc5_)
         {
            return;
         }
         addToTimeline(_loc5_);
         var _loc6_:StcSkillVo = StcMgr.ins.getSkillVo(param1);
         if(_loc6_.kind != 1)
         {
            playSelfEff("600002",0.6);
         }
         if(_loc6_.kind != 10 && _loc6_.trigger_type != 4)
         {
            if(_loc6_.kind == 1)
            {
               showSkillTxt(LocaleMgr.ins.getStr(_loc6_.name),24);
               _loc3_ = 11;
            }
            else
            {
               showSkillTxt(LocaleMgr.ins.getStr(_loc6_.name),18);
               _loc3_ = 12;
            }
            _loc4_ = unitVo.stcNpcVo.speak;
            if(_loc4_ > 0)
            {
               if(!(_loc3_ > 10 && ClientConfig.isChineseLang() == false))
               {
                  SoundMgr.ins.playTexiaoSound(UrlLib.speakUrl(_loc4_,_loc3_));
               }
            }
         }
      }
      
      public function isLastSkillBig() : Boolean
      {
         var _loc1_:* = null;
         if(_lastSkillId > 0)
         {
            _loc1_ = StcMgr.ins.getSkillVo(_lastSkillId);
            if(_loc1_)
            {
               return _loc1_.kind == 1;
            }
            return false;
         }
         return false;
      }
      
      public function playSelfEff(param1:String, param2:Number = 1) : void
      {
         new EffSelf().start(this,{
            "action":"EffSelf",
            "name":param1,
            "speed":1,
            "frame":1,
            "scale":param2
         });
      }
      
      public function doSkillRear(param1:int) : void
      {
         var _loc2_:Array = FPUtil.getRearConfigById(param1);
         if(!_loc2_)
         {
            return;
         }
         addToTimeline(_loc2_,true);
      }
      
      public function addToTimeline(param1:Array, param2:Boolean = false) : void
      {
         if(!_tl)
         {
            _tl = new TimelineLite({"useFrames":false});
         }
         if(!param2)
         {
            _tl.clear();
         }
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _tl.call(doShow,[_loc3_],(!!param2?"+=":"") + String(FPUtil.fixFrame(_loc3_.frame)));
         }
      }
      
      public function clearTL() : void
      {
         if(_tl)
         {
            _tl.clear();
         }
      }
      
      public function doShow(param1:Object) : void
      {
         var _loc2_:ShowBase = ReflectUtil.createInstance("nslm2.modules.battles.battle.show." + param1.action);
         _loc2_.start(this,param1);
      }
      
      public function valueChgShow(param1:int, param2:int) : void
      {
         if(!(int(param1) - 1))
         {
            _unitVo.dispatchEvent(new BattleEvent("FIGHT_ADD_KILL_RAGE",param2));
         }
      }
      
      public function updateRage(param1:int) : void
      {
         _unitVo.rage = param1;
         _unitVo.dispatchEvent(new MzEvent("valueChange",param1));
      }
      
      private function addFireChecker() : void
      {
         if(gm.vo.playMode == 3)
         {
            if(_unitVo.isAttack != gm.vo.isAttack)
            {
               return;
            }
         }
         else if(_unitVo.isAttack != 1)
         {
            return;
         }
      }
      
      public function checkFireAuto() : Boolean
      {
         if(this.action == "std_2")
         {
            return true;
         }
         return false;
      }
      
      public function checkFireManual() : Boolean
      {
         if(this.action == "hurt_4")
         {
            return false;
         }
         if(this.action == "hurt_2_1")
         {
            return false;
         }
         if(this.action == "hurt_2_2")
         {
            return false;
         }
         return true;
      }
      
      private function checkFireBtn() : void
      {
         var _loc1_:Boolean = true;
         _loc1_ = _loc1_ && _unitVo.rage >= _unitVo.stcNpcVo.max_rage;
         if(_loc1_ == _canFire)
         {
            return;
         }
         _canFire = _loc1_;
         this.unitVo.dispatchEvent(new BattleEvent("FIGHT_REFRESH_FIRE_BTN",_loc1_));
      }
      
      public function doDodge() : void
      {
         showFightTxt(0,4);
         if(inSkillAct)
         {
            return;
         }
         if(_tl)
         {
            _tl.clear();
         }
         this.action = "dodge";
      }
      
      public function doImmuneAct() : void
      {
         this.action = "immune";
      }
      
      public function doHeal(param1:int, param2:Boolean, param3:int) : void
      {
         var _loc4_:* = null;
         if(param2)
         {
            showFightTxt(param1,3);
         }
         else
         {
            showFightTxt(param1,2);
         }
         if(param3 == 1)
         {
            playerHurtEffect("0");
         }
         else
         {
            _loc4_ = StcMgr.ins.getSkillEffectVo(param3);
            if(_loc4_)
            {
               playerHurtEffect(_loc4_.hit_effect);
            }
         }
      }
      
      public function addBuff(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:BuffVo = updateBuff(param1,param2,param3);
         if(_loc4_.stcBuffVo.buff_show_id > 0)
         {
            showBuffTxt(_loc4_.stcBuffVo.buff_show_id);
         }
      }
      
      public function updateBuff(param1:int, param2:int, param3:int) : BuffVo
      {
         var _loc14_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc6_:int = 0;
         var _loc13_:Boolean = false;
         var _loc7_:* = null;
         var _loc12_:* = null;
         var _loc11_:* = null;
         var _loc8_:Number = NaN;
         var _loc4_:Array = _state2d.list_icon.dataSource as Array;
         var _loc5_:Boolean = false;
         _loc9_ = 0;
         while(_loc9_ < _loc4_.length)
         {
            _loc10_ = _loc4_[_loc9_];
            if(_loc10_.id == param1)
            {
               _loc14_ = _loc10_;
               _loc14_.stacks = param2;
               _loc14_.cd = param3;
               _state2d.list_icon.changeItem(_loc9_,_loc14_);
               break;
            }
            _loc9_++;
         }
         if(!_loc14_)
         {
            _loc14_ = new BuffVo();
            _loc14_.id = param1;
            _loc14_.stacks = param2;
            _loc14_.cd = param3;
            _loc5_ = true;
            _state2d.list_icon.addItem(_loc14_);
            switch(int(_loc14_.stcBuffVo.effect_type) - 8)
            {
               case 0:
                  isDizzy = true;
                  if(!inPosition())
                  {
                     moveTo(unitVo.oriXY.x,unitVo.oriXY.y,2);
                  }
                  break;
               case 1:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               default:
                  isConfuse = true;
                  break;
               case 15:
                  changeLook(_loc14_.stcBuffVo.init_effect_value1);
            }
         }
         if(!StringUtils.isNull(_loc14_.stcBuffVo.display_effect_id))
         {
            _loc13_ = false;
            _loc7_ = _loc14_.stcBuffVo.display_effect_id.split("|");
            if(_loc7_.length >= 2)
            {
               if(_loc14_.stacks >= int(_loc7_[1]))
               {
                  _loc6_ = _loc7_[0];
                  _loc13_ = true;
               }
            }
            else if(_loc5_)
            {
               _loc6_ = _loc14_.stcBuffVo.display_effect_id;
               _loc13_ = true;
            }
            if(_loc13_)
            {
               _loc12_ = StcMgr.ins.getSpecialEffectVo(_loc6_);
               if(_loc12_)
               {
                  this.avatarBody.removeEffect(UrlLib.e3d_particle(_loc12_.effect));
                  _loc11_ = new AvatarEffectVO();
                  _loc11_.effectUrl = UrlLib.e3d_particle(_loc12_.effect);
                  _loc11_.boneTag = _loc12_.tag;
                  _loc11_.billboard = true;
                  _loc8_ = _loc12_.scale <= 0?1:Number(_loc12_.scale);
                  if(this.isAttack)
                  {
                     _loc11_.scale = DefindConsts.SCENE_AVATAR_SCALE_SCENE / this.avatarBody.scaleAll * _loc8_;
                  }
                  else
                  {
                     _loc11_.scale = !!gm.vo.isBoss?_loc8_:Number(-DefindConsts.SCENE_AVATAR_SCALE_SCENE / this.avatarBody.scaleAll * _loc8_);
                  }
                  this.avatarBody.addEffect(_loc11_);
                  buffEffDic[param1] = _loc11_;
               }
               else
               {
                  Log.error(this,"缺少特效",_loc6_);
               }
            }
         }
         return _loc14_;
      }
      
      public function setResultState(param1:*) : void
      {
         updateHpBarValue(param1.hp,param1.hp_max);
         _unitVo.rage = param1.rage;
         _unitVo.dispatchEvent(new MzEvent("valueChange",param1.rage));
         if(param1.hp <= 0)
         {
            doDie();
            dieAct();
         }
         resetPos();
         Log.debug(this,TimerManager.ins.currTimer,_unitVo.xy,_unitVo.oriXY);
      }
      
      private function resetPos() : void
      {
         var _loc1_:* = null;
         if(_unitVo)
         {
            _unitVo.reOriPoi();
            _loc1_ = TransformUtil.fight2Dto3D(_unitVo.xy.x,_unitVo.xy.y);
            _avatar.position = _loc1_;
            validateStateBar();
         }
      }
      
      public function clearBuff() : void
      {
         _state2d.list_icon.dataSource = [];
         var _loc3_:int = 0;
         var _loc2_:* = buffEffDic;
         for each(var _loc1_ in buffEffDic)
         {
            if(_loc1_)
            {
               this.avatarBody.removeEffect(_loc1_.effectUrl);
            }
         }
         buffEffDic = null;
      }
      
      public function removeBuff(param1:int) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Array = _state2d.list_icon.dataSource as Array;
         _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc6_];
            if(_loc5_.id == param1)
            {
               _loc2_.splice(_loc6_,1);
               _state2d.list_icon.dataSource = _loc2_;
               _loc3_ = StcMgr.ins.getBuffVo(param1);
               _loc4_ = buffEffDic[param1];
               if(_loc4_)
               {
                  this.avatarBody.removeEffect(_loc4_.effectUrl);
                  delete buffEffDic[param1];
               }
               switch(int(_loc3_.effect_type) - 8)
               {
                  case 0:
                     this.isDizzy = false;
                     this.action = "std_2";
                     break;
                  case 1:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  default:
                     this.isConfuse = false;
                     break;
                  case 15:
                     resetLook();
               }
               return;
            }
            _loc6_++;
         }
      }
      
      public function inPosition() : Boolean
      {
         var _loc1_:Boolean = this.x == unitVo.oriXY.x && this.y == unitVo.oriXY.y;
         return _loc1_;
      }
      
      public function lockTarget(param1:nslm2.modules.battles.battle.Player) : void
      {
         if(param1.inPosition())
         {
            return;
         }
         if(_lockTarget)
         {
            _lockTarget.whoLockMe = null;
            _lockTarget.skillRearEnd();
            _lockTarget = null;
         }
         param1.whoLockMe = this;
         _lockTarget = param1;
      }
      
      public function skillRearEnd() : void
      {
         this.action = "std_2";
         if(_chainNode)
         {
            _chainNode = null;
            _chainParam = null;
         }
         if(_lockTarget && _lockTarget.whoLockMe == this)
         {
            _lockTarget.whoLockMe = null;
            _lockTarget.skillRearEnd();
            _lockTarget = null;
         }
         if(whoLockMe)
         {
            return;
         }
         if(_isDead)
         {
            return;
         }
         if(!inPosition())
         {
            moveTo(unitVo.oriXY.x,unitVo.oriXY.y,2);
         }
      }
      
      public function changeLook(param1:int) : void
      {
         if(_isChangeLook)
         {
            return;
         }
         _isChangeLook = true;
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         var _loc4_:StcModelVo = StcMgr.ins.getModelVo(int(_loc3_.model_id));
         var _loc2_:StcModelVo = StcMgr.ins.getModelVo(_loc3_.wing_id);
         TweenLite.delayedCall(FPUtil.fixFrame(6),this._avatar.removeChild,[_avatarBody]);
         _avatarBody = FactoryUtil.add3D(false,_loc4_,0,FactoryUtil.weapon_ModelVos(param1),55,_loc2_);
         _avatarBody.action = "std_2";
         this._avatar.addChild(_avatarBody);
      }
      
      public function resetLook() : void
      {
         if(_isChangeLook)
         {
            _isChangeLook = false;
            _avatarBody.dispose();
            if(unitView.avatarBody)
            {
               _avatarBody = unitView.avatarBody;
               _avatarBody.action = "std_2";
               this._avatar.addChild(_avatarBody);
            }
         }
      }
      
      public function get isDead() : Boolean
      {
         return _isDead;
      }
      
      public function get reBorn() : Boolean
      {
         return _isDead && _dieType == 1;
      }
      
      public function skillInit() : void
      {
         this.aimList.length = 0;
      }
   }
}
