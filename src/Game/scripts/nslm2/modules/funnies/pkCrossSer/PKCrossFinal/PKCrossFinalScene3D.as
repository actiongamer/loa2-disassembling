package nslm2.modules.funnies.pkCrossSer.PKCrossFinal
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IDispose;
   import away3d.containers.ObjectContainer3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.utils.TransformUtil;
   import nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
   import com.mz.core.configs.ClientConfig;
   import game.ui.pkCrossSer.PKCrossFinalPosUI;
   import proto.CrossArenaFinalEnemyInfo;
   import flash.events.Event;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.mgrs.UIMgr;
   
   public class PKCrossFinalScene3D extends Sprite implements IDispose
   {
       
      
      public var layer3D:ObjectContainer3D;
      
      public var sceneLayer3D:ObjectContainer3D;
      
      public var bgBack:TileImg;
      
      public var enemyAvatars:Vector.<nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalUnit3D>;
      
      public function PKCrossFinalScene3D()
      {
         super();
         layer3D = new ObjectContainer3D();
         sceneLayer3D = new ObjectContainer3D();
         UIMgr.root3D.addChild(layer3D);
         layer3D.addChild(sceneLayer3D);
      }
      
      public function init() : void
      {
         TransformUtil.cameraToScene45();
         createBg(35000);
      }
      
      private function createBg(param1:int) : void
      {
         var _loc2_:BgTileImgConfigVo = new BgTileImgConfigVo();
         _loc2_.needLoadConfigXML = true;
         _loc2_.mapId = param1;
         _loc2_.id = 102;
         bgBack = new TileImg(_loc2_);
         bgBack.z = 500;
         bgBack.x = -ClientConfig.SCENE_BG_W;
         bgBack.y = (ClientConfig.SCENE_BG_H >> 1) - 150;
         sceneLayer3D.addChild(bgBack);
         bgBack.loadTileAll();
      }
      
      public function initAvatars() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(!enemyAvatars)
         {
            enemyAvatars = new Vector.<nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalUnit3D>();
         }
         var _loc1_:PKCrossFinalPosUI = new PKCrossFinalPosUI();
         _loc3_ = 0;
         while(_loc3_ < 8)
         {
            _loc2_ = new nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalUnit3D(layer3D);
            layer3D.addChild(_loc2_);
            _loc2_.x = _loc1_["pos" + _loc3_].x;
            _loc2_.z = -_loc1_["pos" + _loc3_].y;
            _loc2_.y = 0;
            _loc2_.parent2D = this;
            _loc2_.rotationY = 20;
            _loc2_.addEventListener("unitMouseClick",unit_clickHandler);
            enemyAvatars.push(_loc2_);
            _loc3_++;
         }
      }
      
      public function changeEnemies(param1:Array) : void
      {
         var _loc3_:int = 0;
         param1.sort(sortByRank);
         var _loc2_:int = Math.min(param1.length,enemyAvatars.length);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.enemyAvatars[_loc3_].initByArenaPlayer(param1[_loc3_]);
            this.enemyAvatars[_loc3_].visible = true;
            _loc3_++;
         }
      }
      
      private function sortByRank(param1:CrossArenaFinalEnemyInfo, param2:CrossArenaFinalEnemyInfo) : int
      {
         if(param1.rank < param2.rank)
         {
            return -1;
         }
         if(param1.rank > param2.rank)
         {
            return 1;
         }
         return 0;
      }
      
      private function unit_clickHandler(param1:Event) : void
      {
         if(!PKCrossModel.ins.isFinalFighter)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50600037));
            return;
         }
         var _loc2_:CrossArenaFinalEnemyInfo = (param1.currentTarget as nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalUnit3D).arenaPlayer;
         if(_loc2_)
         {
            ObserverMgr.ins.sendNotice("OPT_FINAL_START_CHALLENGE",_loc2_);
         }
      }
      
      public function dispose() : void
      {
         if(bgBack)
         {
            bgBack.dispose();
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
