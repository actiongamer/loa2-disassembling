package com.riaidea.text
{
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.events.Event;
   import flash.events.TextEvent;
   
   class TextRenderer extends TextField
   {
       
      
      private var _length:int = 0;
      
      private var _oldLength:int = 0;
      
      private var _scrollHeight:Number = 0;
      
      private var _defaultTextFormat:TextFormat;
      
      function TextRenderer()
      {
         super();
         var _loc1_:TextFormat = new TextFormat("Arial",12,0,false,false,false);
         _loc1_.letterSpacing = 0;
         this.defaultTextFormat = _loc1_;
         this.multiline = true;
         this.wordWrap = true;
         this.type = "dynamic";
      }
      
      override public function get height() : Number
      {
         return this.textHeight;
      }
      
      override public function set text(param1:String) : void
      {
         .super.text = param1;
         _length = this.length;
      }
      
      override public function set htmlText(param1:String) : void
      {
         .super.htmlText = param1;
         _length = this.length;
      }
      
      override public function replaceText(param1:int, param2:int, param3:String) : void
      {
         super.replaceText(param1,param2,param3);
         _length = this.length;
      }
      
      override public function get defaultTextFormat() : TextFormat
      {
         return _defaultTextFormat;
      }
      
      override public function set defaultTextFormat(param1:TextFormat) : void
      {
         if(param1.letterSpacing == null)
         {
            param1.letterSpacing = 0;
         }
         _defaultTextFormat = param1;
         .super.defaultTextFormat = param1;
      }
      
      override public function set type(param1:String) : void
      {
         .super.type = param1;
         this.addEventListener("scroll",onScroll);
         if(type == "input")
         {
            this.addEventListener("change",onTextChange);
            this.addEventListener("textInput",onTextInput);
         }
      }
      
      private function onScroll(param1:Event) : void
      {
         calcScrollHeight();
      }
      
      private function onTextChange(param1:Event) : void
      {
         _oldLength = _length;
         _length = this.length;
      }
      
      private function onTextInput(param1:TextEvent) : void
      {
         recoverDefaultFormat();
      }
      
      private function calcScrollHeight() : void
      {
         var _loc2_:int = 0;
         if(this.length == 0)
         {
            _scrollHeight = 0;
            return;
         }
         var _loc1_:* = 0;
         _loc2_ = 0;
         while(_loc2_ < this.scrollV - 1)
         {
            _loc1_ = Number(_loc1_ + getLineMetrics(_loc2_).height);
            _loc2_++;
         }
         _scrollHeight = _loc1_;
      }
      
      function recoverDefaultFormat() : void
      {
         this.defaultTextFormat = defaultTextFormat;
      }
      
      function get scrollHeight() : Number
      {
         return _scrollHeight;
      }
      
      public function get oldLength() : int
      {
         return _oldLength;
      }
      
      function clear() : void
      {
         this.text = "";
         _oldLength = 0;
         _scrollHeight = 0;
      }
   }
}
