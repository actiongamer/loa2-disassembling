package nslm2.modules.funnies.guildPKCrossSer
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IDispose;
   import away3d.containers.ObjectContainer3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.utils.TransformUtil;
   import nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
   import com.mz.core.configs.ClientConfig;
   import morn.customs.components.Placeholder;
   import flash.geom.Point;
   import flash.events.Event;
   import proto.FamilyExpeEnemyInfo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.mgrs.UIMgr;
   
   public class GPKScene3D extends Sprite implements IDispose
   {
       
      
      public var layer3D:ObjectContainer3D;
      
      public var sceneLayer3D:ObjectContainer3D;
      
      public var bgBack:TileImg;
      
      public var enemyAvatars:Vector.<nslm2.modules.funnies.guildPKCrossSer.GPKUnit3D>;
      
      public function GPKScene3D()
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
         createBg(703);
      }
      
      private function createBg(param1:int) : void
      {
         var _loc2_:BgTileImgConfigVo = new BgTileImgConfigVo();
         _loc2_.needLoadConfigXML = true;
         _loc2_.mapId = param1;
         _loc2_.id = 102;
         bgBack = new TileImg(_loc2_);
         bgBack.z = -1;
         bgBack.x = -ClientConfig.SCENE_BG_W;
         bgBack.y = ClientConfig.SCENE_BG_H >> 1;
         sceneLayer3D.addChild(bgBack);
         bgBack.loadTileAll();
      }
      
      public function initAvatars(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!enemyAvatars)
         {
            enemyAvatars = new Vector.<nslm2.modules.funnies.guildPKCrossSer.GPKUnit3D>();
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc2_ = new nslm2.modules.funnies.guildPKCrossSer.GPKUnit3D(layer3D);
               layer3D.addChild(_loc2_);
               _loc3_ = param1[_loc4_] as Placeholder;
               _loc2_.pos2d = new Point(_loc3_.x,_loc3_.y);
               _loc2_.z = GPKConst.posZ[_loc4_];
               _loc2_.rotationY = 35;
               _loc2_.addEventListener("unitMouseClick",unit_clickHandler);
               enemyAvatars.push(_loc2_);
               _loc4_++;
            }
         }
      }
      
      public function changeEnemies(param1:Array, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         _loc4_ = 0;
         var _loc3_:int = Math.min(param1.length,enemyAvatars.length);
         _loc4_ = 0;
         while(_loc4_ < 6)
         {
            this.enemyAvatars[_loc4_].visible = false;
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.enemyAvatars[_loc4_].initByArenaPlayer(param1[_loc4_]);
            this.enemyAvatars[_loc4_].visible = true;
            if(param2)
            {
               this.enemyAvatars[_loc4_].playBornEff();
            }
            _loc4_++;
         }
      }
      
      private function unit_clickHandler(param1:Event) : void
      {
         e = param1;
         var $player:FamilyExpeEnemyInfo = (e.currentTarget as nslm2.modules.funnies.guildPKCrossSer.GPKUnit3D).arenaPlayer;
         if($player)
         {
            if($player.hpPercent == 0)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(999902571),function():void
               {
                  ObserverMgr.ins.sendNotice("GPK_OPT_FIGHT",$player);
               });
            }
            else
            {
               ObserverMgr.ins.sendNotice("GPK_OPT_FIGHT",$player);
            }
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
