package nslm2.modules.battles.battle
{
   import flash.utils.Dictionary;
   import flash.display.Sprite;
   import nslm2.modules.fightPlayer.FPDebug;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.fightPlayer.FPConsts;
   import com.mz.core.logging.Log;
   import com.mz.core.utils.DictHash;
   import com.greensock.TweenLite;
   import nslm2.modules.fightPlayer.UnitView;
   import flash.utils.getTimer;
   import nslm2.common.model.PlayerModel;
   import flash.events.Event;
   import morn.core.components.List;
   import nslm2.modules.fightPlayer.UnitVo;
   import away3d.containers.ObjectContainer3D;
   import proto.SkillTimePoint;
   import proto.StagePhaseCheckReq;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.dungeons.HeadPortraitRender;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.gmModules.PlayerLogUtil;
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.modules.battles.pvp.PvpEngine;
   import nslm2.modules.battles.battle.show.Act;
   import nslm2.modules.battles.battle.show.MoveSelf;
   import nslm2.modules.battles.battle.show.MoveTarget;
   import nslm2.modules.battles.battle.show.MoveH;
   import nslm2.modules.battles.battle.show.MoveV;
   import nslm2.modules.battles.battle.show.EffSelf;
   import nslm2.modules.battles.battle.show.EffBulletTarget;
   import nslm2.modules.battles.battle.show.RotTarget;
   import nslm2.modules.battles.battle.show.RotBack;
   import nslm2.modules.battles.battle.show.EffTarget;
   import nslm2.modules.battles.battle.show.EffPos;
   import nslm2.modules.battles.battle.show.MoveFix;
   import nslm2.modules.battles.battle.show.EffAimList;
   import nslm2.modules.battles.battle.show.EffSelfBillboard;
   import nslm2.modules.battles.battle.show.EffChainInit;
   import nslm2.modules.battles.battle.show.DelMove;
   import nslm2.modules.battles.battle.show.EffBulletAimList;
   import nslm2.modules.battles.battle.show.BodyFade;
   import nslm2.modules.battles.battle.show.BodyShow;
   import nslm2.modules.battles.battle.show.EffV;
   import nslm2.modules.battles.battle.show.SoundPlay;
   import nslm2.modules.battles.battle.show.EffAimTarget17;
   import nslm2.modules.battles.battle.show.AvatarAct;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   
   public class GameObjectManager
   {
      
      public static const SETTING_USE_BATTLE_Socket:String = "settingUseBattleSocket";
      
      public static const SETTING_BATTLE_Socket_IP:String = "settingBattleIP";
      
      public static const SETTING_BATTLE_SKILL_TEST:String = "settingBattleSkillTest";
      
      protected static var instance:nslm2.modules.battles.battle.GameObjectManager = null;
      
      public static var test_seed:Array = [2593,1451,1850,3462,7803,6516,3418,2807,8458,6212,9209,1434,4429,1017,2009,1391,8718,5500,9804,657,4808,1511,4752,7696,4710,3884,6979,1471,1718,1944,7784,3371,10,5816,8175,9900,1810,7403,831,7328,325,2440,2827,741,1807,640,2261,8584,4263,758,6674,2334,9259,2878,7616,1909,2702,3380,6118,1010,9319,7300,1929,9401];
      
      public static var test_playMode:int;
      
      public static var effectOff:int = 0;
      
      public static var bulletOff:int = 0;
       
      
      private var gameObjectList:Dictionary;
      
      private var _time:Number;
      
      private var _sprite:Sprite;
      
      public var debug:FPDebug;
      
      public var engine:nslm2.modules.battles.battle.IBattleEngine;
      
      private var _pvpEngine:nslm2.modules.battles.battle.IBattleEngine;
      
      private var _pveEngine:nslm2.modules.battles.battle.IBattleEngine;
      
      private var bp:nslm2.modules.battles.battle.BattlePlayer;
      
      public var battleReuslt:int;
      
      private var _useSocketEngine:Boolean;
      
      private var _speedType:int;
      
      private var _autoFire:Boolean;
      
      private var _isFighting:Boolean = false;
      
      private var _slowFlag:Boolean = false;
      
      public var debug_buffs:String;
      
      public var testPlayerId:int = 0;
      
      public var debugActions:String;
      
      private var _immediately:Boolean = false;
      
      private var _isPause:Boolean = false;
      
      private var _frameTime:Number = 0;
      
      public var lastKillPlayer:nslm2.modules.battles.battle.Player;
      
      public function GameObjectManager()
      {
         debug = new FPDebug();
         super();
         if(instance != null)
         {
            throw new Error("Only one Singleton instance should be instantiated");
         }
         new InitCCReplacer();
         gameObjectList = new Dictionary();
         _sprite = new Sprite();
         _useSocketEngine = LocalData.insTools.load("settingUseBattleSocket",false);
         if(_useSocketEngine)
         {
            _pveEngine = new SocketEngine();
         }
         else
         {
            _pveEngine = new CCEngine();
         }
         engine = _pveEngine;
         _pvpEngine = new PvpEngine();
         Act;
         MoveSelf;
         MoveTarget;
         MoveH;
         MoveV;
         EffSelf;
         EffBulletTarget;
         RotTarget;
         RotBack;
         EffTarget;
         EffPos;
         MoveFix;
         EffAimList;
         EffSelfBillboard;
         EffChainInit;
         DelMove;
         EffBulletAimList;
         BodyFade;
         BodyShow;
         EffV;
         SoundPlay;
         EffAimTarget17;
         AvatarAct;
         if(FuncOpenAutoCtrl.checkOpen(40256))
         {
            _autoFire = LocalData.insCurPlayer.load("FP_AUTOFIRE_LOCAL_DATA",false);
         }
         var _loc1_:int = LocalData.insCurPlayer.load("FP_SPEED_LOCAL_DATA",0);
         _loc1_ = Math.min(_loc1_,1);
         speedType = _loc1_;
      }
      
      public static function get Instance() : nslm2.modules.battles.battle.GameObjectManager
      {
         if(instance == null)
         {
            instance = new nslm2.modules.battles.battle.GameObjectManager();
         }
         return instance;
      }
      
      public function get autoFire() : Boolean
      {
         return _autoFire;
      }
      
      public function set autoFire(param1:Boolean) : void
      {
         _autoFire = param1;
         vo.heads.checkMouseState();
         LocalData.insCurPlayer.save("FP_AUTOFIRE_LOCAL_DATA",_autoFire);
      }
      
      public function get speedType() : int
      {
         return _speedType;
      }
      
      public function set speedType(param1:int) : void
      {
         _speedType = param1;
         nslm2.modules.battles.battle.BattlePlayer.CYCLES_FPS = FPConsts.speed_value[_speedType];
         setAllSpeed(FPUtil.playSpeed());
         LocalData.insCurPlayer.save("FP_SPEED_LOCAL_DATA",_speedType);
      }
      
      private function setAllSpeed(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = gameObjectList;
         for each(var _loc3_ in gameObjectList)
         {
            _loc2_ = _loc3_ as nslm2.modules.battles.battle.Player;
            if(_loc2_)
            {
               _loc2_.avatarBody.playbackSpeed = param1;
               _loc2_.setAllSelfEffSpeed(param1);
            }
         }
      }
      
      public function test_btn(param1:int) : void
      {
         if(vo.playMode == 4 && testPlayerId <= 0)
         {
            Log.warn(this,"请点头像择选英雄！testPlayerId:" + testPlayerId);
            return;
         }
         var _loc3_:nslm2.modules.battles.battle.Player = getPlayerId(testPlayerId);
         if(_loc3_ == null)
         {
            Log.warn(this,"player 为空");
            return;
         }
         if(param1 == 6)
         {
            _loc3_.dieAct();
            return;
         }
         if(param1 == 4)
         {
            _loc3_.changeLook(100421);
            return;
         }
         if(param1 == 5)
         {
            _loc3_.resetLook();
            return;
         }
         var _loc2_:Array = [_loc3_.unitVo.stcNpcVo.normal_attack_id,_loc3_.unitVo.stcNpcVo.skill_id1,_loc3_.unitVo.stcNpcVo.skill_id2,_loc3_.unitVo.stcNpcVo.skill_id3,_loc3_.unitVo.stcNpcVo.skill_id4];
         var _loc4_:int = _loc2_[param1 - 1];
         if(_loc4_ > 0)
         {
            engine.skillTest(testPlayerId,_loc4_);
         }
      }
      
      public function get vo() : BattleStartVo
      {
         if(bp)
         {
            return bp.vo;
         }
         return null;
      }
      
      public function get isFighting() : Boolean
      {
         return _isFighting;
      }
      
      public function startup(param1:DictHash, param2:nslm2.modules.battles.battle.BattlePlayer) : void
      {
         var _loc3_:* = null;
         debugActions = "";
         debug_buffs = "";
         bp = param2;
         _slowFlag = false;
         if(vo.playMode == 3)
         {
            engine = _pvpEngine;
         }
         else
         {
            engine = _pveEngine;
         }
         if(!engine.isReady())
         {
            TweenLite.delayedCall(0.3,startup,[param1,param2]);
            return;
         }
         engine.dispatcher.addEventListener("ACTION_READY",onActionReady);
         engine.dispatcher.addEventListener("FIGHT_IMMEDIATELY_FINISH",onResultReturn);
         vo.heads.addEventListener("renderClick",onHeadClick);
         if(vo.playMode == 4)
         {
            vo.heads.list_headPortrait.addEventListener("change",skill_test_head_click);
         }
         engine.createBattle();
         var _loc6_:int = 0;
         var _loc5_:* = param1.array;
         for each(var _loc4_ in param1.array)
         {
            if(_loc4_.vo.hp > 0)
            {
               _loc3_ = new nslm2.modules.battles.battle.Player(_loc4_);
               _loc3_.startup();
               engine.addPlayer(_loc4_.vo);
               if(_loc4_.vo && _loc4_.vo.serVo)
               {
                  debug_buffs = debug_buffs + (_loc3_.objId + "+" + _loc4_.vo.serVo.buff + ";");
               }
            }
         }
         _time = getTimer();
         battleReuslt = 0;
         _frameTime = 0;
         if(!_sprite.hasEventListener("enterFrame"))
         {
            _sprite.addEventListener("enterFrame",onEnterFrame);
         }
         if(vo.playMode == 2)
         {
            engine.start(2,vo.seeds,vo.replayStp);
         }
         else
         {
            engine.start(vo.playMode,vo.seeds);
         }
         _isFighting = true;
         setAllSpeed(FPUtil.playSpeed());
         if(PlayerModel.ins.level <= 5)
         {
            vo.heads.onBeginGuideCheck();
         }
      }
      
      protected function skill_test_head_click(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc4_:UnitVo = List(param1.target).selectedItem as UnitVo;
         var _loc6_:int = 0;
         var _loc5_:* = gameObjectList;
         for each(var _loc3_ in gameObjectList)
         {
            _loc2_ = _loc3_ as nslm2.modules.battles.battle.Player;
            if(_loc2_ && _loc2_.unitVo == _loc4_)
            {
               testPlayerId = _loc2_.objId;
               Log.warn(this,"选中英雄！testPlayerId:" + testPlayerId);
               return;
            }
         }
      }
      
      private function slowDown(param1:nslm2.modules.battles.battle.Player) : void
      {
         if(vo.playMode == 1)
         {
            SlowMotiontHandler.ins.rotate(vo,param1,gameObjectList);
         }
         else
         {
            SlowMotiontHandler.ins.pan(vo,param1,gameObjectList);
         }
      }
      
      public function get fightLayer() : ObjectContainer3D
      {
         return vo.container;
      }
      
      public function get rootLayer() : ObjectContainer3D
      {
         return vo.container.parent;
      }
      
      protected function onResultReturn(param1:BattleEvent) : void
      {
         event = param1;
         if(!_useSocketEngine && _immediately)
         {
            var _loc4_:int = 0;
            var _loc3_:* = event.data["players"];
            for each(op in event.data["players"])
            {
               var p:nslm2.modules.battles.battle.Player = getPlayerId(op.id);
               p.setResultState(op);
            }
         }
         battleReuslt = event.data["re"]["result"];
         var turnNums:int = event.data["re"]["turnNum"];
         var damageSum:Number = event.data["re"]["damageSum"];
         var stps:Array = event.data["stps"];
         var deStr:String = "战斗结果：" + battleReuslt + "，回合数：" + turnNums + "，伤统：" + damageSum;
         deStr = deStr + FPUtil.getStpString(stps);
         var _loc6_:int = 0;
         var _loc5_:* = event.data["players"];
         for each(op in event.data["players"])
         {
            deStr = deStr + (op.id + ":hp:" + op.hp + ",rage:" + op.rage + "\n");
         }
         Log.debug(this,deStr);
         var serStps:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = stps;
         for each(stp in stps)
         {
            var serStp:SkillTimePoint = new SkillTimePoint();
            serStp.objId = stp.objId;
            serStp.timePoint = stp.timePoint;
            serStps.push(serStp);
         }
         var $req:StagePhaseCheckReq = new StagePhaseCheckReq();
         $req.stp = serStps;
         $req.playMode = 2;
         $req.clientRet = battleReuslt;
         $req.damage = damageSum;
         setAllSpeed(1);
         TweenLite.delayedCall(1,function():void
         {
            shutDown();
            bp.dispatchEvent(new BattleEvent("FIGHT_COMPLETE",{
               "req":$req,
               "bResult":battleReuslt
            }));
         });
      }
      
      protected function onHeadClick(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:nslm2.modules.battles.battle.Player = null;
         var _loc7_:int = 0;
         var _loc6_:* = gameObjectList;
         for each(var _loc3_ in gameObjectList)
         {
            _loc2_ = _loc3_ as nslm2.modules.battles.battle.Player;
            if(_loc2_ && _loc2_.unitVo == HeadPortraitRender(param1.data).vo)
            {
               _loc4_ = !!autoFire?_loc2_.checkFireAuto():Boolean(_loc2_.checkFireManual());
               if(_loc4_)
               {
                  if(isDefenAllDead())
                  {
                     return;
                  }
                  if(ClientConfig.firstBattle == 1)
                  {
                     PlayerLogUtil.ins.saveNext();
                  }
                  engine.manualSkillFire(_loc2_.objId);
               }
               return;
            }
         }
      }
      
      protected function onActionReady(param1:BattleEvent) : void
      {
         var _loc3_:Array = param1.data as Array;
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            onAction(_loc2_);
            debugActions = debugActions + ("numCycles:" + _loc2_.numCycles + " id:" + _loc2_.id + " data0:" + _loc2_.data0 + " data1:" + _loc2_.data1 + " data2:" + _loc2_.data2 + " data3:" + _loc2_.data3 + "\n");
         }
      }
      
      public function shutDown() : void
      {
         var _loc2_:* = null;
         engine.dispatcher.removeEventListener("ACTION_READY",onActionReady);
         engine.dispatcher.removeEventListener("FIGHT_IMMEDIATELY_FINISH",onResultReturn);
         _isFighting = false;
         if(vo)
         {
            vo.heads.removeEventListener("renderClick",onHeadClick);
         }
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = gameObjectList;
         for each(_loc2_ in gameObjectList)
         {
            _loc1_.push(_loc2_);
         }
         var _loc6_:int = 0;
         var _loc5_:* = _loc1_;
         for each(_loc2_ in _loc1_)
         {
            _loc2_.shutdown();
            removeGameObject(_loc2_);
         }
      }
      
      public function getPlayerId(param1:int) : nslm2.modules.battles.battle.Player
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = gameObjectList;
         for each(var _loc3_ in gameObjectList)
         {
            _loc2_ = _loc3_ as nslm2.modules.battles.battle.Player;
            if(_loc2_ && _loc2_.objId == param1)
            {
               _loc4_ = _loc2_;
            }
         }
         return _loc4_;
      }
      
      public function finish(param1:Boolean = false) : void
      {
         _immediately = param1;
         if(isFighting)
         {
            _sprite.removeEventListener("enterFrame",onEnterFrame);
            engine.getResult();
            _isFighting = false;
         }
      }
      
      public function clearPlayerTL() : void
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = gameObjectList;
         for each(var _loc2_ in gameObjectList)
         {
            _loc1_ = _loc2_ as nslm2.modules.battles.battle.Player;
            if(_loc1_)
            {
               _loc1_.clearTL();
            }
         }
      }
      
      public function pause(param1:Boolean = false) : void
      {
         _isPause = param1;
         if(_isPause)
         {
            _sprite.removeEventListener("enterFrame",onEnterFrame);
         }
         else
         {
            _time = getTimer();
            _sprite.addEventListener("enterFrame",onEnterFrame);
         }
      }
      
      public function addGameObject(param1:GameObject) : void
      {
         if(param1)
         {
            gameObjectList[param1] = param1;
         }
      }
      
      public function removeGameObject(param1:GameObject) : void
      {
         gameObjectList[param1] = null;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc3_:Number = getTimer();
         var _loc2_:Number = (_loc3_ - _time) / 1000;
         battleUpdate(_loc2_);
         _time = _loc3_;
      }
      
      private function checkAutoFire() : void
      {
         if(!autoFire)
         {
            return;
         }
         if(vo)
         {
            vo.heads.checkAutoFire();
         }
      }
      
      private function setMapDark(param1:Boolean) : void
      {
         setMapDark2(vo.maps,param1);
      }
      
      private function setMapDark2(param1:*, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:* = undefined;
         if(param1 is DungeonMultilayerBg)
         {
            _loc5_ = param1 as DungeonMultilayerBg;
            if(param2)
            {
               _loc5_.addMethod(FPUtil.getDarkMethod());
            }
            else
            {
               _loc5_.removeMethod(FPUtil.getDarkMethod());
            }
         }
         else if(param1 is Image3D)
         {
            _loc4_ = param1 as Image3D;
            if(param2)
            {
               _loc4_.addMethod(FPUtil.getDarkMethod());
            }
            else
            {
               _loc4_.removeMethod(FPUtil.getDarkMethod());
            }
         }
         else if(param1 is TileImg)
         {
            _loc7_ = param1 as TileImg;
            if(param2)
            {
               _loc7_.addMethod(FPUtil.getDarkMethod());
            }
            else
            {
               _loc7_.removeMethod(FPUtil.getDarkMethod());
            }
         }
         else if(param1 is Array)
         {
            _loc6_ = (param1 as Array).length;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc3_ = (param1 as Array)[_loc8_];
               setMapDark2(_loc3_,param2);
               _loc8_++;
            }
         }
      }
      
      private function battleUpdate(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         _frameTime = _frameTime + param1;
         if(nslm2.modules.battles.battle.BattlePlayer.CYCLES_FPS != -1)
         {
            _loc2_ = 1 / nslm2.modules.battles.battle.BattlePlayer.CYCLES_FPS;
            while(_frameTime > _loc2_)
            {
               _frameTime = _frameTime - _loc2_;
               engine.update();
               checkAutoFire();
            }
         }
      }
      
      private function unFreezeAll() : void
      {
         setMapDark(false);
         var _loc3_:int = 0;
         var _loc2_:* = gameObjectList;
         for each(var _loc1_ in gameObjectList)
         {
            _loc1_.setFreeze(false);
         }
      }
      
      private function summon(param1:*) : void
      {
         var _loc5_:nslm2.modules.battles.battle.Player = getPlayerId(param1.data3);
         if(!_loc5_)
         {
            return;
         }
         var _loc4_:UnitVo = new UnitVo();
         _loc4_.npc_id = param1.data0;
         _loc4_.posId = param1.data1;
         _loc4_.isAttack = param1.data2;
         _loc4_.hp_max = _loc4_.stcNpcVo.hp;
         _loc4_.hp = _loc4_.hp_max;
         _loc4_.init(vo.isBoss);
         var _loc2_:UnitView = new UnitView(_loc4_,Sprite(_loc5_.layer2D));
         _loc2_.action = "std_2";
         _loc2_.init();
         _loc5_.avatar.parent.addChild(_loc2_.avatarBox);
         var _loc3_:nslm2.modules.battles.battle.Player = new nslm2.modules.battles.battle.Player(_loc2_);
         _loc3_.summonPlayId = param1.data3;
         _loc3_.startup();
      }
      
      public function isDefenAllDead(param1:Boolean = false) : Boolean
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = gameObjectList;
         for each(var _loc3_ in gameObjectList)
         {
            _loc2_ = _loc3_ as nslm2.modules.battles.battle.Player;
            if(_loc2_ && !_loc2_.isAttack)
            {
               if(!_loc2_.isDead || param1 && _loc2_.reBorn)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      private function onAction(param1:*) : void
      {
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:int = 0;
         var _loc11_:* = null;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc14_:* = param1.id;
         if(33 !== _loc14_)
         {
            if(6 !== _loc14_)
            {
               if(4 !== _loc14_)
               {
                  if(7 !== _loc14_)
                  {
                     if(11 !== _loc14_)
                     {
                        if(18 !== _loc14_)
                        {
                           if(31 !== _loc14_)
                           {
                              if(38 !== _loc14_)
                              {
                                 if(19 !== _loc14_)
                                 {
                                    if(21 !== _loc14_)
                                    {
                                       if(20 !== _loc14_)
                                       {
                                          if(23 !== _loc14_)
                                          {
                                             if(24 !== _loc14_)
                                             {
                                                if(25 !== _loc14_)
                                                {
                                                   if(37 !== _loc14_)
                                                   {
                                                      if(26 !== _loc14_)
                                                      {
                                                         if(13 !== _loc14_)
                                                         {
                                                            if(17 !== _loc14_)
                                                            {
                                                               if(28 !== _loc14_)
                                                               {
                                                                  if(32 !== _loc14_)
                                                                  {
                                                                     if(34 !== _loc14_)
                                                                     {
                                                                        if(29 !== _loc14_)
                                                                        {
                                                                           if(35 !== _loc14_)
                                                                           {
                                                                              if(36 === _loc14_)
                                                                              {
                                                                                 summon(param1);
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              _loc7_ = getPlayerId(param1.data0);
                                                                              _loc7_.skillInit();
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           _loc7_ = getPlayerId(param1.data0);
                                                                           _loc7_.skillRearEnd();
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        _loc7_ = getPlayerId(param1.data0);
                                                                        _loc7_.valueChgShow(param1.data1,param1.data2);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     _loc7_ = getPlayerId(param1.data0);
                                                                     _loc7_.updateHpBarValue(param1.data1,param1.data2);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  _loc7_ = getPlayerId(param1.data0);
                                                                  _loc5_ = getPlayerId(param1.data1);
                                                                  if(_loc5_)
                                                                  {
                                                                     _loc5_.playSelfEff("600004",0.6);
                                                                  }
                                                                  _loc7_.aimList.push(param1.data1);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               _loc2_ = param1.data0;
                                                               bp.dispatchEvent(new BattleEvent("FIGHT_NEW_TURN_BEGIN",_loc2_));
                                                            }
                                                         }
                                                         else
                                                         {
                                                            _loc7_ = getPlayerId(param1.data0);
                                                            _loc7_.doSkillRear(param1.data1);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         _loc7_ = getPlayerId(param1.data0);
                                                         _loc7_.removeBuff(param1.data1);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      _loc7_ = getPlayerId(param1.data0);
                                                      _loc7_.addBuff(param1.data1,param1.data3,param1.data2);
                                                   }
                                                }
                                                else
                                                {
                                                   _loc7_ = getPlayerId(param1.data0);
                                                   _loc7_.updateBuff(param1.data1,param1.data3,param1.data2);
                                                }
                                             }
                                             else
                                             {
                                                _loc7_ = getPlayerId(param1.data0);
                                                _loc3_ = param1.data2 % 10;
                                                _loc6_ = param1.data2 / 10;
                                                if(_loc6_ > 0)
                                                {
                                                   _loc5_ = getPlayerId(_loc6_);
                                                   if(_loc5_)
                                                   {
                                                      _loc5_.unitVo.sumHeal = _loc5_.unitVo.sumHeal + param1.data1;
                                                      _loc5_.chainEffShow(_loc7_);
                                                   }
                                                }
                                                _loc7_.doHeal(param1.data1,_loc3_ == 1,param1.data3);
                                             }
                                          }
                                          else
                                          {
                                             _loc7_ = getPlayerId(param1.data0);
                                             _loc5_ = getPlayerId(param1.data1);
                                             _loc5_.chainEffShow(_loc7_);
                                             _loc7_.doDodge();
                                          }
                                       }
                                       else
                                       {
                                          unFreezeAll();
                                       }
                                    }
                                    else
                                    {
                                       _loc7_ = getPlayerId(param1.data0);
                                       _loc7_.setFreeze(false);
                                       _loc7_.doBigSkillEffect();
                                    }
                                 }
                                 else
                                 {
                                    setMapDark(true);
                                    _loc14_ = 0;
                                    var _loc13_:* = gameObjectList;
                                    for each(var _loc12_ in gameObjectList)
                                    {
                                       _loc11_ = _loc12_ as nslm2.modules.battles.battle.Player;
                                       if(_loc11_)
                                       {
                                          if(_loc11_.objId != param1.data0)
                                          {
                                             _loc12_.setFreeze(true);
                                          }
                                          else
                                          {
                                             _loc11_.doBigSkillEffect();
                                          }
                                       }
                                       else
                                       {
                                          _loc12_.setFreeze(true);
                                       }
                                    }
                                 }
                              }
                              else
                              {
                                 _loc7_ = getPlayerId(param1.data0);
                                 _loc7_.showFightTxt(0,7);
                                 if(param1.data1 == 1)
                                 {
                                    _loc7_.doImmuneAct();
                                 }
                              }
                           }
                           else
                           {
                              _loc7_ = getPlayerId(param1.data0);
                              _loc7_.doAbsorb(param1.data1);
                           }
                        }
                        else
                        {
                           _loc7_ = getPlayerId(param1.data0);
                           _loc7_.updateRage(param1.data1);
                        }
                     }
                     else
                     {
                        _loc7_ = getPlayerId(param1.data0);
                        lastKillPlayer = _loc7_;
                        _loc7_.doSkillFront(param1.data1,param1.data2);
                     }
                  }
                  else
                  {
                     finish();
                  }
               }
               else
               {
                  _loc7_ = getPlayerId(param1.data0);
                  if(!_loc7_.unitVo.isAttack)
                  {
                     bp.dispatchEvent(new BattleEvent("FIGHT_DEFENDER_GET_DAMAGE",param1.data1));
                  }
                  _loc10_ = param1.data2 / 100;
                  _loc4_ = param1.data2 % 10;
                  _loc8_ = param1.data2 % 100 / 10;
                  if(_loc10_ > 0)
                  {
                     _loc5_ = getPlayerId(_loc10_);
                     if(_loc5_)
                     {
                        _loc5_.unitVo.sumDamage = _loc5_.unitVo.sumDamage + param1.data1;
                        _loc5_.chainEffShow(_loc7_);
                     }
                  }
                  _loc7_.unitVo.sumHurt = _loc7_.unitVo.sumHurt + param1.data1;
                  _loc7_.doHurt(param1.data1,_loc8_,_loc4_,param1.data3);
               }
            }
            else
            {
               _loc7_ = getPlayerId(param1.data0);
               _loc9_ = param1.data1;
               _loc7_.doDie(_loc9_);
               if(_loc9_ == 0)
               {
                  bp.dispatchEvent(new BattleEvent("FIGHT_PLAYER_DIE",_loc7_.unitVo));
                  if(lastKillPlayer && isDefenAllDead(true) && vo.isWinAct && lastKillPlayer.isLastSkillBig())
                  {
                     if(!_slowFlag)
                     {
                        slowDown(_loc7_);
                        _slowFlag = true;
                     }
                  }
               }
            }
         }
         else
         {
            _loc7_ = getPlayerId(param1.data0);
            _loc7_.reborn(param1.data1,param1.data2);
         }
      }
   }
}
