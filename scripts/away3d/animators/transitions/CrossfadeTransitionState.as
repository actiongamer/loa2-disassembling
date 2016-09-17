package away3d.animators.transitions
{
   import away3d.animators.states.SkeletonBinaryLERPState;
   import away3d.events.AnimationStateEvent;
   import away3d.animators.IAnimator;
   
   public class CrossfadeTransitionState extends SkeletonBinaryLERPState
   {
       
      
      private var _skeletonAnimationNode:away3d.animators.transitions.CrossfadeTransitionNode;
      
      private var _animationStateTransitionComplete:AnimationStateEvent;
      
      public function CrossfadeTransitionState(param1:IAnimator, param2:away3d.animators.transitions.CrossfadeTransitionNode)
      {
         super(param1,param2);
         _skeletonAnimationNode = param2;
      }
      
      override protected function updateTime(param1:int) : void
      {
         blendWeight = Math.abs(param1 - _skeletonAnimationNode.startBlend) / (1000 * _skeletonAnimationNode.blendSpeed);
         if(blendWeight >= 1)
         {
            blendWeight = 1;
            _skeletonAnimationNode.dispatchEvent(_animationStateTransitionComplete || new AnimationStateEvent("transitionComplete",_animator,this,_skeletonAnimationNode));
         }
         super.updateTime(param1);
      }
   }
}
