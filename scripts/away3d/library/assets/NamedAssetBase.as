package away3d.library.assets
{
   import flash.events.EventDispatcher;
   import away3d.events.AssetEvent;
   
   public class NamedAssetBase extends EventDispatcher
   {
      
      public static const DEFAULT_NAMESPACE:String = "default";
       
      
      private var _originalName:String;
      
      private var _namespace:String;
      
      private var _name:String;
      
      private var _full_path:Array;
      
      public function NamedAssetBase(param1:String = null)
      {
         super();
         if(param1 == null)
         {
            param1 = "null";
         }
         _name = param1;
         _originalName = param1;
         updateFullPath();
      }
      
      public function get originalName() : String
      {
         return _originalName;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:* = null;
         _loc2_ = _name;
         _name = param1;
         if(_name == null)
         {
            _name = "null";
         }
         updateFullPath();
         if(hasEventListener("assetRename"))
         {
            dispatchEvent(new AssetEvent("assetRename",IAsset(this),_loc2_));
         }
      }
      
      public function get assetNamespace() : String
      {
         return _namespace;
      }
      
      public function get assetFullPath() : Array
      {
         return _full_path;
      }
      
      public function assetPathEquals(param1:String, param2:String) : Boolean
      {
         return _name == param1 && (!param2 || _namespace == param2);
      }
      
      public function resetAssetPath(param1:String, param2:String = null, param3:Boolean = true) : void
      {
         _name = !!param1?param1:"null";
         _namespace = !!param2?param2:"default";
         if(param3)
         {
            _originalName = _name;
         }
         updateFullPath();
      }
      
      private function updateFullPath() : void
      {
         _full_path = [_namespace,_name];
      }
   }
}
