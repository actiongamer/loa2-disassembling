package nslm2.common.uiEffects
{
   import com.mz.core.interFace.IDispose;
   import away3d.core.managers.IAnimatorUpdate;
   import flash.utils.Dictionary;
   import flash.display.DisplayObject;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import com.mz.core.utils.FilterUtil;
   
   public class ArriveTickEff implements IDispose, IAnimatorUpdate
   {
      
      public static var lib:Dictionary = new Dictionary();
       
      
      private const _scaleSpeedConst:Number = 3;
      
      private var _scaleSpeed:Number = 0;
      
      private var _scaleMax:Number = 1.3;
      
      private var _view:DisplayObject;
      
      public function ArriveTickEff()
      {
         super();
      }
      
      public static function createIns(param1:Object) : ArriveTickEff
      {
         var _loc2_:* = null;
         if(lib[param1])
         {
            return lib[param1];
         }
         _loc2_ = new ArriveTickEff();
         if(param1 is DisplayObject)
         {
            _loc2_._view = param1 as DisplayObject;
            lib[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function start() : void
      {
         _scaleSpeed = 3;
         TimerManager.ins.doFrameLoop(1,this.onLoop);
      }
      
      private function onLoop(param1:TimerHandlerVo) : void
      {
         this.update(param1.runTimeMs,param1.overTimeMs);
      }
      
      public function update(param1:int, param2:Number = 0) : void
      {
         if(_view == null)
         {
            TimerManager.ins.clearTimer(this.onLoop);
            return;
         }
         if(_scaleSpeed < 0 && _view.scaleX <= 1)
         {
            var _loc3_:int = 1;
            _view.scaleY = _loc3_;
            _view.scaleX = _loc3_;
            finish();
         }
         else
         {
            if(_scaleSpeed > 0 && _view.scaleX > _scaleMax)
            {
               _scaleSpeed = -_scaleSpeed;
            }
            _view.scaleX = _view.scaleX + param2 * _scaleSpeed / 1000;
            _view.scaleY = _view.scaleX;
            updateFilters();
         }
      }
      
      private function updateFilters() : void
      {
         var _loc1_:Number = NaN;
         if(_view.scaleX <= 1)
         {
            _view.filters = null;
         }
         else
         {
            _loc1_ = (_view.scaleX - 1) * 255;
            _view.filters = [FilterUtil.getColorMatrixFilter(255,255,255,_loc1_,_loc1_,_loc1_)];
         }
      }
      
      private function finish() : void
      {
         _view.filters = null;
         TimerManager.ins.clearTimer(this.onLoop);
         dispose();
      }
      
      public function dispose() : void
      {
         delete lib[_view];
         _view = null;
      }
   }
}
