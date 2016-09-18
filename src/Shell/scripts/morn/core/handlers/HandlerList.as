package morn.core.handlers
{
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.errors.ArgClassError;
   
   public class HandlerList
   {
       
      
      protected var list:Array;
      
      public function HandlerList()
      {
         list = [];
         super();
      }
      
      public function get length() : int
      {
         if(list == null)
         {
            return 0;
         }
         return list.length;
      }
      
      public function addHandler(param1:*) : Boolean
      {
         if(param1 is Function)
         {
            if(list.indexOf(param1) == -1)
            {
               list.push(new Handler(param1));
               return true;
            }
         }
         else if(param1 is Handler)
         {
            if(ArrayUtil.indexByAttr(list,"method",(param1 as Handler).method) == -1)
            {
               list.push(param1);
               return true;
            }
         }
         else
         {
            throw new ArgClassError(param1,[Function,Handler]);
         }
         return false;
      }
      
      public function removeHandler(param1:*) : int
      {
         if(param1 is Handler)
         {
            return ArrayUtil.removeItem(this.list,param1);
         }
         if(param1 is Function)
         {
            return removeHandlerByFunc(param1 as Function);
         }
         return -1;
      }
      
      public function hasFunc(param1:Function) : Boolean
      {
         return ArrayUtil.indexByAttr(this.list,"method",param1) != -1;
      }
      
      public function removeHandlerByFunc(param1:Function) : int
      {
         return ArrayUtil.removeItemByAttr(this.list,"method",param1);
      }
      
      public function apply(param1:* = null, param2:Array = null, param3:Boolean = true) : void
      {
         var _loc6_:int = 0;
         var _loc5_:Array = list.concat();
         if(param3)
         {
            list.length = 0;
         }
         var _loc4_:int = _loc5_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            Handler.execute(_loc5_[_loc6_],param2);
            _loc6_++;
         }
      }
      
      public function clear() : void
      {
         this.list = [];
      }
      
      public function marge(param1:HandlerList) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.list[_loc4_];
            addHandler(_loc2_);
            _loc4_++;
         }
      }
   }
}
