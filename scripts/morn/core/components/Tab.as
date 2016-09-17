package morn.core.components
{
   import flash.display.DisplayObject;
   
   public class Tab extends Group
   {
      
      public static const HORIZENTAL:String = "horizontal";
      
      public static const VERTICAL:String = "vertical";
       
      
      public function Tab(param1:String = null, param2:String = null)
      {
         super(param1,param2);
         _direction = "horizontal";
      }
      
      override protected function createItem(param1:String, param2:String) : DisplayObject
      {
         return new Button(param1,param2);
      }
      
      override protected function changeLabels() : void
      {
         var _loc3_:* = NaN;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(_items)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            _loc2_ = _items.length;
            while(_loc4_ < _loc2_)
            {
               _loc1_ = _items[_loc4_] as Button;
               if(_skin)
               {
                  _loc1_.skin = _skin;
               }
               if(_labelColors)
               {
                  _loc1_.labelColors = _labelColors;
               }
               if(_labelFilterKind)
               {
                  _loc1_.labelFilterKind = _labelFilterKind;
               }
               if(_labelSize)
               {
                  _loc1_.labelSize = _labelSize;
               }
               if(_labelBold)
               {
                  _loc1_.labelBold = _labelBold;
               }
               if(_labelMargin)
               {
                  _loc1_.labelMargin = _labelMargin;
               }
               if(_direction == "horizontal")
               {
                  _loc1_.y = 0;
                  _loc1_.x = _loc3_;
                  _loc3_ = Number(_loc3_ + (_loc1_.width + _space));
               }
               else
               {
                  _loc1_.x = 0;
                  _loc1_.y = _loc3_;
                  _loc3_ = Number(_loc3_ + (_loc1_.height + _space));
               }
               _loc4_++;
            }
         }
      }
   }
}
