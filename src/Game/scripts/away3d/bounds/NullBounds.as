package away3d.bounds
{
   import away3d.primitives.WireframePrimitiveBase;
   import away3d.primitives.WireframeSphere;
   import flash.geom.Matrix3D;
   import away3d.core.base.Geometry;
   import flash.geom.Vector3D;
   import away3d.core.math.Plane3D;
   
   public class NullBounds extends BoundingVolumeBase
   {
       
      
      private var _alwaysIn:Boolean;
      
      private var _renderable:WireframePrimitiveBase;
      
      public function NullBounds(param1:Boolean = true, param2:WireframePrimitiveBase = null)
      {
         super();
         _alwaysIn = param1;
         _renderable = param2;
         var _loc3_:* = Infinity;
         _max.z = _loc3_;
         _loc3_ = _loc3_;
         _max.y = _loc3_;
         _max.x = _loc3_;
         _loc3_ = !!_alwaysIn?-Infinity:Infinity;
         _min.z = _loc3_;
         _loc3_ = _loc3_;
         _min.y = _loc3_;
         _min.x = _loc3_;
      }
      
      override protected function createBoundingRenderable() : WireframePrimitiveBase
      {
         return _renderable || new WireframeSphere(100);
      }
      
      override public function isInFrustum(param1:Matrix3D) : Boolean
      {
         return _alwaysIn;
      }
      
      override public function fromGeometry(param1:Geometry) : void
      {
      }
      
      override public function fromSphere(param1:Vector3D, param2:Number) : void
      {
      }
      
      override public function fromExtremes(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
      }
      
      override public function classifyToPlane(param1:Plane3D) : int
      {
         return 2;
      }
   }
}
