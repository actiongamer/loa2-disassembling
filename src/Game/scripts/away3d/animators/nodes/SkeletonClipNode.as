package away3d.animators.nodes
{
   import away3d.animators.data.SkeletonPose;
   import away3d.animators.states.SkeletonClipState;
   import away3d.animators.IAnimator;
   
   public class SkeletonClipNode extends AnimationClipNodeBase
   {
       
      
      private var _frames:Vector.<SkeletonPose>;
      
      private var _frameRate:int;
      
      public var highQuality:Boolean = false;
      
      public function SkeletonClipNode(param1:int = 30)
      {
         _frames = new Vector.<SkeletonPose>();
         super();
         this._frameRate = param1;
         _stateClass = SkeletonClipState;
      }
      
      public function get frameRate() : int
      {
         return _frameRate;
      }
      
      public function get frames() : Vector.<SkeletonPose>
      {
         return _frames;
      }
      
      public function addFrame(param1:SkeletonPose, param2:uint) : void
      {
         _frames.push(param1);
         _durations.push(param2);
         _numFrames = _durations.length;
         _stitchDirty = true;
      }
      
      public function getAnimationState(param1:IAnimator) : SkeletonClipState
      {
         return param1.getAnimationState(this) as SkeletonClipState;
      }
      
      override protected function updateStitch() : void
      {
         super.updateStitch();
         var _loc1_:uint = _numFrames - 1;
         while(_loc1_--)
         {
            _totalDuration = _totalDuration + _durations[_loc1_];
         }
         if(_stitchFinalFrame || !_looping)
         {
            _totalDuration = _totalDuration + _durations[_numFrames - 1];
         }
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _frames;
         for each(var _loc1_ in _frames)
         {
            _loc1_.dispose();
         }
         _frames = null;
         super.dispose();
      }
   }
}
