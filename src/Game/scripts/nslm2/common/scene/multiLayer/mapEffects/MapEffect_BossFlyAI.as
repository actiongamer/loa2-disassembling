package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.events.Event;
   import com.mz.core.utils.MathUtil;
   import com.greensock.TweenLite;
   import nslm2.common.scene.multiLayer.BgLayer;
   import flash.geom.Point;
   
   public class MapEffect_BossFlyAI extends BgLayerCtrlBase
   {
       
      
      private var unit:Unit3DBase;
      
      public function MapEffect_BossFlyAI(param1:BgLayer)
      {
         super(param1,null);
         unit = new Unit3DBase();
         unit.actStd = "std_2";
         unit.useDefaultAvatar = false;
         unit.useShadow = false;
         unit.initByStcNpcId(100010);
         unit.avatar.scaleAll = 1;
         this.bgLayer.addChild(unit);
         unit.pos2d = new Point(-2000,0);
         unit.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
      }
      
      private function avatarAsset_onCpl(param1:Event) : void
      {
         runRandom();
      }
      
      public function runRandom() : void
      {
         if(isDisposed)
         {
            return;
         }
         if(this.isBattling && configVo.battling == 0)
         {
            unit.runTo(2000,150,dispose);
         }
         else
         {
            unit.runTo(MathUtil.random(-700,400),MathUtil.random(0,150),runRandom2);
         }
      }
      
      private function runRandom2() : void
      {
         if(isDisposed)
         {
            return;
         }
         if(this.isBattling && configVo.battling == 0)
         {
            unit.runTo(2000,150,dispose);
         }
         else
         {
            if(unit.x > 0)
            {
               unit.setRotation(MathUtil.random(-90,-120),true);
            }
            else
            {
               unit.setRotation(MathUtil.random(-90,-60),true);
            }
            TweenLite.delayedCall(MathUtil.randomRadii(2,1),this.runRandom);
         }
      }
      
      override public function dispose() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         unit.removeEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         unit.dispose();
         super.dispose();
      }
   }
}
