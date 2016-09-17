package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.display.particle.SpecterEffect;
   import flash.events.Event;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.battle.FPUtil;
   
   public class EffSelf extends ShowBase
   {
       
      
      public function EffSelf()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         caster = param1;
         param = param2;
         onComp = function(param1:Event):void
         {
            param1.currentTarget.removeEventListener(param1.type,arguments.callee);
            var _loc3_:SpecterEffect = param1.currentTarget as SpecterEffect;
         };
         if(GameObjectManager.effectOff)
         {
            return;
         }
         var spEffectVo:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(int(param.name));
         if(spEffectVo)
         {
            var container:ObjectContainer3D = caster.avatarBody.avatarMesh;
            if(spEffectVo.tag != "" && spEffectVo.tag != "0")
            {
               container = caster.avatarBody.getBoneTagByName(spEffectVo.tag);
            }
            var effectBody:SpecterEffect = EffectManager.createEffect(UrlLib.e3d_particle(spEffectVo.effect),true,container,null,FPUtil.overTime(spEffectVo.over_time),true,1,"default_group");
            var loop:Boolean = false;
            if(param.hasOwnProperty("loop"))
            {
               loop = param.loop;
            }
            if(param.hasOwnProperty("scale"))
            {
               effectBody.scaleAll = param.scale;
            }
            if(param.hasOwnProperty("x"))
            {
               if(caster.isAttack)
               {
                  effectBody.x = param.x;
               }
               else
               {
                  effectBody.x = -param.x;
               }
            }
            if(param.hasOwnProperty("y"))
            {
               effectBody.y = param.y;
            }
            if(param.hasOwnProperty("z"))
            {
               effectBody.z = param.z;
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
            if(!loop)
            {
               effectBody.addEventListener("removed",onComp);
               caster.selfEffDic[effectBody] = effectBody;
            }
            else
            {
               caster.selfEffDic[effectBody] = 1;
            }
            effectBody.playSpeed = FPUtil.playSpeed();
         }
      }
   }
}
