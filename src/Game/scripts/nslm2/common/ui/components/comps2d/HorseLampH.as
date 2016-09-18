package nslm2.common.ui.components.comps2d
{
   import morn.core.components.Component;
   import morn.core.components.Label;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.components.Image;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class HorseLampH extends Component
   {
      
      public static const GAP:int = 2;
      
      public static const END:String = "end";
       
      
      private var compArr:Array;
      
      private var compArr2:Array;
      
      private var box:Component;
      
      public var fontSize:int = 12;
      
      public var isLoop:Boolean = true;
      
      public var loopInterval:int = 2000;
      
      public var speed:int = 1;
      
      public var txtGap:int = 10;
      
      public var useImgFlag:Boolean = true;
      
      private var curComp:Component;
      
      public function HorseLampH(param1:int = 12, param2:int = 2)
      {
         compArr = [];
         compArr2 = [];
         box = new Component();
         super();
         this.fontSize = param1;
         speed = param2;
         this.addChild(box);
      }
      
      public function hack() : void
      {
         var _loc1_:Label = new Label();
         _loc1_.size = 40;
         _loc1_.text = "test";
         box.addChild(_loc1_);
         this.commitMeasure();
         _loc1_.dispose();
      }
      
      public function show(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            this.add(_loc2_);
            _loc4_++;
         }
      }
      
      public function pause() : void
      {
         TimerManager.ins.clearTimer(this.onLoop);
      }
      
      public function clear() : void
      {
         TimerManager.ins.clearTimer(this.onLoop);
         this.compArr.length = 0;
         box.removeChildren();
      }
      
      public function add(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Label = new Label();
         _loc4_.style = "普通说明";
         _loc4_.text = param1;
         _loc4_.size = fontSize;
         if(compArr.length > 0)
         {
            _loc2_ = compArr[compArr.length - 1];
         }
         if(_loc2_ && _loc2_.x + _loc2_.width > this.width)
         {
            _loc4_.x = _loc2_.x + _loc2_.width + txtGap;
         }
         else
         {
            _loc4_.x = this.width + txtGap;
            if(useImgFlag)
            {
               _loc3_ = new Image("png.a5.commonImgs.img_dot");
               _loc3_.x = -_loc3_.width - 2 + 2;
               _loc3_.y = (_loc4_.textHeight - _loc3_.height) / 2;
               _loc4_.addChild(_loc3_);
            }
         }
         box.addChild(_loc4_);
         compArr.push(_loc4_);
         curComp = compArr[0];
         if(TimerManager.ins.hasTimer(this.onLoop) == false)
         {
            TimerManager.ins.doFrameLoop(2,this.onLoop);
         }
      }
      
      private function onLoop() : void
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         if(compArr.length == 0)
         {
            return;
         }
         var _loc2_:Component = compArr[0];
         if(_loc2_.x <= -_loc2_.width)
         {
            if(this.isLoop == false)
            {
               compArr.shift();
               _loc2_.dispose();
               if(compArr.length == 0)
               {
                  TimerManager.ins.clearTimer(this.onLoop);
                  this.dispatchEvent(new Event("end"));
               }
            }
            else
            {
               _loc1_ = compArr2[compArr2.length - 1];
               if(_loc1_)
               {
                  _loc2_.x = _loc1_.x + _loc1_.width + txtGap;
               }
               else
               {
                  _loc2_.x = this.width + txtGap;
               }
               compArr2.push(compArr.shift());
               if(compArr.length == 0)
               {
                  TimerManager.ins.doOnce(loopInterval,restart);
               }
            }
         }
         var _loc3_:int = compArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = compArr[_loc4_];
            _loc2_.x = _loc2_.x - speed;
            _loc4_++;
         }
      }
      
      private function restart() : void
      {
         compArr = compArr2;
         compArr2 = [];
      }
      
      private function continueLoop() : void
      {
         TimerManager.ins.doFrameLoop(2,this.onLoop);
      }
      
      override protected function changeSize() : void
      {
         super.changeSize();
         this.scrollRect = new Rectangle(0,0,this.width,this.height);
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(this.onLoop);
         super.dispose();
      }
   }
}
