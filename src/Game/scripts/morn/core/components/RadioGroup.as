package morn.core.components
{
   import flash.display.DisplayObject;
   
   public class RadioGroup extends Group
   {
      
      public static const HORIZENTAL:String = "horizontal";
      
      public static const VERTICAL:String = "vertical";
       
      
      public function RadioGroup(param1:String = null, param2:String = null)
      {
         super(param1,param2);
         _direction = "horizontal";
      }
      
      override protected function createItem(param1:String, param2:String) : DisplayObject
      {
         return new RadioButton(param1,param2);
      }
      
      override protected function changeLabels() : void
      {
         var _loc3_:* = NaN;
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(_items)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            _loc1_ = _items.length;
            while(_loc4_ < _loc1_)
            {
               _loc2_ = _items[_loc4_] as RadioButton;
               if(_skin)
               {
                  _loc2_.skin = _skin;
               }
               if(_labelColors)
               {
                  _loc2_.labelColors = _labelColors;
               }
               if(_labelFilterKind)
               {
                  _loc2_.labelFilterKind = _labelFilterKind;
               }
               if(_labelSize)
               {
                  _loc2_.labelSize = _labelSize;
               }
               if(_labelBold)
               {
                  _loc2_.labelBold = _labelBold;
               }
               if(_labelMargin)
               {
                  _loc2_.labelMargin = _labelMargin;
               }
               if(_direction == "horizontal")
               {
                  _loc2_.y = 0;
                  _loc2_.x = _loc3_;
                  _loc3_ = Number(_loc3_ + (_loc2_.width + _space));
               }
               else
               {
                  _loc2_.x = 0;
                  _loc2_.y = _loc3_;
                  _loc3_ = Number(_loc3_ + (_loc2_.height + _space));
               }
               _loc4_++;
            }
         }
      }
      
      public function get selectedValue() : Object
      {
         return _selectedIndex > -1 && _selectedIndex < _items.length?RadioButton(_items[_selectedIndex]).value:null;
      }
      
      public function set selectedValue(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(_items)
         {
            _loc4_ = 0;
            _loc3_ = _items.length;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = _items[_loc4_] as RadioButton;
               if(_loc2_.value == param1)
               {
                  selectedIndex = _loc4_;
                  break;
               }
               _loc4_++;
            }
         }
      }
   }
}
