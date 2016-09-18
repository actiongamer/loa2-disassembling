package away3d.core.data
{
   import away3d.entities.Entity;
   
   public class EntityListItemPool
   {
       
      
      private var _pool:Vector.<away3d.core.data.EntityListItem>;
      
      private var _index:int;
      
      private var _poolSize:int;
      
      public function EntityListItemPool()
      {
         super();
         _pool = new Vector.<away3d.core.data.EntityListItem>();
      }
      
      public final function getItem() : away3d.core.data.EntityListItem
      {
         var _loc1_:* = null;
         if(_index == _poolSize)
         {
            _loc1_ = new away3d.core.data.EntityListItem();
            _index = Number(_index) + 1;
            _pool[Number(_index)] = _loc1_;
            _poolSize = _poolSize + 1;
         }
         else
         {
            _index = Number(_index) + 1;
            _loc1_ = _pool[Number(_index)];
         }
         return _loc1_;
      }
      
      public function freeAll() : void
      {
         _index = 0;
      }
      
      public function dispose() : void
      {
         _index = 0;
         _poolSize = 0;
         _pool.length = 0;
      }
      
      public function unmap(param1:Entity) : void
      {
         var _loc2_:int = 0;
         _loc2_ = _pool.length - 1;
         while(_loc2_ >= 0)
         {
            if(_pool[_loc2_].entity == param1)
            {
               _pool[_loc2_].entity = null;
               param1 = null;
               _pool.splice(_loc2_,1);
               _poolSize = Number(_poolSize) - 1;
               return;
            }
            _loc2_--;
         }
      }
   }
}
