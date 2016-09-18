package com.junkbyte.console.core
{
   import flash.net.SharedObject;
   import com.junkbyte.console.Console;
   
   public class UserData extends ConsoleCore
   {
      
      private static const HISTORY:String = "clhistory";
       
      
      private var _so:SharedObject;
      
      private var _data:Object;
      
      public function UserData(param1:Console)
      {
         var console:Console = param1;
         this._data = {};
         super(console);
         if(config.sharedObjectName)
         {
            try
            {
               this._so = SharedObject.getLocal(config.sharedObjectName,config.sharedObjectPath);
               this._data = this._so.data;
               return;
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
      
      public function get commandLineHistory() : Array
      {
         var _loc1_:Array = null;
         if(this._data[HISTORY] is Array)
         {
            return this._data[HISTORY];
         }
         _loc1_ = new Array();
         this._data[HISTORY] = _loc1_;
         return _loc1_;
      }
      
      public function commandLineHistoryChanged() : void
      {
         if(this._so)
         {
            this._so.setDirty(HISTORY);
         }
      }
   }
}
