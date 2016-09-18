package away3d.materials.methods
{
   public class MethodVOSet
   {
       
      
      public var method:away3d.materials.methods.EffectMethodBase;
      
      public var data:away3d.materials.methods.MethodVO;
      
      public function MethodVOSet(param1:away3d.materials.methods.EffectMethodBase)
      {
         super();
         this.method = param1;
         data = param1.createMethodVO();
      }
   }
}
