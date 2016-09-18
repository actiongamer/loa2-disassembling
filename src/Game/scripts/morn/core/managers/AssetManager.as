package morn.core.managers
{
   import flash.system.ApplicationDomain;
   import global.GlobalManager;
   import com.mz.core.logging.Log;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.display.BitmapData;
   import com.mz.core.mgrs.resMgrs.CiteBitmapData;
   import morn.core.utils.BitmapUtils;
   import com.mz.core.interFace.IUniqueId;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.interFace.IDispose;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.utils.DictUtils;
   
   public class AssetManager
   {
       
      
      private var _domain:ApplicationDomain;
      
      private var _clipsMap:Object;
      
      private var citedLib:Object;
      
      public function AssetManager()
      {
         _domain = ApplicationDomain.currentDomain;
         _clipsMap = {};
         citedLib = {};
         super();
      }
      
      public static function isClassAsset(param1:String) : Boolean
      {
         return param1.indexOf("png.") == 0 || param1.indexOf("jpg.") == 0 || param1.indexOf("battle_") == 0 && param1.indexOf("/") == -1;
      }
      
      private function hasClass(param1:String) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = _domain.hasDefinition(param1);
         if(_loc3_ == false)
         {
            _loc2_ = GlobalManager.checkMornUIGolbal(param1);
         }
         if(_loc3_ == false && _loc2_ == param1)
         {
            Log.warn(this,"hasClass not",param1);
         }
         return _loc3_;
      }
      
      public function hasBitmapData(param1:String) : Boolean
      {
         var _loc2_:* = null;
         if(ResMgr.ins.getRes(param1))
         {
            return true;
         }
         if(isClassAsset(param1))
         {
            if(hasClass(param1))
            {
               return true;
            }
            _loc2_ = GlobalManager.checkMornUIGolbal(param1);
            if(_loc2_ != param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getBitmapData(param1:String, param2:Boolean = true) : BitmapData
      {
         return !!param2?getBitmapDataFromCache(GlobalManager.checkMornUIGolbal(param1)):getBitmapDataNoCache(GlobalManager.checkMornUIGolbal(param1));
      }
      
      private function getBitmapDataNoCache(param1:String) : BitmapData
      {
         var _loc3_:* = null;
         var _loc2_:BitmapData = ResMgr.ins.getRes(param1) as BitmapData;
         if(_loc2_)
         {
            _loc2_ = _loc2_.clone();
         }
         else if(isClassAsset(param1))
         {
            if(hasClass(param1))
            {
               _loc3_ = _domain.getDefinition(param1) as Class;
               _loc2_ = new _loc3_(1,1);
            }
         }
         if(_loc2_ == null)
         {
            Log.error(this,"Miss Asset:",param1);
         }
         return _loc2_;
      }
      
      private function getBitmapDataFromCache(param1:String) : BitmapData
      {
         var _loc3_:* = null;
         var _loc2_:BitmapData = ResMgr.ins.getRes(param1) as BitmapData;
         if(_loc2_ == null)
         {
            if(isClassAsset(param1))
            {
               if(hasClass(param1))
               {
                  _loc3_ = _domain.getDefinition(param1) as Class;
                  _loc2_ = new _loc3_(1,1);
                  _loc2_ = new CiteBitmapData(_loc2_,param1);
                  ResMgr.ins.setRes(param1,_loc2_);
               }
            }
         }
         if(_loc2_ == null)
         {
            Log.error(this,"Miss Asset:",param1);
         }
         return _loc2_;
      }
      
      public function getClips(param1:String, param2:int, param3:int, param4:Boolean = true, param5:BitmapData = null) : Vector.<BitmapData>
      {
         var _loc6_:* = null;
         var _loc7_:Vector.<BitmapData> = _clipsMap[param1];
         if(_loc7_ == null)
         {
            _loc6_ = param5 || getBitmapData(param1,false);
            if(_loc6_)
            {
               _loc7_ = BitmapUtils.createClips(_loc6_,param2,param3);
               if(param4)
               {
                  _clipsMap[param1] = _loc7_;
               }
            }
         }
         return _loc7_;
      }
      
      public function addCited(param1:String, param2:IUniqueId) : void
      {
         if(citedLib.hasOwnProperty(param1) == false)
         {
            citedLib[param1] = [];
         }
         var _loc3_:* = !!EnvConfig.ins.useCiteTarget?param2:param2.uniqueId;
         if(citedLib[param1].indexOf(_loc3_) == -1)
         {
            citedLib[param1].push(_loc3_);
         }
      }
      
      public function countCited(param1:String) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(citedLib.hasOwnProperty(param1) == false)
         {
            return 0;
         }
         if(EnvConfig.ins.autoRemoveCite)
         {
            _loc3_ = citedLib[param1].length;
            _loc4_ = _loc3_ - 1;
            while(_loc4_ >= 0)
            {
               _loc2_ = citedLib[param1][_loc4_] as IDispose;
               if(_loc2_ && _loc2_.hasOwnProperty("isDisposed") && _loc2_["isDisposed"] == true)
               {
                  citedLib[param1].splice(_loc4_,1);
               }
               _loc4_--;
            }
         }
         return citedLib[param1].length;
      }
      
      public function removeCited(param1:String, param2:IUniqueId) : void
      {
         if(citedLib.hasOwnProperty(param1) == false)
         {
            return;
         }
         var _loc3_:* = !!EnvConfig.ins.useCiteTarget?param2:param2.uniqueId;
         ArrayUtil.removeItem(this.citedLib[param1],_loc3_);
      }
      
      public function clear() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _clipsMap;
         for(var _loc1_ in _clipsMap)
         {
            if(countCited(_loc1_) == 0)
            {
               destroyClips(_loc1_);
               delete citedLib[_loc1_];
            }
         }
         Log.debug(this,"clear leave:",DictUtils.count(_clipsMap));
      }
      
      public function destroyClips(param1:String) : void
      {
         var _loc3_:Vector.<BitmapData> = _clipsMap[param1];
         if(_loc3_)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _loc3_;
            for each(var _loc2_ in _loc3_)
            {
               _loc2_.dispose();
            }
            _loc3_.length = 0;
            delete _clipsMap[param1];
         }
      }
   }
}
