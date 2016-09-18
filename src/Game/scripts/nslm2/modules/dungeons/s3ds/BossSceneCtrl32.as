package nslm2.modules.dungeons.s3ds
{
   import away3d.cameras.Camera3D;
   import nslm2.utils.TransformUtil;
   import nslm2.common.scene.multiLayer.BgLayer;
   import com.greensock.TweenLite;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.dungeons.ctrls.UnitEnterOriCtrl;
   import flash.geom.Vector3D;
   import nslm2.modules.dungeons.DungeonSceneModule;
   
   public class BossSceneCtrl32 extends BossSceneCtrlBase
   {
       
      
      private var scriptIsEnd:Boolean;
      
      private var playIsEnd:Boolean;
      
      public function BossSceneCtrl32(param1:DungeonSceneModule, param2:UnitView)
      {
         $dg = param1;
         $bossView = param2;
         super($dg,$bossView);
         this.dg.rightUnitViewHash.array.forEach(function(param1:UnitView, ... rest):void
         {
            param1.visible = false;
            param1.shadow.visible = false;
         });
      }
      
      public function get camera3d() : Camera3D
      {
         return dg.camera3d;
      }
      
      override public function exec() : void
      {
         super.exec();
         play();
      }
      
      private function play() : void
      {
         TransformUtil.cameraToBattlePerspective2();
         this.dg.dunGeonBgLayer.switchLayerKind(3);
         dg.validateBgBox(true);
         play10();
      }
      
      private function play10() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.dg.dunGeonBgLayer.bgLayers.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.dg.dunGeonBgLayer.bgLayers[_loc3_];
            if(_loc1_.configVo && _loc1_.configVo.kind == 3)
            {
               if(_loc1_.tileImg)
               {
                  TweenLite.to(_loc1_.tileImg,1,{
                     "delay":1,
                     "y":_loc1_.tileImg.y + ClientConfig.SCENE_BG_H - 50
                  });
               }
            }
            _loc3_++;
         }
         TweenLite.delayedCall(2,this.play11);
      }
      
      private function play11() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(isStop)
         {
            return;
         }
         this.dg.playScript(true,scriptPlayerEnd);
         this.makeAvatarAllToOriPos();
         var _loc3_:int = dg.unitViewHash.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = dg.unitViewHash.array[_loc4_];
            _loc2_.x = _loc2_.x - 600;
            _loc4_++;
         }
         var _loc1_:UnitEnterOriCtrl = new UnitEnterOriCtrl(this.dg,true,true,true);
         _loc1_.addHandlers(this.play2);
         _loc1_.exec();
         bossView.visible = true;
      }
      
      private function scriptPlayerEnd() : void
      {
         if(isStop)
         {
            return;
         }
         scriptIsEnd = true;
         validateNext();
      }
      
      private function play2() : void
      {
         if(isStop)
         {
            return;
         }
         playIsEnd = true;
         validateNext();
      }
      
      private function validateNext() : void
      {
         if(isStop)
         {
            return;
         }
         if(scriptIsEnd == false || playIsEnd == false)
         {
            return;
         }
         showAvatarAll();
         onComplete();
      }
      
      private function showAvatarAll() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(isStop)
         {
            return;
         }
         var _loc2_:int = dg.unitViewHash.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = dg.unitViewHash.array[_loc3_];
            _loc1_.visible = true;
            _loc3_++;
         }
         _loc2_ = dg.rightUnitViewHash.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = dg.rightUnitViewHash.array[_loc3_];
            _loc1_.visible = true;
            _loc3_++;
         }
      }
      
      private function makeAvatarAllToOriPos() : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:Number = NaN;
         var _loc4_:int = dg.unitViewHash.array.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = dg.unitViewHash.array[_loc5_];
            _loc3_.vo.init(true);
            _loc2_ = _loc3_.avatarBox.position;
            _loc3_.init();
            _loc1_ = _loc3_.avatarBody.scaleAll;
            _loc5_++;
         }
         _loc4_ = dg.rightUnitViewHash.array.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = dg.rightUnitViewHash.array[_loc5_];
            _loc3_.vo.init(true);
            _loc3_.init();
            _loc5_++;
         }
      }
   }
}
