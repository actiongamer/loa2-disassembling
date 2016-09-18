package com.mz.core.mgrs
{
   import com.mz.core.interFace.IDisplayObject;
   import flash.events.IEventDispatcher;
   
   public interface IDragDropSource extends IDisplayObject, IEventDispatcher
   {
       
      
      function onDragStart() : void;
   }
}
