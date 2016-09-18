package com.mz.core.utils
{
   import flash.utils.Dictionary;
   import com.mz.core.namespaces.ns_nslm2_internal;
   
   use namespace ns_nslm2_internal;
   
   public class DictHash
   {
       
      
      private var _map:Dictionary;
      
      private var _useWeakReferences:Boolean;
      
      ns_nslm2_internal var _array:Array;
      
      public function DictHash(param1:Boolean = true)
      {
         _array = [];
         super();
         _useWeakReferences = param1;
         _map = new Dictionary(_useWeakReferences);
      }
      
      public function get dict() : Dictionary
      {
         return _map;
      }
      
      public function clear() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _map;
         for(var _loc1_ in _map)
         {
            delete _map[_loc1_];
         }
         _array = [];
      }
      
      public function containsKey(param1:*) : Boolean
      {
         return !!_map[param1]?true:false;
      }
      
      public function containsValue(param1:*) : Boolean
      {
         var _loc3_:* = undefined;
         var _loc2_:Boolean = false;
         var _loc6_:int = 0;
         var _loc5_:* = _map;
         for(var _loc4_ in _map)
         {
            _loc3_ = _map[_loc4_];
            if(_loc3_ == param1)
            {
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function getValue(param1:*) : *
      {
         return _map[param1];
      }
      
      public function getKey(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc5_:int = 0;
         var _loc4_:* = _map;
         for(var _loc3_ in _map)
         {
            _loc2_ = _map[_loc3_];
            if(_loc2_ == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getValueAt(param1:int) : *
      {
         return _array[param1];
      }
      
      public function isEmpty() : Boolean
      {
         if(this.size as Number < 1)
         {
            return true;
         }
         return false;
      }
      
      public function keySet() : Array
      {
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _map;
         for(var _loc1_ in _map)
         {
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
      
      public function putByKeyName(param1:*, param2:String) : *
      {
         this.put(param1[param2],param1);
      }
      
      public function put(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         if(_map[param1] != null)
         {
            _loc3_ = _map[param1];
            ArrayUtil.removeItem(this.array,_loc3_);
         }
         _map[param1] = param2;
         array.push(param2);
         return param2;
      }
      
      public function putAll(param1:DictHash) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = 0;
         this.clear();
         var _loc3_:uint = param1.size;
         if(_loc3_ > 0)
         {
            _loc2_ = param1.keySet() as Array;
            _loc4_ = uint(0);
            while(_loc4_ < _loc3_)
            {
               this.put(_loc2_[_loc4_],param1.getValue(_loc2_[_loc4_]));
               _loc4_++;
            }
         }
      }
      
      public function remove(param1:*) : *
      {
         var _loc2_:* = _map[param1];
         if(_loc2_)
         {
            ArrayUtil.removeItem(_array,_loc2_);
            delete _map[param1];
         }
         return _loc2_;
      }
      
      public function removeAt(param1:int) : *
      {
         return _array.splice(param1,1);
      }
      
      public function get size() : uint
      {
         return _array.length;
      }
      
      public function toString() : String
      {
         var _loc2_:String = "";
         var _loc4_:int = 0;
         var _loc3_:* = _map;
         for(var _loc1_ in _map)
         {
            _loc2_ = _loc2_ + (_loc1_ + "=" + _map[_loc1_] + "|");
         }
         return _loc2_;
      }
      
      public function get array() : Array
      {
         return _array;
      }
      
      public function clone() : DictHash
      {
         var _loc1_:DictHash = new DictHash(_useWeakReferences);
         var _loc4_:int = 0;
         var _loc3_:* = this._map;
         for(var _loc2_ in this._map)
         {
            _loc1_.put(_loc2_,this.getValue(_loc2_));
         }
         return _loc1_;
      }
      
      public function merge(param1:DictHash) : DictHash
      {
         var _loc2_:DictHash = this.clone();
         var _loc5_:int = 0;
         var _loc4_:* = param1._map;
         for(var _loc3_ in param1._map)
         {
            _loc2_.put(_loc3_,param1.getValue(_loc3_));
         }
         return _loc2_;
      }
   }
}
