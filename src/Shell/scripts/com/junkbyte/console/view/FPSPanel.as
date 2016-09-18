package com.junkbyte.console.view
{
   import flash.events.TextEvent;
   import com.junkbyte.console.vos.GraphGroup;
   import com.junkbyte.console.Console;
   
   public class FPSPanel extends GraphingPanel
   {
      
      public static const NAME:String = "fpsPanel";
       
      
      public function FPSPanel(param1:Console)
      {
         super(param1,80,40);
         name = NAME;
         minWidth = 32;
      }
      
      override protected function linkHandler(param1:TextEvent) : void
      {
         if(param1.text == "close")
         {
            console.fpsMonitor = false;
         }
         else
         {
            super.linkHandler(param1);
         }
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
            txtField.htmlText = "<r><s>no fps input <menu><a href=\"event:close\">X</a></menu></s></r>";
         }
         else
         {
            txtField.htmlText = "<r><s>" + _interest.v.toFixed(1) + " | " + _interest.avg.toFixed(1) + " <menu><a href=\"event:reset\">R</a> <a href=\"event:close\">X</a></menu></r></s>";
         }
         txtField.scrollH = txtField.maxScrollH;
      }
   }
}
