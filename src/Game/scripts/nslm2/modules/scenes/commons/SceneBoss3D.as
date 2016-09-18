package nslm2.modules.scenes.commons
{
   import away3d.containers.ObjectContainer3D;
   import com.greensock.TweenLite;
   import org.specter3d.events.Avatar3DEvent;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.greensock.easing.Cubic;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import org.specter3d.display.particle.SpecterEffect;
   import com.mz.core.utils2.ShakeUtil;
   import com.mz.core.mgrs.UIMgr;
   import away3d.events.AnimatorEvent;
   
   public class SceneBoss3D extends SceneUnit3D
   {
       
      
      private var isFadeOut:Boolean = false;
      
      public var shakeLayer3D:ObjectContainer3D;
      
      public var startTimer:int;
      
      public var delay:Number;
      
      public function SceneBoss3D(param1:ObjectContainer3D, param2:Number)
      {
         this.actStd = "std1";
         this.startTimer = TimerManager.ins.currTimer;
         this.delay = param2;
         super(param1);
      }
      
      public function fadeOut() : void
      {
         isFadeOut = true;
         TweenLite.killTweensOf(this.avatar);
         TweenLite.to(this.avatar,0.3,{
            "y":avatar.y + 1500,
            "onComplete":this.fadeOutCpl
         });
      }
      
      private function fadeOutCpl() : void
      {
         this.dispose();
      }
      
      override protected function avatarAsset_onCpl(param1:Avatar3DEvent) : void
      {
         if(this.isDispose || this.isFadeOut)
         {
            return;
         }
         super.avatarAsset_onCpl(param1);
         var _loc2_:* = Number(this.delay);
         _loc2_ = Number(_loc2_ - (TimerManager.ins.currTimer - startTimer) / 1000);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         TweenLite.delayedCall(0.3 + _loc2_,showEff);
         TweenLite.from(this.avatar,0.3,{
            "delay":_loc2_ + 0.2,
            "y":avatar.y + 1500,
            "onComplete":this.fadeInCpl,
            "ease":Cubic.easeOut
         });
      }
      
      private function showEff() : void
      {
         if(this.isDispose || this.isFadeOut)
         {
            return;
         }
         var _loc1_:SpecterEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(13000),true,this.avatar,eff_playCpl);
         _loc1_.scaleAll = 1.6;
      }
      
      private function fadeInCpl() : void
      {
         if(this.isDispose || this.isFadeOut)
         {
            return;
         }
         ShakeUtil.shake(false,this.shakeLayer3D,0,8,16,50);
         ShakeUtil.shake(true,UIMgr.layer2D,0,8,16,50);
      }
      
      override protected function onAnimatorComplete(param1:AnimatorEvent) : void
      {
         if(this.action == "skill_1")
         {
            this.action = "std_3";
         }
      }
      
      private function eff_playCpl(param1:SpecterEffect) : void
      {
      }
   }
}
