package away3d.loaders.misc
{
   import flash.net.URLRequest;
   import away3d.library.assets.IAsset;
   import away3d.loaders.parsers.ParserBase;
   
   public class ResourceDependency
   {
       
      
      private var _id:String;
      
      private var _req:URLRequest;
      
      private var _assets:Vector.<IAsset>;
      
      private var _parentParser:ParserBase;
      
      private var _data;
      
      private var _retrieveAsRawData:Boolean;
      
      private var _suppressAssetEvents:Boolean;
      
      private var _dependencies:Vector.<away3d.loaders.misc.ResourceDependency>;
      
      var loader:away3d.loaders.misc.SingleFileLoader;
      
      var success:Boolean;
      
      public function ResourceDependency(param1:String, param2:URLRequest, param3:*, param4:ParserBase, param5:Boolean = false, param6:Boolean = false)
      {
         super();
         _id = param1;
         _req = param2;
         _parentParser = param4;
         _data = param3;
         _retrieveAsRawData = param5;
         _suppressAssetEvents = param6;
         _assets = new Vector.<IAsset>();
         _dependencies = new Vector.<away3d.loaders.misc.ResourceDependency>();
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get assets() : Vector.<IAsset>
      {
         return _assets;
      }
      
      public function get dependencies() : Vector.<away3d.loaders.misc.ResourceDependency>
      {
         return _dependencies;
      }
      
      public function get request() : URLRequest
      {
         return _req;
      }
      
      public function get retrieveAsRawData() : Boolean
      {
         return _retrieveAsRawData;
      }
      
      public function get suppresAssetEvents() : Boolean
      {
         return _suppressAssetEvents;
      }
      
      public function get data() : *
      {
         return _data;
      }
      
      function setData(param1:*) : void
      {
         _data = param1;
      }
      
      public function get parentParser() : ParserBase
      {
         return _parentParser;
      }
      
      public function resolve() : void
      {
         if(_parentParser)
         {
            _parentParser.resolveDependency(this);
         }
      }
      
      public function resolveFailure() : void
      {
         if(_parentParser)
         {
            _parentParser.resolveDependencyFailure(this);
         }
      }
   }
}
