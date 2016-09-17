package away3d.loaders.misc
{
   import flash.events.EventDispatcher;
   import away3d.loaders.parsers.ImageParser;
   import away3d.loaders.parsers.ParserBase;
   import flash.net.URLRequest;
   import flash.net.URLLoader;
   import flash.events.IOErrorEvent;
   import away3d.events.LoaderEvent;
   import flash.events.Event;
   import away3d.events.ParserEvent;
   import away3d.events.AssetEvent;
   import away3d.loaders.parsers.OBJParser;
   
   public class SingleFileLoader extends EventDispatcher
   {
      
      private static var _parsers:Vector.<Class> = Vector.<Class>([ImageParser]);
       
      
      private var _parser:ParserBase;
      
      private var _req:URLRequest;
      
      private var _fileExtension:String;
      
      private var _fileName:String;
      
      private var _loadAsRawData:Boolean;
      
      private var _data;
      
      public function SingleFileLoader()
      {
         super();
      }
      
      public static function enableParser(param1:Class) : void
      {
         if(_parsers.indexOf(param1) < 0)
         {
            _parsers.push(param1);
         }
      }
      
      public static function enableParsers(param1:Vector.<Class>) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(_loc2_ in param1)
         {
            enableParser(_loc2_);
         }
      }
      
      public function get url() : String
      {
         return !!_req?_req.url:"";
      }
      
      public function get data() : *
      {
         return _data;
      }
      
      public function get loadAsRawData() : Boolean
      {
         return _loadAsRawData;
      }
      
      public function load(param1:URLRequest, param2:ParserBase = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         _loadAsRawData = param3;
         _req = param1;
         decomposeFilename(_req.url);
         if(_loadAsRawData)
         {
            _loc5_ = "binary";
         }
         else
         {
            if(param2)
            {
               _parser = param2;
            }
            if(!_parser)
            {
               _parser = getParserFromSuffix();
            }
            if(_parser)
            {
               var _loc6_:* = _parser.dataFormat;
               if("binary" !== _loc6_)
               {
                  if("plainText" === _loc6_)
                  {
                     _loc5_ = "text";
                  }
               }
               else
               {
                  _loc5_ = "binary";
               }
            }
            else
            {
               _loc5_ = "binary";
            }
         }
         _loc4_ = new URLLoader();
         _loc4_.dataFormat = _loc5_;
         _loc4_.addEventListener("complete",handleUrlLoaderComplete);
         _loc4_.addEventListener("ioError",handleUrlLoaderError);
         _loc4_.load(param1);
      }
      
      public function parseData(param1:*, param2:ParserBase = null, param3:URLRequest = null) : void
      {
         if(param1 is Class)
         {
            param1 = new param1();
         }
         if(param2)
         {
            _parser = param2;
         }
         _req = param3;
         parse(param1);
      }
      
      public function get parser() : ParserBase
      {
         return _parser;
      }
      
      public function get dependencies() : Vector.<ResourceDependency>
      {
         return !!_parser?_parser.dependencies:new Vector.<ResourceDependency>();
      }
      
      private function decomposeFilename(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = param1.lastIndexOf(".");
         _loc2_ = param1.indexOf("?") > 0?param1.split("?")[0]:param1;
         _fileExtension = _loc2_.substr(_loc3_ + 1).toLowerCase();
         _fileName = _loc2_.substr(0,_loc3_);
      }
      
      private function getParserFromSuffix() : ParserBase
      {
         var _loc2_:int = 0;
         var _loc1_:uint = _parsers.length;
         _loc2_ = _loc1_ - 1;
         while(_loc2_ >= 0)
         {
            if(_parsers[_loc2_].supportsType(_fileExtension))
            {
               return new _parsers[_loc2_]();
            }
            _loc2_--;
         }
         return null;
      }
      
      private function getParserFromData(param1:*) : ParserBase
      {
         var _loc3_:int = 0;
         var _loc2_:uint = _parsers.length;
         _loc3_ = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if(_parsers[_loc3_].supportsData(param1))
            {
               return new _parsers[_loc3_]();
            }
            _loc3_--;
         }
         return null;
      }
      
      private function removeListeners(param1:URLLoader) : void
      {
         param1.removeEventListener("complete",handleUrlLoaderComplete);
         param1.removeEventListener("ioError",handleUrlLoaderError);
      }
      
      private function handleUrlLoaderError(param1:IOErrorEvent) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.currentTarget);
         removeListeners(_loc2_);
         if(hasEventListener("loadError"))
         {
            dispatchEvent(new LoaderEvent("loadError",_req.url,true,param1.text));
         }
      }
      
      private function handleUrlLoaderComplete(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.currentTarget);
         removeListeners(_loc2_);
         _data = _loc2_.data;
         if(_loadAsRawData)
         {
            dispatchEvent(new LoaderEvent("dependencyComplete"));
         }
         else
         {
            parse(_data);
         }
      }
      
      private function parse(param1:*) : void
      {
         var _loc2_:* = null;
         if(!_parser)
         {
            _parser = getParserFromData(param1);
         }
         if(_parser)
         {
            _parser.addEventListener("readyForDependencies",onReadyForDependencies);
            _parser.addEventListener("parseComplete",onParseComplete);
            _parser.addEventListener("assetComplete",onAssetComplete);
            _parser.addEventListener("animationSetComplete",onAssetComplete);
            _parser.addEventListener("animationStateComplete",onAssetComplete);
            _parser.addEventListener("animationNodeComplete",onAssetComplete);
            _parser.addEventListener("stateTransitionComplete",onAssetComplete);
            _parser.addEventListener("textureComplete",onAssetComplete);
            _parser.addEventListener("containerComplete",onAssetComplete);
            _parser.addEventListener("geometryComplete",onAssetComplete);
            _parser.addEventListener("materialComplete",onAssetComplete);
            _parser.addEventListener("meshComplete",onAssetComplete);
            _parser.addEventListener("entityComplete",onAssetComplete);
            _parser.addEventListener("skeletonComplete",onAssetComplete);
            _parser.addEventListener("skeletonPoseComplete",onAssetComplete);
            if(_req && _req.url)
            {
               _parser._fileName = _req.url;
            }
            _parser.parseAsync(param1);
         }
         else
         {
            _loc2_ = "No parser defined. To enable all parsers for auto-detection, use Parsers.enableAllBundled()";
            if(hasEventListener("loadError"))
            {
               this.dispatchEvent(new LoaderEvent("loadError","",true,_loc2_));
            }
            else
            {
               throw new Error(_loc2_);
            }
         }
      }
      
      private function onReadyForDependencies(param1:ParserEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onAssetComplete(param1:AssetEvent) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      private function onParseComplete(param1:ParserEvent) : void
      {
         this.dispatchEvent(new LoaderEvent("dependencyComplete",this.url));
         _parser.removeEventListener("readyForDependencies",onReadyForDependencies);
         _parser.removeEventListener("parseComplete",onParseComplete);
         _parser.removeEventListener("assetComplete",onAssetComplete);
         _parser.removeEventListener("animationSetComplete",onAssetComplete);
         _parser.removeEventListener("animationStateComplete",onAssetComplete);
         _parser.removeEventListener("animationNodeComplete",onAssetComplete);
         _parser.removeEventListener("stateTransitionComplete",onAssetComplete);
         _parser.removeEventListener("textureComplete",onAssetComplete);
         _parser.removeEventListener("containerComplete",onAssetComplete);
         _parser.removeEventListener("geometryComplete",onAssetComplete);
         _parser.removeEventListener("materialComplete",onAssetComplete);
         _parser.removeEventListener("meshComplete",onAssetComplete);
         _parser.removeEventListener("entityComplete",onAssetComplete);
         _parser.removeEventListener("skeletonComplete",onAssetComplete);
         _parser.removeEventListener("skeletonPoseComplete",onAssetComplete);
      }
      
      private function ont() : void
      {
         if(_parser is OBJParser)
         {
            _parser["_materialLoaded"] = null;
            _parser["_materialIDs"] = null;
            _parser["_materialSpecularData"] = null;
            _parser["_meshes"] = null;
            _parser["_vertices"] = null;
            _parser["_vertexNormals"] = null;
            _parser["_uvs"] = null;
            _parser = null;
         }
      }
   }
}
