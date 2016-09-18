package com.riaidea.text
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   import flash.text.TextLineMetrics;
   import flash.geom.Rectangle;
   import flash.events.Event;
   import com.riaidea.text.plugins.IRTFPlugin;
   
   public class RichTextField extends Sprite
   {
      
      public static const DYNAMIC:String = "dynamic";
      
      public static const INPUT:String = "input";
      
      public static const version:String = "2.0.2";
       
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _textRenderer:com.riaidea.text.TextRenderer;
      
      private var _spriteRenderer:com.riaidea.text.SpriteRenderer;
      
      private var _formatCalculator:TextField;
      
      private var _plugins:Array;
      
      private var _placeholder:String;
      
      private var _placeholderColor:uint;
      
      private var _placeholderMarginH:int;
      
      private var _placeholderMarginV:int;
      
      public var html:Boolean;
      
      public var lineHeight:int;
      
      public var autoScroll:Boolean;
      
      public function RichTextField()
      {
         super();
         _textRenderer = new com.riaidea.text.TextRenderer();
         addChild(_textRenderer);
         _spriteRenderer = new com.riaidea.text.SpriteRenderer(this);
         addChild(_spriteRenderer.container);
         setSize(100,100);
         type = "dynamic";
         lineHeight = 0;
         html = false;
         autoScroll = false;
         _placeholder = String.fromCharCode(12288);
         _placeholderColor = 0;
         _placeholderMarginH = 1;
         _placeholderMarginV = 0;
         _formatCalculator = new TextField();
         _formatCalculator.text = _placeholder;
         _textRenderer.restrict = "^" + _placeholder;
      }
      
      public function append(param1:String, param2:Array = null, param3:Boolean = false, param4:TextFormat = null, param5:Boolean = false) : void
      {
         if(param2 != null && param2.length == 0)
         {
            param2 = null;
         }
         var _loc9_:int = _textRenderer.scrollV;
         var _loc8_:int = _textRenderer.length;
         var _loc7_:int = 0;
         if(!param1)
         {
            param1 = "";
         }
         if(param1 || param3)
         {
            if(param1)
            {
               param1 = param1.split("\r").join("\n");
            }
            if(param3 && !html)
            {
               param1 = param1 + "\n";
            }
            _textRenderer.recoverDefaultFormat();
            if(html)
            {
               _textRenderer.htmlText = _textRenderer.htmlText + param1;
            }
            else
            {
               _textRenderer.appendText(param1);
               if(param4 == null)
               {
                  param4 = _textRenderer.defaultTextFormat;
               }
               _textRenderer.setTextFormat(param4,_loc8_,_textRenderer.length);
            }
            if(html || param3 && !html)
            {
               _loc7_ = Math.max(_textRenderer.length - _loc8_,0);
            }
            else
            {
               _loc7_ = _textRenderer.length - _loc8_;
            }
         }
         var _loc6_:Boolean = html && _loc8_ != 0;
         insertSprites(param2,_loc8_,_loc8_ + _loc7_,_loc6_);
         if(autoScroll && _textRenderer.scrollV != _textRenderer.maxScrollV)
         {
            _textRenderer.scrollV = _textRenderer.maxScrollV;
         }
         else if(!autoScroll && _textRenderer.scrollV != _loc9_)
         {
            _textRenderer.scrollV = _loc9_;
         }
         if(param2 != null)
         {
            _spriteRenderer.render();
         }
      }
      
      public function getSpriteArray() : Array
      {
         return _spriteRenderer.getSpriteArry();
      }
      
      public function replace(param1:int, param2:int, param3:String, param4:Array = null) : void
      {
         var _loc8_:* = 0;
         var _loc6_:int = _textRenderer.length;
         var _loc5_:int = 0;
         if(param2 > _loc6_)
         {
            param2 = _loc6_;
         }
         param3 = param3.split(_placeholder).join("");
         _textRenderer.replaceText(param1,param2,param3);
         _loc5_ = _textRenderer.length - _loc6_ + (param2 - param1);
         if(_loc5_ > 0)
         {
            _textRenderer.setTextFormat(_textRenderer.defaultTextFormat,param1,param1 + _loc5_);
         }
         _loc8_ = param1;
         while(_loc8_ < param2)
         {
            _spriteRenderer.removeSprite(_loc8_);
            _loc8_++;
         }
         var _loc7_:Boolean = _spriteRenderer.adjustSpritesIndex(param1 - 1,_textRenderer.length - _loc6_);
         insertSprites(param4,param1,param1 + _loc5_);
         if(_loc7_ || param4 && param4.length > 0)
         {
            _spriteRenderer.render();
         }
      }
      
      private function insertSprites(param1:Array, param2:int, param3:int, param4:Boolean = false) : void
      {
         var _loc8_:int = 0;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         if(param1 == null)
         {
            return;
         }
         bubbleSortByIndex(param1);
         _loc8_ = 0;
         while(_loc8_ < param1.length)
         {
            _loc7_ = param1[_loc8_];
            _loc6_ = _loc7_.src;
            _loc5_ = _loc7_.index;
            if(_loc7_.index == undefined || _loc5_ < 0 || _loc5_ > param3 - param2)
            {
               _loc7_.index = param3 - param2;
               param1.splice(_loc8_,1);
               param1.push(_loc7_);
               _loc8_--;
            }
            else
            {
               if(param4 && _loc5_ > 0)
               {
                  _loc5_ = Math.min(param3,_loc5_ + param2 + _loc8_) + 1;
               }
               else
               {
                  _loc5_ = _loc5_ + (param2 + _loc8_);
               }
               insertSprite(_loc6_,_loc5_,false,_loc7_.cache);
            }
            _loc8_++;
         }
      }
      
      private function bubbleSortByIndex(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = param1.length - 1;
            while(_loc3_ > _loc4_)
            {
               if(param1[_loc3_].index < param1[_loc3_ - 1].index)
               {
                  _loc2_ = param1[_loc3_];
                  param1[_loc3_] = param1[_loc3_ - 1];
                  param1[_loc3_ - 1] = _loc2_;
               }
               _loc3_--;
            }
            _loc4_++;
         }
      }
      
      public function insertSprite(param1:Object, param2:int = -1, param3:Boolean = true, param4:Boolean = false) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:DisplayObject = getSpriteFromObject(param1);
         if(_loc6_ == null)
         {
            throw Error("Specific sprite:" + param1 + " is not a valid display object!");
         }
         if(param4)
         {
            _loc6_.cacheAsBitmap = true;
         }
         if(lineHeight > 0 && _loc6_.height > lineHeight)
         {
            _loc5_ = lineHeight / _loc6_.height;
            _loc6_.height = lineHeight;
            _loc6_.width = _loc6_.width * _loc5_;
         }
         if(param2 < 0 || param2 > _textRenderer.length)
         {
            param2 = _textRenderer.length;
         }
         _textRenderer.replaceText(param2,param2,_placeholder);
         var _loc7_:TextFormat = calcPlaceholderFormat(_loc6_.width,12);
         _textRenderer.setTextFormat(_loc7_,param2,param2 + 1);
         _spriteRenderer.adjustSpritesIndex(param2,1);
         _spriteRenderer.insertSprite(_loc6_,param2);
         if(param3)
         {
            _spriteRenderer.render();
         }
      }
      
      private function getSpriteFromObject(param1:Object) : DisplayObject
      {
         var _loc2_:* = null;
         if(param1 is String)
         {
            _loc2_ = getDefinitionByName(String(param1)) as Class;
            return new _loc2_() as DisplayObject;
         }
         if(param1 is Class)
         {
            return new param1() as DisplayObject;
         }
         return param1 as DisplayObject;
      }
      
      private function calcPlaceholderFormat(param1:Number, param2:Number) : TextFormat
      {
         var _loc4_:TextFormat = new TextFormat();
         _loc4_.color = _placeholderColor;
         _loc4_.size = param2 + 2 * _placeholderMarginV;
         var _loc5_:* = false;
         _loc4_.bold = _loc5_;
         _loc5_ = _loc5_;
         _loc4_.italic = _loc5_;
         _loc4_.underline = _loc5_;
         _formatCalculator.setTextFormat(_loc4_);
         var _loc3_:TextLineMetrics = _formatCalculator.getLineMetrics(0);
         _loc4_.letterSpacing = param1 - _loc3_.width + 2 * _placeholderMarginH;
         return _loc4_;
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         if(_width == param1 && _height == param2)
         {
            return;
         }
         _width = param1;
         _height = param2;
         _textRenderer.width = _width;
         _textRenderer.height = _height;
         this.scrollRect = new Rectangle(0,0,_width,_height);
         _spriteRenderer.render();
      }
      
      public function isSpriteAt(param1:int) : Boolean
      {
         if(param1 < 0 || param1 >= _textRenderer.length)
         {
            return false;
         }
         return _textRenderer.text.charAt(param1) == _placeholder;
      }
      
      private function scrollHandler(param1:Event) : void
      {
         _spriteRenderer.render();
      }
      
      private function changeHandler(param1:Event) : void
      {
         var _loc4_:* = 0;
         var _loc2_:int = _textRenderer.caretIndex;
         var _loc3_:int = _textRenderer.length - _textRenderer.oldLength;
         if(_loc3_ > 0)
         {
            _spriteRenderer.adjustSpritesIndex(_loc2_ - 1,_loc3_);
         }
         else
         {
            _loc4_ = _loc2_;
            while(_loc4_ < _loc2_ - _loc3_)
            {
               _spriteRenderer.removeSprite(_loc4_);
               _loc4_++;
            }
            _spriteRenderer.adjustSpritesIndex(_loc2_ + _loc3_,_loc3_);
         }
         _spriteRenderer.render();
      }
      
      public function clear() : void
      {
         _spriteRenderer.clear();
         _textRenderer.clear();
         _textRenderer.defaultTextFormat.underline = false;
         _textRenderer.defaultTextFormat.leading = 2;
         _textRenderer.defaultTextFormat.letterSpacing = 0;
         _textRenderer.defaultTextFormat = _textRenderer.defaultTextFormat;
      }
      
      public function transClear() : void
      {
         _spriteRenderer.clear();
         _textRenderer.clear();
      }
      
      public function get type() : String
      {
         return _textRenderer.type;
      }
      
      public function set type(param1:String) : void
      {
         _textRenderer.type = param1;
         _textRenderer.addEventListener("scroll",scrollHandler);
         if(param1 == "input")
         {
            _textRenderer.addEventListener("change",changeHandler);
         }
      }
      
      public function get textfield() : TextField
      {
         return _textRenderer;
      }
      
      public function set placeholderMarginH(param1:int) : void
      {
         _placeholderMarginH = param1;
      }
      
      public function set placeholderMarginV(param1:int) : void
      {
         _placeholderMarginV = param1;
      }
      
      public function get viewWidth() : Number
      {
         return _width;
      }
      
      public function get viewHeight() : Number
      {
         return _height;
      }
      
      public function get content() : String
      {
         return _textRenderer.text;
      }
      
      public function get contentLength() : int
      {
         return _textRenderer.length;
      }
      
      public function get text() : String
      {
         return _textRenderer.text.split(_placeholder).join("");
      }
      
      public function get textLength() : int
      {
         return _textRenderer.length - _spriteRenderer.numSprites;
      }
      
      public function getSprite(param1:int) : DisplayObject
      {
         return _spriteRenderer.getSprite(param1);
      }
      
      public function get numSprites() : int
      {
         return _spriteRenderer.numSprites;
      }
      
      public function get caretIndex() : int
      {
         return _textRenderer.caretIndex;
      }
      
      public function set caretIndex(param1:int) : void
      {
         _textRenderer.setSelection(param1,param1);
      }
      
      public function get defaultTextFormat() : TextFormat
      {
         return _textRenderer.defaultTextFormat;
      }
      
      public function set defaultTextFormat(param1:TextFormat) : void
      {
         if(param1.color != null)
         {
            _placeholderColor = uint(param1.color);
         }
         _textRenderer.defaultTextFormat = param1;
      }
      
      public function exportXML() : XML
      {
         var _loc1_:XML = <rtf/>;
         if(html)
         {
            _loc1_.htmlText = _textRenderer.htmlText.split(_placeholder).join("");
         }
         else
         {
            _loc1_.text = _textRenderer.text.split(_placeholder).join("");
         }
         _loc1_.sprites = _spriteRenderer.exportXML();
         return _loc1_;
      }
      
      public function importXML(param1:XML) : void
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:String = "";
         if(param1.hasOwnProperty("htmlText"))
         {
            _loc2_ = _loc2_ + param1.htmlText;
         }
         if(param1.hasOwnProperty("text"))
         {
            _loc2_ = _loc2_ + param1.text;
         }
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < param1.sprites.sprite.length())
         {
            _loc3_ = param1.sprites.sprite[_loc6_];
            _loc4_ = {};
            _loc4_.src = String(_loc3_.@src);
            if(html)
            {
               _loc4_.index = int(_loc3_.@index) + 1;
            }
            else
            {
               _loc4_.index = int(_loc3_.@index);
            }
            _loc5_.push(_loc4_);
            _loc6_++;
         }
         append(_loc2_,_loc5_);
      }
      
      public function addPlugin(param1:IRTFPlugin) : void
      {
         param1.setup(this);
         if(_plugins == null)
         {
            _plugins = [];
         }
         _plugins.push(param1);
      }
   }
}
