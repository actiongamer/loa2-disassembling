package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import flash.geom.Vector3D;
   import away3d.containers.ObjectContainer3D;
   import flash.geom.Point;
   import org.specter3d.display.particle.SpecterEffect;
   import flash.events.Event;
   import nslm2.modules.battles.battle.FPUtil;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.fightPlayer.PosConts;
   import nslm2.utils.TransformUtil;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class EffTarget extends ShowBase
   {
       
      
      public function EffTarget()
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
            delete caster.selfEffDic[_loc3_];
            if(param.hasOwnProperty("freeze") && param["freeze"] == 1)
            {
               toTarget.avatarBody.playbackSpeed = FPUtil.playSpeed();
            }
         };
         if(GameObjectManager.effectOff)
         {
            return;
         }
         var spEffectVo:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(int(param.name));
         if(spEffectVo == null)
         {
            return;
         }
         var bodyScale:Number = 1;
         if(caster.tarId >= 0 && caster.tarId <= 8)
         {
            var pp:Point = PosConts.oriXY(caster.tarId,caster.isAttack == 1,gm.vo.isBoss);
            var pos:Vector3D = TransformUtil.fight2Dto3D(pp.x,pp.y);
            var container:ObjectContainer3D = gm.fightLayer;
            bodyScale = caster.avatarBody.scaleAll;
         }
         else
         {
            var toTarget:Player = gm.getPlayerId(caster.tarId);
            if(toTarget == null)
            {
               return;
            }
            if(spEffectVo.tag != "" && spEffectVo.tag != "0")
            {
               var bone:ObjectContainer3D = toTarget.avatarBody.getBoneTagByName(spEffectVo.tag);
            }
            if(param.hasOwnProperty("freeze") && param["freeze"] == 1)
            {
               toTarget.avatarBody.playbackSpeed = 0;
            }
            pos = !!bone?bone.scenePosition:toTarget.avatarBody.scenePosition;
            container = gm.rootLayer;
            bodyScale = toTarget.avatarBody.scaleAll;
         }
         var effectBody:SpecterEffect = EffectManager.createEffect(UrlLib.e3d_particle(spEffectVo.effect),true,container,null,FPUtil.overTime(spEffectVo.over_time),true,1,"default_group");
         var voScale:Number = spEffectVo.scale <= 0?1:Number(spEffectVo.scale);
         effectBody.scale(Math.abs(bodyScale) * voScale);
         effectBody.rotationY = caster.isAttack == 1?-90:90;
         effectBody.playSpeed = FPUtil.playSpeed();
         effectBody.position = pos;
         caster.selfEffDic[effectBody] = effectBody;
         effectBody.addEventListener("removed",onComp);
         if(param.hasOwnProperty("rotationX"))
         {
            effectBody.rotationX = param.rotationX;
         }
         if(param.hasOwnProperty("rotationY"))
         {
            effectBody.rotationY = caster.isAttack == 1?-param.rotationY:param.rotationY;
         }
         if(param.hasOwnProperty("rotationZ"))
         {
            effectBody.rotationZ = param.rotationZ;
         }
         if(param.hasOwnProperty("x"))
         {
            if(caster.isAttack)
            {
               effectBody.x = pos.x + param.x;
            }
            else
            {
               effectBody.x = pos.x - param.x;
            }
         }
         if(param.hasOwnProperty("y"))
         {
            effectBody.y = pos.y + param.y;
         }
         if(param.hasOwnProperty("z"))
         {
            effectBody.z = pos.z + param.z;
         }
      }
   }
}
