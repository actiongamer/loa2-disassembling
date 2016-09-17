package com.mz.core.components.comp2d.bitmapClips
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IDispose;
   import flash.geom.Point;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.configs.ClientConfig;
   
   public class Bmc extends Sprite implements IDispose
   {
       
      
      public var isDispose:Boolean = false;
      
      public var useBlendMode:Boolean = true;
      
      public var offset:Point;
      
      private var _startFrame:int;
      
      private var _endFrame:int;
      
      private var _isLoop:Boolean;
      
      private var _endFunc:Function;
      
      private var _endFuncParamArr:Array;
      
      private var _data:com.mz.core.components.comp2d.bitmapClips.BmcData;
      
      private var _bitmap:Bitmap;
      
      private var _autoDispose:Boolean;
      
      public var currentFrame:int;
      
      public var totalFrames:int = 0;
      
      public var isPlay:Boolean = false;
      
      public var frameRate:int;
      
      public var pixcelSnapping:String = "never";
      
      public function Bmc()
      {
         offset = new Point(0,0);
         frameRate = ClientConfig.frameRate;
         super();
         _bitmap = new Bitmap(null,pixcelSnapping,false);
         this.addChild(_bitmap);
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      private static function maxMin(param1:Number, param2:Number, param3:Number = 0) : Number
      {
         var _loc4_:* = NaN;
         if(param2 <= param3)
         {
            _loc4_ = param3;
            param3 = param2;
            param2 = _loc4_;
         }
         return Math.min(param2,Math.max(param3,param1));
      }
      
      public function set data(param1:com.mz.core.components.comp2d.bitmapClips.BmcData) : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(param1 == null)
         {
            throw new Error("");
         }
         _data = param1;
         _data.addCite();
         if(useBlendMode)
         {
            bitmap.blendMode = _data.blendMode;
         }
         totalFrames = _data.totalFrames;
         if(this.isPlay)
         {
            this.redraw(this.currentFrame);
         }
         else
         {
            _startFrame = 1;
            _endFrame = totalFrames;
            this.gotoAndStop(maxMin(currentFrame,_endFrame,1));
         }
      }
      
      public function get data() : com.mz.core.components.comp2d.bitmapClips.BmcData
      {
         return _data;
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmap.bitmapData;
      }
      
      public function get bitmap() : Bitmap
      {
         return _bitmap;
      }
      
      private function step() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this._endFrame == 0)
         {
            _loc1_ = this.totalFrames;
         }
         else
         {
            _loc1_ = this._endFrame;
         }
         if(_loc1_ <= 0 || currentFrame < _loc1_)
         {
            gotoFrame(currentFrame + 1);
         }
         else if(_isLoop == false)
         {
            gotoFrame(_loc1_);
            stop();
            if(_endFunc != null)
            {
               _loc2_ = _endFunc;
               _loc2_.apply(null,_endFuncParamArr);
               _endFunc = null;
            }
            if(_autoDispose)
            {
               this.dispose();
            }
         }
         else
         {
            while(currentFrame >= _loc1_)
            {
               currentFrame = currentFrame - (_loc1_ - _startFrame + 1);
            }
            gotoFrame(this.currentFrame + 1);
         }
      }
      
      private function gotoFrame(param1:int) : void
      {
         if(this.currentFrame == param1)
         {
            return;
         }
         this.currentFrame = param1;
         redraw(currentFrame);
         var _loc2_:BmcEventVo = data.getEventVo(currentFrame);
         if(_loc2_)
         {
            this.dispatchEvent(new Event(_loc2_.eventType));
         }
      }
      
      private function redraw(param1:int) : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(_data == null)
         {
            return;
         }
         param1 = maxMin(param1,this.totalFrames,1);
         var _loc2_:BmcFrame = _data.getFrame(param1);
         if(_loc2_ == null)
         {
            _bitmap.bitmapData = null;
         }
         else
         {
            if(pixcelSnapping == "always")
            {
               _bitmap.bitmapData = null;
               if(_bitmap.parent)
               {
                  _bitmap.parent.removeChild(_bitmap);
               }
               _bitmap = new Bitmap(_loc2_.bmd,pixcelSnapping,false);
               if(useBlendMode)
               {
                  bitmap.blendMode = _data.blendMode;
               }
               this.addChild(_bitmap);
            }
            else
            {
               _bitmap.bitmapData = _loc2_.bmd;
            }
            _bitmap.x = -_loc2_.rx - offset.x;
            _bitmap.y = -_loc2_.ry - offset.y;
         }
      }
      
      public function prevFrame() : void
      {
         gotoAndStop(Math.max(currentFrame - 1,1));
      }
      
      public function nextFrame() : void
      {
         gotoAndStop(Math.min(currentFrame + 1,totalFrames));
      }
      
      protected function play() : void
      {
         if(isDispose)
         {
            return;
         }
         if(data == null)
         {
            throw new Error("");
         }
         TimerManager.ins.doLoop(1000 / frameRate,step);
         isPlay = true;
      }
      
      public function stop() : void
      {
         isPlay = false;
         TimerManager.ins.clearTimer(step);
      }
      
      public function gotoAndPlay(param1:int = 1, param2:Boolean = true, param3:int = 1, param4:int = 0, param5:Function = null, param6:Array = null, param7:Boolean = false) : void
      {
         _isLoop = param2;
         if(param1 == 0)
         {
            if(currentFrame >= param3 && currentFrame <= param4)
            {
               param1 = int(currentFrame);
            }
            else
            {
               param1 = param3;
            }
         }
         _startFrame = param3;
         _endFrame = param4;
         _endFunc = param5;
         _endFuncParamArr = param6;
         _autoDispose = param7;
         gotoFrame(param1);
         play();
      }
      
      public function gotoAndStop(param1:int) : void
      {
         gotoFrame(param1);
         stop();
      }
      
      public function dispose() : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(_bitmap)
         {
            _bitmap.bitmapData = null;
            _bitmap = null;
         }
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.clear();
         isDispose = true;
      }
      
      private function clear() : void
      {
         if(this.isDispose)
         {
            return;
         }
         this.stop();
         if(_data)
         {
            _data.subCite();
            _data = null;
         }
      }
   }
}
