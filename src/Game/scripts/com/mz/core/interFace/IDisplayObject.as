package com.mz.core.interFace
{
   import flash.events.IEventDispatcher;
   
   public interface IDisplayObject extends IEventDispatcher, IDispose
   {
       
      
      function set x(param1:Number) : void;
      
      function get x() : Number;
      
      function set y(param1:Number) : void;
      
      function get y() : Number;
      
      function set width(param1:Number) : void;
      
      function get width() : Number;
      
      function set height(param1:Number) : void;
      
      function get height() : Number;
      
      function set visible(param1:Boolean) : void;
      
      function get visible() : Boolean;
      
      function set alpha(param1:Number) : void;
      
      function get alpha() : Number;
   }
}
