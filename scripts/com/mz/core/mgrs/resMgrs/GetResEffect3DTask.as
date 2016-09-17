package com.mz.core.mgrs.resMgrs
{
   import com.mz.core.utils2.task.TaskBase;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.loaders.AssetLib;
   import com.mz.core.logging.Log;
   import org.specter3d.configs.particle.SpecterEffectData;
   import flash.utils.Dictionary;
   import org.specter3d.configs.particle.EmmiterData;
   import org.specter3d.display.avatar2.data.AnimData;
   import org.specter3d.configs.particle.SpecterParticleData;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.utils2.task.TaskPool;
   import org.specter3d.display.particle.EffectManager;
   
   public class GetResEffect3DTask extends TaskBase
   {
      
      private static var fakeLayer:ObjectContainer3D = new ObjectContainer3D();
      
      private static const REG:RegExp = /\\/g;
       
      
      public var isDebug:Boolean;
      
      private var baUrl:String;
      
      private var effectData:SpecterEffectData;
      
      private var assetsList:Array;
      
      public function GetResEffect3DTask(param1:String, param2:Boolean = false)
      {
         assetsList = [];
         this.isDebug = param2;
         super(param1);
      }
      
      public function get url() : String
      {
         return this.tag as String;
      }
      
      override public function exec() : void
      {
         super.exec();
         if(AssetLib.hasAsset(url))
         {
            onECTLoaded();
         }
         else
         {
            new GetRes3DTask(url).addHandlers(loadBaCpl,loadBaCplErr).exec();
         }
      }
      
      private function loadBaCpl(param1:String) : void
      {
         onECTLoaded();
      }
      
      private function loadBaCplErr(... rest) : void
      {
         Log.error(this,"缺少特效文件" + url);
         this.onComplete();
      }
      
      private function onECTLoaded(... rest) : void
      {
         if(AssetLib.hasAsset(url))
         {
            init(AssetLib.getData(url) as SpecterEffectData);
         }
         else
         {
            Log.error(this,"缺少特效文件" + url);
            this.onComplete();
         }
      }
      
      private function init(param1:SpecterEffectData) : void
      {
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:Dictionary = new Dictionary();
         effectData = param1;
         var _loc2_:int = 0;
         var _loc4_:int = effectData.emmiterArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc3_ = effectData.emmiterArr[_loc7_];
            _loc6_ = getUrl(_loc3_.url);
            if(!_loc5_.hasOwnProperty(_loc6_))
            {
               _loc2_++;
               _loc5_[_loc6_] = _loc3_;
               loadPleOneCpl(_loc6_,_loc3_);
            }
            _loc7_++;
         }
         this.loadPleListCpl();
      }
      
      private function loadPleOneCpl(param1:String, param2:EmmiterData) : void
      {
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         if(param2.modelUrl && param2.modelTextureUrl && param2.modelAction)
         {
            _loc6_ = new AnimData(param2.modelAction);
            addLoad(getUrl(param2.modelUrl));
            addLoad(getUrl(param2.modelTextureUrl));
            _loc4_ = param2.modelUrl.replace(REG,"/");
            _loc3_ = _loc4_.lastIndexOf("/");
            _loc4_ = _loc4_.substr(0,_loc3_ + 1);
            addLoad(getUrl(_loc4_ + param2.modelAction + ".act"));
         }
         var _loc5_:SpecterParticleData = param2.pData;
         if(_loc5_ == null)
         {
            Log.error(this,param1 + "发射器不存在");
         }
         else
         {
            loadPLEAssets(_loc5_);
         }
      }
      
      private function loadPLEAssets(param1:SpecterParticleData) : void
      {
         if(param1.meshData.shapeType == "external" && param1.meshData.url)
         {
            addLoad(getUrl(param1.meshData.url));
         }
         var _loc2_:Boolean = true;
         if(param1.meshData.materialType == "texture" && param1.meshData.textureUrl)
         {
            if(_loc2_)
            {
               addLoad(getUrl(param1.meshData.textureUrl.replace(".png",".dxt")));
            }
            else
            {
               addLoad(getUrl(param1.meshData.textureUrl));
            }
            if(param1.meshData.useMask && param1.meshData.maskUrl != "")
            {
               addLoad(getUrl(param1.meshData.maskUrl));
            }
         }
      }
      
      private function addLoad(param1:String) : void
      {
         if(!AssetLib.hasAsset(param1))
         {
            assetsList.push(param1);
         }
      }
      
      private function loadPleListCpl() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         ArrayUtil.removeRepeat(assetsList);
         if(assetsList.length == 0)
         {
            this.onComplete();
         }
         else
         {
            _loc1_ = new TaskPool();
            _loc2_ = this.assetsList.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_.addTask(new GetRes3DTask(assetsList[_loc3_]));
               _loc3_++;
            }
            _loc1_.stopWhenError = false;
            _loc1_.addHandlers(loadAssetsListCpl);
            _loc1_.exec();
         }
      }
      
      private function loadAssetsListCpl(param1:String) : void
      {
         this.assetsList.length = 0;
         this.onComplete();
      }
      
      private function getUrl(param1:String) : String
      {
         return EffectManager.resourcePath + param1;
      }
   }
}
