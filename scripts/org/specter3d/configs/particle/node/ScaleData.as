package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   
   public class ScaleData extends BaseData
   {
       
      
      public var usesCycle:Boolean = false;
      
      public var usesPhase:Boolean = false;
      
      public var minScale:Number = 1;
      
      public var maxScale:Number = 1;
      
      public var cycleDuration:Number = 0.01;
      
      public var cyclePhase:Number = 0.01;
      
      public var singleMinScale:Number = 1;
      
      public var singleMaxScale:Number = 1;
      
      public function ScaleData()
      {
         super();
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:ScaleData = new ScaleData();
         _loc1_.usesNode = usesNode;
         _loc1_.cycleDuration = cycleDuration;
         _loc1_.cyclePhase = cyclePhase;
         _loc1_.maxScale = maxScale;
         _loc1_.minScale = minScale;
         _loc1_.usesCycle = usesCycle;
         _loc1_.usesNode = usesNode;
         _loc1_.usesPhase = usesPhase;
         return _loc1_;
      }
   }
}
