package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.display.particle.SpecterEffect;
   import flash.geom.Point;
   import flash.events.Event;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.battle.FPUtil;
   import nslm2.modules.fightPlayer.PosConts;
   import com.mz.core.utils.MathUtil;
   
   public class EffPos extends ShowBase
   {
       
      
      public function EffPos()
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
            var container:ObjectContainer3D = gm.fightLayer;
            var effectBody:SpecterEffect = EffectManager.createEffect(UrlLib.e3d_particle(spEffectVo.effect),true,container,null,FPUtil.overTime(spEffectVo.over_time),true,1,"default_group");
            var voScale:Number = spEffectVo.scale <= 0?1:Number(spEffectVo.scale);
            effectBody.scale(voScale);
            effectBody.playSpeed = FPUtil.playSpeed();
            effectBody.rotationY = caster.isAttack == 1?-90:90;
            var oriPos:Point = PosConts.oriXY(4,caster.isAttack != 1,gm.vo.isBoss);
            if(param.hasOwnProperty("randX"))
            {
               if(caster.isAttack)
               {
                  effectBody.x = oriPos.x + MathUtil.randomInt(param.randX,-param.randX);
               }
               else
               {
                  effectBody.x = oriPos.x - MathUtil.randomInt(param.randX,-param.randX);
               }
               effectBody.z = oriPos.y + MathUtil.randomInt(param.randY,-param.randY);
            }
            else if(param.hasOwnProperty("x"))
            {
               if(caster.isAttack)
               {
                  effectBody.x = oriPos.x + param.x;
               }
               else
               {
                  effectBody.x = oriPos.x - param.x;
               }
               effectBody.z = oriPos.y + param.y;
            }
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
            var loop:Boolean = false;
            if(param.hasOwnProperty("loop"))
            {
               loop = param.loop;
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
         }
      }
   }
}
