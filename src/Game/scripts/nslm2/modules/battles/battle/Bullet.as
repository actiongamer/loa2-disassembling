package nslm2.modules.battles.battle
{
   import org.specter3d.display.particle.SpecterEffect;
   import com.greensock.TweenMax;
   import away3d.containers.ObjectContainer3D;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import flash.geom.Vector3D;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import away3d.entities.BoneTag;
   import com.greensock.easing.Linear;
   
   public class Bullet extends GameObject
   {
       
      
      protected var _avatarBody:SpecterEffect;
      
      private var bulletOffY:int = 70;
      
      protected var _tw:TweenMax;
      
      protected var _container:ObjectContainer3D;
      
      public function Bullet()
      {
         super();
      }
      
      public function init(param1:Player, param2:Player, param3:Object) : void
      {
         var _loc5_:int = param3.dur;
         var _loc6_:int = param3.name;
         var _loc4_:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(_loc6_);
         flyToSomeWhere(_loc4_,param1,param2,_loc5_);
      }
      
      protected function flyToSomeWhere(param1:StcSpecialEffectVo, param2:Player, param3:Player, param4:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Vector3D = param2.avatarBody.getBoneTagByName(param1.tag).scenePosition;
         var _loc8_:Boolean = param2.isAttack;
         _container = new ObjectContainer3D();
         _avatarBody = EffectManager.createEffect(UrlLib.e3d_particle(param1.effect),true,_container,null,0,true);
         _avatarBody.playSpeed = FPUtil.playSpeed();
         _avatarBody.scale(1.5);
         gm.rootLayer.addChild(_container);
         _avatarBody.rotationX = -90;
         _container.position = _loc7_;
         if(param3.isBoss())
         {
            _loc5_ = param3.avatarBody.getBoneTagByName("Bip01");
         }
         else
         {
            _loc5_ = param3.avatarBody.getBoneTagByName("Bip01 Spine1");
         }
         if(_loc5_ == null)
         {
            _loc5_ = param3.avatarBody.getBoneTagByName("body");
         }
         if(_loc5_ == null)
         {
            _loc6_ = param3.avatarBody.scenePosition;
         }
         else
         {
            _loc6_ = _loc5_.scenePosition;
         }
         _container.lookAt(_loc6_);
         _tw = TweenMax.to(_container,FPUtil.fixFrame(param4),{
            "x":_loc6_.x,
            "z":_loc6_.z,
            "y":_loc6_.y,
            "useFrames":false,
            "onComplete":_complete,
            "ease":Linear.easeNone
         });
      }
      
      override public function setFreeze(param1:Boolean) : void
      {
         super.setFreeze(param1);
         if(_isFreeze)
         {
            if(_tw && _tw.isActive())
            {
               _tw.paused(true);
            }
            if(_avatarBody)
            {
               _avatarBody.addMethod(FPUtil.getDarkMethod());
               _avatarBody.playSpeed = 0;
            }
         }
         else
         {
            if(_tw)
            {
               _tw.paused(false);
            }
            if(_avatarBody)
            {
               _avatarBody.removeMethod(FPUtil.getDarkMethod());
               _avatarBody.playSpeed = FPUtil.playSpeed();
            }
         }
      }
      
      override public function startup() : void
      {
         super.startup();
      }
      
      protected function _complete() : void
      {
         shutdown();
      }
      
      override public function shutdown() : void
      {
         if(_avatarBody)
         {
            _avatarBody.dispose();
         }
         if(_container)
         {
            _container.dispose();
         }
         _avatarBody = null;
         super.shutdown();
      }
   }
}
