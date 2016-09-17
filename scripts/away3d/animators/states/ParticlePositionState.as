package away3d.animators.states
{
   import away3d.animators.nodes.ParticlePositionNode;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticlePositionState extends ParticleStateBase
   {
       
      
      private var _particlePositionNode:ParticlePositionNode;
      
      private var _position:Vector3D;
      
      public function ParticlePositionState(param1:ParticleAnimator, param2:ParticlePositionNode)
      {
         super(param1,param2);
         _particlePositionNode = param2;
         _position = _particlePositionNode._position;
      }
      
      public function get position() : Vector3D
      {
         return _position;
      }
      
      public function set position(param1:Vector3D) : void
      {
         _position = param1;
      }
      
      public function getPositions() : Vector.<Vector3D>
      {
         return _dynamicProperties;
      }
      
      public function setPositions(param1:Vector.<Vector3D>) : void
      {
         _dynamicProperties = param1;
         _dynamicPropertiesDirty = new Dictionary(true);
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(2 && !_dynamicPropertiesDirty[param3])
         {
            updateDynamicProperties(param3);
         }
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         var _loc6_:int = _registerIndex[0];
         if(_particlePositionNode.mode == 0)
         {
            param4.setVertexConst(_loc6_,_position.x,_position.y,_position.z);
         }
         else
         {
            param3.activateVertexBuffer(_loc6_,_particlePositionNode.dataOffset,param1,"float3");
         }
      }
   }
}
