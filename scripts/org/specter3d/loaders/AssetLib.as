package org.specter3d.loaders
{
   import org.specter3d.utils.HashMap;
   import away3d.textures.ATFTexture;
   import away3d.library.assets.IAsset;
   import org.specter3d.loaders.parsers.data.ImageObject;
   import flash.utils.ByteArray;
   import flash.display.Loader;
   import org.specter3d.loaders.parsers.data.ShareBitmapData;
   import org.specter3d.debug.DevLog;
   import away3d.animators.nodes.AnimationNodeBase;
   import away3d.animators.AnimationSetBase;
   import flash.display.BitmapData;
   import away3d.textures.BitmapTexture;
   import org.specter3d.debug.DebugEngineLog;
   import org.specter3d.loaders.parsers.data.MaskCodeSet;
   import flash.system.ApplicationDomain;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import away3d.entities.Entity;
   import away3d.core.base.Geometry;
   import away3d.materials.MaterialBase;
   import away3d.entities.Mesh;
   import flash.display.MovieClip;
   import away3d.entities.SegmentSet;
   import away3d.animators.data.Skeleton;
   import away3d.animators.data.SkeletonPose;
   import com.mz.core.mgrs.VerListMgr;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.display.particle.EffectManager;
   import com.mz.core.logging.Log;
   
   public class AssetLib
   {
      
      private static const ENCRYPTION_TYPES:String = ".xml|.png|.jpg|.swf|.mov";
      
      public static const CAM_TYPE:String = ".cam";
      
      public static const DDS_TYPE:String = ".dds";
      
      public static const ECT_TYPE:String = ".ect";
      
      public static const EXCEL_TYPE:String = ".excel";
      
      public static const GRP_TYPE:String = ".grp";
      
      public static const JPG_TYPE:String = ".jpg";
      
      public static const NMP_TYPE:String = ".nmp";
      
      public static const PACK_TYPE:String = ".pack";
      
      public static const PLE_TYPE:String = ".ple";
      
      public static const PNG_TYPE:String = ".png";
      
      public static const S3D_TYPE:String = ".s3d";
      
      public static const ACT_TYPE:String = ".act";
      
      public static const SWF_TYPE:String = ".swf";
      
      public static const C3D_TYPE:String = ".3ds";
      
      public static const MP3_TYPE:String = ".mp3";
      
      public static const SSD_TYPE:String = ".ssd";
      
      public static const MOV_TYPE:String = ".mov";
      
      public static const UIE_TYPE:String = ".uie";
      
      public static const XML_TYPE:String = ".xml";
      
      public static const NAV_TYPE:String = ".nav";
      
      public static const MAPBIN_TYPE:String = ".mapbin";
      
      public static const SCE_TYPE:String = ".sce";
      
      public static const MD5_MESH_TYPE:String = ".md5mesh";
      
      public static const MD5_ANIM_TYPE:String = ".md5anim";
      
      public static const PROTOCOL_TYPE:String = ".protocol";
      
      public static const DZIP_TYPE:String = ".dzip";
      
      public static const VZIP_TYPE:String = ".vzip";
      
      public static var VERSION:String;
      
      public static var isNetResource:Boolean;
      
      public static var RESSTATIC:String = "";
      
      public static var relativePath:String = "";
      
      public static var GAPP_VERSION:Boolean;
      
      public static var resourceHashes:HashMap = new HashMap();
      
      private static var _assetGroupInfoLib:HashMap = new HashMap();
      
      private static var _assetLib:HashMap = new HashMap();
      
      private static var encryption_array:String = "0|4|15|17|22|56|126|128|177|254|312|488|599|688|799|955|1569|3005|4888|5000|5011|5012|5023|8784|25894|56849|102546|451236";
      
      private static var _encryptionList:Array;
      
      private static var _encryptionListLen:int;
      
      private static const BMD_CLASS_CHAR:String = "~";
      
      public static var needClearAll:Boolean = false;
       
      
      public function AssetLib()
      {
         super();
      }
      
      public static function delAsset(param1:String, param2:String = "default_group", param3:Boolean = true) : void
      {
         var _loc5_:int = 0;
         if(param3)
         {
            param1 = operationUrlByVersion(param1);
         }
         var _loc4_:Array = _assetGroupInfoLib.getValue(param2) as Array;
         if(_loc4_ != null)
         {
            _loc5_ = _loc4_.indexOf(param1);
            _loc5_ != -1 && _loc4_.splice(_loc5_,1);
            disposeAsset(param1);
         }
      }
      
      private static function disposeAsset(param1:String) : void
      {
         var _loc2_:* = null;
         try
         {
            _loc2_ = _assetLib.remove(param1);
            if(_loc2_ is ATFTexture)
            {
               (_loc2_ as ATFTexture).disposeAtf_real();
            }
            else if(_loc2_ is IAsset)
            {
               _loc2_.dispose();
            }
            else if(_loc2_ is ImageObject)
            {
               _loc2_.dispose();
            }
            else if(_loc2_ is S3DObject)
            {
               _loc2_.dispose();
            }
            else if(_loc2_ is ByteArray)
            {
               _loc2_.clear();
            }
            else if(_loc2_ is Loader)
            {
               (_loc2_ as Loader).unloadAndStop();
            }
            else if(_loc2_ is ShareBitmapData)
            {
               (_loc2_ as ShareBitmapData).dispose_real();
            }
            return;
         }
         catch(e:Error)
         {
            DevLog.warning("dispose() " + param1 + " error!");
            return;
         }
      }
      
      public static function decomposeFileSuffix(param1:String) : String
      {
         if(!param1)
         {
            return "";
         }
         var _loc2_:int = param1.lastIndexOf(".");
         var _loc3_:String = param1.substr(_loc2_);
         return _loc3_;
      }
      
      public static function checkLocalAndDevelopServer(param1:Boolean = false) : Boolean
      {
         if(AssetLib.RESSTATIC == "" || AssetLib.RESSTATIC.indexOf("http://test.res.mf.youzu.com") != -1)
         {
            return true;
         }
         if(param1 && AssetLib.RESSTATIC.indexOf("http://static.mfwz.youzu.com") != -1)
         {
            return true;
         }
         return false;
      }
      
      public static function checkResourceServer() : Boolean
      {
         if(RESSTATIC == "" && isNetResource)
         {
            return true;
         }
         return RESSTATIC != ""?true:false;
      }
      
      public static function operationByteArray(param1:ByteArray, param2:String) : ByteArray
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         if(checkResourceServer() && param2.indexOf(AssetLib.relativePath) != -1 && ".xml|.png|.jpg|.swf|.mov".indexOf(decomposeFileSuffix(param2)) != -1)
         {
            if(_encryptionList == null)
            {
               _encryptionList = encryption_array.split("|");
               _encryptionListLen = _encryptionList.length;
            }
            _loc4_ = param1.bytesAvailable;
            _loc5_ = 0;
            while(_loc5_ < _encryptionListLen)
            {
               _loc3_ = _encryptionList[_loc5_];
               if(_loc3_ < _loc4_)
               {
                  param1[_loc3_] = param1[_loc3_] ^ 171;
               }
               _loc5_++;
            }
            param1.position = 0;
            return param1;
         }
         return null;
      }
      
      public static function disposeAll() : void
      {
         var _loc1_:Array = _assetGroupInfoLib.keySet();
         while(_loc1_.length)
         {
            disposeGroup(_loc1_.pop());
         }
      }
      
      public static function disposeGroup(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = _assetGroupInfoLib.remove(param1) as Array;
         if(_loc2_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc3_ = _loc2_[_loc4_];
               disposeAsset(_loc3_);
               _loc4_++;
            }
         }
      }
      
      public static function getAnimationNode(param1:String) : Vector.<AnimationNodeBase>
      {
         var _loc2_:S3DObject = getS3D(param1);
         return !_loc2_?null:_loc2_.animationNodes;
      }
      
      public static function getAnimationSet(param1:String) : AnimationSetBase
      {
         var _loc2_:S3DObject = getS3D(param1);
         return !_loc2_?null:_loc2_["animationSet"];
      }
      
      public static function hasBitmapData(param1:String) : Boolean
      {
         var _loc2_:BitmapData = _assetLib.getValue(operationUrlByVersion(param1)) as BitmapData;
         return _loc2_ is BitmapData;
      }
      
      public static function getBitmapData(param1:String) : BitmapData
      {
         var _loc2_:BitmapData = _assetLib.getValue(operationUrlByVersion(param1)) as BitmapData;
         return _loc2_;
      }
      
      public static function getBitmapTexture(param1:String, param2:Boolean = true) : BitmapTexture
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:String = operationUrlByVersion(param1);
         var _loc5_:BitmapTexture = null;
         var _loc3_:Object = _assetLib.getValue(_loc4_);
         if(_loc3_ is BitmapData)
         {
            _loc6_ = new ImageObject(_loc3_ as ShareBitmapData);
            if(param2)
            {
               _loc6_.group == "default_group";
            }
            putAsset(_loc4_,_loc6_,_loc6_.group);
            _loc5_ = _loc6_.bitmapTexture;
         }
         else if(_loc3_ is ImageObject)
         {
            _loc5_ = (_loc3_ as ImageObject).bitmapTexture;
         }
         if(_loc5_ == null)
         {
            _loc7_ = param1 + "  贴图不存在！";
            DebugEngineLog.toWindowError(_loc7_);
         }
         return _loc5_;
      }
      
      public static function getBytes(param1:String) : ByteArray
      {
         return _assetLib.getValue(operationUrlByVersion(param1)) as ByteArray;
      }
      
      public static function getATFTexture(param1:String) : ATFTexture
      {
         var _loc2_:Object = _assetLib.getValue(operationUrlByVersion(param1));
         var _loc3_:ATFTexture = _loc2_ as ATFTexture;
         if(_loc2_ is ByteArray)
         {
            _loc3_ = new ATFTexture(_loc2_ as ByteArray,param1);
            _assetLib.put(operationUrlByVersion(param1),_loc3_);
         }
         if(_loc3_ && _loc3_.atfData)
         {
            return _loc3_;
         }
         return null;
      }
      
      public static function getData(param1:String) : Object
      {
         return _assetLib.getValue(operationUrlByVersion(param1));
      }
      
      public static function getMask(param1:String, param2:int) : MaskCodeSet
      {
         var _loc3_:HashMap = _assetLib.getValue(operationUrlByVersion(param1)) as HashMap;
         var _loc4_:MaskCodeSet = _loc3_.getValue(param2) as MaskCodeSet;
         _loc4_.index = 0;
         return _loc4_;
      }
      
      public static function getDefinition(param1:String, param2:String) : Object
      {
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc5_:String = operationUrlByVersion(param1);
         _loc4_ = getBitmapData(_loc5_ + "~" + param2);
         if(_loc4_)
         {
            return _loc4_;
         }
         var _loc6_:ApplicationDomain = getDomain(param1);
         if(!_loc6_)
         {
            return null;
         }
         try
         {
            _loc8_ = _loc6_.getDefinition(param2) as Class;
         }
         catch(e:Error)
         {
            var _loc10_:* = null;
            return _loc10_;
         }
         var _loc3_:* = new _loc8_();
         if(_loc3_ is BitmapData)
         {
            _loc4_ = _loc3_ as BitmapData;
            _loc7_ = new ShareBitmapData(_loc4_.width,_loc4_.height,_loc4_.transparent);
            _loc7_.copyPixels(_loc4_,new Rectangle(0,0,_loc4_.width,_loc4_.height),new Point());
            _loc7_.url = _loc5_ + "~" + param2;
            _loc4_.dispose();
            _loc4_ = null;
            _loc3_ = null;
            putAsset(_loc7_.url,_loc7_,"default_group");
            return _loc7_;
         }
         return _loc3_;
      }
      
      public static function getDomain(param1:String) : ApplicationDomain
      {
         return ApplicationDomain(_assetLib.getValue(operationUrlByVersion(param1)));
      }
      
      public static function getEntity(param1:String) : Entity
      {
         var _loc2_:S3DObject = getS3D(param1);
         return !_loc2_?null:_loc2_["entity"];
      }
      
      public static function getGeometry(param1:String) : Geometry
      {
         var _loc2_:S3DObject = getS3D(param1);
         return !_loc2_?null:_loc2_["geometry"];
      }
      
      public static function getMaterial(param1:String) : MaterialBase
      {
         var _loc2_:S3DObject = getS3D(param1);
         return !_loc2_?null:_loc2_["material"];
      }
      
      public static function getMesh(param1:String) : Mesh
      {
         var _loc2_:S3DObject = getS3D(param1);
         return !_loc2_?null:_loc2_["mesh"];
      }
      
      public static function getMovieClip(param1:String, param2:String) : MovieClip
      {
         var _loc3_:ApplicationDomain = getDomain(param1);
         if(!_loc3_ || _loc3_.hasDefinition(param2) == false)
         {
            return null;
         }
         var _loc4_:Class = _loc3_.getDefinition(param2) as Class;
         var _loc5_:MovieClip = new _loc4_() as MovieClip;
         if(_loc5_)
         {
            _loc5_.stop();
         }
         return _loc5_;
      }
      
      public static function getS3D(param1:String) : S3DObject
      {
         var _loc2_:S3DObject = _assetLib.getValue(operationUrlByVersion(param1)) as S3DObject;
         return _loc2_;
      }
      
      public static function getS3DaddRefCount(param1:String) : S3DObject
      {
         var _loc2_:String = operationUrlByVersion(param1);
         var _loc3_:S3DObject = _assetLib.getValue(_loc2_) as S3DObject;
         if(_loc3_)
         {
            _loc3_.refCount = _loc3_.refCount + 1;
         }
         return _loc3_;
      }
      
      public static function costS3dRefCount(param1:String) : void
      {
         var _loc2_:String = operationUrlByVersion(param1);
         var _loc3_:S3DObject = _assetLib.getValue(_loc2_) as S3DObject;
         if(_loc3_)
         {
            _loc3_.refCount = _loc3_.refCount - 1;
            if(_loc3_.refCount <= 0)
            {
            }
         }
      }
      
      public static function getSegmentSet(param1:String) : SegmentSet
      {
         var _loc2_:S3DObject = getS3D(operationUrlByVersion(param1));
         return !_loc2_?null:_loc2_["segmentSet"];
      }
      
      public static function getSkeleton(param1:String) : Skeleton
      {
         var _loc2_:S3DObject = getS3D(param1);
         return !_loc2_?null:_loc2_["skeleton"];
      }
      
      public static function getSkeletonPose(param1:String) : SkeletonPose
      {
         var _loc2_:S3DObject = getS3D(param1);
         return !_loc2_?null:_loc2_["skeletonPose"];
      }
      
      public static function operationUrlByVersion(param1:String) : String
      {
         return param1;
      }
      
      public static function getResourceURL(param1:String) : String
      {
         param1 = relativePath + param1;
         var _loc2_:String = AssetLib.resourceHashes.getValue(param1) as String;
         return !!_loc2_?param1 + "?" + _loc2_:param1;
      }
      
      public static function getXml(param1:String) : XML
      {
         return _assetLib.getValue(operationUrlByVersion(param1)) as XML;
      }
      
      public static function urlRequest(param1:String) : String
      {
         var _loc2_:String = AssetLib.resourceHashes.getValue(param1) as String;
         param1 = !!_loc2_?param1 + "?" + _loc2_:param1;
         param1 = VerListMgr.ins.addUrlVer(param1);
         return param1;
      }
      
      public static function hasAsset(param1:String) : Boolean
      {
         if(param1 != null)
         {
            param1 = param1.replace(relativePath,"");
            return _assetLib.containsKey(operationUrlByVersion(param1));
         }
         return false;
      }
      
      public static function hasAssets(param1:Array) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(!hasAsset(_loc2_))
            {
               return false;
            }
         }
         return true;
      }
      
      public static function hasAssetByGroup(param1:String, param2:String) : Boolean
      {
         var _loc3_:Array = _assetGroupInfoLib.getValue(param2) as Array;
         if(!_loc3_)
         {
            return false;
         }
         var _loc4_:int = _loc3_.indexOf(param1);
         return _loc4_ != -1?true:false;
      }
      
      public static function putAsset(param1:String, param2:Object, param3:String = "default_group") : void
      {
         if(_assetGroupInfoLib.getValue(param3) == null)
         {
            _assetGroupInfoLib.put(param3,[]);
         }
         _assetLib.put(param1,param2);
         if((_assetGroupInfoLib.getValue(param3) as Array).indexOf(param1) == -1)
         {
            (_assetGroupInfoLib.getValue(param3) as Array).push(param1);
         }
      }
      
      static function getRepeatResources(param1:String) : Object
      {
         return _assetLib.getValue(param1);
      }
      
      public static function clearAssetLib(param1:Array = null) : void
      {
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc5_:Array = [];
         AppGlobalContext.animatorManager.clearAll();
         EffectManager.clearAll();
         AppGlobalContext.QueueLoader.clean();
         AppGlobalContext.asynLoader.clean();
         if(!needClearAll)
         {
            if(param1 != null)
            {
               _loc4_ = param1.length;
               _loc7_ = 0;
               while(_loc7_ < _loc4_)
               {
                  _loc6_ = param1[_loc7_];
                  _loc6_ = operationUrlByVersion(_loc6_);
                  _loc5_.push(_loc6_);
                  _loc7_++;
               }
            }
         }
         var _loc2_:Array = _assetLib.keySet();
         _loc4_ = _loc2_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc3_ = _loc2_[_loc7_];
            if(_loc5_.indexOf(_loc3_) == -1)
            {
               delAsset(_loc3_,"default_group",false);
            }
            _loc7_++;
         }
         Log.info(AssetLib,"clearAssetLib","leave size:",_assetLib.size());
      }
      
      public static function loaderCallBack(param1:Function) : void
      {
      }
      
      public static function throwError(param1:Error) : void
      {
         var _loc2_:ErrorLogEvent = new ErrorLogEvent("errorlog");
         _loc2_.data = param1;
         AppGlobalContext.stage2d.dispatchEvent(_loc2_);
         throw param1;
      }
   }
}
