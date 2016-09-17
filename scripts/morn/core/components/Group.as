package morn.core.components
{
   import flash.display.DisplayObject;
   import com.mz.core.interFace.IDispose;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   
   public class Group extends Box implements IItem
   {
       
      
      protected var _items:Vector.<morn.core.components.ISelect>;
      
      protected var _selectHandler;
      
      public var userChangeHandler;
      
      protected var _selectedIndex:int = -1;
      
      protected var _skin:String;
      
      protected var _labels:String;
      
      protected var _labelColors:String;
      
      protected var _labelStroke:String;
      
      protected var _labelSize:Object;
      
      protected var _labelBold:Object;
      
      protected var _labelMargin:String;
      
      protected var _direction:String;
      
      protected var _space:Number = 0;
      
      public var preCondHandler;
      
      protected var _labelFilterKind:String;
      
      public function Group(param1:String = null, param2:String = null)
      {
         super();
         this.skin = param2;
         this.labels = param1;
      }
      
      public function addItem(param1:morn.core.components.ISelect, param2:Boolean = true) : int
      {
         var _loc5_:* = null;
         var _loc4_:DisplayObject = param1 as DisplayObject;
         var _loc3_:int = _items.length;
         _loc4_.name = "item" + _loc3_;
         addChild(_loc4_);
         initItems();
         if(param2 && _loc3_ > 0)
         {
            _loc5_ = _items[_loc3_ - 1] as DisplayObject;
            if(_direction == "horizontal")
            {
               _loc4_.x = _loc5_.x + _loc5_.width + _space;
            }
            else
            {
               _loc4_.y = _loc5_.y + _loc5_.height + _space;
            }
         }
         return _loc3_;
      }
      
      public function delItem(param1:morn.core.components.ISelect, param2:Boolean = true) : void
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = _items.indexOf(param1);
         if(_loc4_ != -1)
         {
            _loc6_ = param1 as DisplayObject;
            removeChild(_loc6_);
            _loc7_ = _loc4_ + 1;
            _loc5_ = _items.length;
            while(_loc7_ < _loc5_)
            {
               _loc3_ = _items[_loc7_] as DisplayObject;
               _loc3_.name = "item" + (_loc7_ - 1);
               if(param2)
               {
                  if(_direction == "horizontal")
                  {
                     _loc3_.x = _loc3_.x - (_loc6_.width + _space);
                  }
                  else
                  {
                     _loc3_.y = _loc3_.y - (_loc6_.height + _space);
                  }
               }
               _loc7_++;
            }
            if(_loc6_ is IDispose)
            {
               (_loc6_ as IDispose).dispose();
            }
            initItems();
            if(_selectedIndex > -1)
            {
               selectedIndex = _selectedIndex < _items.length?_selectedIndex:_selectedIndex - 1;
            }
         }
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeLabels);
         super.cancelMeasure();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function initItems() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _items = new Vector.<morn.core.components.ISelect>();
         _loc2_ = 0;
         while(_loc2_ < 2147483647)
         {
            _loc1_ = getChildByName("item" + _loc2_) as morn.core.components.ISelect;
            if(_loc1_ != null)
            {
               _items.push(_loc1_);
               _loc1_.selected = _loc2_ == _selectedIndex;
               _loc1_.clickHandler = new Handler(itemClick,[_loc2_]);
               _loc2_++;
               continue;
            }
            break;
         }
      }
      
      protected function itemClick(param1:int) : void
      {
         selectedIndex = param1;
         if(userChangeHandler != null)
         {
            Handler.execute(userChangeHandler,[_selectedIndex]);
         }
      }
      
      public function get selectedIndex() : int
      {
         return _selectedIndex;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(_selectedIndex != param1)
         {
            if(preCondHandler != null)
            {
               if(preCondHandler(param1))
               {
                  changeIndexHandler(param1);
               }
            }
            else
            {
               changeIndexHandler(param1);
            }
         }
      }
      
      private function changeIndexHandler(param1:int) : void
      {
         setSelect(_selectedIndex,false);
         _selectedIndex = param1;
         setSelect(_selectedIndex,true);
         sendEvent("change");
         sendEvent("select");
         if(_selectHandler != null)
         {
            Handler.execute(_selectHandler,[_selectedIndex]);
         }
      }
      
      protected function setSelect(param1:int, param2:Boolean) : void
      {
         if(_items && param1 > -1 && param1 < _items.length)
         {
            _items[param1].selected = param2;
         }
      }
      
      public function get selectHandler() : *
      {
         return _selectHandler;
      }
      
      public function set selectHandler(param1:*) : void
      {
         _selectHandler = param1;
      }
      
      public function get skin() : String
      {
         return _skin;
      }
      
      public function set skin(param1:String) : void
      {
         if(_skin != param1)
         {
            _skin = param1;
            callLater(changeLabels);
         }
      }
      
      public function get labels() : String
      {
         return _labels;
      }
      
      public function set labels(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(_labels != param1)
         {
            _labels = param1;
            DisplayUtils.disposeChildren(this);
            callLater(changeLabels);
            if(_labels)
            {
               _loc3_ = _labels.split(",");
               _loc5_ = 0;
               _loc4_ = _loc3_.length;
               while(_loc5_ < _loc4_)
               {
                  _loc2_ = createItem(_skin,_loc3_[_loc5_]);
                  _loc2_.name = "item" + _loc5_;
                  addChild(_loc2_);
                  _loc5_++;
               }
            }
            initItems();
         }
      }
      
      protected function createItem(param1:String, param2:String) : DisplayObject
      {
         return null;
      }
      
      public function get labelColors() : String
      {
         return _labelColors;
      }
      
      public function set labelColors(param1:String) : void
      {
         if(_labelColors != param1)
         {
            _labelColors = param1;
            callLater(changeLabels);
         }
      }
      
      public function get labelStroke() : String
      {
         return _labelStroke;
      }
      
      public function set labelStroke(param1:String) : void
      {
         if(_labelStroke != param1)
         {
            _labelStroke = param1;
            callLater(changeLabels);
         }
      }
      
      public function get labelSize() : Object
      {
         return _labelSize;
      }
      
      public function set labelSize(param1:Object) : void
      {
         if(_labelSize != param1)
         {
            _labelSize = param1;
            callLater(changeLabels);
         }
      }
      
      public function get labelBold() : Object
      {
         return _labelBold;
      }
      
      public function set labelBold(param1:Object) : void
      {
         if(_labelBold != param1)
         {
            _labelBold = param1;
            callLater(changeLabels);
         }
      }
      
      public function get labelMargin() : String
      {
         return _labelMargin;
      }
      
      public function set labelMargin(param1:String) : void
      {
         if(_labelMargin != param1)
         {
            _labelMargin = param1;
            callLater(changeLabels);
         }
      }
      
      public function get direction() : String
      {
         return _direction;
      }
      
      public function set direction(param1:String) : void
      {
         _direction = param1;
         callLater(changeLabels);
      }
      
      public function get space() : Number
      {
         return _space;
      }
      
      public function set space(param1:Number) : void
      {
         _space = param1;
         callLater(changeLabels);
      }
      
      protected function changeLabels() : void
      {
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeLabels);
         super.commitMeasure();
      }
      
      public function get items() : Vector.<morn.core.components.ISelect>
      {
         return _items;
      }
      
      public function get selection() : morn.core.components.ISelect
      {
         return _selectedIndex > -1 && _selectedIndex < _items.length?_items[_selectedIndex]:null;
      }
      
      public function set selection(param1:morn.core.components.ISelect) : void
      {
         selectedIndex = _items.indexOf(param1);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is int || param1 is String)
         {
            selectedIndex = int(param1);
         }
         else if(param1 is Array)
         {
            labels = (param1 as Array).join(",");
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      public function get labelFilterKind() : String
      {
         return _labelFilterKind;
      }
      
      public function set labelFilterKind(param1:String) : void
      {
         if(_labelFilterKind != param1)
         {
            _labelFilterKind = param1;
            callLater(changeLabels);
         }
      }
   }
}
