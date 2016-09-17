package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import morn.core.handlers.Handler;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class NumberBreathCtrl implements IDispose
   {
       
      
      public var number:Number = 0;
      
      private var _numberMax:Number = 0;
      
      private var _numberMin:Number = 0;
      
      private var _callBack;
      
      private var duration:Number = 2.5;
      
      private var _actived:Boolean = false;
      
      public function NumberBreathCtrl(param1:Number = 2, param2:Number = 0)
      {
         super();
         _numberMax = param1;
         _numberMin = param2;
         this.actived = true;
      }
      
      private function changeNumber() : void
      {
         if(_callBack)
         {
            Handler.execute(_callBack,[number]);
         }
      }
      
      public function set_duration(param1:Number = 2.5) : NumberBreathCtrl
      {
         this.duration = param1;
         return this;
      }
      
      private function toMax() : void
      {
         TweenLite.to(this,duration,{
            "number":_numberMax,
            "onComplete":toMin
         });
      }
      
      private function toMin() : void
      {
         TweenLite.to(this,duration,{
            "number":_numberMin,
            "onComplete":toMax
         });
      }
      
      public function addHandler(param1:*) : NumberBreathCtrl
      {
         _callBack = param1;
         return this;
      }
      
      public function get actived() : Boolean
      {
         return _actived;
      }
      
      public function set actived(param1:Boolean) : void
      {
         if(_actived != param1)
         {
            _actived = param1;
            if(_actived)
            {
               toMax();
               TimerManager.ins.doLoop(100,changeNumber);
            }
            else
            {
               this.number = 0;
               TweenLite.killTweensOf(this);
               TimerManager.ins.clearTimer(changeNumber);
            }
         }
      }
      
      public function dispose() : void
      {
         TweenLite.killTweensOf(this);
         TimerManager.ins.clearTimer(changeNumber);
         _callBack = null;
      }
   }
}
