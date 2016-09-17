package nslm2.modules.funnies.pkCrossSer
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IDispose;
   import away3d.containers.ObjectContainer3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.utils.TransformUtil;
   import nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
   import com.mz.core.configs.ClientConfig;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.events.Event;
   import proto.CrossArenaEnemyInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import com.netease.protobuf.UInt64;
   import flash.geom.Point;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.utils.Uint64Util;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.mgrs.UIMgr;
   
   public class PKCrossScene3D extends Sprite implements IDispose
   {
       
      
      public var layer3D:ObjectContainer3D;
      
      public var sceneLayer3D:ObjectContainer3D;
      
      public var bgBack:TileImg;
      
      public var bgFront:TileImg;
      
      public var enemyAvatars:Vector.<nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D>;
      
      public var player3D:nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D;
      
      private var _isUp:Boolean = false;
      
      private var _cmpFunc:Function;
      
      public function PKCrossScene3D()
      {
         super();
         layer3D = new ObjectContainer3D();
         sceneLayer3D = new ObjectContainer3D();
         UIMgr.root3D.addChild(layer3D);
         layer3D.addChild(sceneLayer3D);
      }
      
      public function init() : void
      {
         TransformUtil.cameraToSceneBattle();
         createBg(9003);
      }
      
      public function setAllUnitVisibleFalse() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = enemyAvatars[_loc2_];
            _loc1_.visible = false;
            _loc2_++;
         }
      }
      
      private function createBg(param1:int) : void
      {
         var _loc2_:BgTileImgConfigVo = new BgTileImgConfigVo();
         _loc2_.needLoadConfigXML = true;
         _loc2_.mapId = param1;
         _loc2_.id = 101;
         bgBack = new TileImg(_loc2_);
         bgBack.z = -1;
         bgBack.x = -ClientConfig.SCENE_BG_W >> 1;
         bgBack.y = (ClientConfig.SCENE_BG_H >> 1) + 100;
         sceneLayer3D.addChild(bgBack);
         bgBack.loadTileAll();
         _loc2_ = new BgTileImgConfigVo();
         _loc2_.needLoadConfigXML = true;
         _loc2_.mapId = param1;
         _loc2_.id = 102;
         bgFront = new TileImg(_loc2_);
         bgFront.z = -2;
         bgFront.x = -ClientConfig.SCENE_BG_W >> 1;
         bgFront.y = 0;
         sceneLayer3D.addChild(bgFront);
         bgFront.loadTileAll();
      }
      
      public function elevatorUp(param1:Function) : void
      {
         if(_isUp)
         {
            return;
         }
         _isUp = true;
         _cmpFunc = param1;
         var _loc2_:Number = bgBack.configVo.oriHeight / 2;
         bgBack.repeatStartY = 0;
         TweenLite.to(this.bgBack,1.5,{
            "repeatStartY":_loc2_,
            "ease":Linear.easeNone,
            "onComplete":onElevatorCmp
         });
      }
      
      private function unit_clickHandler(param1:Event) : void
      {
         var _loc2_:CrossArenaEnemyInfo = (param1.currentTarget as nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D).arenaPlayer;
         if(_loc2_)
         {
            ObserverMgr.ins.sendNotice("OPT_START_CHALLENGE",_loc2_);
         }
      }
      
      public function runTo(param1:UInt64, param2:Function) : void
      {
         var _loc4_:nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D = findUnit3D(param1);
         var _loc3_:Point = _loc4_.pos2d;
         this.player3D.moveSpeed = 450;
         this.player3D.runTo(_loc3_.x,_loc3_.y,param2);
      }
      
      public function initAvatars() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(!enemyAvatars)
         {
            enemyAvatars = new Vector.<nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D>();
         }
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = new nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D(layer3D);
            layer3D.addChild(_loc1_);
            _loc1_.pos2d = PKCrossConst.POS_ARR[_loc2_];
            _loc1_.z = -200;
            _loc1_.rotationY = PKCrossConst.POS_RO[_loc2_];
            _loc1_.addEventListener("unitMouseClick",unit_clickHandler);
            enemyAvatars.push(_loc1_);
            _loc2_++;
         }
         player3D = new nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D(this.layer3D);
         player3D.overMethodEnabled = false;
         player3D.buttonMode = false;
         PlayerModel.ins.changePlayerViewByPlayerInfo(player3D,PlayerModel.ins.playerInfo);
         if(HorseService.ins.curHorseId)
         {
            player3D.initStcHorseId(HorseService.ins.curHorseId);
         }
         resetPos();
      }
      
      public function changeEnemies(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = Math.min(param1.length,enemyAvatars.length);
         param1.sort(sortByPower);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.enemyAvatars[_loc3_].initByArenaPlayer(param1[_loc3_]);
            this.enemyAvatars[_loc3_].visible = true;
            _loc3_++;
         }
      }
      
      public function reNewAvatar() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = enemyAvatars;
         for each(var _loc1_ in enemyAvatars)
         {
            _loc1_.dispose();
         }
         enemyAvatars.length = 0;
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            _loc2_ = new nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D(layer3D);
            layer3D.addChild(_loc2_);
            _loc2_.pos2d = PKCrossConst.POS_ARR[_loc3_];
            _loc2_.z = -200;
            _loc2_.rotationY = PKCrossConst.POS_RO[_loc3_];
            _loc2_.addEventListener("unitMouseClick",unit_clickHandler);
            enemyAvatars.push(_loc2_);
            _loc3_++;
         }
      }
      
      private function sortByPower(param1:CrossArenaEnemyInfo, param2:CrossArenaEnemyInfo) : int
      {
         var _loc3_:int = Uint64Util.compare(param1.baseInfo.ability,param2.baseInfo.ability);
         if(_loc3_ == 0)
         {
            return Uint64Util.compare(param1.baseInfo.id,param2.baseInfo.id);
         }
         return _loc3_;
      }
      
      public function resetPos() : void
      {
         player3D.pos2d = new Point(0,-400);
         player3D.rotationY = 180;
         player3D.z = -800;
      }
      
      public function findUnit3D(param1:UInt64) : nslm2.modules.funnies.pkCrossSer.PKCrossUnit3D
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            _loc2_ = enemyAvatars[_loc3_];
            if(Uint64Util.equal(_loc2_.arenaPlayer.baseInfo.id,param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function playRebornAni() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = new BmcSpriteSheet();
            _loc1_.x = PKCrossConst.POS_ARR[_loc2_].x + UIMgr.gameWidth / 2 - 81;
            _loc1_.y = -PKCrossConst.POS_ARR[_loc2_].y + 273;
            _loc1_.init(50200001);
            this.addChild(_loc1_);
            _loc2_++;
         }
      }
      
      private function onElevatorCmp() : void
      {
         _isUp = false;
         if(_cmpFunc is Function)
         {
            _cmpFunc();
         }
      }
      
      public function dispose() : void
      {
         _isUp = false;
         if(bgBack)
         {
            bgBack.dispose();
         }
         if(bgFront)
         {
            bgFront.dispose();
         }
         if(player3D)
         {
            player3D.dispose();
         }
         var _loc3_:int = 0;
         var _loc2_:* = enemyAvatars;
         for each(var _loc1_ in enemyAvatars)
         {
            _loc1_.dispose();
         }
         sceneLayer3D.dispose();
         layer3D.dispose();
      }
   }
}
