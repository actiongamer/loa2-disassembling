package away3d.materials.passes
{
   import flash.utils.Dictionary;
   import away3d.entities.Mesh;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.display3D.Context3D;
   import away3d.core.base.IRenderable;
   import away3d.core.base.SubMesh;
   import away3d.core.managers.Context3DProxy;
   import away3d.core.base.ISubGeometry;
   import away3d.core.base.Geometry;
   import away3d.core.base.SubGeometry;
   
   public class OutlinePass extends MaterialPassBase
   {
       
      
      private var _outlineColor:uint;
      
      private var _colorData:Vector.<Number>;
      
      private var _offsetData:Vector.<Number>;
      
      private var _showInnerLines:Boolean;
      
      private var _outlineMeshes:Dictionary;
      
      private var _dedicatedMeshes:Boolean;
      
      public function OutlinePass(param1:uint = 0, param2:Number = 20, param3:Boolean = true, param4:Boolean = false)
      {
         super();
         mipmap = false;
         _colorData = new Vector.<Number>(4,true);
         _colorData[3] = 1;
         _offsetData = new Vector.<Number>(4,true);
         this.outlineColor = param1;
         this.outlineSize = param2;
         _defaultCulling = "front";
         _numUsedStreams = 2;
         _numUsedVertexConstants = 6;
         _showInnerLines = param3;
         _dedicatedMeshes = param4;
         if(param4)
         {
            _outlineMeshes = new Dictionary();
         }
         _animatableAttributes = Vector.<String>(["va0"]);
         _animationTargetRegisters = Vector.<String>(["vt0"]);
      }
      
      public function clearDedicatedMesh(param1:Mesh) : void
      {
         var _loc2_:int = 0;
         if(_dedicatedMeshes)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.subMeshes.length)
            {
               disposeDedicated(param1.subMeshes[_loc2_]);
               _loc2_++;
            }
         }
      }
      
      private function disposeDedicated(param1:Object) : void
      {
         var _loc2_:* = null;
         _loc2_ = Mesh(_dedicatedMeshes[param1]);
         _loc2_.geometry.dispose();
         _loc2_.dispose();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_dedicatedMeshes)
         {
            var _loc3_:int = 0;
            var _loc2_:* = _outlineMeshes;
            for(var _loc1_ in _outlineMeshes)
            {
               disposeDedicated(_loc1_);
            }
         }
      }
      
      public function get showInnerLines() : Boolean
      {
         return _showInnerLines;
      }
      
      public function set showInnerLines(param1:Boolean) : void
      {
         _showInnerLines = param1;
      }
      
      public function get outlineColor() : uint
      {
         return _outlineColor;
      }
      
      public function set outlineColor(param1:uint) : void
      {
         _outlineColor = param1;
         _colorData[0] = (param1 >> 16 & 255) / 255;
         _colorData[1] = (param1 >> 8 & 255) / 255;
         _colorData[2] = (param1 & 255) / 255;
      }
      
      public function get outlineSize() : Number
      {
         return _offsetData[0];
      }
      
      public function set outlineSize(param1:Number) : void
      {
         _offsetData[0] = param1;
      }
      
      override function getVertexCode() : String
      {
         var _loc1_:* = null;
         _loc1_ = "mov vt1, va1 \nmul vt7, vt1, vc5.x\nadd vt7, vt7, vt0\nmov vt7.w, vt0.w\nm44 vt7, vt7, vc0\t\t\nmul op, vt7, vc4\n";
         return _loc1_;
      }
      
      override function getFragmentCode(param1:String) : String
      {
         return "mov oc, fc0\n";
      }
      
      override function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         var _loc5_:Context3D = param1._context3D;
         super.activate(param1,param2,param3,param4);
         if(!_showInnerLines)
         {
            _loc5_.setDepthTest(false,"less");
         }
         _loc5_.setProgramConstantsFromVector("fragment",0,_colorData,1);
         _loc5_.setProgramConstantsFromVector("vertex",5,_offsetData,1);
      }
      
      override function deactivate(param1:Stage3DProxy) : void
      {
         super.deactivate(param1);
         if(!_showInnerLines)
         {
            param1._context3D.setDepthTest(true,"less");
         }
      }
      
      override function render(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         if(_dedicatedMeshes)
         {
            var _loc7_:* = param1;
            var _loc8_:* = _outlineMeshes[_loc7_] || createDedicatedMesh(SubMesh(param1).subGeometry);
            _outlineMeshes[_loc7_] = _loc8_;
            _loc6_ = _loc8_;
            _loc5_ = _loc6_.subMeshes[0];
            _loc4_ = param2._context3D;
            _loc4_.setProgramConstantsFromMatrix("vertex",0,param1.modelViewProjection,true);
            _loc5_.activateVertexBuffer(0,param2);
            _loc5_.activateVertexNormalBuffer(1,param2);
            _loc4_.drawTriangles(_loc5_.getIndexBuffer(param2),0,_loc5_.numTriangles);
            Context3DProxy.drawCall++;
         }
         else
         {
            param1.activateVertexNormalBuffer(1,param2);
            _loc4_ = param2._context3D;
            _loc4_.setProgramConstantsFromMatrix("vertex",0,param1.modelViewProjection,true);
            param1.activateVertexBuffer(0,param2);
            _loc4_.drawTriangles(param1.getIndexBuffer(param2),0,param1.numTriangles);
            Context3DProxy.drawCall++;
         }
      }
      
      private function createDedicatedMesh(param1:ISubGeometry) : Mesh
      {
         var _loc2_:int = 0;
         var _loc17_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc18_:* = null;
         var _loc3_:int = 0;
         var _loc11_:int = 0;
         var _loc6_:* = 0;
         var _loc10_:int = 0;
         var _loc19_:Mesh = new Mesh(new Geometry(),null);
         var _loc13_:SubGeometry = new SubGeometry();
         var _loc4_:Array = [];
         var _loc7_:Vector.<uint> = param1.indexData;
         var _loc14_:Vector.<Number> = param1.vertexData;
         var _loc12_:Vector.<uint> = new Vector.<uint>();
         var _loc5_:Vector.<Number> = new Vector.<Number>();
         var _loc8_:int = _loc7_.length;
         var _loc9_:int = param1.vertexStride;
         var _loc15_:int = param1.vertexOffset;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc2_ = _loc15_ + _loc7_[_loc10_] * _loc9_;
            _loc20_ = _loc14_[_loc2_];
            _loc17_ = _loc14_[_loc2_ + 1];
            _loc16_ = _loc14_[_loc2_ + 2];
            _loc18_ = _loc20_.toPrecision(5) + "/" + _loc17_.toPrecision(5) + "/" + _loc16_.toPrecision(5);
            if(_loc4_[_loc18_])
            {
               _loc2_ = _loc4_[_loc18_] - 1;
            }
            else
            {
               _loc2_ = _loc11_ / 3;
               _loc4_[_loc18_] = _loc2_ + 1;
               _loc11_++;
               _loc5_[_loc11_] = _loc20_;
               _loc11_++;
               _loc5_[_loc11_] = _loc17_;
               _loc11_++;
               _loc5_[_loc11_] = _loc16_;
            }
            if(_loc2_ > _loc6_)
            {
               _loc6_ = _loc2_;
            }
            _loc3_++;
            _loc12_[_loc3_] = _loc2_;
            _loc10_++;
         }
         _loc13_.autoDeriveVertexNormals = true;
         _loc13_.updateVertexData(_loc5_);
         _loc13_.updateIndexData(_loc12_);
         _loc19_.geometry.addSubGeometry(_loc13_);
         return _loc19_;
      }
   }
}
