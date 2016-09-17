package org.specter3d.utils
{
   import flash.utils.Dictionary;
   
   public class HashMap
   {
      
      private static const VALUE_NULL:String = "::null";
       
      
      private var _map:Dictionary;
      
      private var _mapLenth:uint = 0;
      
      public function HashMap()
      {
         super();
         _map = new Dictionary();
      }
      
      public final function clone() : HashMap
      {
         var _loc6_:int = 0;
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:HashMap = new HashMap();
         var _loc1_:Array = this.keySet();
         var _loc3_:uint = _loc1_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc5_ = _loc1_[_loc6_];
            _loc2_ = getValue(_loc5_);
            _loc4_.put(_loc5_,_loc2_);
            _loc6_++;
         }
         return _loc4_;
      }
      
      public final function clear() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _map;
         for(var _loc1_ in _map)
         {
            delete _map[_loc1_];
         }
         _mapLenth = 0;
      }
      
      public final function containsKey(param1:*) : Boolean
      {
         return _map[param1] != null;
      }
      
      public final function getValue(param1:*) : Object
      {
         var _loc2_:* = _map[param1];
         if(_loc2_ === "::null")
         {
            _loc2_ = null;
         }
         return _loc2_;
      }
      
      public function isEmpty() : Boolean
      {
         var _loc1_:Boolean = false;
         if(_mapLenth < 1)
         {
            _loc1_ = true;
            §§push(_loc1_);
         }
         else
         {
            _loc1_ = false;
            §§push(Boolean(_loc1_));
         }
         §§pop();
         return _loc1_;
      }
      
      public final function keySet() : Array
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
      
      public final function put(param1:*, param2:*) : *
      {
         if(param1 == null)
         {
            return;
         }
         if(_map[param1] == null)
         {
            _mapLenth = Number(_mapLenth) + 1;
         }
         if(param2 == null)
         {
            var _loc3_:* = "::null";
            _map[param1] = _loc3_;
            §§push(_loc3_);
         }
         else
         {
            _loc3_ = param2;
            _map[param1] = _loc3_;
            §§push(_loc3_);
         }
         §§pop();
         return param2;
      }
      
      public final function remove(param1:*) : *
      {
         var _loc2_:* = _map[param1];
         if(_loc2_ != null)
         {
            delete _map[param1];
            _mapLenth > 0 && Number(_mapLenth);
            if(_loc2_ == "::null")
            {
               _loc2_ = null;
            }
            return _loc2_;
         }
         return null;
      }
      
      public final function size() : uint
      {
         return _mapLenth;
      }
      
      public final function values() : Array
      {
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _map;
         for each(var _loc1_ in _map)
         {
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
      
      public final function forEach(param1:Function) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _map;
         for each(var _loc2_ in _map)
         {
            param1(_loc2_);
         }
      }
   }
}
