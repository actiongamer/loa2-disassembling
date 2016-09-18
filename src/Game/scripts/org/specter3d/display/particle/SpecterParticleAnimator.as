package org.specter3d.display.particle
{
   import away3d.animators.ParticleAnimator;
   import org.specter3d.configs.particle.SpecterParticleData;
   import org.specter3d.display.particle.extend.ParticleAlphaState;
   import away3d.events.AnimatorEvent;
   import away3d.animators.ParticleAnimationSet;
   
   public class SpecterParticleAnimator extends ParticleAnimator
   {
      
      private static const GLOBAL:String = "ParticleAlphaGlobal";
       
      
      private var _pData:SpecterParticleData;
      
      private var _startTime:Number;
      
      private var _callbackOnEnterFrame:Function = null;
      
      private var _originalStartTime:Number;
      
      private var _originalEndTime:Number;
      
      private var _visible:Boolean;
      
      private var _alpha:Number;
      
      public function SpecterParticleAnimator(param1:ParticleAnimationSet, param2:SpecterParticleData)
      {
         super(param1);
         _pData = param2;
         _originalStartTime = (_pData.minStartTime + _pData.delay) * 1000;
         _originalEndTime = (_pData.delay + _pData.maxStartTime + _pData.maxDuration) * 1000;
      }
      
      public function set callbackOnEnterFrame(param1:Function) : void
      {
         _callbackOnEnterFrame = param1;
      }
      
      public function updateAlpha(param1:Number) : void
      {
         if(_alpha == param1)
         {
            return;
         }
         var _loc2_:ParticleAlphaState = getAnimationStateByName("ParticleAlphaGlobal") as ParticleAlphaState;
         _loc2_.updateAlpha(param1);
         _alpha = param1;
      }
      
      override public function start() : void
      {
         super.start();
         _startTime = _absoluteTime;
      }
      
      override protected function updateDeltaTime(param1:Number) : void
      {
         var _loc4_:int = 0;
         super.updateDeltaTime(param1);
         if(_callbackOnEnterFrame != null)
         {
            _callbackOnEnterFrame();
         }
         var _loc2_:Number = _absoluteTime - _startTime;
         var _loc3_:* = _loc2_ >= _originalStartTime;
         if(_pData && _pData.usesLooping == false)
         {
            if(_loc3_ != _visible)
            {
               _loc4_ = _owners.length;
               while(true)
               {
                  _loc4_--;
                  if(_loc4_ <= -1)
                  {
                     break;
                  }
                  _owners[_loc4_].visible = _loc3_;
               }
               _visible = _loc3_;
            }
            if(_absoluteTime - _startTime >= _originalEndTime)
            {
               if(true && hasEventListener("animator_complete"))
               {
                  dispatchEvent(new AnimatorEvent("animator_complete",this));
               }
            }
         }
      }
      
      public function playAndStop(param1:Number) : void
      {
         start();
         autoUpdate = false;
         absoluteTime = absoluteTime + param1 * playbackSpeed;
         super.updateDeltaTime(0);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _pData = null;
      }
   }
}
