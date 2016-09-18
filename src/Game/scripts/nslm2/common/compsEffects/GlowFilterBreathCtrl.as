package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import flash.filters.GlowFilter;
   import flash.display.Sprite;
   import morn.core.handlers.Handler;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class GlowFilterBreathCtrl implements IDispose
   {
       
      
      public var strength:Number;
      
      private var _strengthMax:Number;
      
      private var _strengthMin:Number;
      
      private var _glowFilter:GlowFilter;
      
      private var _glowFilterInner:GlowFilter;
      
      private var _callBack;
      
      private var _loopTimes:int = -1;
      
      public var target:Sprite;
      
      private var duration:Number = 2.5;
      
      public function GlowFilterBreathCtrl(param1:GlowFilter, param2:Number = 2, param3:Number = 0, param4:Number = 2.5, param5:int = -1)
      {
         super();
         _strengthMax = param1.strength;
         strength = 0;
         _strengthMax = param2;
         _strengthMin = param3;
         _glowFilter = param1.clone() as GlowFilter;
         _glowFilterInner = param1.clone() as GlowFilter;
         _glowFilterInner.inner = true;
         this.duration = param4;
         _loopTimes = param5;
         toStrong();
         TimerManager.ins.doLoop(100,changeFilter);
      }
      
      private function changeFilter() : void
      {
         changeStrength();
         if(target)
         {
            target.filters = getFilter();
         }
         if(_callBack)
         {
            Handler.execute(_callBack,[getFilter()]);
         }
      }
      
      private function getFilter() : Array
      {
         var _loc1_:Array = [_glowFilter,_glowFilterInner];
         return _loc1_;
      }
      
      private function changeStrength() : void
      {
         _glowFilter.strength = strength;
         _glowFilterInner.strength = strength;
      }
      
      public function set_duration(param1:Number = 2.5) : GlowFilterBreathCtrl
      {
         this.duration = param1;
         return this;
      }
      
      private function toStrong() : void
      {
         TweenLite.to(this,duration,{
            "strength":_strengthMax,
            "onComplete":toWeak
         });
      }
      
      private function toWeak() : void
      {
         if(_loopTimes > 0)
         {
            _loopTimes = Number(_loopTimes) - 1;
         }
         TweenLite.to(this,duration,{
            "strength":_strengthMin,
            "onComplete":(_loopTimes > 0 || _loopTimes == -1?toStrong:dispose)
         });
      }
      
      public function addHandler(param1:*) : GlowFilterBreathCtrl
      {
         _callBack = param1;
         return this;
      }
      
      public function dispose() : void
      {
         TweenLite.killTweensOf(this);
         TimerManager.ins.clearTimer(changeFilter);
      }
   }
}
