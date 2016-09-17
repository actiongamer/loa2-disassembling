package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import org.specter3d.display.Specter3D;
   import com.mz.core.utils.MathUtil;
   import com.greensock.TweenLite;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import com.mz.core.utils2.ShakeUtil;
   import nslm2.common.scene.multiLayer.BgLayer;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   
   public class MapEffect_RainOfFire extends BgLayerCtrlBase
   {
      
      public static const effId:int = 301;
       
      
      private var box:Specter3D;
      
      public function MapEffect_RainOfFire(param1:BgLayer)
      {
         super(param1,null);
         box = new Specter3D();
         this.bgLayer.addChild(new Specter3D());
         box.rotationX = 20;
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(301)).addCompleteHandler(onLoop).exec();
      }
      
      private function onLoop() : void
      {
         var _loc1_:int = MathUtil.randomInt(1,1);
         while(true)
         {
            _loc1_--;
            if(!_loc1_)
            {
               break;
            }
            TweenLite.delayedCall(MathUtil.random(0.8,0),this.fire);
         }
         TweenLite.delayedCall(MathUtil.random(3.6,1.6),this.onLoop);
      }
      
      private function fire() : void
      {
         var _loc1_:* = null;
         if(this.isBattling && configVo.battling == 0)
         {
            return;
         }
         var _loc2_:SpecterEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(301),true,box,null,0,true,1);
         _loc2_.rotationY = 90;
         _loc2_.x = MathUtil.random(500,-500);
         _loc2_.y = MathUtil.random(0,-500);
         if(configVo.shake == 1)
         {
            _loc1_ = StcMgr.ins.getSpecialEffectVo(301);
            TweenLite.delayedCall(_loc1_.over_time / 1000,this.shake);
         }
      }
      
      public function shake() : void
      {
         ShakeUtil.shake(false,this.bgLayer.multiBg,0,6,15,40);
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(onLoop);
         TweenLite.killDelayedCallsTo(fire);
         TweenLite.killDelayedCallsTo(shake);
         box.dispose();
         super.dispose();
      }
   }
}
