package away3d.animators.transitions
{
   import flash.utils.Dictionary;
   import away3d.animators.nodes.AnimationNodeBase;
   import away3d.animators.IAnimator;
   
   public class CrossfadeTransition implements IAnimationTransition
   {
      
      private static var _nodesCache:Dictionary = new Dictionary(true);
       
      
      public var blendSpeed:Number = 0.5;
      
      public function CrossfadeTransition(param1:Number)
      {
         super();
         this.blendSpeed = param1;
      }
      
      public function getAnimationNode(param1:IAnimator, param2:AnimationNodeBase, param3:AnimationNodeBase, param4:int) : AnimationNodeBase
      {
         var _loc6_:TransitionData = _nodesCache[param1];
         _loc6_ = _loc6_ || _loc6_;
         _nodesCache[param1] = _loc6_ || _loc6_;
         var _loc5_:String = getKey(param2,param3);
         var _loc7_:CrossfadeTransitionNode = _loc6_.getValue(_loc5_);
         if(!_loc7_)
         {
            _loc7_ = new CrossfadeTransitionNode();
            _loc7_.inputA = param2;
            _loc7_.inputB = param3;
            _loc6_.put(_loc5_,_loc7_);
         }
         _loc7_.blendSpeed = blendSpeed;
         _loc7_.startBlend = param4;
         return _loc7_;
      }
      
      private function getKey(param1:AnimationNodeBase, param2:AnimationNodeBase) : String
      {
         return param1.name + param2.name;
      }
      
      public function removeAnimationNode(param1:IAnimator) : void
      {
         var _loc2_:TransitionData = _nodesCache[param1];
      }
   }
}

import flash.utils.Dictionary;
import away3d.animators.transitions.CrossfadeTransitionNode;

class TransitionData
{
    
   
   private var _attribute:Dictionary;
   
   function TransitionData()
   {
      _attribute = new Dictionary(true);
      super();
   }
   
   public function put(param1:String, param2:CrossfadeTransitionNode) : void
   {
      _attribute[param1] = param2;
   }
   
   public function getValue(param1:String) : CrossfadeTransitionNode
   {
      return _attribute[param1] as CrossfadeTransitionNode;
   }
   
   public function clean() : void
   {
      var _loc1_:* = null;
      var _loc4_:int = 0;
      var _loc3_:* = _attribute;
      for(var _loc2_ in _attribute)
      {
         _loc1_ = _attribute[_loc2_] as CrossfadeTransitionNode;
         _loc1_.inputA = null;
         _loc1_.inputB = null;
         delete _attribute[_loc2_];
      }
   }
}
