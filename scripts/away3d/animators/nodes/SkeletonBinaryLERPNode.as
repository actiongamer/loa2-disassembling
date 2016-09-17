package away3d.animators.nodes
{
   import away3d.animators.states.SkeletonBinaryLERPState;
   import away3d.animators.IAnimator;
   
   public class SkeletonBinaryLERPNode extends away3d.animators.nodes.AnimationNodeBase
   {
       
      
      private var _inputA:away3d.animators.nodes.AnimationNodeBase;
      
      private var _inputB:away3d.animators.nodes.AnimationNodeBase;
      
      public function SkeletonBinaryLERPNode()
      {
         super();
         _stateClass = SkeletonBinaryLERPState;
      }
      
      public function getAnimationState(param1:IAnimator) : SkeletonBinaryLERPState
      {
         return param1.getAnimationState(this) as SkeletonBinaryLERPState;
      }
      
      public function get inputA() : away3d.animators.nodes.AnimationNodeBase
      {
         return _inputA;
      }
      
      public function set inputA(param1:away3d.animators.nodes.AnimationNodeBase) : void
      {
         _inputA = param1;
      }
      
      public function get inputB() : away3d.animators.nodes.AnimationNodeBase
      {
         return _inputB;
      }
      
      public function set inputB(param1:away3d.animators.nodes.AnimationNodeBase) : void
      {
         _inputB = param1;
      }
   }
}
