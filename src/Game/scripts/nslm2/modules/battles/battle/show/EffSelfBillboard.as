package nslm2.modules.battles.battle.show
{
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.modules.battles.battle.Player;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.events.Event;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.battle.FPUtil;
   import flash.geom.Vector3D;
   import away3d.entities.Entity;
   
   public class EffSelfBillboard extends ShowBase
   {
       
      
      private var bone:ObjectContainer3D;
      
      private var effectBody:SpecterEffect;
      
      public function EffSelfBillboard()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         caster = param1;
         param = param2;
         if(GameObjectManager.effectOff)
         {
            return;
         }
         var spEffectVo:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(param.name);
         if(spEffectVo)
         {
            onComp = function(param1:Event):void
            {
               App.stage.removeEventListener("enterFrame",onEF);
               param1.currentTarget.removeEventListener(param1.type,arguments.callee);
               var _loc3_:SpecterEffect = param1.currentTarget as SpecterEffect;
            };
            if(spEffectVo.tag != "" && spEffectVo.tag != "0")
            {
               bone = caster.avatarBody.getBoneTagByName(spEffectVo.tag);
            }
            var container:ObjectContainer3D = gm.rootLayer;
            effectBody = EffectManager.createEffect(UrlLib.e3d_particle(spEffectVo.effect),true,container,null,FPUtil.overTime(spEffectVo.over_time),true,1,"default_group");
            effectBody.scale(Math.abs(caster.avatarBody.scaleAll));
            effectBody.rotationY = caster.isAttack == 1?-90:90;
            effectBody.scaleX = caster.isAttack == 1?-effectBody.scaleX:Number(effectBody.scaleX);
            effectBody.playSpeed = FPUtil.playSpeed();
            effectBody.position = !!bone?bone.scenePosition:caster.avatarBody.scenePosition;
            if(param.hasOwnProperty("topLayer") && param.topLayer)
            {
               effectBody.renderLayer = Entity.TOP_LAYER;
            }
            if(param.hasOwnProperty("offsetX"))
            {
               if(caster.isAttack == 1)
               {
                  effectBody.x = effectBody.x + param.offsetX;
               }
               else
               {
                  effectBody.x = effectBody.x + -param.offsetX;
               }
            }
            if(param.hasOwnProperty("rotationX"))
            {
               effectBody.rotationX = param.rotationX;
            }
            if(param.hasOwnProperty("rotationY"))
            {
               effectBody.rotationY = param.rotationY;
            }
            if(param.hasOwnProperty("rotationZ"))
            {
               effectBody.rotationZ = param.rotationZ;
            }
            caster.selfEffDic[effectBody] = effectBody;
            effectBody.addEventListener("removed",onComp);
            App.stage.addEventListener("enterFrame",onEF);
         }
      }
      
      protected function onEF(param1:Event) : void
      {
         if(bone)
         {
            effectBody.position = bone.scenePosition;
         }
      }
   }
}
