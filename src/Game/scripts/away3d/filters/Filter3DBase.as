package away3d.filters
{
   import away3d.filters.tasks.Filter3DTaskBase;
   import flash.display3D.textures.Texture;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import away3d.core.traverse.EntityCollector;
   
   public class Filter3DBase
   {
       
      
      private var _tasks:Vector.<Filter3DTaskBase>;
      
      private var _requireDepthRender:Boolean;
      
      private var _textureWidth:int;
      
      private var _textureHeight:int;
      
      public function Filter3DBase()
      {
         super();
         _tasks = new Vector.<Filter3DTaskBase>();
      }
      
      public function get requireDepthRender() : Boolean
      {
         return _requireDepthRender;
      }
      
      protected function addTask(param1:Filter3DTaskBase) : void
      {
         _tasks.push(param1);
         if(!_requireDepthRender)
         {
            _requireDepthRender = param1.requireDepthRender;
         }
      }
      
      public function get tasks() : Vector.<Filter3DTaskBase>
      {
         return _tasks;
      }
      
      public function getMainInputTexture(param1:Stage3DProxy) : Texture
      {
         return _tasks[0].getMainInputTexture(param1);
      }
      
      public function get textureWidth() : int
      {
         return _textureWidth;
      }
      
      public function set textureWidth(param1:int) : void
      {
         var _loc2_:int = 0;
         _textureWidth = param1;
         _loc2_ = 0;
         while(_loc2_ < _tasks.length)
         {
            _tasks[_loc2_].textureWidth = param1;
            _loc2_++;
         }
      }
      
      public function get textureHeight() : int
      {
         return _textureHeight;
      }
      
      public function set textureHeight(param1:int) : void
      {
         var _loc2_:int = 0;
         _textureHeight = param1;
         _loc2_ = 0;
         while(_loc2_ < _tasks.length)
         {
            _tasks[_loc2_].textureHeight = param1;
            _loc2_++;
         }
      }
      
      public function setRenderTargets(param1:Texture, param2:Stage3DProxy) : void
      {
         _tasks[_tasks.length - 1].target = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _tasks.length)
         {
            _tasks[_loc1_].dispose();
            _loc1_++;
         }
      }
      
      public function update(param1:Stage3DProxy, param2:Camera3D) : void
      {
      }
      
      public function filterRender(param1:Stage3DProxy, param2:EntityCollector, param3:Number, param4:Number) : void
      {
      }
   }
}
