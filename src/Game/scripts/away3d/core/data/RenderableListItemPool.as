package away3d.core.data
{
   public class RenderableListItemPool
   {
       
      
      private var _pool:Vector.<away3d.core.data.RenderableListItem>;
      
      private var _index:int;
      
      private var _poolSize:int;
      
      public function RenderableListItemPool()
      {
         super();
         _pool = new Vector.<away3d.core.data.RenderableListItem>();
      }
      
      public final function getItem() : away3d.core.data.RenderableListItem
      {
         var _loc1_:* = null;
         if(_index == _poolSize)
         {
            _loc1_ = new away3d.core.data.RenderableListItem();
            _index = Number(_index) + 1;
            _pool[Number(_index)] = _loc1_;
            _poolSize = _poolSize + 1;
            return _loc1_;
         }
         _index = Number(_index) + 1;
         return _pool[Number(_index)];
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
   }
}
