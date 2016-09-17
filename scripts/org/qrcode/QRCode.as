package org.qrcode
{
   import flash.events.IEventDispatcher;
   import flash.display.BitmapData;
   import flash.events.EventDispatcher;
   import org.qrcode.input.QRInput;
   import org.qrcode.utils.QRCodeTool;
   import org.qrcode.encode.QRRawCode;
   import org.qrcode.specs.QRSpecs;
   import org.qrcode.utils.FrameFiller;
   import flash.geom.Point;
   import flash.events.Event;
   
   public class QRCode implements IEventDispatcher
   {
       
      
      private var data:Array;
      
      private var level:int;
      
      private var type:int;
      
      private var version:int = 1;
      
      private var width:int;
      
      private var text:String;
      
      private var _1743837831bitmapData:BitmapData;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function QRCode(param1:int = 0, param2:int = 2)
      {
         this.data = [];
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.level = param1;
         this.type = param2;
      }
      
      public function encode(param1:String) : void
      {
         this.version = 1;
         this.text = param1;
         this.encodeString(true);
         this.encodeBitmap();
      }
      
      private function encodeBitmap() : void
      {
         this.bitmapData = QRImage.image(this.data);
      }
      
      private function encodeString(param1:Boolean = true) : void
      {
         if(this.type != 2 && this.type != 3)
         {
            throw new Error("bad hint");
         }
         var _loc2_:QRInput = new QRInput(this.version,this.level);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_ = QRSplit.splitStringToQRinput(this.text,_loc2_,this.type,param1);
         var _loc3_:Array = this.encodeInput(_loc2_);
         this.data = QRCodeTool.binarize(_loc3_);
      }
      
      private function encodeMask(param1:QRInput, param2:int) : QRCode
      {
         var _loc12_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:* = null;
         var _loc7_:int = 0;
         var _loc4_:* = 0;
         var _loc6_:* = null;
         if(param1.version < 0 || param1.version > 40)
         {
            throw new Error("wrong version");
         }
         if(param1.errorCorrectionLevel > 3)
         {
            throw new Error("wrong level");
         }
         var _loc3_:QRRawCode = new QRRawCode(param1);
         this.version = _loc3_.version;
         this.width = QRSpecs.getWidth(this.version);
         var _loc5_:Array = QRSpecs.newFrame(this.version);
         var _loc8_:FrameFiller = new FrameFiller(this.width,_loc5_);
         if(_loc8_ == null)
         {
            return null;
         }
         _loc12_ = 0;
         while(_loc12_ < _loc3_.dataLength + _loc3_.eccLength)
         {
            _loc7_ = _loc3_.getCode();
            _loc4_ = 128;
            _loc9_ = 0;
            while(_loc9_ < 8)
            {
               _loc6_ = _loc8_.next();
               _loc8_.setFrameAt(_loc6_,2 | int((_loc4_ & _loc7_) != 0));
               _loc4_ = _loc4_ >> 1;
               _loc9_++;
            }
            _loc12_++;
         }
         _loc9_ = QRSpecs.getRemainder(this.version);
         _loc12_ = 0;
         while(_loc12_ < _loc9_)
         {
            _loc6_ = _loc8_.next();
            _loc8_.setFrameAt(_loc6_,2);
            _loc12_++;
         }
         _loc5_ = _loc8_.frame;
         var _loc10_:QRMask = new QRMask(_loc5_);
         if(param2 < 0)
         {
            _loc11_ = _loc10_.mask(this.width,param1.errorCorrectionLevel);
         }
         else
         {
            _loc11_ = _loc10_.makeMask(this.width,param2,param1.errorCorrectionLevel);
         }
         if(_loc11_ == null)
         {
            return null;
         }
         this.data = _loc11_;
         return this;
      }
      
      private function encodeInput(param1:QRInput) : Array
      {
         return this.encodeMask(param1,-1).data;
      }
      
      private function encodeString8bit(param1:String, param2:int, param3:int) : Array
      {
         if(param1 == "")
         {
            throw new Error("empty string!");
         }
         var _loc5_:QRInput = new QRInput(param2,param3);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc4_:int = _loc5_.append(2,param1.length,param1.split(""));
         if(_loc4_ < 0)
         {
            return null;
         }
         var _loc6_:* = QRCodeTool.binarize(this.encodeInput(_loc5_));
         this.data = _loc6_;
         return _loc6_;
      }
      
      [Bindable("propertyChange")]
      public function get bitmapData() : BitmapData
      {
         return this._1743837831bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1743837831bitmapData;
         if(_loc2_ !== param1)
         {
            this._1743837831bitmapData = param1;
            if(!this.hasEventListener("propertyChange"))
            {
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
