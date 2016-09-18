package com.mz.core.utils
{
   import com.mz.core.configs.ClientConfig;
   import flash.net.SharedObject;
   import com.mz.core.logging.Log;
   
   public class LocalData
   {
      
      private static var _sharedObjectArr:Object = {};
       
      
      private var _sharedObject:SharedObject;
      
      private var _data:Object;
      
      public function LocalData(param1:*)
      {
         super();
         try
         {
            _sharedObject = SharedObject.getLocal("nslm2_" + param1,"/");
            _data = _sharedObject.data;
            return;
         }
         catch(err:Error)
         {
            Log.warn(this,err);
            _data = {};
            return;
         }
      }
      
      public static function get insTools() : LocalData
      {
         return getIns("tools");
      }
      
      public static function get insCurPlayer() : LocalData
      {
         return getIns(ClientConfig.playId + "_" + ClientConfig.district);
      }
      
      public static function getIns(param1:*) : LocalData
      {
         if(_sharedObjectArr.hasOwnProperty(param1) == false)
         {
            _sharedObjectArr[param1] = new LocalData(param1);
         }
         return _sharedObjectArr[param1];
      }
      
      public function save(param1:String, param2:*, param3:Boolean = true) : void
      {
         _data[param1] = param2;
         if(param3)
         {
            flush();
         }
      }
      
      public function flush() : void
      {
         try
         {
            _sharedObject.flush();
            return;
         }
         catch(err:Error)
         {
            Log.warn(this,err);
            return;
         }
      }
      
      public function clear() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _data;
         for(var _loc1_ in _data)
         {
            delete _data[_loc1_];
         }
         this.flush();
      }
      
      public function load(param1:String, param2:Object = null) : *
      {
         if(_data.hasOwnProperty(param1))
         {
            return _data[param1];
         }
         return param2;
      }
   }
}
