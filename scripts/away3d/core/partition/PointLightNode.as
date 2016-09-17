package away3d.core.partition
{
   import away3d.lights.PointLight;
   import away3d.core.traverse.PartitionTraverser;
   
   public class PointLightNode extends EntityNode
   {
       
      
      private var _light:PointLight;
      
      public function PointLightNode(param1:PointLight)
      {
         super(param1);
         _light = param1;
      }
      
      public function get light() : PointLight
      {
         return _light;
      }
      
      override public function acceptTraverser(param1:PartitionTraverser) : void
      {
         if(param1.enterNode(this))
         {
            super.acceptTraverser(param1);
            param1.applyPointLight(_light);
         }
      }
   }
}
