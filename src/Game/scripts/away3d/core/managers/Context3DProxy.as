package away3d.core.managers
{
   import flash.display3D.Context3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.textures.CubeTexture;
   import flash.display3D.textures.TextureBase;
   import flash.display3D.textures.Texture;
   import flash.display.BitmapData;
   
   public class Context3DProxy
   {
      
      private static var _stage3DProxy:away3d.core.managers.Stage3DProxy;
      
      public static var drawCall:uint = 0;
      
      public static var drawUICall:uint = 0;
      
      public static var vbCount:int = 0;
      
      public static var ibCount:int = 0;
      
      public static var texCount:int = 0;
      
      public static var programCount:int = 0;
      
      public static var meshCount:int = 0;
      
      public static var calcTimes:uint = 0;
      
      public static var _vbUploadCount:int = 0;
      
      public static var _ibUploadCount:int = 0;
      
      public static var _bmpUploadCount:int = 0;
       
      
      public function Context3DProxy()
      {
         super();
      }
      
      public static function setStage3DProxy(param1:away3d.core.managers.Stage3DProxy) : void
      {
         _stage3DProxy = param1;
      }
      
      public static function get stage3DIndex() : int
      {
         return stage3DProxy.stage3DIndex;
      }
      
      public static function get stage3DProxy() : away3d.core.managers.Stage3DProxy
      {
         return _stage3DProxy;
      }
      
      public static function get context3D() : Context3D
      {
         return _stage3DProxy._context3D;
      }
      
      public static function createProgram(param1:int = 0) : Program3D
      {
         programCount = Number(programCount) + 1;
         return _stage3DProxy._context3D.createProgram();
      }
      
      public static function disposeProgram(param1:Program3D) : void
      {
         param1.dispose();
         programCount = Number(programCount) - 1;
      }
      
      public static function createVertexBuffer(param1:int, param2:int) : VertexBuffer3D
      {
         vbCount = Number(vbCount) + 1;
         return _stage3DProxy._context3D.createVertexBuffer(param1,param2);
      }
      
      public static function disposeVertexBuffer(param1:VertexBuffer3D) : void
      {
         param1.dispose();
         vbCount = Number(vbCount) - 1;
      }
      
      public static function createIndexBuffer(param1:int) : IndexBuffer3D
      {
         ibCount = Number(ibCount) + 1;
         return _stage3DProxy._context3D.createIndexBuffer(param1);
      }
      
      public static function disposeIndexBuffer(param1:IndexBuffer3D) : void
      {
         param1.dispose();
         ibCount = Number(ibCount) - 1;
      }
      
      public static function createCubeTexture(param1:int, param2:String, param3:Boolean) : CubeTexture
      {
         texCount = Number(texCount) + 1;
         return _stage3DProxy._context3D.createCubeTexture(param1,param2,param3);
      }
      
      public static function disposeTexture(param1:TextureBase) : void
      {
         param1.dispose();
         texCount = Number(texCount) - 1;
      }
      
      public static function drawTriangles(param1:IndexBuffer3D, param2:int = 0, param3:int = -1) : void
      {
         drawCall = Number(drawCall) + 1;
         _stage3DProxy._context3D.drawTriangles(param1,param2,param3);
      }
      
      public static function uploadVertexBufferFromVector(param1:VertexBuffer3D, param2:Vector.<Number>, param3:int, param4:int) : void
      {
         param1.uploadFromVector(param2,param3,param4);
         _vbUploadCount = Number(_vbUploadCount) + 1;
      }
      
      public static function uploadIndexBufferFromVector(param1:IndexBuffer3D, param2:Vector.<uint>, param3:int, param4:int) : void
      {
         param1.uploadFromVector(param2,param3,param4);
         _ibUploadCount = Number(_ibUploadCount) + 1;
      }
      
      public static function uploadTextureFromBitmapData(param1:Texture, param2:BitmapData, param3:uint = 0) : void
      {
         param1.uploadFromBitmapData(param2,param3);
         _bmpUploadCount = Number(_bmpUploadCount) + 1;
      }
      
      public static function uploadCubeTextureFromBitmapData(param1:CubeTexture, param2:BitmapData, param3:uint, param4:uint = 0) : void
      {
         param1.uploadFromBitmapData(param2,param3,param4);
         _bmpUploadCount = Number(_bmpUploadCount) + 1;
      }
      
      public static function reset() : void
      {
         drawUICall = 0;
         drawCall = 0;
         _bmpUploadCount = 0;
         _ibUploadCount = 0;
         _vbUploadCount = 0;
         calcTimes = 0;
      }
   }
}
