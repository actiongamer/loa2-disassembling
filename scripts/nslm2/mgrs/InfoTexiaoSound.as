package nslm2.mgrs
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.errors.IOError;
   import flash.events.IOErrorEvent;
   import com.mz.core.logging.Log;
   import flash.events.Event;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import flash.media.SoundTransform;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.net.URLRequest;
   
   public class InfoTexiaoSound
   {
       
      
      private var _texiaoName:String;
      
      private var _texiaoRepeat:int;
      
      private var _texiaoPlay:Boolean;
      
      private var _texiaoClear:Boolean;
      
      private var _texiaoSystemEff:Boolean;
      
      private var _url:String;
      
      private var _completeFun:Function;
      
      private var _texiaoInLoad:Boolean = false;
      
      private var _texiaoLoaded:Boolean = false;
      
      public var sound:Sound;
      
      public var channel:SoundChannel;
      
      public function InfoTexiaoSound(param1:String, param2:int = 0, param3:Boolean = true, param4:Boolean = true, param5:Function = null, param6:Boolean = true)
      {
         super();
         _texiaoName = param1;
         _texiaoRepeat = param2;
         _texiaoPlay = param3;
         _texiaoClear = param4;
         _texiaoSystemEff = param6;
         _completeFun = param5;
         sound = new Sound();
         if(param6 == true)
         {
            _url = UrlLib.soundEffect(param1);
         }
         else
         {
            _url = param1;
         }
         sound.addEventListener("ioError",loadError);
         sound.addEventListener("complete",loadComplete);
         _texiaoInLoad = true;
         sound.load(new URLRequest(App.getResPath(_url)));
      }
      
      public function clear() : void
      {
         if(channel)
         {
            channel.removeEventListener("soundComplete",soundComplete);
            channel.stop();
            channel = null;
         }
         if(sound)
         {
            sound.removeEventListener("ioError",loadError);
            sound.removeEventListener("complete",loadComplete);
            if(_texiaoInLoad)
            {
               try
               {
                  sound.close();
               }
               catch(error:IOError)
               {
               }
            }
            sound = null;
         }
         _texiaoInLoad = false;
         _texiaoLoaded = false;
         _completeFun = null;
      }
      
      private function loadError(param1:IOErrorEvent) : void
      {
         sound.removeEventListener("ioError",loadError);
         Log.warn(this,"特效音乐地址错误",_url);
      }
      
      private function loadComplete(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         sound.removeEventListener("ioError",loadError);
         sound.removeEventListener("complete",loadComplete);
         _texiaoInLoad = false;
         _texiaoLoaded = true;
         channel = sound.play(0,_texiaoRepeat == 0?1000000:_texiaoRepeat);
         if(channel == null)
         {
            return;
         }
         if(_texiaoName.indexOf("battle/") != -1)
         {
            _loc2_ = SettingModel.ins.battleVolume / 100;
            _loc3_ = channel.soundTransform;
            _loc3_.volume = _loc2_;
            channel.soundTransform = _loc3_;
         }
         else if(_texiaoSystemEff)
         {
            _loc2_ = SettingModel.ins.uiVolume / 100;
            _loc3_ = channel.soundTransform;
            _loc3_.volume = _loc2_;
            channel.soundTransform = _loc3_;
         }
         if(channel)
         {
            channel.addEventListener("soundComplete",soundComplete);
         }
      }
      
      private function soundComplete(param1:Event) : void
      {
         channel.removeEventListener("soundComplete",soundComplete);
         if(_completeFun != null)
         {
            _completeFun.apply();
         }
         clear();
      }
   }
}
