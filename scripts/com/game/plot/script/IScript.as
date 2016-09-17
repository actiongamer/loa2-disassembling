package com.game.plot.script
{
   import flash.events.IEventDispatcher;
   
   public interface IScript extends IEventDispatcher
   {
       
      
      function play() : void;
      
      function stop() : void;
   }
}
