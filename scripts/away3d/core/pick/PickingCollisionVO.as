package away3d.core.pick
{
   import away3d.entities.Entity;
   import flash.geom.Vector3D;
   import flash.geom.Point;
   import away3d.core.base.IRenderable;
   
   public class PickingCollisionVO
   {
       
      
      public var entity:Entity;
      
      private var _localPosition:Vector3D;
      
      public var localNormal:Vector3D;
      
      public var uv:Point;
      
      public var localRayPosition:Vector3D;
      
      public var localRayDirection:Vector3D;
      
      public var rayOriginIsInsideBounds:Boolean;
      
      public var rayEntryDistance:Number;
      
      public var renderable:IRenderable;
      
      public function PickingCollisionVO(param1:Entity)
      {
         super();
         this.entity = param1;
      }
      
      public function get localPosition() : Vector3D
      {
         return _localPosition;
      }
      
      public function set localPosition(param1:Vector3D) : void
      {
         _localPosition = param1;
      }
   }
}
