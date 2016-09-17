package away3d.core.render
{
   import away3d.filters.tasks.Filter3DTaskBase;
   import flash.display3D.textures.Texture;
   import away3d.core.managers.RTTBufferManager;
   import away3d.core.managers.Stage3DProxy;
   import away3d.events.Stage3DEvent;
   import flash.events.Event;
   import away3d.filters.Filter3DBase;
   import away3d.cameras.Camera3D;
   import flash.display3D.Context3D;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.VertexBuffer3D;
   import away3d.core.managers.Context3DProxy;
   
   public class Filter3DRenderer
   {
       
      
      private var _filters:Array;
      
      private var _tasks:Vector.<Filter3DTaskBase>;
      
      private var _filterTasksInvalid:Boolean;
      
      private var _mainInputTexture:Texture;
      
      private var _requireDepthRender:Boolean;
      
      private var _rttManager:RTTBufferManager;
      
      private var _stage3DProxy:Stage3DProxy;
      
      private var _filterSizesInvalid:Boolean = true;
      
      public function Filter3DRenderer(param1:Stage3DProxy)
      {
         super();
         _stage3DProxy = param1;
         _stage3DProxy.addEventListener("Context3DRecreated",onContext3DRecreated);
         _rttManager = RTTBufferManager.getInstance(param1);
         _rttManager.addEventListener("resize",onRTTResize);
      }
      
      private function onContext3DRecreated(param1:Stage3DEvent) : void
      {
         _filterSizesInvalid = true;
      }
      
      private function onRTTResize(param1:Event) : void
      {
         _filterSizesInvalid = true;
      }
      
      public function get requireDepthRender() : Boolean
      {
         return _requireDepthRender;
      }
      
      public function getMainInputTexture(param1:Stage3DProxy) : Texture
      {
         if(_filterTasksInvalid)
         {
            updateFilterTasks(param1);
         }
         return _mainInputTexture;
      }
      
      public function get filters() : Array
      {
         return _filters;
      }
      
      public function set filters(param1:Array) : void
      {
         var _loc2_:int = 0;
         _filters = param1;
         _filterTasksInvalid = true;
         _requireDepthRender = false;
         if(!_filters)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _filters.length)
         {
            if(!_requireDepthRender)
            {
               _requireDepthRender = _filters[_loc2_].requireDepthRender;
            }
            _loc2_++;
         }
         _filterSizesInvalid = true;
      }
      
      private function updateFilterTasks(param1:Stage3DProxy) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = null;
         var _loc4_:* = 0;
         if(_filterSizesInvalid)
         {
            updateFilterSizes();
         }
         if(!_filters)
         {
            _tasks = null;
            return;
         }
         _tasks = new Vector.<Filter3DTaskBase>();
         _loc2_ = uint(_filters.length - 1);
         _loc4_ = uint(0);
         while(_loc4_ <= _loc2_)
         {
            _loc3_ = _filters[_loc4_];
            _loc3_.setRenderTargets(_loc4_ == _loc2_?null:Filter3DBase(_filters[_loc4_ + 1]).getMainInputTexture(param1),param1);
            _tasks = _tasks.concat(_loc3_.tasks);
            _loc4_++;
         }
         _mainInputTexture = _filters[0].getMainInputTexture(param1);
      }
      
      public function render(param1:Stage3DProxy, param2:Camera3D, param3:Texture) : void
      {
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:* = null;
         var _loc6_:Context3D = param1.context3D;
         var _loc5_:IndexBuffer3D = _rttManager.indexBuffer;
         var _loc8_:VertexBuffer3D = _rttManager.renderToTextureVertexBuffer;
         if(!_filters)
         {
            return;
         }
         if(_filterSizesInvalid)
         {
            updateFilterSizes();
         }
         if(_filterTasksInvalid)
         {
            updateFilterTasks(param1);
         }
         _loc7_ = _filters.length;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _filters[_loc9_].update(param1,param2);
            _loc9_++;
         }
         _loc7_ = _tasks.length;
         if(_loc7_ > 1)
         {
            _loc6_.setVertexBufferAt(0,_loc8_,0,"float2");
            _loc6_.setVertexBufferAt(1,_loc8_,2,"float2");
         }
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc4_ = _tasks[_loc9_];
            param1.setRenderTarget(_loc4_.target);
            if(!_loc4_.target)
            {
               param1.scissorRect = null;
               _loc8_ = _rttManager.renderToScreenVertexBuffer;
               _loc6_.setVertexBufferAt(0,_loc8_,0,"float2");
               _loc6_.setVertexBufferAt(1,_loc8_,2,"float2");
            }
            param1.setTextureAt(0,_loc4_.getMainInputTexture(param1));
            param1.setProgram(_loc4_.getProgram3D(param1));
            _loc6_.clear(0,0,0,0);
            _loc4_.activate(param1,param2,param3);
            _loc6_.setBlendFactors("one","zero");
            _loc6_.drawTriangles(_loc5_,0,2);
            Context3DProxy.drawCall++;
            _loc4_.deactivate(param1);
            _loc9_++;
         }
         param1.setTextureAt(0,null);
         _loc6_.setVertexBufferAt(0,null);
         _loc6_.setVertexBufferAt(1,null);
      }
      
      private function updateFilterSizes() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _filters.length)
         {
            _filters[_loc1_].textureWidth = _rttManager.textureWidth;
            _filters[_loc1_].textureHeight = _rttManager.textureHeight;
            _loc1_++;
         }
         _filterSizesInvalid = true;
      }
      
      public function dispose() : void
      {
         _rttManager.removeEventListener("resize",onRTTResize);
         _rttManager = null;
         _stage3DProxy.removeEventListener("Context3DRecreated",onContext3DRecreated);
         _stage3DProxy = null;
      }
   }
}
