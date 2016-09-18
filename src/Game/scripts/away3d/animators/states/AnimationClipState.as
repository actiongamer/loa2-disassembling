package away3d.animators.states
{
   import away3d.animators.nodes.AnimationClipNodeBase;
   import away3d.events.AnimationStateEvent;
   import away3d.animators.IAnimator;
   
   public class AnimationClipState extends AnimationStateBase
   {
       
      
      private var _animationClipNode:AnimationClipNodeBase;
      
      private var _animationStatePlaybackComplete:AnimationStateEvent;
      
      protected var _blendWeight:Number;
      
      protected var _currentFrame:uint;
      
      protected var _nextFrame:uint;
      
      protected var _oldFrame:uint;
      
      protected var _timeDir:int;
      
      protected var _framesDirty:Boolean = true;
      
      public function AnimationClipState(param1:IAnimator, param2:AnimationClipNodeBase)
      {
         super(param1,param2);
         _animationClipNode = param2;
      }
      
      public function get blendWeight() : Number
      {
         if(_framesDirty)
         {
            updateFrames();
         }
         return _blendWeight;
      }
      
      public function get currentFrame() : uint
      {
         if(_framesDirty)
         {
            updateFrames();
         }
         return _currentFrame;
      }
      
      public function get nextFrame() : uint
      {
         if(_framesDirty)
         {
            updateFrames();
         }
         return _nextFrame;
      }
      
      override public function update(param1:int) : void
      {
         if(!_animationClipNode.looping)
         {
            if(param1 > _startTime + _animationClipNode.totalDuration)
            {
               param1 = _startTime + _animationClipNode.totalDuration;
            }
            else if(param1 < _startTime)
            {
               param1 = _startTime;
            }
         }
         if(_time == param1 - _startTime)
         {
            return;
         }
         updateTime(param1);
      }
      
      override public function phase(param1:Number) : void
      {
         var _loc2_:int = param1 * _animationClipNode.totalDuration + _startTime;
         if(_time == _loc2_ - _startTime)
         {
            return;
         }
         updateTime(_loc2_);
      }
      
      override protected function updateTime(param1:int) : void
      {
         _framesDirty = true;
         _timeDir = param1 - _startTime > _time?1:-1;
         super.updateTime(param1);
      }
      
      protected function updateFrames() : void
      {
         var _loc4_:Number = NaN;
         var _loc7_:* = 0;
         var _loc6_:* = 0;
         var _loc3_:* = undefined;
         _framesDirty = false;
         var _loc8_:Boolean = _animationClipNode.looping;
         var _loc5_:uint = _animationClipNode.totalDuration;
         var _loc1_:uint = _animationClipNode.lastFrame;
         var _loc2_:int = _time;
         if(_loc8_ && (_loc2_ >= _loc5_ || _loc2_ < 0))
         {
            _loc2_ = _loc2_ % _loc5_;
            if(_loc2_ < 0)
            {
               _loc2_ = _loc2_ + _loc5_;
            }
         }
         if(!_loc8_ && _loc2_ >= _loc5_)
         {
            notifyPlaybackComplete();
            _currentFrame = _loc1_;
            _nextFrame = _loc1_;
            _blendWeight = 0;
         }
         else if(!_loc8_ && _loc2_ <= 0)
         {
            _currentFrame = 0;
            _nextFrame = 0;
            _blendWeight = 0;
         }
         else if(_animationClipNode.fixedFrameRate)
         {
            _loc4_ = _loc2_ / _loc5_ * _loc1_;
            _currentFrame = _loc4_;
            _blendWeight = _loc4_ - _currentFrame;
            _nextFrame = _currentFrame + 1;
         }
         else
         {
            _currentFrame = 0;
            _nextFrame = 0;
            _loc6_ = uint(0);
            _loc3_ = _animationClipNode.durations;
            do
            {
               _loc7_ = _loc6_;
               _loc6_ = uint(_loc6_ + _loc3_[nextFrame]);
               _nextFrame = Number(_nextFrame) + 1;
               _currentFrame = Number(_nextFrame);
            }
            while(_loc2_ > _loc6_);
            
            if(_currentFrame == _loc1_)
            {
               _currentFrame = 0;
               _nextFrame = 1;
            }
            _blendWeight = (_loc2_ - _loc7_) / _loc3_[_currentFrame];
         }
      }
      
      private function notifyPlaybackComplete() : void
      {
         _animationClipNode.dispatchEvent(_animationStatePlaybackComplete || new AnimationStateEvent("playbackComplete",_animator,this,_animationClipNode));
      }
   }
}
