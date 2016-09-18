package org.specter3d.display.particle
{
   import com.mz.core.interFace.IObserver;
   import org.specter3d.loaders.ILoader;
   import org.specter3d.utils.HashMap;
   import away3d.filters.HeatFilter3D;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.configs.particle.SpecterEffectData;
   import org.specter3d.loaders.AssetLib;
   import flash.events.Event;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import org.specter3d.configs.particle.EmmiterData;
   import org.specter3d.configs.particle.SpecterParticleData;
   import org.specter3d.debug.DebugEngineLog;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.utils.FunctionDelegate;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class EffectManager implements IObserver
   {
      
      public static var avatarObject:Class;
      
      public static const EFFECT_NUM_LIMITED:int = 120;
      
      public static var totalEmpty:Number = 0;
      
      public static var totalEffects:Number = 0;
      
      public static var totalEmmiters:Number = 0;
      
      public static var statesCounts:Number = 0;
      
      public static var isEditor:Boolean = false;
      
      public static var resourcePath:String = "particle/";
      
      public static var parserTime:Number = 0;
      
      public static var parserCount:Number = 0;
      
      public static var parserAverage:Number = 0;
      
      public static var parserMax:Number = 0;
      
      public static var loader:ILoader = AppGlobalContext.QueueLoader;
      
      private static var _particleDrivers:HashMap = new HashMap();
      
      private static var _effectAvatarCacheMap:HashMap = new HashMap();
      
      private static var _effectVec:Vector.<org.specter3d.display.particle.SpecterEffect> = new Vector.<org.specter3d.display.particle.SpecterEffect>();
      
      private static var _heatFilter3D:HeatFilter3D;
      
      private static var _cbOnCreat:Function;
       
      
      public function EffectManager()
      {
         super();
         ObserverMgr.ins.regObserver(this);
      }
      
      public static function init(param1:Class) : void
      {
         EffectManager.avatarObject = param1;
      }
      
      public static function addHeatFilter() : void
      {
         if(AppGlobalContext.PlayQuality != 3)
         {
            return;
         }
         if(_heatFilter3D == null)
         {
            _heatFilter3D = new HeatFilter3D();
         }
         AppGlobalContext.addFillter(_heatFilter3D);
      }
      
      public static function disposeHeatFilter() : void
      {
         if(_heatFilter3D == null)
         {
            return;
         }
         AppGlobalContext.removeFillter(_heatFilter3D);
         _heatFilter3D.dispose();
         _heatFilter3D = null;
      }
      
      public static function createEffect(param1:String, param2:Boolean, param3:* = null, param4:Function = null, param5:Number = 0, param6:Boolean = true, param7:int = 1, param8:String = "default_group", param9:Function = null, param10:Boolean = false) : org.specter3d.display.particle.SpecterEffect
      {
         $url = param1;
         $prepareClear = param2;
         $parent = param3;
         $callback = param4;
         $lifeTime = param5;
         $autoPlay = param6;
         $level = param7;
         $group = param8;
         $onComplete = param9;
         sDisabled = param10;
         onBaLoaded = function():void
         {
            if(__specterEffect.isDispose)
            {
               return;
            }
            return;
            §§push(onECTLoaded());
         };
         onECTLoaded = function():void
         {
            if(__specterEffect.isDispose)
            {
               return;
            }
            var effectData:SpecterEffectData = AssetLib.getData($url) as SpecterEffectData;
            if(effectData)
            {
               if($onComplete != null)
               {
                  onComplete = function(param1:Event):void
                  {
                     __specterEffect.removeEventListener("complete",onComplete);
                  };
                  __specterEffect.addEventListener("complete",onComplete);
               }
               __specterEffect.init(effectData);
            }
            else if($onComplete != null)
            {
               $onComplete(__specterEffect);
            }
            if($callback != null)
            {
               $callback(__specterEffect);
            }
         };
         var __specterEffect:org.specter3d.display.particle.SpecterEffect = new org.specter3d.display.particle.SpecterEffect($parent,$lifeTime,$group,sDisabled);
         __specterEffect.autoPlay = $autoPlay;
         __specterEffect.url = $url;
         __specterEffect.prepareClear = $prepareClear;
         _effectVec.push(__specterEffect);
         if(_cbOnCreat != null && $autoPlay)
         {
            _cbOnCreat(__specterEffect);
         }
         if(true && (totalEffects - totalEmpty > 120 && $lifeTime > 0 && $onComplete == null))
         {
            __specterEffect.isEmpty = true;
            totalEmpty = Number(totalEmpty) + 1;
            if($callback != null)
            {
               $callback(__specterEffect);
            }
         }
         else
         {
            if(AssetLib.hasAsset($url))
            {
               onECTLoaded();
            }
            else
            {
               new GetResEffect3DTask($url).addCompleteHandler(onBaLoaded).exec();
            }
            __specterEffect.isEmpty = false;
         }
         return __specterEffect;
      }
      
      public static function createEmmiter(param1:EmmiterData, param2:Function, param3:Number = 0, param4:int = 0, param5:Boolean = true, param6:String = "default_group", param7:Number = 1) : void
      {
         $emmiterData = param1;
         $onLoaded = param2;
         $timeOffset = param3;
         $disposeType = param4;
         $autoPlay = param5;
         $group = param6;
         $speedRate = param7;
         onPLELoaded = function():void
         {
            var _loc2_:* = null;
            var _loc1_:* = null;
            var _loc3_:* = null;
            if($emmiterData.pData)
            {
               _loc1_ = $emmiterData.pData;
            }
            else
            {
               _loc1_ = AssetLib.getData(__url) as SpecterParticleData;
            }
            if(isEditor)
            {
               if($emmiterData.keyFrames.length == 0 && _loc1_.keyFrames.length > 0)
               {
                  $emmiterData.keyFrames = _loc1_.keyFrames;
                  $emmiterData.isKeyFramesLoop = _loc1_.isKeyFramesLoop;
               }
               _loc2_ = new ParticleDirver(_loc1_,__url,$group);
            }
            else
            {
               _loc2_ = _particleDrivers.getValue(__url) as ParticleDirver;
               if(_loc2_ == null)
               {
                  if(_loc1_ == null)
                  {
                     _loc3_ = __url + "发射器不存在";
                     DebugEngineLog.toWindowError(_loc3_);
                     return;
                     §§push($onLoaded(null));
                  }
                  else
                  {
                     _loc1_.keyFrames = $emmiterData.keyFrames;
                     _loc2_ = new ParticleDirver(_loc1_,__url,$group);
                     if(_loc1_.meshData.shapeType != "avatar")
                     {
                        _particleDrivers.put(__url,_loc2_);
                     }
                  }
               }
            }
         };
         totalEmmiters = Number(totalEmmiters) + 1;
         var __url:String = getUrl($emmiterData.url);
         if($emmiterData.url && $emmiterData.url.indexOf(" ") != -1)
         {
            DebugEngineLog.toWindowError($emmiterData.url + "路径不可带空格");
         }
         if(AssetLib.hasAsset(__url) || $emmiterData.pData)
         {
            onPLELoaded();
         }
         else
         {
            loader.loadOne(new ResourceVo(__url,1),FunctionDelegate.create(onPLELoaded),$group);
         }
      }
      
      public static function removeEffect(param1:org.specter3d.display.particle.SpecterEffect, param2:Function = null, param3:Boolean = false) : void
      {
         if(param1.isDispose)
         {
            return;
         }
         param1.clear(param2);
         var _loc4_:int = _effectVec.indexOf(param1);
         if(_loc4_ != -1)
         {
            _effectVec.splice(_loc4_,1);
         }
      }
      
      public static function clearAll() : void
      {
         eachDriver = function(param1:ParticleDirver):void
         {
            try
            {
               param1.dispose();
               return;
            }
            catch(err:Error)
            {
               return;
            }
         };
         eachAvatar = function(param1:AvatarBody3D):void
         {
            try
            {
               param1.dispose();
               return;
            }
            catch(err:Error)
            {
               return;
            }
         };
         _particleDrivers.forEach(eachDriver);
         _particleDrivers.clear();
         var i:int = 0;
         while(i < _effectVec.length)
         {
            try
            {
               _effectVec[i].clean();
            }
            catch(err:Error)
            {
            }
            i = i + 1;
         }
         _effectVec.length = 0;
         SpecterParticle.cleanCache();
         _effectAvatarCacheMap.forEach(eachAvatar);
         _effectAvatarCacheMap.clear();
      }
      
      public static function getUrl(param1:String) : String
      {
         return resourcePath + param1;
      }
      
      public static function setTriggerHandler(param1:Function, param2:Function) : void
      {
         _cbOnCreat = param1;
         org.specter3d.display.particle.SpecterEffect.setCallbackOnTrigger(param2);
      }
      
      public static function disposeEffectAvatar(param1:AvatarBody3D) : void
      {
         if(_effectAvatarCacheMap.containsKey(param1.modelUrl))
         {
            param1.dispose();
         }
         else if(param1.body)
         {
            param1.stopFrame();
            _effectAvatarCacheMap.put(param1.modelUrl,param1);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_SWITCH_BATTLE_PLAY_QUALITY"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(AppGlobalContext.PlayQuality == 3)
         {
            addHeatFilter();
         }
         else
         {
            disposeHeatFilter();
         }
      }
   }
}
