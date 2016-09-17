package morn.core.components
{
   import com.mz.core.interFace.IUniqueId;
   import flash.events.MouseEvent;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.handlers.Handler;
   import morn.core.utils.ObjectUtils;
   import morn.core.utils.StringUtils;
   import morn.core.utils.UniqueId;
   
   public class Button extends Component implements ISelect, IUniqueId
   {
      
      protected static var stateMap:Object = {
         "rollOver":1,
         "rollOut":0,
         "mouseDown":2,
         "mouseUp":1,
         "selected":2
      };
      
      public static const MOUSEENABLED_KEY_CLICKDELAY:String = "MOUSEENABLED_KEY_CLICKDELAY";
      
      public static const MOUSEENABLED_KEY_DEFAULT:String = "MOUSEENABLED_KEY_DEFAULT";
       
      
      protected var _bitmap:morn.core.components.AutoBitmap;
      
      protected var _btnLabel:morn.core.components.Label;
      
      protected var _clickHandler;
      
      protected var _labelColors:Array;
      
      protected var _labelMargin:Array;
      
      protected var _labelStyle:String;
      
      protected var _state:int;
      
      protected var _toggle:Boolean;
      
      protected var _selected:Boolean;
      
      protected var _skin:String;
      
      protected var _autoSize:Boolean = true;
      
      protected var _stateNum:int;
      
      protected var _clickDelay:int;
      
      protected var _stateFilters:Array;
      
      public var _uniqueId:uint;
      
      protected var _mouseEnabledList:Object;
      
      public function Button(param1:String = null, param2:String = "")
      {
         _labelColors = Styles.buttonLabelColors;
         _labelMargin = Styles.buttonLabelMargin;
         _stateNum = Styles.buttonStateNum;
         _clickDelay = Config.clickNeedWaitDelay;
         _stateFilters = Styles.buttonStateFilters;
         _mouseEnabledList = {};
         super();
         this.skin = param1;
         this.label = param2;
         this._uniqueId = UniqueId.next;
      }
      
      public function get bg() : morn.core.components.AutoBitmap
      {
         return _bitmap;
      }
      
      public function get uniqueId() : uint
      {
         return _uniqueId;
      }
      
      override protected function preinitialize() : void
      {
         super.preinitialize();
         this.mouseChildren = false;
      }
      
      override protected function createChildren() : void
      {
         _bitmap = new morn.core.components.AutoBitmap();
         addChild(new morn.core.components.AutoBitmap());
         _btnLabel = new morn.core.components.Label();
         addChild(new morn.core.components.Label());
         _btnLabel.buttonMode = true;
      }
      
      override protected function initialize() : void
      {
         _btnLabel.align = "center";
         addEventListener("rollOver",onMouse);
         addEventListener("rollOut",onMouse);
         addEventListener("mouseDown",onMouse);
         addEventListener("mouseUp",onMouse);
         addEventListener("click",onMouse);
         _bitmap.sizeGrid = Styles.defaultSizeGrid;
         buttonMode = true;
         this.labelFilterKind = "黑色1像素描边";
      }
      
      protected function onMouse(param1:MouseEvent) : void
      {
         if(_toggle == false && _selected || _disabled)
         {
            return;
         }
         if(param1.type == "click")
         {
            if(_clickDelay != 0)
            {
               setMouseEnabledList("MOUSEENABLED_KEY_CLICKDELAY",false);
               TimerManager.ins.doOnce(_clickDelay,setEnable);
            }
            if(_toggle)
            {
               selected = !_selected;
            }
            if(_clickHandler)
            {
               Handler.execute(_clickHandler,[this,param1]);
            }
            return;
         }
         if(_selected == false)
         {
            state = stateMap[param1.type];
         }
      }
      
      public function get label() : String
      {
         return _btnLabel.text;
      }
      
      public function set label(param1:String) : void
      {
         if(_btnLabel.text != param1)
         {
            _btnLabel.text = param1;
            callLater(changeState);
         }
      }
      
      public function get skin() : String
      {
         return _skin;
      }
      
      public function set skin(param1:String) : void
      {
         if(_skin != param1)
         {
            if(_skin != null)
            {
               App.asset.removeCited(_skin,this);
            }
            _skin = param1;
            callLater(changeClips);
            callLater(changeLabelSize);
         }
      }
      
      protected function changeClips() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         _bitmap.clips = App.asset.getClips(_skin,1,_stateNum);
         App.asset.addCited(_skin,this);
         if(_autoSize)
         {
            _contentWidth = _bitmap.width;
            _contentHeight = _bitmap.height;
         }
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeState);
         exeCallLater(changeClips);
         exeCallLater(changeLabelSize);
         super.commitMeasure();
      }
      
      protected function changeLabelSize() : void
      {
         exeCallLater(changeClips);
         _btnLabel.width = width - _labelMargin[0] - _labelMargin[2];
         _btnLabel.height = ObjectUtils.getTextField(_btnLabel.format).height;
         _btnLabel.x = _labelMargin[0];
         _btnLabel.y = (height - _btnLabel.height) * 0.5 + _labelMargin[1] - _labelMargin[3];
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(_selected != param1)
         {
            _selected = param1;
            state = !!_selected?stateMap["selected"]:stateMap["rollOut"];
            sendEvent("change");
            sendEvent("select");
         }
      }
      
      protected function get state() : int
      {
         return _state;
      }
      
      protected function set state(param1:int) : void
      {
         _state = param1;
         callLater(changeState);
      }
      
      protected function changeState() : void
      {
         var _loc1_:int = _state;
         if(_stateNum == 2)
         {
            _loc1_ = _loc1_ < 2?_loc1_:1;
         }
         else if(_stateNum == 1)
         {
            _loc1_ = 0;
         }
         _bitmap.index = _loc1_;
         _btnLabel.color = _labelColors[_state];
         var _loc2_:int = 0;
         if(_stateNum == 1)
         {
            if(_state == 2)
            {
               _loc2_ = 2;
            }
            else if(_state == 1)
            {
               _loc2_ = 1;
            }
            else
            {
               _loc2_ = 0;
            }
            _bitmap.filters = _stateFilters[_loc2_];
         }
      }
      
      public function get toggle() : Boolean
      {
         return _toggle;
      }
      
      public function set toggle(param1:Boolean) : void
      {
         _toggle = param1;
      }
      
      override public function set disabled(param1:Boolean) : void
      {
         if(_disabled != param1)
         {
            state = !!_selected?stateMap["selected"]:stateMap["rollOut"];
            .super.disabled = param1;
         }
      }
      
      public function get labelColors() : String
      {
         return String(_labelColors);
      }
      
      public function set labelColors(param1:String) : void
      {
         _labelColors = StringUtils.fillArray2(_labelColors,param1);
         callLater(changeState);
      }
      
      public function get labelMargin() : String
      {
         return String(_labelMargin);
      }
      
      public function set labelMargin(param1:String) : void
      {
         _labelMargin = StringUtils.fillArray(_labelMargin,param1,int);
         callLater(changeLabelSize);
      }
      
      public function get labelStroke() : String
      {
         return _btnLabel.stroke;
      }
      
      public function set labelStroke(param1:String) : void
      {
         _btnLabel.stroke = param1;
      }
      
      public function get labelSize() : Object
      {
         return _btnLabel.size;
      }
      
      public function set labelSize(param1:Object) : void
      {
         _btnLabel.size = param1;
         callLater(changeLabelSize);
      }
      
      public function get labelBold() : Object
      {
         return _btnLabel.bold;
      }
      
      public function set labelBold(param1:Object) : void
      {
         _btnLabel.bold = param1;
         callLater(changeLabelSize);
      }
      
      public function get letterSpacing() : Object
      {
         return _btnLabel.letterSpacing;
      }
      
      public function set letterSpacing(param1:Object) : void
      {
         _btnLabel.letterSpacing = param1;
         callLater(changeLabelSize);
      }
      
      public function get labelFont() : String
      {
         return _btnLabel.font;
      }
      
      public function set labelFont(param1:String) : void
      {
         _btnLabel.font = param1;
         callLater(changeLabelSize);
      }
      
      public function get clickHandler() : *
      {
         return _clickHandler;
      }
      
      public function set clickHandler(param1:*) : void
      {
         _clickHandler = param1;
      }
      
      public function get btnLabel() : morn.core.components.Label
      {
         return _btnLabel;
      }
      
      public function get sizeGrid() : String
      {
         if(_bitmap.sizeGrid)
         {
            return _bitmap.sizeGrid.join(",");
         }
         return null;
      }
      
      public function set sizeGrid(param1:String) : void
      {
         _bitmap.sizeGrid = StringUtils.fillArray(Styles.defaultSizeGrid,param1);
      }
      
      public function get repeatSkin() : Boolean
      {
         return _bitmap.repeatSkin;
      }
      
      public function set repeatSkin(param1:Boolean) : void
      {
         _bitmap.repeatSkin = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         if(_autoSize)
         {
            _bitmap.width = param1;
         }
         callLater(changeLabelSize);
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         if(_autoSize)
         {
            _bitmap.height = param1;
         }
         callLater(changeLabelSize);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is Number || param1 is String)
         {
            label = String(param1);
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      public function get stateNum() : int
      {
         return _stateNum;
      }
      
      public function set stateNum(param1:int) : void
      {
         if(_stateNum != param1)
         {
            _stateNum = param1 < 1?1:param1 > 3?3:param1;
            callLater(changeClips);
         }
      }
      
      public function get stateFilters() : Array
      {
         return _stateFilters;
      }
      
      public function set stateFilters(param1:Array) : void
      {
         _stateFilters = param1;
         callLater(changeState);
      }
      
      public function get labelStyle() : String
      {
         return _labelStyle;
      }
      
      public function set labelStyle(param1:String) : void
      {
         if(param1 != _labelStyle)
         {
            _labelStyle = param1;
            _btnLabel.style = param1;
         }
      }
      
      public function get labelFilterKind() : String
      {
         return _btnLabel.labelFilterKind;
      }
      
      public function set labelFilterKind(param1:String) : void
      {
         _btnLabel.labelFilterKind = param1;
      }
      
      public function setClickDelay(param1:int) : void
      {
         _clickDelay = param1;
      }
      
      public function setEnable() : void
      {
         setMouseEnabledList("MOUSEENABLED_KEY_CLICKDELAY",true);
      }
      
      override public function get mouseEnabled() : Boolean
      {
         return super.mouseEnabled;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         setMouseEnabledList("MOUSEENABLED_KEY_DEFAULT",param1);
      }
      
      public function setMouseEnabledList(param1:String, param2:Boolean) : void
      {
         _mouseEnabledList[param1] = param2;
         this.mouseEnabledList();
      }
      
      public function getMouseEnabledList(param1:String) : Boolean
      {
         if(_mouseEnabledList.hasOwnProperty(param1))
         {
            return _mouseEnabledList[param1];
         }
         return true;
      }
      
      protected function mouseEnabledList() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = this._mouseEnabledList;
         for each(var _loc1_ in this._mouseEnabledList)
         {
            if(_loc1_ == false)
            {
               .super.mouseEnabled = false;
               return;
            }
         }
         .super.mouseEnabled = true;
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeState);
         cancelCallLater(changeClips);
         cancelCallLater(changeLabelSize);
         super.cancelMeasure();
      }
      
      override public function dispose() : void
      {
         if(_skin)
         {
            App.asset.removeCited(_skin,this);
         }
         _bitmap.clips = null;
         _bitmap.dispose();
         TimerManager.ins.clearTimer(setEnable);
         super.dispose();
      }
   }
}
