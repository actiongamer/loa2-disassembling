package com.junkbyte.console.view
{
   import com.junkbyte.console.vos.GraphGroup;
   import flash.events.TextEvent;
   import com.junkbyte.console.Console;
   
   public class MemoryPanel extends GraphingPanel
   {
      
      public static const NAME:String = "memoryPanel";
       
      
      public function MemoryPanel(param1:Console)
      {
         super(param1,80,40);
         name = NAME;
         minWidth = 32;
      }
      
      override public function update(param1:GraphGroup, param2:Boolean = true) : void
      {
         super.update(param1,param2);
         this.updateKeyText();
      }
      
      override public function updateKeyText() : void
      {
         if(isNaN(_interest.v))
         {
            txtField.htmlText = "<r><s>no mem input <menu><a href=\"event:close\">X</a></menu></s></r>";
         }
         else
         {
            txtField.htmlText = "<r><s>" + _interest.v.toFixed(2) + "mb <menu><a href=\"event:gc\">G</a> <a href=\"event:reset\">R</a> <a href=\"event:close\">X</a></menu></r></s>";
         }
         txtField.scrollH = txtField.maxScrollH;
      }
      
      override protected function linkHandler(param1:TextEvent) : void
      {
         if(param1.text == "gc")
         {
            console.gc();
         }
         else if(param1.text == "close")
         {
            console.memoryMonitor = false;
         }
         else
         {
            super.linkHandler(param1);
         }
      }
      
      override protected function onMenuRollOver(param1:TextEvent) : void
      {
         var _loc2_:String = !!param1.text?param1.text.replace("event:",""):null;
         if(_loc2_ == "gc")
         {
            _loc2_ = "Garbage collect::Requires debugger version of flash player";
         }
         console.panels.tooltip(_loc2_,this);
      }
   }
}
