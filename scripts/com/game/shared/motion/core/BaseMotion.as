package com.game.shared.motion.core
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   
   public class BaseMotion extends EventDispatcher implements IMotion, IDispose
   {
       
      
      private var _debug:Boolean;
      
      private var _callBack:Function;
      
      private var _callBackParams:Array;
      
      public function BaseMotion()
      {
         super();
      }
      
      public function get debug() : Boolean
      {
         return _debug;
      }
      
      public function set debug(param1:Boolean) : void
      {
         _debug = param1;
      }
      
      public function setCallBack(param1:Function, param2:Array) : void
      {
         _callBack = param1;
         _callBackParams = param2;
      }
      
      public function onMotionStart() : void
      {
      }
      
      public final function onMotionEnd() : void
      {
         onMotionEndHandle();
         if(_callBack != null)
         {
            _callBack.apply(null,_callBackParams);
         }
      }
      
      protected function onMotionEndHandle() : void
      {
      }
      
      public function onMotionHanle() : void
      {
      }
      
      public function motioning(param1:int) : void
      {
      }
      
      public function motionEnd() : Boolean
      {
         return false;
      }
      
      public function dispose() : void
      {
         setCallBack(null,null);
      }
   }
}
