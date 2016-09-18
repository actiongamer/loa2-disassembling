package com.mz.core.event
{
   import flash.events.Event;
   
   public class MzEvent extends Event
   {
      
      public static const DISPOSE:String = "dispose";
      
      public static const START:String = "start";
      
      public static const UPDATE:String = "update";
      
      public static const RENDER_CLICK:String = "renderClick";
      
      public static const VALUE_CHANGE:String = "valueChange";
      
      public static const SHOW:String = "show";
      
      public static const HIDE:String = "hide";
      
      public static const CLOSE:String = "close";
      
      public static const FADE_IN_CPL:String = "fadeInCpl";
      
      public static const FADE_OUT_CPL:String = "fadeOutCpl";
      
      public static const ENTER:String = "enter";
      
      public static const END:String = "end";
      
      public static const MODEL_SERVER_CPL_PREFIX:String = "modelServerCplPrefix";
       
      
      public var data;
      
      public function MzEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         this.data = param2;
         super(param1,param3,param4);
      }
   }
}
