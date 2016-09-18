package away3d.core.managers
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.IndexBuffer3D;
   import flash.geom.Rectangle;
   import away3d.tools.utils.TextureUtils;
   import flash.events.Event;
   import away3d.events.Stage3DEvent;
   import flash.display3D.Context3D;
   
   public class RTTBufferManager extends EventDispatcher
   {
      
      private static var _instances:Dictionary;
       
      
      private var _renderToTextureVertexBuffer:VertexBuffer3D;
      
      private var _renderToScreenVertexBuffer:VertexBuffer3D;
      
      private var _indexBuffer:IndexBuffer3D;
      
      private var _stage3DProxy:away3d.core.managers.Stage3DProxy;
      
      private var _viewWidth:int = -1;
      
      private var _viewHeight:int = -1;
      
      private var _textureWidth:int = -1;
      
      private var _textureHeight:int = -1;
      
      private var _renderToTextureRect:Rectangle;
      
      private var _buffersInvalid:Boolean = true;
      
      private var _textureRatioX:Number;
      
      private var _textureRatioY:Number;
      
      public function RTTBufferManager(param1:SingletonEnforcer, param2:away3d.core.managers.Stage3DProxy)
      {
         super();
         if(!param1)
         {
            throw new Error("No cheating the multiton!");
         }
         _renderToTextureRect = new Rectangle();
         _stage3DProxy = param2;
         _stage3DProxy.addEventListener("Context3DRecreated",onContextRecreated);
      }
      
      public static function getInstance(param1:away3d.core.managers.Stage3DProxy) : RTTBufferManager
      {
         if(!param1)
         {
            throw new Error("stage3DProxy key cannot be null!");
         }
         if(!_instances)
         {
            _instances = new Dictionary();
         }
         var _loc2_:* = param1;
         var _loc3_:* = _instances[_loc2_] || new RTTBufferManager(new SingletonEnforcer(),param1);
         _instances[_loc2_] = _loc3_;
         return _loc3_;
      }
      
      public function get textureRatioX() : Number
      {
         if(_buffersInvalid)
         {
            updateRTTBuffers();
         }
         return _textureRatioX;
      }
      
      public function get textureRatioY() : Number
      {
         if(_buffersInvalid)
         {
            updateRTTBuffers();
         }
         return _textureRatioY;
      }
      
      public function get viewWidth() : int
      {
         return _viewWidth;
      }
      
      public function set viewWidth(param1:int) : void
      {
         if(param1 == _viewWidth)
         {
            return;
         }
         _viewWidth = param1;
         _buffersInvalid = true;
         _textureWidth = TextureUtils.getBestPowerOf2(_viewWidth);
         if(_textureWidth > _viewWidth)
         {
            _renderToTextureRect.x = uint((_textureWidth - _viewWidth) * 0.5);
            _renderToTextureRect.width = _viewWidth;
         }
         else
         {
            _renderToTextureRect.x = 0;
            _renderToTextureRect.width = _textureWidth;
         }
         dispatchEvent(new Event("resize"));
      }
      
      public function get viewHeight() : int
      {
         return _viewHeight;
      }
      
      public function set viewHeight(param1:int) : void
      {
         if(param1 == _viewHeight)
         {
            return;
         }
         _viewHeight = param1;
         _buffersInvalid = true;
         _textureHeight = TextureUtils.getBestPowerOf2(_viewHeight);
         if(_textureHeight > _viewHeight)
         {
            _renderToTextureRect.y = uint((_textureHeight - _viewHeight) * 0.5);
            _renderToTextureRect.height = _viewHeight;
         }
         else
         {
            _renderToTextureRect.y = 0;
            _renderToTextureRect.height = _textureHeight;
         }
         dispatchEvent(new Event("resize"));
      }
      
      public function get renderToTextureVertexBuffer() : VertexBuffer3D
      {
         if(_buffersInvalid)
         {
            updateRTTBuffers();
         }
         return _renderToTextureVertexBuffer;
      }
      
      public function get renderToScreenVertexBuffer() : VertexBuffer3D
      {
         if(_buffersInvalid)
         {
            updateRTTBuffers();
         }
         return _renderToScreenVertexBuffer;
      }
      
      public function get indexBuffer() : IndexBuffer3D
      {
         return _indexBuffer;
      }
      
      public function get renderToTextureRect() : Rectangle
      {
         if(_buffersInvalid)
         {
            updateRTTBuffers();
         }
         return _renderToTextureRect;
      }
      
      public function get textureWidth() : int
      {
         return _textureWidth;
      }
      
      public function get textureHeight() : int
      {
         return _textureHeight;
      }
      
      public function dispose() : void
      {
         delete _instances[_stage3DProxy];
         _stage3DProxy.removeEventListener("Context3DRecreated",onContextRecreated);
         if(_indexBuffer)
         {
            _indexBuffer.dispose();
            _renderToScreenVertexBuffer.dispose();
            _renderToTextureVertexBuffer.dispose();
            _renderToScreenVertexBuffer = null;
            _renderToTextureVertexBuffer = null;
            _indexBuffer = null;
         }
      }
      
      private function onContextRecreated(param1:Stage3DEvent) : void
      {
         _indexBuffer = null;
         _renderToTextureVertexBuffer = null;
         _renderToScreenVertexBuffer = null;
         updateRTTBuffers();
      }
      
      public function updateRTTBuffers() : void
      {
         var _loc7_:* = undefined;
         var _loc2_:* = undefined;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc6_:Context3D = _stage3DProxy.context3D;
         if(!_renderToTextureVertexBuffer)
         {
            _renderToTextureVertexBuffer = _loc6_.createVertexBuffer(4,5);
         }
         if(!_renderToScreenVertexBuffer)
         {
            _renderToScreenVertexBuffer = _loc6_.createVertexBuffer(4,5);
         }
         if(!_indexBuffer)
         {
            _indexBuffer = _loc6_.createIndexBuffer(6);
            _indexBuffer.uploadFromVector(new <uint>[2,1,0,3,2,0],0,6);
         }
         _loc9_ = Math.min(_viewWidth / _textureWidth,1);
         _textureRatioX = Math.min(_viewWidth / _textureWidth,1);
         _loc8_ = Math.min(_viewHeight / _textureHeight,1);
         _textureRatioY = Math.min(_viewHeight / _textureHeight,1);
         var _loc4_:Number = (1 - _loc9_) * 0.5;
         var _loc3_:Number = (_loc9_ + 1) * 0.5;
         var _loc1_:Number = (_loc8_ + 1) * 0.5;
         var _loc5_:Number = (1 - _loc8_) * 0.5;
         _loc7_ = new <Number>[-_loc9_,-_loc8_,_loc4_,_loc1_,0,_loc9_,-_loc8_,_loc3_,_loc1_,1,_loc9_,_loc8_,_loc3_,_loc5_,2,-_loc9_,_loc8_,_loc4_,_loc5_,3];
         _loc2_ = new <Number>[-1,-1,_loc4_,_loc1_,0,1,-1,_loc3_,_loc1_,1,1,1,_loc3_,_loc5_,2,-1,1,_loc4_,_loc5_,3];
         _renderToTextureVertexBuffer.uploadFromVector(_loc7_,0,4);
         _renderToScreenVertexBuffer.uploadFromVector(_loc2_,0,4);
         _buffersInvalid = false;
      }
   }
}

class SingletonEnforcer
{
    
   
   function SingletonEnforcer()
   {
      super();
   }
}
