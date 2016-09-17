package morn.core.components
{
   import morn.core.handlers.Handler;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import morn.core.utils.ObjectUtils;
   import flash.text.TextFormat;
   import flash.display.Graphics;
   import morn.core.utils.StringUtils;
   import flash.geom.Point;
   import com.mz.core.configs.EnvConfig;
   import flash.display.DisplayObject;
   
   public class ComboBox extends Component
   {
      
      public static const UP:String = "up";
      
      public static const DOWN:String = "down";
       
      
      protected var _visibleNum:int = 6;
      
      protected var _button:morn.core.components.Button;
      
      protected var _list:morn.core.components.List;
      
      protected var _isOpen:Boolean;
      
      protected var _scrollBar:morn.core.components.VScrollBar;
      
      protected var _itemColors:Array;
      
      protected var _itemSize:int;
      
      protected var _labels:Array;
      
      protected var _selectedIndex:int = -1;
      
      protected var _selectHandler;
      
      protected var _itemHeight:Number;
      
      protected var _listHeight:Number;
      
      public function ComboBox(param1:String = null, param2:String = null)
      {
         _itemColors = Styles.comboBoxItemColors;
         _itemSize = Styles.fontSize;
         _labels = [];
         super();
         this.skin = param1;
         this.labels = param2;
      }
      
      override protected function preinitialize() : void
      {
         mouseChildren = true;
      }
      
      override protected function createChildren() : void
      {
         _button = new morn.core.components.Button();
         addChild(new morn.core.components.Button());
         _list = new morn.core.components.List();
         _list.mouseHandler = new Handler(onlistItemMouse);
         _scrollBar = new morn.core.components.VScrollBar();
         _list.addChild(_scrollBar);
      }
      
      override protected function initialize() : void
      {
         _button.btnLabel.align = "left";
         _button.labelMargin = "5";
         _button.addEventListener("mouseDown",onButtonMouseDown);
         _list.addEventListener("change",onListChange);
         _scrollBar.name = "scrollBar";
         _scrollBar.y = 1;
      }
      
      private function onButtonMouseDown(param1:MouseEvent) : void
      {
         callLater(changeOpen);
      }
      
      protected function onListChange(param1:Event) : void
      {
         selectedIndex = _list.selectedIndex;
      }
      
      public function get skin() : String
      {
         return _button.skin;
      }
      
      public function set skin(param1:String) : void
      {
         if(_button.skin != param1)
         {
            _button.skin = param1;
            _contentWidth = _button.width;
            _contentHeight = _button.height;
            callLater(changeList);
         }
      }
      
      protected function changeList() : void
      {
         var _loc1_:Number = width - 2;
         var _loc2_:Number = _itemColors[2];
         _itemHeight = ObjectUtils.getTextField(new TextFormat(Styles.fontName,_itemSize)).height + 3;
         _list.itemRender = new XML("<Box><Label name=\'label\' width=\'" + _loc1_ + "\' size=\'" + _itemSize + "\' height=\'" + _itemHeight + "\' color=\'" + _loc2_ + "\' x=\'1\' /></Box>");
         _list.repeatY = _visibleNum;
         _scrollBar.x = width - _scrollBar.width - 1;
         _list.refresh();
      }
      
      protected function onlistItemMouse(param1:MouseEvent, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:String = param1.type;
         if(_loc5_ == "click" || _loc5_ == "rollOver" || _loc5_ == "rollOut")
         {
            _loc4_ = _list.getCell(param2);
            _loc3_ = _loc4_.getChildByName("label") as Label;
            if(_loc5_ == "rollOver")
            {
               _loc3_.background = true;
               _loc3_.backgroundColor = _itemColors[0];
               _loc3_.color = _itemColors[1];
            }
            else
            {
               _loc3_.background = false;
               _loc3_.color = _itemColors[2];
            }
            if(_loc5_ == "click")
            {
               isOpen = false;
            }
         }
      }
      
      protected function changeOpen() : void
      {
         isOpen = !_isOpen;
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         _button.width = _width;
         callLater(changeItem);
         callLater(changeList);
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         _button.height = _height;
      }
      
      public function get labels() : String
      {
         return _labels.join(",");
      }
      
      public function set labels(param1:String) : void
      {
         if(_labels.length > 0)
         {
            selectedIndex = -1;
         }
         if(param1)
         {
            _labels = param1.split(",");
         }
         else
         {
            _labels.length = 0;
         }
         callLater(changeItem);
      }
      
      protected function changeItem() : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         exeCallLater(changeList);
         _listHeight = _labels.length > 0?Math.min(_visibleNum,_labels.length) * _itemHeight:Number(_itemHeight);
         _scrollBar.height = _listHeight - 2;
         var _loc1_:Graphics = _list.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(1,_itemColors[3],0.3);
         _loc1_.beginFill(_itemColors[4]);
         _loc1_.drawRect(0,0,width - 1,_listHeight);
         _loc1_.endFill();
         var _loc2_:Array = [];
         _loc4_ = 0;
         _loc3_ = _labels.length;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push({"label":_labels[_loc4_]});
            _loc4_++;
         }
         _list.array = _loc2_;
      }
      
      public function get selectedIndex() : int
      {
         return _selectedIndex;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(_selectedIndex != param1)
         {
            _selectedIndex = param1;
            _list.selectedIndex = param1;
            _button.label = selectedLabel;
            sendEvent("change");
            sendEvent("select");
            if(_selectHandler != null)
            {
               Handler.execute(_selectHandler,[_selectedIndex]);
            }
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
      
      public function get selectedLabel() : String
      {
         return _selectedIndex > -1 && _selectedIndex < _labels.length?_labels[_selectedIndex]:null;
      }
      
      public function set selectedLabel(param1:String) : void
      {
         selectedIndex = _labels.indexOf(param1);
      }
      
      public function get visibleNum() : int
      {
         return _visibleNum;
      }
      
      public function set visibleNum(param1:int) : void
      {
         _visibleNum = param1;
         callLater(changeList);
      }
      
      public function get itemColors() : String
      {
         return String(_itemColors);
      }
      
      public function set itemColors(param1:String) : void
      {
         _itemColors = StringUtils.fillArray(_itemColors,param1);
         callLater(changeList);
      }
      
      public function get itemSize() : int
      {
         return _itemSize;
      }
      
      public function set itemSize(param1:int) : void
      {
         _itemSize = param1;
         callLater(changeList);
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeItem);
         exeCallLater(changeList);
         exeCallLater(changeOpen);
         super.commitMeasure();
      }
      
      public function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      public function set isOpen(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         if(_isOpen != param1)
         {
            _isOpen = param1;
            _button.selected = _isOpen;
            if(_isOpen)
            {
               _loc3_ = localToGlobal(new Point());
               _loc2_ = _loc3_.y + _button.height;
               _loc2_ = _loc2_ + _listHeight <= this.stage.stageHeight - EnvConfig.ins.shellY?_loc2_:Number(_loc3_.y - _listHeight);
               _list.setPosition(_loc3_.x,_loc2_);
               this.stage.addChild(_list);
               this.stage.addEventListener("mouseDown",removeList);
               _list.scrollTo(_selectedIndex + _visibleNum < _list.length?_selectedIndex:_list.length - _visibleNum);
            }
            else
            {
               _list.remove();
               this.stage.removeEventListener("mouseDown",removeList);
            }
         }
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeItem);
         cancelCallLater(changeList);
         cancelCallLater(changeOpen);
         super.cancelMeasure();
      }
      
      override public function dispose() : void
      {
         if(_list)
         {
            _list.dispose();
            _list = null;
         }
         super.dispose();
      }
      
      protected function removeList(param1:Event) : void
      {
         if(param1 == null || param1.target == _list.content || !_button.contains(param1.target as DisplayObject) && !_list.contains(param1.target as DisplayObject))
         {
            isOpen = false;
         }
      }
      
      public function get scrollBarSkin() : String
      {
         return _scrollBar.skin;
      }
      
      public function set scrollBarSkin(param1:String) : void
      {
         _scrollBar.skin = param1;
      }
      
      public function get sizeGrid() : String
      {
         return _button.sizeGrid;
      }
      
      public function set sizeGrid(param1:String) : void
      {
         _button.sizeGrid = param1;
      }
      
      public function get scrollBar() : morn.core.components.VScrollBar
      {
         return _scrollBar;
      }
      
      public function get button() : morn.core.components.Button
      {
         return _button;
      }
      
      public function get list() : morn.core.components.List
      {
         return _list;
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
      
      public function get labelColors() : String
      {
         return _button.labelColors;
      }
      
      public function set labelColors(param1:String) : void
      {
         _button.labelColors = param1;
      }
      
      public function get labelMargin() : String
      {
         return _button.btnLabel.margin;
      }
      
      public function set labelMargin(param1:String) : void
      {
         _button.btnLabel.margin = param1;
      }
      
      public function get labelStroke() : String
      {
         return _button.btnLabel.stroke;
      }
      
      public function set labelStroke(param1:String) : void
      {
         _button.btnLabel.stroke = param1;
      }
      
      public function get labelSize() : Object
      {
         return _button.btnLabel.size;
      }
      
      public function set labelSize(param1:Object) : void
      {
         _button.btnLabel.size = param1;
      }
      
      public function get labelBold() : Object
      {
         return _button.btnLabel.bold;
      }
      
      public function set labelBold(param1:Object) : void
      {
         _button.btnLabel.bold = param1;
      }
      
      public function get labelFont() : String
      {
         return _button.btnLabel.font;
      }
      
      public function set labelFont(param1:String) : void
      {
         _button.btnLabel.font = param1;
      }
      
      public function get stateNum() : int
      {
         return _button.stateNum;
      }
      
      public function set stateNum(param1:int) : void
      {
         _button.stateNum = param1;
      }
      
      public function get labelFilterKind() : String
      {
         return _button.btnLabel.labelFilterKind;
      }
      
      public function set labelFilterKind(param1:String) : void
      {
         _button.btnLabel.labelFilterKind = param1;
      }
   }
}
