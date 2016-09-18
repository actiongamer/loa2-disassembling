package away3d.core.traverse
{
   import away3d.containers.Scene3D;
   import flash.geom.Vector3D;
   import away3d.core.partition.NodeBase;
   import away3d.core.base.IRenderable;
   import away3d.errors.AbstractMethodError;
   import away3d.lights.LightBase;
   import away3d.lights.DirectionalLight;
   import away3d.lights.PointLight;
   import away3d.lights.LightProbe;
   import away3d.entities.Entity;
   import §away3d:arcane§._entryPoint;
   
   public class PartitionTraverser
   {
      
      static var _collectionMark:uint;
       
      
      public var scene:Scene3D;
      
      var _entryPoint:Vector3D;
      
      public function PartitionTraverser()
      {
         super();
      }
      
      public function enterNode(param1:NodeBase) : Boolean
      {
         return true;
      }
      
      public function applySkyBox(param1:IRenderable) : void
      {
         throw new AbstractMethodError();
      }
      
      public function applyRenderable(param1:IRenderable) : void
      {
         throw new AbstractMethodError();
      }
      
      public function applyUnknownLight(param1:LightBase) : void
      {
         throw new AbstractMethodError();
      }
      
      public function applyDirectionalLight(param1:DirectionalLight) : void
      {
         throw new AbstractMethodError();
      }
      
      public function applyPointLight(param1:PointLight) : void
      {
         throw new AbstractMethodError();
      }
      
      public function applyLightProbe(param1:LightProbe) : void
      {
         throw new AbstractMethodError();
      }
      
      public function applyEntity(param1:Entity) : void
      {
         throw new AbstractMethodError();
      }
      
      public function get entryPoint() : Vector3D
      {
         return _entryPoint;
      }
   }
}
