package com.mz.debug
{
   import flash.display.Sprite;
   import flash.display.BitmapData;
   import flash.text.TextField;
   import flash.events.Event;
   import flash.text.TextFormat;
   import flash.system.System;
   import flash.display.Bitmap;
   import flash.utils.getTimer;
   import flash.geom.Rectangle;
   
   public class FPSView extends Sprite
   {
      
      private static const maxMemory:uint = 41943000;
      
      private static const diagramWidth:uint = 60;
      
      private static const tfDelayMax:int = 10;
      
      private static const diagramHeight:uint = 40;
       
      
      private var currentY:int;
      
      private var diagramTimer:int;
      
      private var tfTimer:int;
      
      private var diagram:BitmapData;
      
      private var mem:TextField;
      
      private var fps:TextField;
      
      private var tfDelay:int = 0;
      
      public function FPSView()
      {
         super();
         this.addEventListener("addedToStage",run);
      }
      
      private function run(param1:Event) : void
      {
         fps = new TextField();
         mem = new TextField();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         fps.defaultTextFormat = new TextFormat("Tahoma",10,13421772);
         fps.autoSize = "left";
         fps.text = "FPS: " + Number(stage.frameRate).toFixed(2);
         fps.selectable = false;
         fps.x = -62;
         addChild(fps);
         mem.defaultTextFormat = new TextFormat("Tahoma",10,13421568);
         mem.autoSize = "left";
         mem.text = "MEM: " + bytesToString(System.totalMemory);
         mem.selectable = false;
         mem.x = -62;
         mem.y = 10;
         addChild(mem);
         currentY = 20;
         diagram = new BitmapData(60,40,true,553647872);
         var _loc2_:Bitmap = new Bitmap(diagram);
         _loc2_.y = currentY + 4;
         _loc2_.x = -60;
         addChildAt(_loc2_,0);
         this.addEventListener("enterFrame",onEnterFrame);
         this.stage.addEventListener("resize",onResize);
         onResize();
         diagramTimer = getTimer();
         tfTimer = getTimer();
      }
      
      private function bytesToString(param1:uint) : String
      {
         var _loc2_:* = null;
         if(param1 < 1024)
         {
            _loc2_ = String(param1) + "b";
         }
         else if(param1 < 10240)
         {
            _loc2_ = (Number(param1 / 1024)).toFixed(2) + "kb";
         }
         else if(param1 < 102400)
         {
            _loc2_ = (Number(param1 / 1024)).toFixed(1) + "kb";
         }
         else if(param1 < 1048576)
         {
            _loc2_ = int(param1 / 1024) + "kb";
         }
         else
         {
            _loc2_ = (Number(param1 / 1048576)).toFixed(2) + "mb";
         }
         return _loc2_;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         tfDelay = Number(tfDelay) + 1;
         if(tfDelay >= 10)
         {
            tfDelay = 0;
            fps.text = "FPS: " + (Number(1000 * 10 / (getTimer() - tfTimer))).toFixed(2);
            tfTimer = getTimer();
         }
         var _loc4_:* = 1000 / (getTimer() - diagramTimer);
         var _loc3_:* = _loc4_ > stage.frameRate?1:Number(_loc4_ / stage.frameRate);
         diagramTimer = getTimer();
         diagram.scroll(1,0);
         diagram.fillRect(new Rectangle(0,0,1,40),553647872);
         diagram.setPixel32(0,40 * (1 - _loc3_),4291611852);
         mem.text = "MEM: " + bytesToString(System.totalMemory);
         var _loc2_:Number = System.totalMemory / 41943000;
         diagram.setPixel32(0,40 * (1 - _loc2_),4294927872);
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.x = this.stage.stageWidth - 20;
         this.y = 20;
      }
   }
}
