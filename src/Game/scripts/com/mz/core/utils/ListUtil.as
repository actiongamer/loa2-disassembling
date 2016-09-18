package com.mz.core.utils
{
   import morn.core.components.List;
   import morn.core.components.Component;
   import morn.core.components.Label;
   
   public class ListUtil
   {
       
      
      public function ListUtil()
      {
         super();
      }
      
      public static function getLongestTextLength(param1:List, param2:String) : Number
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = 0;
         var _loc3_:int = param1.cells.length;
         while(_loc7_ < _loc3_)
         {
            _loc5_ = param1.cells[_loc7_];
            if(_loc5_.hasOwnProperty(param2))
            {
               _loc6_ = _loc5_[param2] as Label;
               if(_loc6_.textWidth > _loc4_)
               {
                  _loc4_ = Number(_loc6_.textWidth);
               }
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public static function clone(param1:List) : List
      {
         var _loc2_:List = new List();
         _loc2_.itemRender = param1.itemRender;
         _loc2_.width = param1.width;
         _loc2_.height = param1.height;
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         _loc2_.dataSource = param1.dataSource;
         _loc2_.commitMeasure();
         return _loc2_;
      }
   }
}
