package nslm2.common.ctrls
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Component;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import morn.core.handlers.Handler;
   
   public class DialCtrl implements IDispose
   {
       
      
      private var _preTurns:int = 5;
      
      private var _arrow:Component;
      
      private var _isRunning:Boolean;
      
      private var _splitCnt:int;
      
      private var _cplHandler;
      
      private var _nowIndex:int;
      
      private var _needToIndex:int;
      
      public function DialCtrl(param1:Component)
      {
         super();
         _arrow = param1;
      }
      
      public function split(param1:int) : void
      {
         _splitCnt = param1;
      }
      
      public function toIndex(param1:int, param2:* = null) : void
      {
         if(_isRunning)
         {
            return;
         }
         _cplHandler = param2;
         _needToIndex = param1;
         _isRunning = true;
         turn();
      }
      
      public function toRotation(param1:Number, param2:* = null) : void
      {
         if(_isRunning)
         {
            return;
         }
         _cplHandler = param2;
         _isRunning = true;
         _arrow.rotation = _arrow.rotation % 360;
         TweenLite.to(this,3,{
            "rotation":360 * _preTurns + param1,
            "onComplete":over,
            "ease":Cubic.easeInOut
         });
      }
      
      private function turn() : void
      {
         _arrow.rotation = _arrow.rotation % 360;
         TweenLite.to(this,3,{
            "rotation":360 * _preTurns + 360 / _splitCnt * _needToIndex + 360 / _splitCnt / 2,
            "onComplete":over,
            "ease":Cubic.easeInOut
         });
      }
      
      private function over() : void
      {
         _isRunning = false;
         if(_cplHandler)
         {
            Handler.execute(_cplHandler);
         }
      }
      
      public function set rotation(param1:Number) : void
      {
         _arrow.rotation = param1;
      }
      
      public function get rotation() : Number
      {
         return _arrow.rotation;
      }
      
      public function dispose() : void
      {
         TweenLite.killTweensOf(this);
         _arrow = null;
      }
   }
}
