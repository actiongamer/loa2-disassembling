package morn.core.managers
{
   import morn.core.handlers.Handler;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.utils.ArrayUtil;
   
   public class MassLoaderManager
   {
       
      
      private var _maxLoader:int = 3;
      
      public var _loaderCount:int = 0;
      
      private var loadingResMap:Object;
      
      private var waitResArr:Array;
      
      private var loadingResArr:Vector.<morn.core.managers.IResLoader>;
      
      private var _maxPriority:uint = 5;
      
      public function MassLoaderManager()
      {
         var _loc1_:int = 0;
         loadingResMap = {};
         waitResArr = [];
         loadingResArr = new Vector.<morn.core.managers.IResLoader>();
         super();
         _loc1_ = 0;
         while(_loc1_ < _maxPriority)
         {
            waitResArr[_loc1_] = [];
            _loc1_++;
         }
      }
      
      private function load(param1:String, param2:uint, param3:uint = 1, param4:Handler = null, param5:Handler = null, param6:Handler = null, param7:Boolean = true) : void
      {
         var _loc9_:* = null;
         var _loc8_:ResInfo = loadingResMap[param1];
         if(_loc8_ == null)
         {
            _loc9_ = new ResInfo();
            _loc9_.url = param1;
            _loc9_.type = param2;
            _loc9_.isCache = param7;
            _loc9_.priority = param3;
            if(param4)
            {
               _loc9_.completeHandlers.addHandler(param4);
            }
            if(param5)
            {
               _loc9_.progressHandlers.addHandler(param5);
            }
            if(param6)
            {
               _loc9_.errorHandlers.addHandler(param6);
            }
            loadingResMap[param1] = _loc9_;
            param3 = param3 < _maxPriority?param3:_maxPriority - 1;
            waitResArr[param3].push(_loc9_);
            checkNext();
         }
         else
         {
            if(param4)
            {
               _loc8_.completeHandlers.addHandler(param4);
            }
            if(param5)
            {
               _loc8_.progressHandlers.addHandler(param5);
            }
            if(param6)
            {
               _loc8_.errorHandlers.addHandler(param6);
            }
         }
      }
      
      private function checkNext() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_loaderCount >= _maxLoader)
         {
            return;
         }
         _loc3_ = 0;
         while(_loc3_ < _maxPriority)
         {
            _loc1_ = waitResArr[_loc3_];
            while(_loc1_.length > 0)
            {
               _loc2_ = _loc1_.shift();
               doLoad(_loc2_);
               if(_loaderCount >= _maxLoader)
               {
                  return;
               }
            }
            _loc3_++;
         }
      }
      
      private function doLoad(param1:ResInfo) : void
      {
         var _loc2_:* = null;
         _loaderCount = Number(_loaderCount) + 1;
         if(ClientConfig.airData == null)
         {
            _loc2_ = new ResLoader();
         }
         else
         {
            _loc2_ = new AirResLoader();
         }
         loadingResArr.push(_loc2_);
         _loc2_.load(param1.url,param1.type,new Handler(loadComplete,[_loc2_,param1]),new Handler(loadProgress,[param1]),param1.isCache);
      }
      
      private function loadProgress(param1:ResInfo, param2:Number) : void
      {
         Handler.execute(param1.progressHandlers,[param2]);
      }
      
      private function loadComplete(param1:morn.core.managers.IResLoader, param2:ResInfo, param3:*) : void
      {
         ArrayUtil.removeItem(loadingResArr,param1);
         endLoad(param2,param3);
         _loaderCount = Number(_loaderCount) - 1;
         checkNext();
      }
      
      private function endLoad(param1:ResInfo, param2:*) : void
      {
         if(param2 == null)
         {
            Handler.execute(param1.errorHandlers,[param1.url]);
         }
         delete loadingResMap[param1.url];
         Handler.execute(param1.completeHandlers,[param2]);
      }
      
      public function loadSWF(param1:String, param2:uint = 1, param3:Handler = null, param4:Handler = null, param5:Handler = null, param6:Boolean = true) : void
      {
         load(param1,0,param2,param3,param4,param5,param6);
      }
      
      public function loadBMD(param1:String, param2:uint = 1, param3:Handler = null, param4:Handler = null, param5:Handler = null, param6:Boolean = true) : void
      {
         load(param1,1,param2,param3,param4,param5,param6);
      }
      
      public function loadAMF(param1:String, param2:uint = 1, param3:Handler = null, param4:Handler = null, param5:Handler = null, param6:Boolean = true) : void
      {
         load(param1,2,param2,param3,param4,param5,param6);
      }
      
      public function loadTXT(param1:String, param2:uint = 1, param3:Handler = null, param4:Handler = null, param5:Handler = null, param6:Boolean = true) : void
      {
         load(param1,3,param2,param3,param4,param5,param6);
      }
      
      public function loadDB(param1:String, param2:uint = 1, param3:Handler = null, param4:Handler = null, param5:Handler = null, param6:Boolean = true) : void
      {
         load(param1,4,param2,param3,param4,param5,param6);
      }
      
      public function loadBYTE(param1:String, param2:uint = 1, param3:Handler = null, param4:Handler = null, param5:Handler = null, param6:Boolean = true) : void
      {
         load(param1,5,param2,param3,param4,param5,param6);
      }
      
      public function get maxLoader() : int
      {
         return _maxLoader;
      }
      
      public function set maxLoader(param1:int) : void
      {
         _maxLoader = param1;
      }
      
      public function stopAndClearLoadArr(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            this.stopAndClearLoad(_loc2_);
            _loc4_++;
         }
      }
      
      public function stopAndClearLoad(param1:String) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = this.waitResArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this.waitResArr[_loc5_];
            if(!stopAndClearWait(param1,_loc4_))
            {
               _loc5_++;
               continue;
            }
            break;
         }
         var _loc7_:int = 0;
         var _loc6_:* = loadingResArr;
         for each(var _loc2_ in loadingResArr)
         {
            if(_loc2_.url == param1)
            {
               _loc2_.tryToCloseLoad();
               ArrayUtil.removeItem(loadingResArr,_loc2_);
               _loaderCount = Number(_loaderCount) - 1;
            }
         }
      }
      
      public function stopAndClearWait(param1:String, param2:Array) : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = param2.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = param2[_loc5_];
            if(_loc4_.url == param1)
            {
               param2.splice(_loc5_,1);
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function loadAssets(param1:Array, param2:Handler = null, param3:Handler = null, param4:Handler = null, param5:Boolean = true) : void
      {
         arr = param1;
         complete = param2;
         progress = param3;
         error = param4;
         isCacheContent = param5;
         loadAssetsComplete = function(param1:Object, param2:*):void
         {
            itemloaded = Number(itemloaded) + 1;
            param1.progress = 1;
            if(itemloaded == itemCount)
            {
               if(complete != null)
               {
                  complete.execute();
               }
            }
         };
         loadAssetsProgress = function(param1:Object, param2:Number):void
         {
            var _loc4_:* = NaN;
            var _loc5_:int = 0;
            var _loc3_:* = null;
            if(progress != null)
            {
               param1.progress = param2;
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc5_ < itemCount)
               {
                  _loc3_ = items[_loc5_];
                  _loc4_ = Number(_loc4_ + _loc3_.size * _loc3_.progress);
                  _loc5_++;
               }
               progress.executeWith([_loc4_ / totalSize]);
            }
         };
         var itemCount:int = arr.length;
         var itemloaded:int = 0;
         var totalSize:int = 0;
         var items:Array = [];
         var i:int = 0;
         while(i < itemCount)
         {
            var item:Object = arr[i];
            if(item is String)
            {
               item = {
                  "url":item,
                  "type":0,
                  "size":1,
                  "priority":1
               };
            }
            item.progress = 0;
            totalSize = totalSize + item.size;
            items.push(item);
            load(item.url,item.type,item.priority,new Handler(loadAssetsComplete,[item]),new Handler(loadAssetsProgress,[item]),error,isCacheContent);
            i = Number(i) + 1;
         }
      }
   }
}

import morn.core.handlers.HandlerList;

class ResInfo
{
    
   
   public var url:String;
   
   public var type:int;
   
   public var priority:int;
   
   public var completeHandlers:HandlerList;
   
   public var progressHandlers:HandlerList;
   
   public var errorHandlers:HandlerList;
   
   public var isCache:Boolean;
   
   public var loadErrorCount:int;
   
   function ResInfo()
   {
      completeHandlers = new HandlerList();
      progressHandlers = new HandlerList();
      errorHandlers = new HandlerList();
      super();
   }
}
