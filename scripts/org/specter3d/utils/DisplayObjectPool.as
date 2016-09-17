package org.specter3d.utils
{
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getDefinitionByName;
   
   public class DisplayObjectPool
   {
      
      private static const MAX_NUM:int = 256;
      
      public static const MONSTER_NAME_PREFIX:String = "monster_name_prefix_";
      
      public static const NUDE_TYPE_PREFIX:String = "nude_type_prefix_";
      
      public static const FLY_PROP_TYPE:String = "fly_prop_type_";
      
      private static var instance:org.specter3d.utils.DisplayObjectPool;
       
      
      private var objPoolDict:Dictionary;
      
      private var _countDic:Dictionary;
      
      public function DisplayObjectPool()
      {
         objPoolDict = new Dictionary();
         super();
      }
      
      public static function getInstance() : org.specter3d.utils.DisplayObjectPool
      {
         if(instance == null)
         {
            instance = new org.specter3d.utils.DisplayObjectPool();
         }
         return instance;
      }
      
      public function disposeAll() : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = this.objPoolDict;
         for each(var _loc2_ in this.objPoolDict)
         {
            if(_loc2_ is Dictionary)
            {
               var _loc4_:int = 0;
               var _loc3_:* = _loc2_;
               for each(var _loc1_ in _loc2_)
               {
                  dispose(_loc1_ as Array);
               }
            }
            else
            {
               dispose(_loc2_ as Array);
            }
         }
         this.objPoolDict = new Dictionary();
         if(_countDic != null)
         {
            _countDic = new Dictionary();
         }
      }
      
      private function dispose(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(_loc2_ is IDisplayObjectPool)
            {
               (_loc2_ as IDisplayObjectPool).poolDispose();
            }
         }
      }
      
      public function push(param1:Object) : void
      {
         var _loc2_:String = getQualifiedClassName(param1);
         if(param1 == null)
         {
            return;
         }
         if(param1 is IDisplayObjectPool && (param1 as IDisplayObjectPool).poolType != null)
         {
            typePush(param1,_loc2_);
         }
         else
         {
            defaultPush(param1,_loc2_);
         }
      }
      
      private function typePush(param1:Object, param2:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:IDisplayObjectPool = param1 as IDisplayObjectPool;
         if(_loc4_.poolType != null && _loc4_.poolType != "")
         {
            var _loc5_:* = param2;
            this.objPoolDict[_loc5_] = this.objPoolDict[_loc5_] || new Dictionary();
            _loc3_ = this.objPoolDict[param2][_loc4_.poolType];
            if(_loc3_ == null)
            {
               _loc3_ = [];
            }
            else if(_loc3_.length >= 256)
            {
               _loc4_.poolDispose();
               return;
            }
            _loc3_.push(param1);
            this.objPoolDict[param2][_loc4_.poolType] = _loc3_;
         }
         else
         {
            _loc4_.poolDispose();
         }
      }
      
      private function defaultPush(param1:Object, param2:String) : void
      {
         var _loc4_:IDisplayObjectPool = param1 as IDisplayObjectPool;
         var _loc3_:Array = this.objPoolDict[param2];
         if(_loc3_ == null)
         {
            _loc3_ = [];
         }
         else if(_loc3_.length >= 256)
         {
            return;
            §§push(_loc4_ && _loc4_.poolDispose());
         }
         _loc3_.push(param1);
         this.objPoolDict[param2] = _loc3_;
         if(_countDic != null)
         {
            trace("[camus]=====>  回收：" + param2 + "______池中数量：" + this.objPoolDict[param2].length);
         }
      }
      
      public function pop(param1:Object, param2:String = null, param3:* = null) : Object
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc4_:String = getQualifiedClassName(param1);
         if(param2 == null)
         {
            _loc5_ = defaultPop(_loc4_);
         }
         else
         {
            _loc5_ = typePop(_loc4_,param2);
         }
         if(_loc5_ == null)
         {
            _loc6_ = getDefinitionByName(_loc4_) as Class;
            if(param3)
            {
               _loc5_ = new _loc6_(param3) as Object;
            }
            else
            {
               _loc5_ = new _loc6_() as Object;
            }
         }
         return _loc5_;
      }
      
      private function defaultPop(param1:String) : Object
      {
         if(this.objPoolDict[param1] != null && this.objPoolDict[param1].length > 0)
         {
            return this.objPoolDict[param1].pop() as Object;
         }
         if(_countDic != null)
         {
            if(_countDic[param1] == null)
            {
               _countDic[param1] = 0;
            }
            var _loc2_:* = _countDic;
            var _loc3_:* = param1;
            var _loc4_:* = Number(_loc2_[_loc3_]) + 1;
            _loc2_[_loc3_] = _loc4_;
            trace("[camus]=====> new " + param1 + "()     +" + _countDic[param1]);
         }
         return null;
      }
      
      private function typePop(param1:String, param2:String) : Object
      {
         if(this.objPoolDict[param1] != null && this.objPoolDict[param1][param2] != null && this.objPoolDict[param1][param2].length > 0)
         {
            return this.objPoolDict[param1][param2].pop() as Object;
         }
         return null;
      }
   }
}
