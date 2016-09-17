package away3d.core.pick
{
   import flash.display.Shader;
   import away3d.core.base.SubMesh;
   import flash.geom.Vector3D;
   import flash.geom.Point;
   import flash.display.ShaderJob;
   import flash.utils.ByteArray;
   
   public class PBPickingCollider extends PickingColliderBase implements IPickingCollider
   {
       
      
      private var RayTriangleKernelClass:Class;
      
      private var _findClosestCollision:Boolean;
      
      private var _rayTriangleKernel:Shader;
      
      private var _lastSubMeshUploaded:SubMesh;
      
      private var _kernelOutputBuffer:Vector.<Number>;
      
      public function PBPickingCollider(param1:Boolean = false)
      {
         RayTriangleKernelClass = §RayTriangleKernel_pbj$6d94020d070c5bf50991ad27df6040cc-1525816648§;
         super();
         _findClosestCollision = param1;
         _kernelOutputBuffer = new Vector.<Number>();
         _rayTriangleKernel = new Shader(new RayTriangleKernelClass() as ByteArray);
      }
      
      override public function setLocalRay(param1:Vector3D, param2:Vector3D) : void
      {
         super.setLocalRay(param1,param2);
         _rayTriangleKernel.data.rayStartPoint.value = [rayPosition.x,rayPosition.y,rayPosition.z];
         _rayTriangleKernel.data.rayDirection.value = [rayDirection.x,rayDirection.y,rayDirection.z];
      }
      
      public function testSubMeshCollision(param1:SubMesh, param2:PickingCollisionVO, param3:Number, param4:Boolean) : Boolean
      {
         var _loc10_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc9_:* = undefined;
         var _loc19_:* = null;
         var _loc13_:* = 0;
         var _loc17_:Number = NaN;
         var _loc8_:Vector.<uint> = param1.indexData;
         var _loc21_:Vector.<Number> = param1.vertexData;
         var _loc18_:Vector.<Number> = param1.UVData;
         var _loc20_:Vector.<Number> = Vector.<Number>(_loc8_);
         var _loc6_:Point = evaluateArrayAsGrid(_loc20_);
         if(!_lastSubMeshUploaded || _lastSubMeshUploaded !== param1)
         {
            _loc9_ = _loc21_.concat();
            _loc19_ = evaluateArrayAsGrid(_loc9_);
            _rayTriangleKernel.data.vertexBuffer.width = _loc19_.x;
            _rayTriangleKernel.data.vertexBuffer.height = _loc19_.y;
            _rayTriangleKernel.data.vertexBufferWidth.value = [_loc19_.x];
            _rayTriangleKernel.data.vertexBuffer.input = _loc9_;
            _rayTriangleKernel.data.ignoreFacesLookingAway.value = [!!param4?1:0];
            _rayTriangleKernel.data.indexBuffer.width = _loc6_.x;
            _rayTriangleKernel.data.indexBuffer.height = _loc6_.y;
            _rayTriangleKernel.data.indexBuffer.input = _loc20_;
         }
         _lastSubMeshUploaded = param1;
         var _loc22_:ShaderJob = new ShaderJob(_rayTriangleKernel,_kernelOutputBuffer,_loc6_.x,_loc6_.y);
         _loc22_.start(true);
         var _loc5_:int = -1;
         var _loc12_:uint = _kernelOutputBuffer.length;
         _loc13_ = uint(0);
         while(_loc13_ < _loc12_)
         {
            _loc17_ = _kernelOutputBuffer[_loc13_];
            if(_loc17_ > 0 && _loc17_ < param3)
            {
               param3 = _loc17_;
               _loc5_ = _loc13_;
               if(!_findClosestCollision)
               {
                  break;
               }
            }
            _loc13_ = uint(_loc13_ + 3);
         }
         if(_loc5_ >= 0)
         {
            param2.rayEntryDistance = param3;
            _loc11_ = rayPosition.x + param3 * rayDirection.x;
            _loc10_ = rayPosition.y + param3 * rayDirection.y;
            _loc7_ = rayPosition.z + param3 * rayDirection.z;
            param2.localPosition = new Vector3D(_loc11_,_loc10_,_loc7_);
            param2.localNormal = getCollisionNormal(_loc8_,_loc21_,_loc5_);
            _loc15_ = _kernelOutputBuffer[_loc5_ + 1];
            _loc14_ = _kernelOutputBuffer[_loc5_ + 2];
            _loc16_ = 1 - _loc15_ - _loc14_;
            param2.uv = getCollisionUV(_loc8_,_loc18_,_loc5_,_loc15_,_loc14_,_loc16_,0,2);
            return true;
         }
         return false;
      }
      
      private function evaluateArrayAsGrid(param1:Vector.<Number>) : Point
      {
         var _loc5_:* = 0;
         var _loc3_:uint = param1.length / 3;
         var _loc2_:uint = Math.floor(Math.sqrt(_loc3_));
         var _loc4_:* = _loc2_;
         while(_loc2_ * _loc4_ < _loc3_)
         {
            _loc5_ = uint(0);
            while(_loc5_ < _loc2_)
            {
               param1.push(0,0,0);
               _loc5_++;
            }
            _loc4_++;
         }
         return new Point(_loc2_,_loc4_);
      }
   }
}
