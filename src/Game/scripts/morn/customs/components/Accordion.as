package morn.customs.components
{
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.ScrollBar;
   import morn.customs.expands.ListCellVo;
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   import morn.core.components.View;
   import com.mz.core.event.ChangeValueEvent;
   import flash.display.DisplayObject;
   import morn.core.events.UIEvent;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import flash.events.Event;
   
   public class Accordion extends List
   {
       
      
      protected var boxs:Vector.<morn.customs.components.AccordionBox>;
      
      protected var _subCells:Vector.<Box>;
      
      public var subRender;
      
      private var _subTop:int;
      
      private var _subBottom:int;
      
      protected var _subArray:Array;
      
      public function Accordion()
      {
         boxs = new Vector.<morn.customs.components.AccordionBox>();
         _subCells = new Vector.<Box>();
         super();
      }
      
      override protected function changeCells() : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:int = 0;
         if(_itemRender)
         {
            var _loc11_:* = 0;
            var _loc10_:* = _cells;
            for each(var _loc4_ in _cells)
            {
               _loc4_.removeEventListener("click",onCellMouse);
               _loc4_.removeEventListener("rollOver",onCellMouse);
               _loc4_.removeEventListener("rollOut",onCellMouse);
               _loc4_.removeEventListener("mouseDown",onCellMouse);
               _loc4_.removeEventListener("mouseUp",onCellMouse);
               _loc4_.removeEventListener("doubleClick",onCellMouse);
               _loc4_.dispose();
            }
            _cells.length = 0;
            var _loc13_:int = 0;
            var _loc12_:* = _subCells;
            for each(var _loc1_ in _subCells)
            {
               _loc1_.removeEventListener("changeValue",subCellValueChangeHandler);
               _loc1_.dispose();
            }
            _subCells.length = 0;
            var _loc15_:int = 0;
            var _loc14_:* = boxs;
            for each(var _loc8_ in boxs)
            {
               _loc8_.dispose();
            }
            boxs.length = 0;
            scrollBar = getChildByName("scrollBar") as ScrollBar;
            _loc4_ = createCell();
            _loc1_ = createSubCell();
            _loc3_ = !!isNaN(_width)?Math.max(_loc4_.width,_loc1_.width):Number(_width);
            _loc2_ = !!isNaN(_height)?(_loc4_.height + _spaceY) * repeatY - _spaceY + _loc1_.height:Number(_height);
            _cellSize = _loc4_.height + _spaceY + _loc1_.height;
            _cellSize = 1;
            if(_isVerticalLayout && _scrollBar)
            {
               _scrollBar.height = _loc2_;
            }
            else if(_isVerticalLayout && _scrollBar)
            {
               _scrollBar.width = _loc3_;
            }
            setContentSize(_loc3_,_loc2_);
            _loc6_ = !!_isVerticalLayout?repeatX:int(repeatY);
            _loc7_ = (!!_isVerticalLayout?repeatY:int(repeatX)) + (!!_scrollBar?1:0);
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc6_)
               {
                  _loc8_ = new morn.customs.components.AccordionBox();
                  _loc8_.width = _loc3_;
                  _loc4_ = this.createCell();
                  _loc1_ = this.createSubCell();
                  _loc11_ = new ListCellVo(this,_loc9_ * _loc6_ + _loc5_);
                  _loc1_.listCellVo = _loc11_;
                  _loc10_ = _loc11_;
                  _loc4_.listCellVo = _loc10_;
                  _loc8_.listCellVo = _loc10_;
                  _loc8_.y = (!!_isVerticalLayout?_loc9_:int(_loc5_)) * (_spaceY + _loc4_.height);
                  _loc4_.y = 0;
                  _loc1_.x = 0;
                  _loc1_.y = _loc4_.height + subTop;
                  _loc8_.name = "box" + (_loc9_ * _loc6_ + _loc5_);
                  _loc4_.name = "item" + (_loc9_ * _loc6_ + _loc5_);
                  _loc1_.name = "subItem" + (_loc9_ * _loc6_ + _loc5_);
                  _content.addChild(_loc8_);
                  _loc8_.addChild(_loc4_);
                  _loc8_.addChild(_loc1_);
                  boxs.push(_loc8_);
                  addCell(_loc4_);
                  addSubCell(_loc1_);
                  _loc5_++;
               }
               _loc9_++;
            }
            if(_array)
            {
               array = _array;
               exeCallLater(renderItems);
            }
         }
      }
      
      override public function set array(param1:Array) : void
      {
         .super.array = param1;
         callLater(switchSeleted,[false]);
      }
      
      public function get subArray() : Array
      {
         return _subArray;
      }
      
      public function set subArray(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = undefined;
         exeCallLater(changeCells);
         _subArray = param1 || [];
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            if(this._subCells[_loc4_] is List)
            {
               if(this._subCells[_loc4_].isVerticalLayout)
               {
                  this._subCells[_loc4_].repeatY = _loc2_.length;
               }
            }
            this._subCells[_loc4_].dataSource = _loc2_;
            _loc4_++;
         }
         this.switchSeleted(true);
      }
      
      override public function setContentSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _content.width = param1;
         _content.height = param2;
         _content.scrollRect = new Rectangle(0,0,param1,param2);
      }
      
      protected function createSubCell() : Box
      {
         return subRender is XML?View.createComp(subRender) as Box:new subRender();
      }
      
      protected function addSubCell(param1:Box) : void
      {
         param1.addEventListener("changeValue",subCellValueChangeHandler);
         _subCells.push(param1);
      }
      
      protected function subCellValueChangeHandler(param1:ChangeValueEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         if(_loc2_ && _loc2_ is List)
         {
            dispatchEvent(new UIEvent("accordion_change_sub_selected_data",(_loc2_ as List).selectedItem));
         }
         else
         {
            dispatchEvent(new UIEvent("accordion_change_sub_selected_data",param1.newValue));
         }
      }
      
      override public function set selectedIndex(param1:int) : void
      {
         if(_selectedIndex != param1)
         {
            .super.selectedIndex = param1;
            switchSeleted(true);
         }
      }
      
      public function get subSelection() : Box
      {
         return getSubCell(_selectedIndex);
      }
      
      public function getSubCell(param1:int) : Box
      {
         exeCallLater(changeCells);
         if(param1 > -1 && _subCells && param1 - _startIndex > -1 && param1 - _startIndex < _cells.length)
         {
            return _subCells[param1 - _startIndex];
         }
         return null;
      }
      
      public function get subCells() : Vector.<Box>
      {
         exeCallLater(changeCells);
         return _subCells;
      }
      
      public function switchSeleted(param1:Boolean) : void
      {
         var _loc12_:int = 0;
         var _loc11_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:int = 0;
         var _loc10_:int = this.boxs.length;
         var _loc7_:int = 0;
         _loc12_ = 0;
         while(_loc12_ < _loc10_)
         {
            _loc11_ = this.boxs[_loc12_];
            _loc3_ = this._cells[_loc12_];
            _loc2_ = this._subCells[_loc12_];
            if(_loc12_ < this._selectedIndex || this._selectedIndex == -1)
            {
               _loc5_ = _loc12_ * _loc3_.height;
               _loc4_ = _loc3_.height;
            }
            else if(_loc12_ == this._selectedIndex)
            {
               _loc7_ = _loc2_.height;
               _loc5_ = _loc12_ * _loc3_.height;
               _loc4_ = _loc3_.height + _loc7_ + _subTop + _subBottom;
            }
            else
            {
               _loc5_ = _loc12_ * _loc3_.height + _loc7_ + _subTop + _subBottom;
               _loc4_ = _loc3_.height;
            }
            if(param1)
            {
               TweenLite.to(_loc11_,0.2,{
                  "y":_loc5_,
                  "height":_loc4_,
                  "ease":Cubic.easeOut
               });
            }
            else
            {
               _loc11_.y = _loc5_;
               _loc11_.height = _loc4_;
            }
            _loc12_++;
         }
         if(_scrollBar)
         {
            _loc8_ = !!_isVerticalLayout?repeatX:int(repeatY);
            _loc9_ = !!_isVerticalLayout?repeatY:int(repeatX);
            _loc6_ = Math.ceil(length / _loc8_);
            _scrollBar.visible = _loc5_ + _loc4_ > this.height;
            if(_scrollBar.visible)
            {
               _scrollBar.scrollSize = 10;
               _scrollBar.thumbPercent = _loc9_ / _loc6_;
               _scrollBar.setScroll(0,_loc5_ + _loc4_ - this.height,0);
            }
            else
            {
               _scrollBar.setScroll(0,0,0);
            }
         }
      }
      
      override protected function onScrollBarChange(param1:Event) : void
      {
         exeCallLater(changeCells);
         var _loc2_:Rectangle = _content.scrollRect;
         var _loc3_:Number = _scrollBar.value;
         if(_isVerticalLayout)
         {
            _loc2_.y = _loc3_;
         }
         else
         {
            _loc2_.x = _loc3_;
         }
         _content.scrollRect = _loc2_;
      }
      
      public function get subTop() : int
      {
         return _subTop;
      }
      
      public function set subTop(param1:int) : void
      {
         if(_subTop != param1)
         {
            callLater(switchSeleted,[true]);
         }
         _subTop = param1;
      }
      
      public function get subBottom() : int
      {
         return _subBottom;
      }
      
      public function set subBottom(param1:int) : void
      {
         if(_subBottom != param1)
         {
            callLater(switchSeleted,[true]);
         }
         _subBottom = param1;
      }
   }
}
