package morn.core.components
{
   import flash.text.TextField;
   import flash.text.TextFormat;
   import com.mz.core.interFace.IDispose;
   import morn.customs.FilterLib;
   import morn.core.utils.FontUtils;
   import morn.core.utils.StringUtils;
   
   public class Label extends Component
   {
       
      
      protected var _textField:TextField;
      
      private var _format:TextFormat;
      
      protected var _text:String = "";
      
      protected var _isHtml:Boolean = true;
      
      protected var _stroke:String;
      
      protected var _skin:String;
      
      protected var _bitmap:morn.core.components.AutoBitmap;
      
      private var _useTextMask:Boolean = false;
      
      protected var _margin:Array;
      
      public var labelMedItemList:Vector.<IDispose>;
      
      private var _labelFilterKind:String;
      
      public function Label(param1:String = "", param2:String = null)
      {
         _margin = Styles.labelMargin;
         super();
         this.text = param1;
         this.skin = param2;
      }
      
      public function get bg() : morn.core.components.AutoBitmap
      {
         return _bitmap;
      }
      
      public function get useTextMask() : Boolean
      {
         return _useTextMask;
      }
      
      public function set useTextMask(param1:Boolean) : void
      {
         if(_useTextMask != param1)
         {
            _useTextMask = param1;
            if(param1)
            {
               this.textField.cacheAsBitmap = true;
               this._bitmap.cacheAsBitmap = true;
               this._bitmap.mask = this.textField;
            }
            else
            {
               this._bitmap.mask = null;
            }
         }
      }
      
      override protected function preinitialize() : void
      {
      }
      
      override protected function createChildren() : void
      {
         _bitmap = new morn.core.components.AutoBitmap();
         addChild(new morn.core.components.AutoBitmap());
         _textField = new TextField();
         addChild(new TextField());
      }
      
      override protected function initialize() : void
      {
         _format = _textField.defaultTextFormat;
         _format.font = Styles.fontName;
         _format.size = Styles.fontSize;
         _format.color = Styles.labelColor;
         _textField.selectable = false;
         _textField.autoSize = "left";
         _textField.embedFonts = Styles.embedFonts;
         _bitmap.sizeGrid = Styles.defaultSizeGrid;
         this.margin = _margin.join(",");
         this.labelFilterKind = "黑色1像素描边";
         this.callLater(this.changeFormat);
      }
      
      public function get num() : Number
      {
         return Number(this.text);
      }
      
      public function set num(param1:Number) : void
      {
         this.text = String(param1);
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function set text(param1:String) : void
      {
         if(_text != param1)
         {
            _text = param1 || "";
            _text = _text.replace(/\\n/g,"\n");
            if(App.localeMgr)
            {
               _text = App.localeMgr.parseText(_text);
            }
            exeCallLater(this.changeFormat);
            changeText();
            sendEvent("change");
         }
      }
      
      public function get textWidth() : int
      {
         this.exeCallLater(this.changeSize);
         return this.textField.textWidth;
      }
      
      public function get textHeight() : int
      {
         this.exeCallLater(this.changeSize);
         return this.textField.textHeight;
      }
      
      protected function changeFormat() : void
      {
         _textField.defaultTextFormat = _format;
         changeText();
      }
      
      protected final function changeText() : void
      {
         if(App.labelMed)
         {
            App.labelMed.parseText(this,_text);
         }
         else
         {
            if(_isHtml)
            {
               var _loc1_:* = _text;
               _textField.htmlText = _loc1_;
               §§push(_loc1_);
            }
            else
            {
               _loc1_ = _text;
               _textField.text = _loc1_;
               §§push(_loc1_);
            }
            §§pop();
         }
      }
      
      override protected function changeSize() : void
      {
         if(!isNaN(_width))
         {
            _textField.autoSize = "none";
            _textField.width = _width - _margin[0] - _margin[2];
            if(isNaN(_height) && wordWrap)
            {
               _textField.autoSize = "left";
            }
            else
            {
               _height = !!isNaN(_height)?20:Number(_height);
               _textField.height = _height - _margin[1] - _margin[3];
            }
         }
         else
         {
            _height = NaN;
            _width = NaN;
            _textField.autoSize = "left";
         }
         super.changeSize();
      }
      
      public function get isHtml() : Boolean
      {
         return _isHtml;
      }
      
      public function set isHtml(param1:Boolean) : void
      {
         if(_isHtml != param1)
         {
            _isHtml = param1;
            callLater(changeText);
         }
      }
      
      public function get stroke() : String
      {
         return _stroke;
      }
      
      public function set stroke(param1:String) : void
      {
         if(_stroke != param1)
         {
         }
      }
      
      public function get labelFilterKind() : String
      {
         return _labelFilterKind;
      }
      
      public function set labelFilterKind(param1:String) : void
      {
         _labelFilterKind = param1;
         if(!param1 || param1 == "0")
         {
            this._textField.filters = null;
         }
         else
         {
            this._textField.filters = FilterLib.ins.getFilterArr(_labelFilterKind);
         }
      }
      
      public function get multiline() : Boolean
      {
         return _textField.multiline;
      }
      
      public function set multiline(param1:Boolean) : void
      {
         _textField.multiline = param1;
      }
      
      public function get asPassword() : Boolean
      {
         return _textField.displayAsPassword;
      }
      
      public function set asPassword(param1:Boolean) : void
      {
         _textField.displayAsPassword = param1;
      }
      
      public function get autoSize() : String
      {
         return _textField.autoSize;
      }
      
      public function set autoSize(param1:String) : void
      {
         if(_textField.autoSize != param1)
         {
            _textField.autoSize = param1;
            callLater(changeSize);
         }
      }
      
      public function get wordWrap() : Boolean
      {
         return _textField.wordWrap;
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         _textField.wordWrap = param1;
      }
      
      public function get selectable() : Boolean
      {
         return _textField.selectable;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         _textField.selectable = param1;
         mouseEnabled = param1;
      }
      
      public function get background() : Boolean
      {
         return _textField.background;
      }
      
      public function set background(param1:Boolean) : void
      {
         _textField.background = param1;
      }
      
      public function get backgroundColor() : uint
      {
         return _textField.backgroundColor;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         _textField.backgroundColor = param1;
      }
      
      public function get color() : Object
      {
         return _format.color;
      }
      
      public function set color(param1:Object) : void
      {
         _format.color = param1;
         callLater(changeFormat);
      }
      
      public function get font() : String
      {
         return _format.font;
      }
      
      public function set font(param1:String) : void
      {
         if(FontUtils.ins.isEmbed(param1))
         {
            _format.font = FontUtils.ins.getFullName(param1);
            this.embedFonts = true;
            _textField.antiAliasType = "advanced";
            _textField.gridFitType = "subpixel";
         }
         else if(FontUtils.ins.isCanUse(param1))
         {
            _format.font = param1;
            this.embedFonts = false;
         }
         callLater(changeFormat);
      }
      
      public function get align() : String
      {
         return _format.align;
      }
      
      public function set align(param1:String) : void
      {
         _format.align = param1;
         callLater(changeFormat);
      }
      
      public function get bold() : Object
      {
         return _format.bold;
      }
      
      public function set bold(param1:Object) : void
      {
         _format.bold = param1;
         callLater(changeFormat);
      }
      
      public function get leading() : Object
      {
         return _format.leading;
      }
      
      public function set leading(param1:Object) : void
      {
         _format.leading = param1;
         callLater(changeFormat);
      }
      
      public function get indent() : Object
      {
         return _format.indent;
      }
      
      public function set indent(param1:Object) : void
      {
         _format.indent = param1;
         callLater(changeFormat);
      }
      
      public function get size() : Object
      {
         return _format.size;
      }
      
      public function set size(param1:Object) : void
      {
         _format.size = param1;
         callLater(changeFormat);
      }
      
      public function get underline() : Object
      {
         return _format.underline;
      }
      
      public function set underline(param1:Object) : void
      {
         _format.underline = param1;
         callLater(changeFormat);
      }
      
      public function get letterSpacing() : Object
      {
         return _format.letterSpacing;
      }
      
      public function set letterSpacing(param1:Object) : void
      {
         _format.letterSpacing = param1;
         callLater(changeFormat);
      }
      
      public function get margin() : String
      {
         return _margin.join(",");
      }
      
      public function set margin(param1:String) : void
      {
         _margin = StringUtils.fillArray(_margin,param1,int);
         _textField.x = _margin[0];
         _textField.y = _margin[1];
         callLater(changeSize);
      }
      
      public function get embedFonts() : Boolean
      {
         return _textField.embedFonts;
      }
      
      public function set embedFonts(param1:Boolean) : void
      {
         _textField.embedFonts = param1;
      }
      
      public function get format() : TextFormat
      {
         return _format;
      }
      
      public function set format(param1:TextFormat) : void
      {
         _format = param1;
         callLater(changeFormat);
      }
      
      public function get textField() : TextField
      {
         return _textField;
      }
      
      public function appendText(param1:String) : void
      {
         text = text + param1;
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
            _bitmap.bitmapData = App.asset.getBitmapData(_skin);
            if(_bitmap.bitmapData)
            {
               _contentWidth = _bitmap.bitmapData.width;
               _contentHeight = _bitmap.bitmapData.height;
            }
         }
      }
      
      public function get sizeGrid() : String
      {
         return _bitmap.sizeGrid.join(",");
      }
      
      public function set sizeGrid(param1:String) : void
      {
         _bitmap.sizeGrid = StringUtils.fillArray(Styles.defaultSizeGrid,param1,int);
      }
      
      public function get repeatSkin() : Boolean
      {
         return _bitmap.repeatSkin;
      }
      
      public function set repeatSkin(param1:Boolean) : void
      {
         _bitmap.repeatSkin = param1;
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeFormat);
         exeCallLater(changeText);
         exeCallLater(changeSize);
         super.commitMeasure();
      }
      
      override public function cancelMeasure() : void
      {
         exeCallLater(changeFormat);
         cancelCallLater(changeText);
         cancelCallLater(changeSize);
         super.cancelMeasure();
      }
      
      override public function get width() : Number
      {
         if(!isNaN(_width) || _skin || _text)
         {
            return super.width;
         }
         return 0;
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         _bitmap.width = param1;
      }
      
      override public function get height() : Number
      {
         if(!isNaN(_height) || _skin || _text)
         {
            return super.height;
         }
         return 0;
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         _bitmap.height = param1;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is Number || param1 is String)
         {
            text = String(param1);
         }
         else
         {
            .super.dataSource = param1;
         }
      }
   }
}
