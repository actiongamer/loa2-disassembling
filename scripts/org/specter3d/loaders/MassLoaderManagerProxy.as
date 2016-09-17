package org.specter3d.loaders
{
   import org.specter3d.utils.HashMap;
   import morn.core.managers.MassLoaderManager;
   import morn.core.utils.PathUtil;
   import morn.core.handlers.Handler;
   import flash.display.BitmapData;
   import org.specter3d.loaders.parsers.data.ShareBitmapData;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import com.mz.core.logging.Log;
   import com.mz.core.net.LoadByteTask;
   import flash.display.LoaderInfo;
   import flash.display.Bitmap;
   import away3d.loaders.parsers.ParserBase;
   import org.specter3d.debug.DevLog;
   import away3d.events.AssetEvent;
   import away3d.library.assets.IAsset;
   import away3d.animators.nodes.AnimationNodeBase;
   import flash.events.Event;
   import away3d.events.ParserEvent;
   import org.specter3d.utils.FunctionDelegate;
   import org.specter3d.loaders.parsers.PackParsers;
   import org.specter3d.loaders.parsers.S3DMeshParsers;
   import org.specter3d.loaders.parsers.S3DAnimParsers;
   import org.specter3d.loaders.parsers.XMLParsers;
   import org.specter3d.loaders.parsers.NavParsers;
   import org.specter3d.loaders.parsers.MapBinParser;
   import org.specter3d.loaders.parsers.DDSParsers;
   import org.specter3d.loaders.parsers.CameraParser;
   import away3d.loaders.parsers.MD5MeshParser;
   import away3d.loaders.parsers.MD5AnimParser;
   import org.specter3d.loaders.parsers.ExcelFileParser;
   import org.specter3d.loaders.parsers.UIEParsers;
   import org.specter3d.loaders.parsers.SCEParser;
   import org.specter3d.loaders.parsers.PLEParser;
   import org.specter3d.loaders.parsers.ECTParser;
   import org.specter3d.loaders.parsers.ProtocolParser;
   import org.specter3d.loaders.parsers.C3DSParser;
   import org.specter3d.loaders.parsers.VZipParsers;
   import org.specter3d.loaders.parsers.SSDParser;
   import away3d.loaders.parsers.OBJParser;
   import org.specter3d.loaders.parsers.BaParser;
   
   public class MassLoaderManagerProxy implements ILoader
   {
      
      public static const folder3d:String = "3d/";
      
      public static const NO_3D:String = "__no3d/";
      
      private static var _parserClassSet:HashMap = new HashMap();
       
      
      public var loadingVoLib:Object;
      
      public function MassLoaderManagerProxy()
      {
         loadingVoLib = {};
         super();
         registerParserAll();
      }
      
      public function get loaderMgr() : MassLoaderManager
      {
         return App.mloader;
      }
      
      public function loadOne(param1:ResourceVo, param2:Function = null, param3:String = "default_group") : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:ResourceVo = loadingVoLib[param1.url];
         if(_loc6_)
         {
            if(param2)
            {
               _loc6_.handlers.addHandler(param2);
            }
            if(param1.callBackFunction)
            {
               _loc6_.handlers.addHandler(param1.callBackFunction);
            }
         }
         else
         {
            loadingVoLib[param1.url] = param1;
            if(param2)
            {
               param1.handlers.addHandler(param2);
            }
            if(param1.callBackFunction)
            {
               param1.handlers.addHandler(param1.callBackFunction);
            }
            param1.callBackFunction = null;
         }
         if(AssetLib.hasAsset(param1.url))
         {
            end(param1.url);
         }
         else if(param1.rawBa)
         {
            nextParse(param1.url,param1.rawBa);
         }
         else
         {
            _loc4_ = realUrl(param1.url);
            _loc5_ = PathUtil.parseSuffix(_loc4_);
            if(_loc5_ == "png" || _loc5_ == "jpg")
            {
               loaderMgr.loadBMD(_loc4_,3,new Handler(load_complete,[param1.url]),null,new Handler(load_error,[param1.url]),false);
            }
            else
            {
               loaderMgr.loadBYTE(_loc4_,3,new Handler(load_complete,[param1.url]),null,new Handler(load_error,[param1.url]),false);
            }
         }
      }
      
      private function realUrl(param1:String) : String
      {
         var _loc2_:* = null;
         if(param1.indexOf("__no3d/") == 0)
         {
            _loc2_ = param1.replace("__no3d/","");
         }
         else
         {
            _loc2_ = "3d/" + param1;
         }
         return _loc2_;
      }
      
      public function loads(param1:Vector.<ResourceVo>, param2:Function = null, param3:String = "default_group") : void
      {
      }
      
      public function load_complete(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:ResourceVo = loadingVoLib[param1];
         if(_loc4_ != null)
         {
            if(param2 is BitmapData)
            {
               _loc3_ = param2 as BitmapData;
               _loc5_ = new ShareBitmapData(_loc3_.width,_loc3_.height,_loc3_.transparent);
               _loc5_.copyPixels(_loc3_,new Rectangle(0,0,_loc3_.width,_loc3_.height),new Point());
               _loc5_.url = param1;
               _loc3_ = null;
               AssetLib.putAsset(param1,_loc5_,"default_group");
               this.end(param1);
            }
            else if(param2 is ByteArray)
            {
               nextParse(param1,param2);
            }
         }
         else
         {
            Log.info(this,"is null");
         }
      }
      
      public function load_error(param1:String) : void
      {
         var _loc2_:ResourceVo = loadingVoLib[param1];
         Log.warn(this,"载入失败:" + param1);
         this.parseFinished(param1);
      }
      
      private function nextParse(param1:String, param2:ByteArray) : void
      {
         if(param2 == null)
         {
            parseFinished(param1);
            return;
         }
         var _loc4_:ByteArray = AssetLib.operationByteArray(param2,param1);
         var _loc3_:String = decomposeFileSuffix(param1);
         if(_loc3_ == ".jpg" || _loc3_ == ".png" || _loc3_ == ".swf" || _loc3_ == ".mov")
         {
            new LoadByteTask(!!_loc4_?_loc4_:param2).addCompleteHandler(new Handler(onLoadBytesDone,[param1])).exec();
         }
         else
         {
            this.parseData(param1,!!_loc4_?_loc4_:param2);
            parseFinished(param1);
         }
      }
      
      private function onLoadBytesDone(param1:String, param2:LoadByteTask) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:LoaderInfo = param2.loader.contentLoaderInfo;
         var _loc4_:String = decomposeFileSuffix(param1);
         if(_loc4_ == ".jpg" || _loc4_ == ".png" || _loc4_ == ".swf" || _loc4_ == ".mov")
         {
            if(_loc4_ == ".swf")
            {
               AssetLib.putAsset(param1,_loc6_.applicationDomain);
            }
            else if(_loc4_ == ".mov")
            {
               AssetLib.putAsset(param1,_loc6_.loader);
            }
            else
            {
               _loc3_ = Bitmap(_loc6_.content).bitmapData;
               try
               {
                  _loc5_ = new ShareBitmapData(_loc3_.width,_loc3_.height,_loc3_.transparent);
                  _loc5_.copyPixels(_loc3_,new Rectangle(0,0,_loc3_.width,_loc3_.height),new Point());
                  _loc5_.url = param1;
                  _loc3_ = null;
                  AssetLib.putAsset(param1,_loc5_,"default_group");
               }
               catch(e:Error)
               {
                  AssetLib.putAsset(param1,null,"default_group");
                  Log.error(this,param1,e.message);
               }
            }
         }
         parseFinished(param1);
      }
      
      protected function parseData(param1:String, param2:Object) : Boolean
      {
         var _loc3_:* = null;
         try
         {
            _loc3_ = getParserFromSuffix(param1);
            if(_loc3_)
            {
               _loc3_.name = param1;
               _loc3_.addEventListener("assetComplete",onAssetComplete,false,1000);
               _loc3_.addEventListener("parseComplete",onCurrentParseComplete);
               _loc3_.addEventListener("parseError",parserFileError);
               _loc3_.parseAsync(param2);
               var _loc5_:Boolean = true;
               return _loc5_;
            }
            AssetLib.putAsset(param1,param2);
            var _loc6_:Boolean = false;
            return _loc6_;
         }
         catch(err:Error)
         {
            DevLog.warning("解析失败:" + param1 + "\n" + err + "\n" + err.getStackTrace());
            var _loc7_:Boolean = false;
            return _loc7_;
         }
         return false;
      }
      
      protected function onAssetComplete(param1:AssetEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:ParserBase = param1.currentTarget as ParserBase;
         var _loc5_:ResourceVo = this.loadingVoLib[_loc4_.name];
         var _loc2_:S3DObject = null;
         if(param1.asset && param1.asset is IAsset)
         {
            _loc2_ = AssetLib.getRepeatResources(_loc5_.url) as S3DObject;
            _loc2_ = _loc2_ || new S3DObject();
            _loc3_ = param1.asset as IAsset;
            var _loc6_:* = _loc3_.assetType;
            if("animationSet" !== _loc6_)
            {
               if("animationState" !== _loc6_)
               {
                  if("animationNode" !== _loc6_)
                  {
                     if("stateTransition" !== _loc6_)
                     {
                        if("texture" !== _loc6_)
                        {
                           if("container" !== _loc6_)
                           {
                              if("geometry" !== _loc6_)
                              {
                                 if("material" !== _loc6_)
                                 {
                                    if("mesh" !== _loc6_)
                                    {
                                       if("skeleton" !== _loc6_)
                                       {
                                          if("skeletonPose" !== _loc6_)
                                          {
                                             if("entity" !== _loc6_)
                                             {
                                                if("segmentSet" === _loc6_)
                                                {
                                                   _loc2_["segmentSet"] = _loc3_;
                                                }
                                             }
                                             else
                                             {
                                                _loc2_["entity"] = _loc3_;
                                             }
                                          }
                                          else
                                          {
                                             _loc2_["skeletonPose"] = _loc3_;
                                          }
                                       }
                                       else
                                       {
                                          _loc2_["skeleton"] = _loc3_;
                                       }
                                    }
                                    else
                                    {
                                       _loc2_["mesh"] = _loc3_;
                                    }
                                 }
                                 else
                                 {
                                    _loc2_["material"] = _loc3_;
                                 }
                              }
                              else
                              {
                                 _loc2_["geometry"] = _loc3_;
                              }
                           }
                           else
                           {
                              _loc2_["container"] = _loc3_;
                           }
                        }
                        else
                        {
                           _loc2_["texture"] = _loc3_;
                        }
                     }
                     else
                     {
                        _loc2_["stateTransition"] = _loc3_;
                     }
                  }
                  else
                  {
                     _loc2_.animationNodes = _loc2_.animationNodes || new Vector.<AnimationNodeBase>();
                     (_loc3_ as AnimationNodeBase).url = _loc5_.url;
                     _loc2_.animationNodes.push(_loc3_);
                  }
               }
               else
               {
                  _loc2_["animationState"] = _loc3_;
               }
            }
            else
            {
               _loc2_["animationSet"] = _loc3_;
            }
            AssetLib.putAsset(_loc5_.url,_loc2_);
            return;
         }
         if(param1.asset != null)
         {
            AssetLib.putAsset(_loc5_.url,param1.asset);
         }
      }
      
      protected function parserFileError(param1:Event) : void
      {
         var _loc3_:ParserBase = param1.currentTarget as ParserBase;
         var _loc2_:String = _loc3_.name;
         var _loc4_:ResourceVo = this.loadingVoLib[_loc2_];
         _loc3_.removeEventListener("parseError",parserFileError);
         _loc3_.removeEventListener("assetComplete",onAssetComplete);
         _loc3_.removeEventListener("parseComplete",onCurrentParseComplete);
         parseFinished(_loc2_);
      }
      
      protected function onCurrentParseComplete(param1:ParserEvent) : void
      {
         var _loc4_:* = null;
         var _loc3_:ParserBase = param1.currentTarget as ParserBase;
         var _loc2_:String = _loc3_.name;
         if(_loc4_)
         {
            _loc4_ = this.loadingVoLib[_loc2_];
            _loc3_.removeEventListener("parseError",parserFileError);
            _loc3_.removeEventListener("assetComplete",onAssetComplete);
            _loc3_.removeEventListener("parseComplete",onCurrentParseComplete);
            _loc3_.parsingFailure = false;
            this.parseFinished(_loc2_);
         }
      }
      
      private function parseFinished(param1:String) : void
      {
         this.end(param1);
      }
      
      private function end(param1:String) : void
      {
         var _loc2_:ResourceVo = this.loadingVoLib[param1];
         if(_loc2_)
         {
            delete this.loadingVoLib[param1];
            Handler.execute(_loc2_.handlers,[param1]);
            if(_loc2_.callBackFunction)
            {
               AssetLib.loaderCallBack(FunctionDelegate.create(_loc2_.callBackFunction,_loc2_.url));
            }
         }
      }
      
      public function clean() : void
      {
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = this.loadingVoLib;
         for(var _loc1_ in this.loadingVoLib)
         {
            _loc2_.push(realUrl(_loc1_));
         }
         loadingVoLib = {};
         loaderMgr.stopAndClearLoadArr(_loc2_);
      }
      
      public function isLoading() : Boolean
      {
         return loaderMgr._loaderCount > 0;
      }
      
      public function registerParser(param1:String, param2:Class) : void
      {
         var _loc3_:* = _parserClassSet.getValue(param1);
      }
      
      public function registerParserAll() : void
      {
         registerParser(".pack",PackParsers);
         registerParser(".s3d",S3DMeshParsers);
         registerParser(".act",S3DAnimParsers);
         registerParser(".xml",XMLParsers);
         registerParser(".nmp",NavParsers);
         registerParser(".mapbin",MapBinParser);
         registerParser(".dds",DDSParsers);
         registerParser(".cam",CameraParser);
         registerParser(".md5mesh",MD5MeshParser);
         registerParser(".md5anim",MD5AnimParser);
         registerParser(".excel",ExcelFileParser);
         registerParser(".uie",UIEParsers);
         registerParser(".sce",SCEParser);
         registerParser(".ple",PLEParser);
         registerParser(".ect",ECTParser);
         registerParser(".protocol",ProtocolParser);
         registerParser(".3ds",C3DSParser);
         registerParser(".vzip",VZipParsers);
         registerParser(".ssd",SSDParser);
         registerParser(".obj",OBJParser);
         registerParser(".ba",BaParser);
      }
      
      protected function decomposeFileSuffix(param1:String) : String
      {
         if(!param1)
         {
            return "";
         }
         var _loc2_:int = param1.lastIndexOf(".");
         var _loc3_:String = param1.substr(_loc2_);
         return _loc3_.toLocaleLowerCase();
      }
      
      private function getParserFromSuffix(param1:String) : ParserBase
      {
         var _loc4_:* = null;
         var _loc3_:String = decomposeFileSuffix(param1);
         var _loc2_:* = _parserClassSet.getValue(_loc3_);
         if(_loc2_ is Class)
         {
            _loc4_ = new _loc2_();
            _loc4_.parserType = _loc3_;
            return _loc4_;
         }
         return null;
      }
   }
}

import org.specter3d.loaders.ResourceVo;

class AsynLoaderObj
{
    
   
   public var vo:ResourceVo;
   
   public var callback:Function;
   
   private var _group:String;
   
   public var total:int;
   
   public var count:int;
   
   function AsynLoaderObj()
   {
      super();
   }
   
   public function get group() : String
   {
      return _group;
   }
   
   public function set group(param1:String) : void
   {
      if(param1 == null)
      {
         throw new Error("group null???");
      }
      _group = param1;
   }
}
