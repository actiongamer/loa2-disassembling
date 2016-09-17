package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.ProgressBar;
   import morn.core.handlers.Handler;
   import com.greensock.TweenLite;
   
   public class ProgressBarAddEffect implements IDispose
   {
       
      
      private var _progressBar:ProgressBar;
      
      private var _endValue:Number;
      
      private var _perLevelUpHandler:Handler;
      
      private var _lastLevelUpHandler:Handler;
      
      private var _overHandler:Handler;
      
      private var _time:Number = 0.2;
      
      public function ProgressBarAddEffect(param1:ProgressBar, param2:Number, param3:Handler = null, param4:Handler = null, param5:Handler = null)
      {
         super();
         _progressBar = param1;
         _endValue = param2;
         _perLevelUpHandler = param3;
         _lastLevelUpHandler = param4;
         _overHandler = param5;
      }
      
      public function setTweenTime(param1:Number) : ProgressBarAddEffect
      {
         _time = param1;
         return this;
      }
      
      public function startAnim() : void
      {
         if(_endValue < 1)
         {
            TweenLite.to(this._progressBar,_time,{
               "value":_endValue,
               "onComplete":effectCpl
            });
         }
         else
         {
            TweenLite.to(this._progressBar,_time,{
               "value":1,
               "onComplete":perLevelUpCpl
            });
         }
      }
      
      private function perLevelUpCpl() : void
      {
         _endValue = Number(_endValue) - 1;
         this._progressBar.value = 0;
         if(_endValue < 1 && _lastLevelUpHandler != null)
         {
            _lastLevelUpHandler.execute();
         }
         else if(_perLevelUpHandler != null)
         {
            _perLevelUpHandler.execute();
         }
         startAnim();
      }
      
      private function effectCpl() : void
      {
         if(_overHandler != null)
         {
            _overHandler.execute();
         }
      }
      
      public function dispose() : void
      {
         _perLevelUpHandler = null;
         _lastLevelUpHandler = null;
         _overHandler = null;
      }
   }
}
