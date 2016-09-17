package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   
   public class AnimationClipNodeBase extends AnimationNodeBase
   {
       
      
      protected var _looping:Boolean = true;
      
      protected var _totalDuration:uint = 0;
      
      protected var _lastFrame:uint;
      
      protected var _stitchDirty:Boolean = true;
      
      protected var _stitchFinalFrame:Boolean = false;
      
      protected var _numFrames:uint = 0;
      
      protected var _durations:Vector.<uint>;
      
      protected var _totalDelta:Vector3D;
      
      public var fixedFrameRate:Boolean = true;
      
      public function AnimationClipNodeBase()
      {
         _durations = new Vector.<uint>();
         _totalDelta = new Vector3D();
         super();
      }
      
      public final function get looping() : Boolean
      {
         return _looping;
      }
      
      public final function set looping(param1:Boolean) : void
      {
         if(_looping == param1)
         {
            return;
         }
         _looping = param1;
         _stitchDirty = true;
      }
      
      public function get stitchFinalFrame() : Boolean
      {
         return _stitchFinalFrame;
      }
      
      public function set stitchFinalFrame(param1:Boolean) : void
      {
         if(_stitchFinalFrame == param1)
         {
            return;
         }
         _stitchFinalFrame = param1;
         _stitchDirty = true;
      }
      
      public function get totalDuration() : uint
      {
         if(_stitchDirty)
         {
            updateStitch();
         }
         return _totalDuration;
      }
      
      public function get totalDelta() : Vector3D
      {
         if(_stitchDirty)
         {
            updateStitch();
         }
         return _totalDelta;
      }
      
      public function get lastFrame() : uint
      {
         if(_stitchDirty)
         {
            updateStitch();
         }
         return _lastFrame;
      }
      
      public function get durations() : Vector.<uint>
      {
         return _durations;
      }
      
      protected function updateStitch() : void
      {
         _stitchDirty = false;
         _lastFrame = !!_stitchFinalFrame?_numFrames:_numFrames - 1;
         _totalDuration = 0;
         _totalDelta.x = 0;
         _totalDelta.y = 0;
         _totalDelta.z = 0;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
