package away3d.core.partition
{
   import away3d.lights.LightBase;
   import away3d.core.traverse.PartitionTraverser;
   
   public class LightNode extends EntityNode
   {
       
      
      private var _light:LightBase;
      
      public function LightNode(param1:LightBase)
      {
         super(param1);
         _light = param1;
      }
      
      public function get light() : LightBase
      {
         return _light;
      }
      
      override public function acceptTraverser(param1:PartitionTraverser) : void
      {
         if(param1.enterNode(this))
         {
            super.acceptTraverser(param1);
            param1.applyUnknownLight(_light);
         }
      }
   }
}
