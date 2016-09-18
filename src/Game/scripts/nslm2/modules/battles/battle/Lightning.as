package nslm2.modules.battles.battle
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import flash.geom.Vector3D;
   import away3d.entities.BoneTag;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenMax;
   
   public class Lightning extends Bullet
   {
       
      
      public function Lightning()
      {
         super();
      }
      
      override public function init(param1:Player, param2:Player, param3:Object) : void
      {
         var _loc6_:int = param3.dur;
         var _loc7_:int = param3.name;
         var _loc4_:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(_loc7_);
         var _loc5_:Vector3D = getPos(param1,_loc4_.tag);
         flyToSomeWhere2(_loc4_,_loc5_,param2,param1.isAttack,_loc6_);
      }
      
      private function getPos(param1:Player, param2:String = "Bip01 Spine1") : Vector3D
      {
         var _loc4_:* = null;
         var _loc3_:BoneTag = param1.avatarBody.getBoneTagByName(param2);
         if(_loc3_ == null)
         {
            _loc3_ = param1.avatarBody.getBoneTagByName("Bip01 Spine1");
         }
         if(_loc3_ == null)
         {
            _loc4_ = new Vector3D(0,0,0);
         }
         else
         {
            _loc4_ = _loc3_.scenePosition;
         }
         return _loc4_;
      }
      
      protected function flyToSomeWhere2(param1:StcSpecialEffectVo, param2:Vector3D, param3:Player, param4:Boolean, param5:int) : void
      {
         _container = new ObjectContainer3D();
         _avatarBody = EffectManager.createEffect(UrlLib.e3d_particle(param1.effect),true,_container,null,0,true);
         gm.rootLayer.addChild(_container);
         _avatarBody.rotationX = -90;
         var _loc7_:Vector3D = getPos(param3,param1.tag);
         _container.position = _loc7_;
         _container.lookAt(param2);
         var _loc6_:Number = Vector3D.distance(param2,_loc7_);
         _container.scaleZ = _loc6_ / 192;
         _tw = TweenMax.delayedCall(FPUtil.fixFrame(param5),_complete,null,false);
      }
   }
}
