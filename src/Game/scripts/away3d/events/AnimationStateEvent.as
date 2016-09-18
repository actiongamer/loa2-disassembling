package away3d.events
{
   import flash.events.Event;
   import away3d.animators.IAnimator;
   import away3d.animators.states.IAnimationState;
   import away3d.animators.nodes.AnimationNodeBase;
   
   public class AnimationStateEvent extends Event
   {
      
      public static const PLAYBACK_COMPLETE:String = "playbackComplete";
      
      public static const TRANSITION_COMPLETE:String = "transitionComplete";
       
      
      private var _animator:IAnimator;
      
      private var _animationState:IAnimationState;
      
      private var _animationNode:AnimationNodeBase;
      
      public function AnimationStateEvent(param1:String, param2:IAnimator, param3:IAnimationState, param4:AnimationNodeBase)
      {
         super(param1,false,false);
         _animator = param2;
         _animationState = param3;
         _animationNode = param4;
      }
      
      public function get animator() : IAnimator
      {
         return _animator;
      }
      
      public function get animationState() : IAnimationState
      {
         return _animationState;
      }
      
      public function get animationNode() : AnimationNodeBase
      {
         return _animationNode;
      }
      
      override public function clone() : Event
      {
         return new AnimationStateEvent(type,_animator,_animationState,_animationNode);
      }
   }
}
