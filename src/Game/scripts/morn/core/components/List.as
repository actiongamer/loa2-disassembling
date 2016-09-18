package morn.core.components
{
   import morn.editor.core.IRender;
   import flash.display.DisplayObject;
   import morn.core.handlers.Handler;
   import morn.customs.expands.ListCellVo;
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   import flash.events.MouseEvent;
   import com.mz.core.event.ChangeValueEvent;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   import com.greensock.TweenLite;
   import morn.core.events.DragEvent;
   
   public class List extends morn.core.components.Box implements IRender, IItem
   {
      
      public static const SET_DATA_SOURCE:String = "setDataSource";
      
      public static const SELECT_BOX:String = "selectBox";
      
      public static const FRAME_STATE_UP:int = 1;
      
      public static const FRAME_STATE_OVER:int = 2;
      
      public static const FRAME_STATE_SELECT:int = 3;
       
      
      protected var _content:morn.core.components.Box;
      
      protected var _scrollBar:morn.core.components.ScrollBar;
      
      protected var _itemRender;
      
      protected var _repeatX:int;
      
      protected var _repeatY:int;
      
      protected var _repeatX2:int;
      
      protected var _repeatY2:int;
      
      protected var _spaceX:int;
      
      protected var _spaceY:int;
      
      protected var _cells:Vector.<morn.core.components.Box>;
      
      protected var _array:Array;
      
      protected var _startIndex:int;
      
      protected var _selectedIndex:int = -1;
      
      protected var _selectHandler;
      
      public var changeHandler;
      
      protected var _renderHandler;
      
      protected var _mouseHandler;
      
      protected var _page:int;
      
      protected var _totalPage:int;
      
      protected var _selectEnable:Boolean = true;
      
      protected var _isVerticalLayout:Boolean = true;
      
      protected var _cellSize:Number = 20;
      
      protected var _useMouseDown:Boolean = true;
      
      public var preCondHandler;
      
      public var createCellHandler;
      
      public var scrollToTween:Boolean;
      
      public function List()
      {
         _cells = new Vector.<morn.core.components.Box>();
         super();
      }
      
      public function set isVerticalLayout(param1:Boolean) : void
      {
         _isVerticalLayout = param1;
      }
      
      public function get isVerticalLayout() : Boolean
      {
         return _isVerticalLayout;
      }
      
      override protected function createChildren() : void
      {
         _content = new morn.core.components.Box();
         addChild(new morn.core.components.Box());
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         return param1 != _content?super.removeChild(param1):null;
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         return getChildAt(param1) != _content?super.removeChildAt(param1):null;
      }
      
      public function get content() : morn.core.components.Box
      {
         return _content;
      }
      
      public function get scrollBar() : morn.core.components.ScrollBar
      {
         return _scrollBar;
      }
      
      public function set scrollBar(param1:morn.core.components.ScrollBar) : void
      {
         if(_scrollBar != param1)
         {
            _scrollBar = param1;
            if(param1)
            {
               addChild(_scrollBar);
               _scrollBar.target = this;
               _scrollBar.addEventListener("change",onScrollBarChange);
               _isVerticalLayout = _scrollBar.direction == "vertical";
            }
         }
      }
      
      public function get itemRender() : *
      {
         return _itemRender;
      }
      
      public function set itemRender(param1:*) : void
      {
         if(itemRender != param1)
         {
            _itemRender = param1;
            callLater(changeCells);
         }
      }
      
      public function get repeatX() : int
      {
         return _repeatX > 0?_repeatX:_repeatX2 > 0?_repeatX2:1;
      }
      
      public function set repeatX(param1:int) : void
      {
         if(_repeatX != param1)
         {
            _repeatX = param1;
            callLater(changeCells);
         }
      }
      
      public function get repeatY() : int
      {
         return _repeatY > 0?_repeatY:_repeatY2 > 0?_repeatY2:1;
      }
      
      public function set repeatY(param1:int) : void
      {
         if(_repeatY != param1)
         {
            _repeatY = param1;
            callLater(changeCells);
         }
      }
      
      public function get spaceX() : int
      {
         return _spaceX;
      }
      
      public function set spaceX(param1:int) : void
      {
         if(_spaceX != param1)
         {
            _spaceX = param1;
            callLater(changeCells);
         }
      }
      
      public function get spaceY() : int
      {
         return _spaceY;
      }
      
      public function set spaceY(param1:int) : void
      {
         if(_spaceY != param1)
         {
            _spaceY = param1;
            callLater(changeCells);
         }
      }
      
      protected function createCell() : morn.core.components.Box
      {
         var _loc1_:morn.core.components.Box = _itemRender is XML?View.createComp(_itemRender) as morn.core.components.Box:new _itemRender();
         if(createCellHandler)
         {
            Handler.execute(this.createCellHandler,[_loc1_]);
         }
         return _loc1_;
      }
      
      protected function changeCells() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         if(_itemRender)
         {
            var _loc9_:int = 0;
            var _loc8_:* = _cells;
            for each(var _loc3_ in _cells)
            {
               _loc3_.removeEventListener("click",onCellMouse);
               _loc3_.removeEventListener("rollOver",onCellMouse);
               _loc3_.removeEventListener("rollOut",onCellMouse);
               _loc3_.removeEventListener("mouseDown",onCellMouse);
               _loc3_.removeEventListener("mouseUp",onCellMouse);
               _loc3_.removeEventListener("doubleClick",onCellMouse);
               _loc3_.dispose();
            }
            _cells.length = 0;
            scrollBar = getChildByName("scrollBar") as morn.core.components.ScrollBar;
            _loc3_ = createCell();
            if(_repeatX < 1 && !isNaN(_width))
            {
               _repeatX2 = Math.round(_width / (_loc3_.width + _spaceX));
            }
            if(_repeatY < 1 && !isNaN(_height))
            {
               _repeatY2 = Math.round(_height / (_loc3_.height + _spaceY));
            }
            _loc2_ = !!isNaN(_width)?(_loc3_.width + _spaceX) * repeatX - _spaceX:Number(_width);
            _loc1_ = !!isNaN(_height)?(_loc3_.height + _spaceY) * repeatY - _spaceY:Number(_height);
            _cellSize = !!_isVerticalLayout?_loc3_.height + _spaceY:Number(_loc3_.width + _spaceX);
            if(_isVerticalLayout && _scrollBar)
            {
               _scrollBar.height = _loc1_;
            }
            else if(_isVerticalLayout && _scrollBar)
            {
               _scrollBar.width = _loc2_;
            }
            setContentSize(_loc2_,_loc1_);
            _loc5_ = !!_isVerticalLayout?repeatX:int(repeatY);
            _loc6_ = (!!_isVerticalLayout?repeatY:int(repeatX)) + (!!_scrollBar?1:0);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  if(!(_loc4_ == 0 && _loc7_ == 0))
                  {
                     _loc3_ = this.createCell();
                  }
                  _loc3_.listCellVo = new ListCellVo(this,_loc7_ * _loc5_ + _loc4_);
                  _loc3_.x = (!!_isVerticalLayout?_loc4_:int(_loc7_)) * (_spaceX + _loc3_.width);
                  _loc3_.y = (!!_isVerticalLayout?_loc7_:int(_loc4_)) * (_spaceY + _loc3_.height);
                  _loc3_.name = "item" + (_loc7_ * _loc5_ + _loc4_);
                  _content.addChild(_loc3_);
                  addCell(_loc3_);
                  _loc4_++;
               }
               _loc7_++;
            }
            if(_array)
            {
               array = _array;
               exeCallLater(renderItems);
            }
         }
      }
      
      public function refreshSize() : void
      {
         changeSize();
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(this.changeCells);
         cancelCallLater(this.renderItems);
         super.cancelMeasure();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      protected function addCell(param1:morn.core.components.Box) : void
      {
         param1.addEventListener("click",onCellMouse);
         param1.addEventListener("rollOver",onCellMouse);
         param1.addEventListener("rollOut",onCellMouse);
         param1.addEventListener("mouseDown",onCellMouse);
         param1.addEventListener("mouseUp",onCellMouse);
         param1.addEventListener("doubleClick",onCellMouse);
         _cells.push(param1);
      }
      
      public function initItems() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(!_itemRender)
         {
            _loc2_ = 0;
            while(_loc2_ < 2147483647)
            {
               _loc1_ = getChildByName("item" + _loc2_) as morn.core.components.Box;
               if(_loc1_)
               {
                  _loc1_.name = "item" + _loc2_;
                  _content.addChild(_loc1_);
                  addCell(_loc1_);
                  _loc2_++;
                  continue;
               }
               break;
            }
         }
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         callLater(changeCells);
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         callLater(changeCells);
      }
      
      public function setContentSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _content.width = param1;
         _content.height = param2;
         if(_scrollBar)
         {
            _loc3_.beginFill(16711680,0);
            _loc3_.drawRect(0,0,param1,param2);
            _loc3_.endFill();
            _content.scrollRect = new Rectangle(0,0,param1,param2);
         }
      }
      
      protected function onCellMouse(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:morn.core.components.Box = param1.currentTarget as morn.core.components.Box;
         var _loc2_:int = _startIndex + _cells.indexOf(_loc3_);
         if(!_useMouseDown && param1.type == "click" || _useMouseDown && param1.type == "mouseDown")
         {
            if(_selectEnable)
            {
               _loc4_ = selectedIndex;
               selectedIndex = _loc2_;
               if(changeHandler != null)
               {
                  Handler.execute(changeHandler,[_loc2_,_loc4_]);
               }
               this.dispatchEvent(new ChangeValueEvent(_loc2_,_loc4_));
            }
            else
            {
               changeCellState(_loc3_,true,2);
            }
         }
         else if(_selectedIndex != _loc2_)
         {
            if(param1.type == "rollOver")
            {
               changeCellState(_loc3_,true,2);
            }
            else if(param1.type == "rollOut")
            {
               changeCellState(_loc3_,false,2);
            }
         }
         if(_mouseHandler != null)
         {
            Handler.execute(_mouseHandler,[param1,_loc2_]);
         }
      }
      
      protected function changeCellState(param1:morn.core.components.Box, param2:Boolean, param3:int) : void
      {
         param1.changeSelectState(!!param2?param3:1);
      }
      
      protected function onScrollBarChange(param1:Event) : void
      {
         exeCallLater(changeCells);
         var _loc3_:Rectangle = _content.scrollRect;
         var _loc4_:Number = _scrollBar.value;
         var _loc2_:int = int(_loc4_ / _cellSize) * (!!_isVerticalLayout?repeatX:int(repeatY));
         if(_loc2_ != _startIndex)
         {
            startIndex = _loc2_;
         }
         if(_isVerticalLayout)
         {
            _loc3_.y = _loc4_ % _cellSize;
         }
         else
         {
            _loc3_.x = _loc4_ % _cellSize;
         }
         _content.scrollRect = _loc3_;
      }
      
      public function get selectEnable() : Boolean
      {
         return _selectEnable;
      }
      
      public function set selectEnable(param1:Boolean) : void
      {
         _selectEnable = param1;
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
         _selectedIndex = param1;
         changeSelectStatus();
         sendEvent("change");
         sendEvent("select");
         if(_selectHandler != null)
         {
            Handler.execute(_selectHandler,[param1]);
         }
      }
      
      protected function changeSelectStatus() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 0;
         _loc1_ = _cells.length;
         while(_loc2_ < _loc1_)
         {
            changeCellState(_cells[_loc2_],_selectedIndex == _startIndex + _loc2_,3);
            _loc2_++;
         }
      }
      
      public function get selectedItem() : Object
      {
         return _selectedIndex != -1?_array[_selectedIndex]:null;
      }
      
      public function set selectedItem(param1:Object) : void
      {
         selectedIndex = _array.indexOf(param1);
      }
      
      public function get selection() : morn.core.components.Box
      {
         return getCell(_selectedIndex);
      }
      
      public function set selection(param1:morn.core.components.Box) : void
      {
         selectedIndex = _startIndex + _cells.indexOf(param1);
      }
      
      public function get selectHandler() : *
      {
         return _selectHandler;
      }
      
      public function set selectHandler(param1:*) : void
      {
         _selectHandler = param1;
      }
      
      public function get renderHandler() : *
      {
         return _renderHandler;
      }
      
      public function set renderHandler(param1:*) : void
      {
         _renderHandler = param1;
      }
      
      public function get mouseHandler() : *
      {
         return _mouseHandler;
      }
      
      public function set mouseHandler(param1:*) : void
      {
         _mouseHandler = param1;
      }
      
      public function get startIndex() : int
      {
         return _startIndex;
      }
      
      public function get startIndexMax() : int
      {
         if(array)
         {
            return Math.max(0,array.length - this.repeatY);
         }
         return 0;
      }
      
      public function set startIndex(param1:int) : void
      {
         _startIndex = param1 > 0?param1:0;
         callLater(renderItems);
      }
      
      protected function renderItems() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 0;
         _loc1_ = _cells.length;
         while(_loc2_ < _loc1_)
         {
            renderItem(_cells[_loc2_],_startIndex + _loc2_);
            _loc2_++;
         }
         changeSelectStatus();
      }
      
      protected function renderItem(param1:morn.core.components.Box, param2:int) : void
      {
         if(param2 < _array.length)
         {
            param1.visible = true;
            if(param1.listCellVo)
            {
               param1.listCellVo.dataIndex = param2;
            }
            param1.dataSource = _array[param2];
         }
         else
         {
            if(param1.listCellVo)
            {
               param1.listCellVo.dataIndex = -1;
            }
            param1.visible = false;
            param1.dataSource = null;
         }
         sendEvent("listRender",[param1,param2]);
         if(_renderHandler != null)
         {
            Handler.execute(_renderHandler,[param1,param2]);
         }
      }
      
      public function get array() : Array
      {
         return _array;
      }
      
      public function set array(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         exeCallLater(changeCells);
         _array = param1 || [];
         var _loc3_:int = _array.length;
         _totalPage = Math.ceil(_loc3_ / (repeatX * repeatY));
         if(this.page >= this._totalPage && this._totalPage > 0)
         {
            this.page = this._totalPage - 1;
         }
         else if(this.page < 0)
         {
            this.page = 0;
         }
         else
         {
            _selectedIndex = _selectedIndex < _loc3_?_selectedIndex:_loc3_ - 1;
            startIndex = _startIndex;
         }
         if(_scrollBar)
         {
            _loc4_ = !!_isVerticalLayout?repeatX:int(repeatY);
            _loc5_ = !!_isVerticalLayout?repeatY:int(repeatX);
            _loc2_ = Math.ceil(_loc3_ / _loc4_);
            _scrollBar.visible = _totalPage > 1;
            if(_scrollBar.visible)
            {
               _scrollBar.scrollSize = _cellSize;
               _scrollBar.thumbPercent = _loc5_ / _loc2_;
               _scrollBar.setScroll(0,(_loc2_ - _loc5_) * _cellSize,_startIndex / _loc4_ * _cellSize);
            }
            else
            {
               _scrollBar.setScroll(0,0,0);
            }
         }
         this.dispatchEvent(new MzEvent("setDataSource",_array));
      }
      
      public function get totalPage() : int
      {
         return _totalPage;
      }
      
      public function set totalPage(param1:int) : void
      {
         _totalPage = param1;
      }
      
      public function get page() : int
      {
         return _page;
      }
      
      public function set page(param1:int) : void
      {
         _page = param1;
         if(_array)
         {
            _page = param1 > 0?param1:0;
            _page = _page < _totalPage?_page:_totalPage - 1;
            startIndex = _page * repeatX * repeatY;
         }
      }
      
      public function get length() : int
      {
         return _array.length;
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
            array = param1 as Array;
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      public function get cells() : Vector.<morn.core.components.Box>
      {
         exeCallLater(changeCells);
         return _cells;
      }
      
      public function get lastCellActived() : morn.core.components.Box
      {
         var _loc1_:* = null;
         var _loc2_:int = this.cells.length;
         while(true)
         {
            _loc2_--;
            if(_loc2_ <= -1)
            {
               break;
            }
            _loc1_ = this.cells[_loc2_];
            if(_loc1_.visible || _loc1_.dataSource)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get vScrollBarSkin() : String
      {
         return _scrollBar.skin;
      }
      
      public function set vScrollBarSkin(param1:String) : void
      {
         removeChildByName("scrollBar");
         var _loc2_:morn.core.components.ScrollBar = new VScrollBar();
         _loc2_.name = "scrollBar";
         _loc2_.right = 0;
         _loc2_.skin = param1;
         addChild(_loc2_);
         callLater(changeCells);
      }
      
      public function get hScrollBarSkin() : String
      {
         return _scrollBar.skin;
      }
      
      public function set hScrollBarSkin(param1:String) : void
      {
         removeChildByName("scrollBar");
         var _loc2_:morn.core.components.ScrollBar = new HScrollBar();
         _loc2_.name = "scrollBar";
         _loc2_.bottom = 0;
         _loc2_.skin = param1;
         addChild(_loc2_);
         callLater(changeCells);
      }
      
      public function refresh() : void
      {
         array = _array;
      }
      
      public function getItem(param1:int) : Object
      {
         if(param1 > -1 && param1 < _array.length)
         {
            return _array[param1];
         }
         return null;
      }
      
      public function getItemIndex(param1:Object) : int
      {
         return _array.indexOf(param1);
      }
      
      public function refreshItem(param1:int) : void
      {
         if(param1 > -1 && param1 < _array.length)
         {
            if(param1 >= _startIndex && param1 < _startIndex + _cells.length)
            {
               renderItem(getCell(param1),param1);
            }
         }
      }
      
      public function changeItem(param1:int, param2:Object) : void
      {
         if(param1 > -1 && param1 < _array.length)
         {
            _array[param1] = param2;
            if(param1 >= _startIndex && param1 < _startIndex + _cells.length)
            {
               renderItem(getCell(param1),param1);
            }
         }
      }
      
      public function addItem(param1:Object) : void
      {
         _array.push(param1);
         array = _array;
      }
      
      public function addItemAt(param1:Object, param2:int) : void
      {
         _array.splice(param2,0,param1);
         array = _array;
      }
      
      public function deleteItem(param1:int) : void
      {
         _array.splice(param1,1);
         array = _array;
      }
      
      public function deleteItemObject(param1:Object) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ >= 0)
         {
            this.deleteItem(_loc2_);
         }
      }
      
      public function getCell(param1:int) : morn.core.components.Box
      {
         exeCallLater(changeCells);
         if(param1 > -1 && _cells && param1 - _startIndex > -1 && param1 - _startIndex < _cells.length)
         {
            return _cells[param1 - _startIndex];
         }
         return null;
      }
      
      public function scrollTo(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         this.commitMeasure();
         startIndex = param1;
         if(_scrollBar)
         {
            _loc2_ = !!_isVerticalLayout?repeatX:int(repeatY);
            _loc3_ = param1 / _loc2_ * _cellSize;
            if(scrollToTween)
            {
               TweenLite.to(_scrollBar,1,{"value":_loc3_});
            }
            else
            {
               _scrollBar.value = _loc3_;
            }
         }
      }
      
      public function scrollToBottom() : void
      {
         this.scrollTo(this.array.length - this.repeatX * this.repeatY);
      }
      
      public function getDropIndex(param1:DragEvent) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = param1.data.dropTarget;
         _loc4_ = 0;
         _loc2_ = _cells.length;
         while(_loc4_ < _loc2_)
         {
            if(_cells[_loc4_].contains(_loc3_))
            {
               return _startIndex + _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(this.changeCells);
         exeCallLater(this.renderItems);
         super.commitMeasure();
      }
      
      public function get useMouseDown() : Boolean
      {
         return _useMouseDown;
      }
      
      public function set useMouseDown(param1:Boolean) : void
      {
         _useMouseDown = param1;
      }
   }
}
