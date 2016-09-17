package morn.core.components
{
   import morn.core.handlers.Handler;
   import flash.display.DisplayObject;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IDispose;
   
   public class ViewStack extends Box implements IItem
   {
       
      
      protected var _items:Array;
      
      protected var _setIndexHandler:Handler;
      
      protected var _selectedIndex:int = -1;
      
      protected var _subViewClassArr:Array;
      
      public var createSubViewCallBack;
      
      public function ViewStack()
      {
         _setIndexHandler = new Handler(setIndex);
         super();
      }
      
      public function set subViewClasses(param1:Array) : void
      {
         _subViewClassArr = param1;
      }
      
      public function setItems(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         removeAllChild();
         var _loc2_:int = 0;
         _loc5_ = 0;
         _loc4_ = param1.length;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_)
            {
               _loc3_.name = "item" + _loc2_;
               addChild(_loc3_);
               _loc2_++;
            }
            _loc5_++;
         }
         initItems();
      }
      
      public function addItem(param1:DisplayObject) : void
      {
         if(_items == null)
         {
            param1.name = "item0";
         }
         else
         {
            param1.name = "item" + _items.length;
         }
         addChild(param1);
         initItems();
      }
      
      public function initItems() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _items = [];
         _loc2_ = 0;
         while(_loc2_ < 2147483647)
         {
            _loc1_ = getChildByName("item" + _loc2_);
            if(_loc1_ != null)
            {
               _items.push(_loc1_);
               _loc1_.visible = _loc2_ == _selectedIndex;
               _loc2_++;
               continue;
            }
            break;
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
            setSelect(_selectedIndex,false);
            _selectedIndex = param1;
            setSelect(_selectedIndex,true);
         }
      }
      
      protected function setSelect(param1:int, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!_items)
         {
            _items = [];
         }
         if(_subViewClassArr && _subViewClassArr.length > 0 && param1 > -1 && !_items[param1] && param1 < _subViewClassArr.length)
         {
            _loc3_ = _subViewClassArr[param1];
            _loc4_ = new _loc3_();
            _items[param1] = _loc4_;
            _loc4_.name = "item" + param1;
            addChild(_loc4_);
            if(createSubViewCallBack != null)
            {
               Handler.execute(createSubViewCallBack,[_loc4_]);
            }
         }
         if(_items && param1 > -1 && _items[param1])
         {
            if(_items[param1] is IViewStackPage)
            {
               if(param2)
               {
                  (_items[param1] as IViewStackPage).viewStackIn();
               }
               else
               {
                  (_items[param1] as IViewStackPage).viewStackOut();
               }
            }
            else
            {
               _items[param1].visible = param2;
            }
         }
      }
      
      public function get selection() : DisplayObject
      {
         if(!_items)
         {
            return null;
         }
         return _selectedIndex > -1 && _selectedIndex < _items.length?_items[_selectedIndex]:null;
      }
      
      public function set selection(param1:DisplayObject) : void
      {
         selectedIndex = _items.indexOf(param1);
      }
      
      public function get setIndexHandler() : Handler
      {
         return _setIndexHandler;
      }
      
      public function set setIndexHandler(param1:Handler) : void
      {
         _setIndexHandler = param1;
      }
      
      protected function setIndex(param1:int) : void
      {
         selectedIndex = param1;
      }
      
      public function get items() : Array
      {
         return _items;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is int || param1 is String)
         {
            selectedIndex = int(param1);
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      override public function dispose() : void
      {
         _subViewClassArr = null;
         createSubViewCallBack = null;
         _setIndexHandler = null;
         if(_items)
         {
            _items.forEach(function(param1:IDispose, ... rest):void
            {
               if(param1)
               {
                  param1.dispose();
               }
            });
            _items = null;
         }
         super.dispose();
      }
   }
}
