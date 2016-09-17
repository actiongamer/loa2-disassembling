package away3d.core.partition
{
   import away3d.lights.DirectionalLight;
   import away3d.core.traverse.PartitionTraverser;
   
   public class DirectionalLightNode extends EntityNode
   {
       
      
      private var _light:DirectionalLight;
      
      public function DirectionalLightNode(param1:DirectionalLight)
      {
         super(param1);
         _light = param1;
      }
      
      public function get light() : DirectionalLight
      {
         return _light;
      }
      
      override public function acceptTraverser(param1:PartitionTraverser) : void
      {
         if(param1.enterNode(this))
         {
            super.acceptTraverser(param1);
            param1.applyDirectionalLight(_light);
         }
      }
   }
}
