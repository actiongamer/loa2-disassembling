package org.specter3d.utils
{
   import away3d.core.managers.IAnimatorUpdate;
   import org.specter3d.context.AppGlobalContext;
   
   public class LifePool implements IAnimatorUpdate
   {
      
      private static const LIFE:int = 60000;
       
      
      private var _pool:org.specter3d.utils.HashMap;
      
      private var _callback:Function;
      
      public function LifePool(param1:Function)
      {
         _pool = new org.specter3d.utils.HashMap();
         super();
         _callback = param1;
      }
      
      public function put(param1:String, param2:int = 0) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(_pool.size() == 0)
         {
            AppGlobalContext.animatorManager.register(this);
         }
         var _loc3_:LifeObj = _pool.getValue(param1) as LifeObj;
         if(_loc3_ == null)
         {
            _loc3_ = new LifeObj();
            _loc3_.url = param1;
            _pool.put(param1,_loc3_);
         }
         if(param2 == 0)
         {
            _loc3_.life = 60000;
         }
         else
         {
            _loc3_.life = param2;
         }
      }
      
      public function remove(param1:String) : void
      {
         _pool.remove(param1);
         if(_pool.size() == 0)
         {
            AppGlobalContext.animatorManager.unregister(this);
         }
      }
      
      public function update(param1:int, param2:Number = 0) : void
      {
         time = param1;
         dt = param2;
         eachObj = function(param1:LifeObj):void
         {
            param1.timeInPool = param1.timeInPool + dt;
            if(param1.timeInPool >= param1.life)
            {
               _callback(param1.url);
               _pool.remove(param1.url);
               dt = 0;
            }
         };
         _pool.forEach(eachObj);
         if(_pool.size() == 0)
         {
            AppGlobalContext.animatorManager.unregister(this);
         }
      }
   }
}

class LifeObj
{
    
   
   public var timeInPool:int;
   
   public var life:int;
   
   public var url:String;
   
   function LifeObj()
   {
      super();
   }
}
