package away3d.animators.transitions
{
   import away3d.animators.nodes.SkeletonBinaryLERPNode;
   
   public class CrossfadeTransitionNode extends SkeletonBinaryLERPNode
   {
       
      
      private var _blendSpeed:Number;
      
      private var _startBlend:int;
      
      public function CrossfadeTransitionNode()
      {
         super();
         _stateClass = CrossfadeTransitionState;
      }
      
      public function get blendSpeed() : Number
      {
         return _blendSpeed;
      }
      
      public function set blendSpeed(param1:Number) : void
      {
         _blendSpeed = param1;
      }
      
      public function get startBlend() : int
      {
         return _startBlend;
      }
      
      public function set startBlend(param1:int) : void
      {
         _startBlend = param1;
      }
   }
}
