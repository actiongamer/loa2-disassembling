package away3d.core.partition
{
   import away3d.lights.LightProbe;
   import away3d.core.traverse.PartitionTraverser;
   
   public class LightProbeNode extends EntityNode
   {
       
      
      private var _light:LightProbe;
      
      public function LightProbeNode(param1:LightProbe)
      {
         super(param1);
         _light = param1;
      }
      
      public function get light() : LightProbe
      {
         return _light;
      }
      
      override public function acceptTraverser(param1:PartitionTraverser) : void
      {
         if(param1.enterNode(this))
         {
            super.acceptTraverser(param1);
            param1.applyLightProbe(_light);
         }
      }
   }
}
