package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import flash.geom.Vector3D;
   import flash.geom.Point;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.display.particle.SpecterEffect;
   import flash.events.Event;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.fightPlayer.PosConts;
   import nslm2.utils.TransformUtil;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.battle.FPUtil;
   
   public class EffV extends ShowBase
   {
       
      
      public function EffV()
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
         if(spEffectVo == null)
         {
            return;
         }
         var row:int = caster.tarId;
         var ind:int = 3 * row + 1;
         var dis:int = 0;
         if(param.hasOwnProperty("distance"))
         {
            dis = param.distance;
         }
         var pp:Point = PosConts.oriXY(ind,caster.isAttack != 1,gm.vo.isBoss);
         if(caster.isAttack)
         {
            pp.x = pp.x - dis;
         }
         else
         {
            pp.x = pp.x + dis;
         }
         if(param.hasOwnProperty("distanceY"))
         {
            pp.y = pp.y + param.distanceY;
         }
         var pos:Vector3D = TransformUtil.fight2Dto3D(pp.x,pp.y);
         var container:ObjectContainer3D = gm.fightLayer;
         var effectBody:SpecterEffect = EffectManager.createEffect(UrlLib.e3d_particle(spEffectVo.effect),true,container,null,FPUtil.overTime(spEffectVo.over_time),true,1,"default_group");
         effectBody.scale(Math.abs(caster.avatarBody.scaleAll));
         if(param.hasOwnProperty("rotationY"))
         {
            effectBody.rotationY = param.rotationY;
         }
         else
         {
            effectBody.rotationY = caster.isAttack == 1?-90:90;
         }
         effectBody.playSpeed = FPUtil.playSpeed();
         effectBody.position = pos;
         caster.selfEffDic[effectBody] = effectBody;
         effectBody.addEventListener("removed",onComp);
      }
   }
}
