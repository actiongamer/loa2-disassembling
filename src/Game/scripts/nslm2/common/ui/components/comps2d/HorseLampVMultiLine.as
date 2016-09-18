package nslm2.common.ui.components.comps2d
{
   import morn.core.components.Component;
   import morn.core.components.Label;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.configs.EnvConfig;
   import flash.geom.Rectangle;
   
   public class HorseLampVMultiLine extends Component
   {
      
      public static const GAP:int = 2;
       
      
      private var compArr:Array;
      
      public var lineCount:int;
      
      public var align:String;
      
      public var speed:Number = 2;
      
      public var needCycling:Boolean = true;
      
      private var oldStrArr:Array;
      
      private var lastPauseMs:int = 0;
      
      public function HorseLampVMultiLine(param1:String)
      {
         compArr = [];
         oldStrArr = [];
         super();
         this.align = param1;
      }
      
      public function init(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         this.lineCount = param1;
         var _loc2_:int = lineCount + 1;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = new Label();
            _loc3_.mouseChildren = true;
            _loc3_.style = "普通说明";
            _loc3_.align = this.align;
            _loc3_.autoSize = "none";
            _loc3_.width = this.width;
            _loc3_.isHtml = true;
            _loc3_.text = "test";
            this.addChild(_loc3_);
            compArr.push(_loc3_);
            _loc3_.y = _loc4_ * (2 + _loc3_.height);
            _loc4_++;
         }
      }
      
      public function show(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = compArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this.compArr[_loc5_];
            _loc2_ = param1.shift();
            _loc4_.text = _loc2_;
            param1.push(_loc2_);
            _loc5_++;
         }
         oldStrArr = param1;
         this.height = (_loc4_.height + 2) * lineCount;
         TimerManager.ins.doFrameLoop(speed,this.onLoop);
      }
      
      public function add(param1:String) : void
      {
         this.oldStrArr.unshift(param1);
      }
      
      public function resume() : void
      {
         if(compArr && compArr.length > 0)
         {
            TimerManager.ins.doFrameLoop(speed,this.onLoop);
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
         this.removeChildren();
      }
      
      private function onLoop() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         if(lastPauseMs)
         {
            if(TimerManager.ins.currTimer - lastPauseMs > 2000)
            {
               lastPauseMs = 0;
               compArr.push(compArr.shift());
            }
         }
         else
         {
            _loc2_ = compArr[0];
            if(_loc2_.y <= 0)
            {
               lastPauseMs = TimerManager.ins.currTimer;
            }
            else
            {
               _loc4_ = compArr.length;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc3_ = compArr[_loc5_];
                  if(EnvConfig.ins.showDebugModule)
                  {
                     _loc3_.y = _loc3_.y - 1;
                  }
                  else
                  {
                     _loc3_.y = _loc3_.y - 1;
                  }
                  if(_loc3_.y <= -(_loc3_.height + 2))
                  {
                     _loc1_ = oldStrArr.shift();
                     _loc3_.text = _loc1_;
                     if(needCycling)
                     {
                        this.oldStrArr.push(_loc1_);
                     }
                     _loc3_.y = this.lineCount * (_loc3_.height + 2);
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      private function continueLoop() : void
      {
         TimerManager.ins.doFrameLoop(speed,this.onLoop);
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
