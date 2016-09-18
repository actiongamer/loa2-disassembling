package nslm2.modules.funnies.teamPKCS.preMatch
{
   import flash.display.Sprite;
   import away3d.containers.ObjectContainer3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.utils.TransformUtil;
   import nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
   import com.mz.core.configs.ClientConfig;
   import game.ui.teamPKCS.pre.TPKCposUI;
   import flash.geom.Point;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import proto.CTeamMemberInfo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import proto.CteamBattleHp;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.UIMgr;
   
   public class TPKCpreScene3D extends Sprite
   {
       
      
      public var layer3D:ObjectContainer3D;
      
      public var sceneLayer3D:ObjectContainer3D;
      
      public var bgBack:TileImg;
      
      public var selfArr:Vector.<nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D>;
      
      public var enemyArr:Vector.<nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D>;
      
      private var pos_ui:TPKCposUI;
      
      private var runCount:int = 0;
      
      private var _isDispose:Boolean = false;
      
      public function TPKCpreScene3D()
      {
         selfArr = new Vector.<nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D>();
         enemyArr = new Vector.<nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D>();
         super();
         layer3D = new ObjectContainer3D();
         sceneLayer3D = new ObjectContainer3D();
         UIMgr.root3D.addChild(layer3D);
         layer3D.addChild(sceneLayer3D);
      }
      
      public function init() : void
      {
         TransformUtil.cameraToSceneBattle();
         createBg(37000);
         initSelf();
         initEnemy();
      }
      
      private function createBg(param1:int) : void
      {
         var _loc2_:BgTileImgConfigVo = new BgTileImgConfigVo();
         _loc2_.needLoadConfigXML = true;
         _loc2_.mapId = param1;
         _loc2_.id = 102;
         bgBack = new TileImg(_loc2_);
         bgBack.z = 50;
         bgBack.x = -ClientConfig.SCENE_BG_W >> 1;
         bgBack.y = ClientConfig.SCENE_BG_H >> 1;
         sceneLayer3D.addChild(bgBack);
         bgBack.loadTileAll();
      }
      
      public function initSelf() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         selfArr.length = 0;
         if(!pos_ui)
         {
            pos_ui = new TPKCposUI();
         }
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = new nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D(layer3D);
            _loc1_.isSelf = true;
            _loc1_.parent2D = this;
            _loc1_.showIndex(_loc2_);
            layer3D.addChild(_loc1_);
            _loc1_.setPos(new Point(pos_ui["s" + _loc2_].x,-pos_ui["s" + _loc2_].y));
            _loc1_.z = _loc1_.y;
            _loc1_.rotationY = -90;
            selfArr.push(_loc1_);
            _loc2_++;
         }
      }
      
      public function getUnitById(param1:UInt64) : nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < enemyArr.length)
         {
            if(Uint64Util.equal(enemyArr[_loc2_].arenaPlayer.id,param1))
            {
               return enemyArr[_loc2_];
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < selfArr.length)
         {
            if(Uint64Util.equal(selfArr[_loc2_].arenaPlayer.id,param1))
            {
               return selfArr[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function initEnemy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         enemyArr.length = 0;
         if(!pos_ui)
         {
            pos_ui = new TPKCposUI();
         }
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = new nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D(layer3D);
            _loc1_.isSelf = false;
            _loc1_.parent2D = this;
            _loc1_.showIndex(_loc2_);
            layer3D.addChild(_loc1_);
            _loc1_.setPos(new Point(pos_ui["e" + _loc2_].x,-pos_ui["e" + _loc2_].y));
            _loc1_.z = _loc1_.y;
            _loc1_.rotationY = 90;
            enemyArr.push(_loc1_);
            _loc2_++;
         }
      }
      
      public function changeSelf(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            this.selfArr[_loc2_].initByArenaPlayer(CTeamMemberInfo(param1[_loc2_]).info);
            this.selfArr[_loc2_].visible = true;
            _loc2_++;
         }
      }
      
      public function changeEnemy(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            this.enemyArr[_loc2_].initByArenaPlayer(CTeamMemberInfo(param1[_loc2_]).info);
            this.enemyArr[_loc2_].visible = true;
            _loc2_++;
         }
      }
      
      public function makeDie(param1:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D) : void
      {
         param1.showShouShen(LocaleMgr.ins.getStr(50800040),"#ff3000");
         param1.resetPos();
      }
      
      public function makeWin3(param1:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D) : void
      {
         param1.showShouShen(LocaleMgr.ins.getStr(50800041),"#32FFFF");
         param1.resetPos();
      }
      
      public function runToFightPos(param1:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D, param2:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D) : void
      {
         runCount = 0;
         param1.moveSpeed = 450;
         if(param1.pos2d.x != this.pos_ui["f0"].x || param1.pos2d.y != -this.pos_ui["f0"].y)
         {
            param1.runTo(this.pos_ui["f0"].x,-this.pos_ui["f0"].y,runCpl);
         }
         else
         {
            runCpl();
         }
         param2.moveSpeed = 450;
         if(param2.pos2d.x != this.pos_ui["f1"].x || param2.pos2d.y != -this.pos_ui["f1"].y)
         {
            param2.runTo(this.pos_ui["f1"].x,-this.pos_ui["f1"].y,runCpl);
         }
         else
         {
            runCpl();
         }
      }
      
      private function runCpl() : void
      {
         runCount = Number(runCount) + 1;
         if(runCount >= 2)
         {
            trace("ok");
            this.dispatchEvent(new Event("EVT_PRE_BATTLE_RUN_COMPLETE"));
         }
      }
      
      public function skillAct(param1:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D) : void
      {
         if(_isDispose)
         {
            return;
         }
         param1.action = "skill_1";
      }
      
      public function fastPK(param1:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D, param2:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D, param3:CteamBattleHp) : void
      {
         param1.removeIndex3D();
         param2.removeIndex3D();
         if(param1.maxHp <= 0)
         {
            param1.maxHp = Uint64Util.toNumber(param3.winMaxHp);
            param1.currHp = param1.maxHp;
            param1.showHpBar(1);
         }
         if(param2.maxHp <= 0)
         {
            param2.maxHp = Uint64Util.toNumber(param3.loseMaxHp);
            param2.currHp = param1.maxHp;
            param2.showHpBar(1);
         }
         param2.afterHp(param3.loseNowHp);
         param1.afterHp(param3.winNowHp);
         param1.winTimes++;
         dispatchEvent(new Event("EVT_PRE_BATTLE_ONE_FIGHT_OVER"));
      }
      
      public function pk(param1:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D, param2:nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreUnit3D, param3:CteamBattleHp) : void
      {
         winner = param1;
         losser = param2;
         hp = param3;
         oneFightOver = function():void
         {
            if(_isDispose)
            {
               return;
            }
            if(winner.winTimes >= 3)
            {
               makeWin3(winner);
            }
            makeDie(losser);
            dispatchEvent(new Event("EVT_PRE_BATTLE_ONE_FIGHT_OVER"));
         };
         winner.removeIndex3D();
         losser.removeIndex3D();
         if(winner.maxHp <= 0)
         {
            winner.maxHp = Uint64Util.toNumber(hp.winMaxHp);
            winner.currHp = winner.maxHp;
            winner.showHpBar(1);
         }
         if(losser.maxHp <= 0)
         {
            losser.maxHp = Uint64Util.toNumber(hp.loseMaxHp);
            losser.currHp = winner.maxHp;
            losser.showHpBar(1);
         }
         winner.winTimes++;
         TweenLite.delayedCall(0.5,skillAct,[winner]);
         TweenLite.delayedCall(0.9,losser.afterHp,[hp.loseNowHp]);
         TweenLite.delayedCall(0.5,skillAct,[losser]);
         TweenLite.delayedCall(0.9,winner.afterHp,[hp.winNowHp]);
         TweenLite.delayedCall(2,oneFightOver);
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         _isDispose = true;
         if(bgBack)
         {
            bgBack.dispose();
         }
         var _loc3_:int = 0;
         var _loc2_:* = selfArr;
         for each(_loc1_ in selfArr)
         {
            _loc1_.dispose();
         }
         var _loc5_:int = 0;
         var _loc4_:* = enemyArr;
         for each(_loc1_ in enemyArr)
         {
            _loc1_.dispose();
         }
         sceneLayer3D.dispose();
         layer3D.dispose();
         DisplayUtils.removeSelf(this);
      }
   }
}
