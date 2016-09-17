package away3d.animators.states
{
   import away3d.animators.nodes.AnimationNodeBase;
   import flash.geom.Vector3D;
   import away3d.animators.IAnimator;
   
   public class AnimationStateBase implements IAnimationState
   {
       
      
      protected var _animationNode:AnimationNodeBase;
      
      protected var _rootDelta:Vector3D;
      
      protected var _positionDeltaDirty:Boolean = true;
      
      protected var _time:int;
      
      protected var _startTime:int;
      
      protected var _animator:IAnimator;
      
      public function AnimationStateBase(param1:IAnimator, param2:AnimationNodeBase)
      {
         _rootDelta = new Vector3D();
         super();
         _animator = param1;
         _animationNode = param2;
      }
      
      public function get positionDelta() : Vector3D
      {
         if(_positionDeltaDirty)
         {
            updatePositionDelta();
         }
         return _rootDelta;
      }
      
      public function offset(param1:int) : void
      {
         _startTime = param1;
         _positionDeltaDirty = true;
      }
      
      public function update(param1:int) : void
      {
         if(_time == param1 - _startTime)
         {
            return;
         }
         updateTime(param1);
      }
      
      public function phase(param1:Number) : void
      {
      }
      
      protected function updateTime(param1:int) : void
      {
         _time = param1 - _startTime;
         _positionDeltaDirty = true;
      }
      
      protected function updatePositionDelta() : void
      {
      }
   }
}
