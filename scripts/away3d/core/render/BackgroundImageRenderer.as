package away3d.core.render
{
   import flash.display3D.Program3D;
   import away3d.textures.Texture2DBase;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.VertexBuffer3D;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.Context3D;
   import away3d.core.managers.Context3DProxy;
   import com.adobe.utils.AGALMiniAssembler;
   import away3d.debug.Debug;
   
   public class BackgroundImageRenderer
   {
       
      
      private var _program3d:Program3D;
      
      private var _texture:Texture2DBase;
      
      private var _indexBuffer:IndexBuffer3D;
      
      private var _vertexBuffer:VertexBuffer3D;
      
      private var _stage3DProxy:Stage3DProxy;
      
      public function BackgroundImageRenderer(param1:Stage3DProxy)
      {
         super();
         this.stage3DProxy = param1;
      }
      
      public function get stage3DProxy() : Stage3DProxy
      {
         return _stage3DProxy;
      }
      
      public function set stage3DProxy(param1:Stage3DProxy) : void
      {
         if(param1 == _stage3DProxy)
         {
            return;
         }
         _stage3DProxy = param1;
         if(_vertexBuffer)
         {
            _vertexBuffer.dispose();
            _vertexBuffer = null;
            _program3d.dispose();
            _program3d = null;
            _indexBuffer.dispose();
            _indexBuffer = null;
         }
      }
      
      private function getVertexCode() : String
      {
         return "mov op, va0\nmov v0, va1";
      }
      
      private function getFragmentCode() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = _texture.format;
         if("compressed" !== _loc2_)
         {
            if("compressedAlpha" !== _loc2_)
            {
               _loc1_ = "";
            }
            else
            {
               _loc1_ = "dxt5,";
            }
         }
         else
         {
            _loc1_ = "dxt1,";
         }
         return "tex ft0, v0, fs0 <2d, " + _loc1_ + "linear>\t\n" + "mov oc, ft0";
      }
      
      public function dispose() : void
      {
         if(_vertexBuffer)
         {
            _vertexBuffer.dispose();
         }
         if(_program3d)
         {
            _program3d.dispose();
         }
      }
      
      public function render() : void
      {
         var _loc1_:Context3D = _stage3DProxy.context3D;
         if(!_loc1_)
         {
            return;
         }
         if(!_vertexBuffer)
         {
            initBuffers(_loc1_);
         }
         _stage3DProxy.setProgram(_program3d);
         _stage3DProxy.setTextureAt(0,_texture.getTextureForStage3D(_stage3DProxy));
         _loc1_.setVertexBufferAt(0,_vertexBuffer,0,"float2");
         _loc1_.setVertexBufferAt(1,_vertexBuffer,2,"float2");
         _loc1_.drawTriangles(_indexBuffer,0,2);
         Context3DProxy.drawCall++;
         _loc1_.setVertexBufferAt(0,null);
         _loc1_.setVertexBufferAt(1,null);
         _stage3DProxy.setTextureAt(0,null);
      }
      
      private function initBuffers(param1:Context3D) : void
      {
         _vertexBuffer = param1.createVertexBuffer(4,4);
         _program3d = param1.createProgram();
         _indexBuffer = param1.createIndexBuffer(6);
         _indexBuffer.uploadFromVector(Vector.<uint>([2,1,0,3,2,0]),0,6);
         _program3d.upload(new AGALMiniAssembler(Debug.active).assemble("vertex",getVertexCode()),new AGALMiniAssembler(Debug.active).assemble("fragment",getFragmentCode()));
         _vertexBuffer.uploadFromVector(Vector.<Number>([-1,-1,0,1,1,-1,1,1,1,1,1,0,-1,1,0,0]),0,4);
      }
      
      public function get texture() : Texture2DBase
      {
         return _texture;
      }
      
      public function set texture(param1:Texture2DBase) : void
      {
         _texture = param1;
      }
   }
}
