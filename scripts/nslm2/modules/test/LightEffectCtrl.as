package nslm2.modules.test
{
   import flash.geom.Point;
   import away3d.containers.ObjectContainer3D;
   import com.greensock.TweenLite;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import org.specter3d.display.particle.SpecterEffect;
   import com.mz.core.utils.MathUtil;
   
   public class LightEffectCtrl
   {
      
      public static const effId:int = 1182;
       
      
      public var center:Point;
      
      public var range:Point;
      
      public var speed:int = 150;
      
      public var frequently:int = 120;
      
      private var box:ObjectContainer3D;
      
      public var use3D:Boolean = false;
      
      public function LightEffectCtrl(param1:ObjectContainer3D)
      {
         center = new Point(0,0);
         range = new Point(750,500);
         super();
         this.box = param1;
      }
      
      public function start() : void
      {
         createLight();
      }
      
      public function stop() : void
      {
         TweenLite.killDelayedCallsTo(this.createLight);
      }
      
      private function createLight() : void
      {
         var _loc1_:SpecterEffect = EffectManager.createEffect(UrlLib.e3d_particle(StcMgr.ins.getSpecialEffectVo(1182).effect),true,box);
         _loc1_.x = MathUtil.randomRadii(center.x,range.x);
         if(use3D)
         {
            _loc1_.z = MathUtil.randomRadii(center.y,range.y);
         }
         else
         {
            _loc1_.y = MathUtil.randomRadii(center.y,range.y);
         }
         TweenLite.delayedCall(MathUtil.randomRadii(speed / 1000,frequently / 1000),createLight);
      }
   }
}
