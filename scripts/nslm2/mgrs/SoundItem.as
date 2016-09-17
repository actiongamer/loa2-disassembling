package nslm2.mgrs
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   import flash.events.IOErrorEvent;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.setting.model.SettingModel;
   
   public class SoundItem
   {
       
      
      public var _url:String;
      
      public var _backInLoad:Boolean = false;
      
      public var _backLoaded:Boolean = false;
      
      public var _backSound:Sound;
      
      public var _backChannel:SoundChannel;
      
      public var vo:nslm2.mgrs.SoundConfigVo;
      
      public var isClosed:Boolean = false;
      
      private var loops:int;
      
      private var totalTime:int;
      
      private var preCloseDuration:Number = 1;
      
      private var _fadeVol:Number;
      
      public function SoundItem()
      {
         super();
      }
      
      public function get _backTransForm() : SoundTransform
      {
         if(_backChannel == null)
         {
            return null;
         }
         return this._backChannel.soundTransform;
      }
      
      public function init() : void
      {
         _backSound.addEventListener("ioError",backLoadError);
         _backSound.addEventListener("complete",backLoadComplete);
         try
         {
            if(_backSound.length)
            {
               _backSound.close();
            }
         }
         catch(e:Error)
         {
         }
         _backSound.load(new URLRequest(App.getResPath(_url)));
         this.loops = vo._backClear == 0?1000000:vo._backRepeat;
      }
      
      private function backLoadError(param1:IOErrorEvent) : void
      {
         _backSound.removeEventListener("ioError",backLoadError);
      }
      
      private function backLoadComplete(param1:Event) : void
      {
         _backSound.removeEventListener("ioError",backLoadError);
         _backSound.removeEventListener("complete",backLoadComplete);
         _backInLoad = false;
         _backLoaded = true;
         this.totalTime = _backSound.length / 1000;
         playSound();
      }
      
      private function playSound() : void
      {
         var _loc1_:Number = NaN;
         if(_backSound == null)
         {
            return;
         }
         TweenLite.killTweensOf(this,false);
         TweenLite.killDelayedCallsTo(preClose);
         TweenLite.killDelayedCallsTo(intervalPlay);
         TweenLite.killDelayedCallsTo(backSoundComplete);
         if(_backChannel)
         {
            _backChannel.stop();
            _backChannel = null;
         }
         _backChannel = _backSound.play(0,1);
         if(_backChannel && _backChannel.soundTransform)
         {
            if(this.vo.fadeInMs)
            {
               this.fadeVol = 0;
               TweenLite.to(this,this.vo.fadeInMs,{"fadeVol":1});
            }
            else
            {
               this.fadeVol = 1;
            }
            _loc1_ = totalTime - preCloseDuration;
            if(_loc1_ > 0)
            {
               TweenLite.delayedCall(_loc1_,preClose);
            }
            TweenLite.delayedCall(totalTime + 1,backSoundComplete);
         }
      }
      
      private function preClose() : void
      {
         TweenLite.to(this,preCloseDuration,{"fadeVol":0});
      }
      
      private function backSoundComplete(param1:Event = null) : void
      {
         if(this._backSound == null)
         {
            return;
         }
         if(loops > 0)
         {
            loops = Number(loops) - 1;
            TweenLite.delayedCall(10,intervalPlay);
         }
         else
         {
            close();
         }
      }
      
      private function intervalPlay() : void
      {
         playSound();
      }
      
      public function get fadeVol() : Number
      {
         return _fadeVol;
      }
      
      public function set fadeVol(param1:Number) : void
      {
         if(!_backChannel || !_backTransForm)
         {
            return;
         }
         _fadeVol = param1;
         var _loc2_:Number = _fadeVol * (SettingModel.ins.backVolume / 100);
         var _loc3_:SoundTransform = _backChannel.soundTransform;
         _loc3_.volume = _loc2_;
         _backChannel.soundTransform = _loc3_;
      }
      
      public function updateBackVolume() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:* = null;
         if(_backTransForm)
         {
            _loc1_ = SettingModel.ins.backVolume / 100;
            _loc2_ = _backChannel.soundTransform;
            _loc2_.volume = _loc1_;
            _backChannel.soundTransform = _loc2_;
         }
      }
      
      public function close(param1:Boolean = false) : void
      {
         isQuick = param1;
         soundStop = function():void
         {
            if(!_backChannel)
            {
               return;
            }
            _backChannel.stop();
            _backChannel = null;
         };
         TweenLite.killDelayedCallsTo(preClose);
         TweenLite.killDelayedCallsTo(intervalPlay);
         TweenLite.killDelayedCallsTo(backSoundComplete);
         isClosed = true;
         if(_backChannel && _backTransForm && !isQuick)
         {
            TweenLite.to(this,preCloseDuration,{
               "fadeVol":0,
               "onComplete":soundStop
            });
         }
         else
         {
            soundStop();
         }
         if(_backSound)
         {
            _backSound.removeEventListener("ioError",backLoadError);
            _backSound.removeEventListener("complete",backLoadComplete);
            try
            {
               if(_backInLoad)
               {
                  _backSound.close();
               }
            }
            catch(e:Error)
            {
            }
            if(isQuick)
            {
               _backSound = null;
            }
            if(_backLoaded)
            {
               _backSound = null;
            }
         }
         _url = "";
         _backInLoad = false;
         _backLoaded = false;
      }
   }
}
