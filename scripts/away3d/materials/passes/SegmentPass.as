package away3d.materials.passes
{
   import flash.geom.Matrix3D;
   import away3d.core.base.IRenderable;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.display3D.Context3D;
   import away3d.entities.SegmentSet;
   import away3d.core.managers.RTTBufferManager;
   
   public class SegmentPass extends MaterialPassBase
   {
      
      protected static const ONE_VECTOR:Vector.<Number> = Vector.<Number>([1,1,1,1]);
      
      protected static const FRONT_VECTOR:Vector.<Number> = Vector.<Number>([0,0,-1,0]);
       
      
      private var _constants:Vector.<Number>;
      
      private var _calcMatrix:Matrix3D;
      
      private var _thickness:Number;
      
      public function SegmentPass(param1:Number)
      {
         _constants = new Vector.<Number>(4,true);
         _calcMatrix = new Matrix3D();
         _thickness = param1;
         _constants[1] = 0.00392156862745098;
         super();
      }
      
      override function getVertexCode() : String
      {
         return "m44 vt0, va0, vc8\t\t\t\nm44 vt1, va1, vc8\t\t\t\nsub vt2, vt1, vt0 \t\t\t\nslt vt5.x, vt0.z, vc7.z\t\t\t\nsub vt5.y, vc5.x, vt5.x\t\t\t\nadd vt4.x, vt0.z, vc7.z\t\t\t\nsub vt4.y, vt0.z, vt1.z\t\t\t\nseq vt4.z, vt4.y vc6.x\t\t\t\nadd vt4.y, vt4.y, vt4.z\t\t\t\ndiv vt4.z, vt4.x, vt4.y\t\t\t\nmul vt4.xyz, vt4.zzz, vt2.xyz\t\nadd vt3.xyz, vt0.xyz, vt4.xyz\t\nmov vt3.w, vc5.x\t\t\t\nmul vt0, vt0, vt5.yyyy\t\t\t\nmul vt3, vt3, vt5.xxxx\t\t\t\nadd vt0, vt0, vt3\t\t\t\t\nsub vt2, vt1, vt0 \t\t\t\nnrm vt2.xyz, vt2.xyz\t\t\t\nnrm vt5.xyz, vt0.xyz\t\t\t\nmov vt5.w, vc5.x\t\t\t\t\ncrs vt3.xyz, vt2, vt5\t\t\t\nnrm vt3.xyz, vt3.xyz\t\t\t\nmul vt3.xyz, vt3.xyz, va2.xxx\t\nmov vt3.w, vc5.x\t\t\t\ndp3 vt4.x, vt0, vc6\t\t\t\nmul vt4.x, vt4.x, vc7.x\t\t\t\nmul vt3.xyz, vt3.xyz, vt4.xxx\t\nadd vt0.xyz, vt0.xyz, vt3.xyz\t\nm44 op, vt0, vc0\t\t\t\nmov v0, va3\t\t\t\t\n";
      }
      
      override function getFragmentCode(param1:String) : String
      {
         return "mov oc, v0\n";
      }
      
      override function render(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         var _loc6_:* = 0;
         var _loc5_:Context3D = param2._context3D;
         _calcMatrix.copyFrom(param1.sourceEntity.sceneTransform);
         _calcMatrix.append(param3.inverseSceneTransform);
         var _loc4_:uint = SegmentSet(param1).subSetCount;
         if(SegmentSet(param1).hasData)
         {
            _loc6_ = uint(0);
            while(_loc6_ < _loc4_)
            {
               param1.activateVertexBuffer(_loc6_,param2);
               _loc5_.setProgramConstantsFromMatrix("vertex",8,_calcMatrix,true);
               _loc5_.drawTriangles(param1.getIndexBuffer(param2),0,param1.numTriangles);
               _loc6_++;
            }
         }
      }
      
      override function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         var _loc6_:* = null;
         var _loc5_:Context3D = param1._context3D;
         super.activate(param1,param2,param3,param4);
         if(param1.scissorRect)
         {
            _constants[0] = _thickness / Math.min(param1.scissorRect.width,param1.scissorRect.height);
         }
         else
         {
            _constants[0] = _thickness / Math.min(param1.width,param1.height);
         }
         _constants[2] = param2.lens.near;
         _loc5_.setProgramConstantsFromVector("vertex",5,ONE_VECTOR);
         _loc5_.setProgramConstantsFromVector("vertex",6,FRONT_VECTOR);
         _loc5_.setProgramConstantsFromVector("vertex",7,_constants);
         if(!param1.renderTarget)
         {
            _loc5_.setProgramConstantsFromMatrix("vertex",0,param2.lens.matrix,true);
         }
         else
         {
            _calcMatrix.copyFrom(param2.lens.matrix);
            _loc6_ = RTTBufferManager.getInstance(param1);
            _calcMatrix.appendScale(_loc6_.textureRatioX,_loc6_.textureRatioY,1);
            _loc5_.setProgramConstantsFromMatrix("vertex",0,_calcMatrix,true);
         }
      }
      
      override function deactivate(param1:Stage3DProxy) : void
      {
         var _loc2_:Context3D = param1._context3D;
         _loc2_.setVertexBufferAt(0,null);
         _loc2_.setVertexBufferAt(1,null);
         _loc2_.setVertexBufferAt(2,null);
         _loc2_.setVertexBufferAt(3,null);
      }
   }
}
