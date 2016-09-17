package away3d.core.sort
{
   import away3d.core.traverse.EntityCollector;
   import away3d.core.data.RenderableListItem;
   
   public class RenderableMergeSort implements IEntitySorter
   {
       
      
      public function RenderableMergeSort()
      {
         super();
      }
      
      public function sort(param1:EntityCollector) : void
      {
         param1.opaqueRenderableHead = mergeSortByMaterial(param1.opaqueRenderableHead);
         param1.decalRenderableHead = mergeSortByDepth(param1.decalRenderableHead);
         param1.blendedRenderableHead = mergeSortByDepth(param1.blendedRenderableHead);
      }
      
      private function mergeSortByDepth(param1:RenderableListItem) : RenderableListItem
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         if(!param1 || !param1.next)
         {
            return param1;
         }
         _loc6_ = param1;
         _loc7_ = param1.next;
         while(_loc7_)
         {
            _loc7_ = _loc7_.next;
            if(_loc7_)
            {
               _loc6_ = _loc6_.next;
               _loc7_ = _loc7_.next;
            }
         }
         _loc4_ = _loc6_.next;
         _loc6_.next = null;
         param1 = mergeSortByDepth(param1);
         _loc4_ = mergeSortByDepth(_loc4_);
         if(!param1)
         {
            return _loc4_;
         }
         if(!_loc4_)
         {
            return param1;
         }
         while(param1 && _loc4_ && param1 != null && _loc4_ != null)
         {
            if(param1.zIndex < _loc4_.zIndex)
            {
               _loc5_ = param1;
               param1 = param1.next;
            }
            else if(param1.renderPriority > 0 && param1.renderPriority < _loc4_.renderPriority)
            {
               _loc5_ = param1;
               param1 = param1.next;
            }
            else
            {
               _loc5_ = _loc4_;
               _loc4_ = _loc4_.next;
            }
            if(!_loc2_)
            {
               _loc2_ = _loc5_;
            }
            else
            {
               _loc3_.next = _loc5_;
            }
            _loc3_ = _loc5_;
         }
         if(param1)
         {
            _loc3_.next = param1;
         }
         else if(_loc4_)
         {
            _loc3_.next = _loc4_;
         }
         return _loc2_;
      }
      
      private function mergeSortByMaterial(param1:RenderableListItem) : RenderableListItem
      {
         var _loc6_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc9_:* = 0;
         var _loc12_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         if(!param1 || !param1.next)
         {
            return param1;
         }
         _loc10_ = param1;
         _loc11_ = param1.next;
         while(_loc11_)
         {
            _loc11_ = _loc11_.next;
            if(_loc11_)
            {
               _loc10_ = _loc10_.next;
               _loc11_ = _loc11_.next;
            }
         }
         _loc6_ = _loc10_.next;
         _loc10_.next = null;
         param1 = mergeSortByMaterial(param1);
         _loc6_ = mergeSortByMaterial(_loc6_);
         if(!param1)
         {
            return _loc6_;
         }
         if(!_loc6_)
         {
            return param1;
         }
         while(param1 && _loc6_ && param1 != null && _loc6_ != null)
         {
            _loc9_ = uint(param1.renderOrderId);
            _loc12_ = uint(_loc6_.renderOrderId);
            if(_loc9_ == _loc12_)
            {
               _loc3_ = uint(param1.materialId);
               _loc4_ = uint(_loc6_.materialId);
               if(param1.renderPriority < _loc6_.renderPriority)
               {
                  _loc7_ = 1;
               }
               else if(_loc3_ == _loc4_)
               {
                  if(param1.zIndex < _loc6_.zIndex)
                  {
                     _loc7_ = 1;
                  }
                  else
                  {
                     _loc7_ = -1;
                  }
               }
               else if(_loc3_ > _loc4_)
               {
                  _loc7_ = 1;
               }
               else
               {
                  _loc7_ = -1;
               }
            }
            else if(_loc9_ > _loc12_)
            {
               _loc7_ = 1;
            }
            else
            {
               _loc7_ = -1;
            }
            if(_loc7_ < 0)
            {
               _loc8_ = param1;
               param1 = param1.next;
            }
            else
            {
               _loc8_ = _loc6_;
               _loc6_ = _loc6_.next;
            }
            if(!_loc2_)
            {
               _loc2_ = _loc8_;
               _loc5_ = _loc8_;
            }
            else
            {
               _loc5_.next = _loc8_;
               _loc5_ = _loc8_;
            }
         }
         if(param1)
         {
            _loc5_.next = param1;
         }
         else if(_loc6_)
         {
            _loc5_.next = _loc6_;
         }
         return _loc2_;
      }
   }
}
