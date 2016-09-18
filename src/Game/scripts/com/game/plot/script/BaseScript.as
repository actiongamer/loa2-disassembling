package com.game.plot.script
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   
   public class BaseScript extends EventDispatcher implements IScript, IDispose
   {
       
      
      protected var _debug:String;
      
      protected var _id:String;
      
      private var _playing:Boolean;
      
      public function BaseScript()
      {
         super();
      }
      
      protected function playHandle() : void
      {
      }
      
      protected function stopHandle() : void
      {
      }
      
      protected function free() : void
      {
      }
      
      public function set debug(param1:String) : void
      {
         _debug = param1;
      }
      
      public function get debug() : String
      {
         return _debug;
      }
      
      public function get playing() : Boolean
      {
         return _playing;
      }
      
      public final function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public final function get id() : String
      {
         return _id;
      }
      
      protected final function finish() : void
      {
         dispatchEvent(new ScriptEvent("script_over",this));
      }
      
      public final function play() : void
      {
         if(!_playing && canPlay())
         {
            _playing = true;
            dispatchEvent(new ScriptEvent("script_start",this));
            playHandle();
         }
      }
      
      protected function canPlay() : Boolean
      {
         return true;
      }
      
      public final function stop() : void
      {
         if(_playing)
         {
            _playing = false;
            stopHandle();
         }
      }
      
      public final function dispose() : void
      {
         stop();
         free();
         _debug = null;
         _id = null;
      }
      
      override public function toString() : String
      {
         var _loc1_:* = null;
         if(_id != null)
         {
            _loc1_ = _id;
         }
         if(_debug != null)
         {
            if(_loc1_ == null)
            {
               _loc1_ = _debug;
            }
            else
            {
               _loc1_ = _loc1_ + (">" + _debug);
            }
            return _loc1_;
         }
         return super.toString();
      }
   }
}
