package away3d.tools.helpers.data
{
   import flash.geom.Matrix3D;
   import flash.geom.Matrix;
   
   public class ParticleGeometryTransform
   {
       
      
      private var _defaultVertexTransform:Matrix3D;
      
      private var _defaultInvVertexTransform:Matrix3D;
      
      private var _defaultUVTransform:Matrix;
      
      public function ParticleGeometryTransform()
      {
         super();
      }
      
      public function set vertexTransform(param1:Matrix3D) : void
      {
         _defaultVertexTransform = param1;
         _defaultInvVertexTransform = param1.clone();
         _defaultInvVertexTransform.invert();
         _defaultInvVertexTransform.transpose();
      }
      
      public function set UVTransform(param1:Matrix) : void
      {
         _defaultUVTransform = param1;
      }
      
      public function get UVTransform() : Matrix
      {
         return _defaultUVTransform;
      }
      
      public function get vertexTransform() : Matrix3D
      {
         return _defaultVertexTransform;
      }
      
      public function get invVertexTransform() : Matrix3D
      {
         return _defaultInvVertexTransform;
      }
   }
}
