package morn.core.handlers
{
   public class HandlerBatch
   {
       
      
      protected var listDict:Object;
      
      public function HandlerBatch()
      {
         listDict = {};
         super();
      }
      
      public function addHandler(param1:int, param2:*) : HandlerBatch
      {
         if(listDict.hasOwnProperty(param1) == false)
         {
            listDict[param1] = new HandlerList();
         }
         (listDict[param1] as HandlerList).addHandler(param2);
         return this;
      }
      
      public function merge(param1:HandlerBatch) : HandlerBatch
      {
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = this.listDict;
         for(var _loc3_ in this.listDict)
         {
            _loc6_.push(int(_loc3_));
         }
         var _loc10_:int = 0;
         var _loc9_:* = param1.listDict;
         for(_loc3_ in param1.listDict)
         {
            if(_loc6_.indexOf(int(_loc3_)) == -1)
            {
               _loc6_.push(int(_loc3_));
            }
         }
         var _loc4_:int = _loc6_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc6_[_loc5_];
            this.mergeType(_loc2_,param1);
            _loc5_++;
         }
         return this;
      }
      
      public function mergeType(param1:int, param2:HandlerBatch) : HandlerBatch
      {
         if(this.listDict.hasOwnProperty(param1) && param2.listDict.hasOwnProperty(param1))
         {
            (listDict[param1] as HandlerList).marge(param2.listDict[param1] as HandlerList);
         }
         else if(param2.listDict.hasOwnProperty(param1))
         {
            listDict[param1] = new HandlerList();
            (listDict[param1] as HandlerList).marge(param2.listDict[param1] as HandlerList);
         }
         return this;
      }
      
      public function hasFunc(param1:int, param2:Function) : Boolean
      {
         var _loc3_:* = null;
         if(listDict.hasOwnProperty(param1) == true)
         {
            _loc3_ = listDict[param1] as HandlerList;
            return _loc3_.hasFunc(param2);
         }
         return false;
      }
      
      public function hasType(param1:int) : Boolean
      {
         if(listDict.hasOwnProperty(param1) == true)
         {
            return (listDict[param1] as HandlerList).length > 0;
         }
         return false;
      }
      
      public function getList(param1:int) : HandlerList
      {
         if(listDict.hasOwnProperty(param1) == true)
         {
            return listDict[param1] as HandlerList;
         }
         return null;
      }
      
      public function execute(param1:int, param2:Array = null, param3:Boolean = true) : void
      {
         if(listDict.hasOwnProperty(param1) == true)
         {
            (listDict[param1] as HandlerList).apply(null,param2,param3);
         }
      }
      
      public function removeHandler(param1:int, param2:*) : HandlerBatch
      {
         var _loc3_:HandlerList = listDict[param1];
         if(_loc3_)
         {
            _loc3_.removeHandler(param2);
         }
         return this;
      }
      
      public function removeList(param1:int) : HandlerBatch
      {
         delete listDict[param1];
         return this;
      }
      
      public function clear() : void
      {
         listDict = {};
      }
   }
}
