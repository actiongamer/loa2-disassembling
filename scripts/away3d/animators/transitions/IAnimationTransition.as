package away3d.animators.transitions
{
   import away3d.animators.nodes.AnimationNodeBase;
   import away3d.animators.IAnimator;
   
   public interface IAnimationTransition
   {
       
      
      function getAnimationNode(param1:IAnimator, param2:AnimationNodeBase, param3:AnimationNodeBase, param4:int) : AnimationNodeBase;
   }
}
