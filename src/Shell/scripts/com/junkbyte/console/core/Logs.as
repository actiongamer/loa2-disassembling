package com.junkbyte.console.core
{
   import com.junkbyte.console.vos.Log;
   import com.junkbyte.console.Console;
   
   public class Logs extends ConsoleCore
   {
       
      
      private var _channels:Object;
      
      private var _repeating:uint;
      
      private var _lastRepeat:Log;
      
      private var _newRepeat:Log;
      
      private var first:Log;
      
      public var last:Log;
      
      private var _length:uint;
      
      public function Logs(param1:Console)
      {
         super(param1);
         this._channels = new Object();
      }
      
      public function tick() : void
      {
         if(this._repeating > 0)
         {
            this._repeating--;
         }
         if(this._newRepeat)
         {
            if(this._lastRepeat)
            {
               this.remove(this._lastRepeat);
            }
            this._lastRepeat = this._newRepeat;
            this._newRepeat = null;
            this.push(this._lastRepeat);
         }
      }
      
      public function add(param1:Log, param2:Boolean) : Boolean
      {
         var _loc3_:int = 0;
         this.addChannel(param1.ch);
         if(param2)
         {
            if(this._repeating > 0 && this._lastRepeat)
            {
               this._newRepeat = param1;
               return false;
            }
            this._repeating = config.maxRepeats;
            this._lastRepeat = param1;
         }
         this.push(param1);
         if(config.maxLines > 0)
         {
            _loc3_ = this._length - config.maxLines;
            while(_loc3_ > 0 && this.first)
            {
               if(this.first == this._lastRepeat)
               {
                  this._lastRepeat = null;
               }
               this.first = this.first.next;
               this.first.prev = null;
               _loc3_--;
               this._length--;
            }
         }
         return true;
      }
      
      public function clear(param1:String = null) : void
      {
         var _loc2_:Log = null;
         if(param1)
         {
            _loc2_ = this.first;
            while(_loc2_)
            {
               if(_loc2_.ch == param1)
               {
                  this.remove(_loc2_);
               }
               _loc2_ = _loc2_.next;
            }
            delete this._channels[param1];
         }
         else
         {
            this.first = null;
            this.last = null;
            this._length = 0;
            this._channels = new Object();
         }
      }
      
      public function getLogsAsBytes() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:Log = this.first;
         while(_loc2_)
         {
            _loc1_.push(_loc2_.toBytes());
            _loc2_ = _loc2_.next;
         }
         return _loc1_;
      }
      
      public function getLogsAsString(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:Log = this.first;
         while(_loc3_)
         {
            _loc2_ = _loc2_ + (_loc3_.toString() + (!!_loc3_.next?param1:""));
            _loc3_ = _loc3_.next;
         }
         return _loc2_;
      }
      
      public function getChannels() : Array
      {
         var _loc3_:* = null;
         var _loc1_:Array = new Array(Console.GLOBAL_CHANNEL);
         this.addIfexist(Console.DEFAULT_CHANNEL,_loc1_);
         this.addIfexist(Console.FILTER_CHANNEL,_loc1_);
         this.addIfexist(LogReferences.INSPECTING_CHANNEL,_loc1_);
         this.addIfexist(Console.CONSOLE_CHANNEL,_loc1_);
         var _loc2_:Array = new Array();
         for(_loc3_ in this._channels)
         {
            if(_loc1_.indexOf(_loc3_) < 0)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc1_.concat(_loc2_.sort(Array.CASEINSENSITIVE));
      }
      
      private function addIfexist(param1:String, param2:Array) : void
      {
         if(this._channels.hasOwnProperty(param1))
         {
            param2.push(param1);
         }
      }
      
      public function cleanChannels() : void
      {
         this._channels = new Object();
         var _loc1_:Log = this.first;
         while(_loc1_)
         {
            this.addChannel(_loc1_.ch);
            _loc1_ = _loc1_.next;
         }
      }
      
      public function addChannel(param1:String) : void
      {
         this._channels[param1] = null;
      }
      
      private function push(param1:Log) : void
      {
         if(this.last == null)
         {
            this.first = param1;
         }
         else
         {
            this.last.next = param1;
            param1.prev = this.last;
         }
         this.last = param1;
         this._length++;
      }
      
      private function remove(param1:Log) : void
      {
         if(this.first == param1)
         {
            this.first = param1.next;
         }
         if(this.last == param1)
         {
            this.last = param1.prev;
         }
         if(param1 == this._lastRepeat)
         {
            this._lastRepeat = null;
         }
         if(param1 == this._newRepeat)
         {
            this._newRepeat = null;
         }
         if(param1.next != null)
         {
            param1.next.prev = param1.prev;
         }
         if(param1.prev != null)
         {
            param1.prev.next = param1.next;
         }
         this._length--;
      }
   }
}
