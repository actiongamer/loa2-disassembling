package morn.customs.tests
{
   import flash.utils.getTimer;
   import com.mz.core.logging.Log;
   import flash.display.BitmapData;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.handlers.Handler;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class TestTimerCount
   {
      
      private static var _ins:morn.customs.tests.TestTimerCount;
      
      private static var _insLib:Object = {};
       
      
      public var insName:String;
      
      public var list:Array;
      
      public function TestTimerCount(param1:String)
      {
         super();
         this.insName = param1;
      }
      
      public static function get ins() : morn.customs.tests.TestTimerCount
      {
         return getIns("common");
      }
      
      public static function getIns(param1:*) : morn.customs.tests.TestTimerCount
      {
         if(_insLib.hasOwnProperty(param1) == false)
         {
            _insLib[param1] = new morn.customs.tests.TestTimerCount(param1);
         }
         return _insLib[param1];
      }
      
      public function start(param1:String = "start") : Number
      {
         list = [];
         add(param1);
         return list[0]["timer"] / 1000;
      }
      
      public function add(param1:String = "") : void
      {
         var _loc2_:int = 0;
         if(list)
         {
            _loc2_ = getTimer();
            list.push({
               "key":param1,
               "timer":_loc2_
            });
         }
      }
      
      public function end(param1:String = "end") : Array
      {
         this.add(param1);
         return out();
      }
      
      public function LogOut() : void
      {
         Log.debug(this,this.out());
      }
      
      public function out() : Array
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         if(list)
         {
            _loc1_ = [];
            _loc3_ = list.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_ - 1)
            {
               _loc2_ = list[_loc4_ + 1]["timer"] - list[_loc4_]["timer"];
               _loc1_.push(list[_loc4_ + 1]["key"] + ":" + _loc2_ / 1000);
               _loc4_++;
            }
            _loc1_.unshift(insName + "-分时:");
            _loc1_.unshift("总耗时:" + (list[_loc3_ - 1]["timer"] - list[0]["timer"]) / 1000);
            list = null;
            return _loc1_;
         }
         return null;
      }
      
      public function testBmdNoise() : void
      {
         var _loc2_:int = 2048;
         var _loc1_:BitmapData = new BitmapData(_loc2_,_loc2_,false,16777215);
         TimerManager.ins.doFrameLoop(1,new Handler(testBmdNoise_delayCall,[_loc1_]));
      }
      
      private function testBmdNoise_delayCall(param1:BitmapData, param2:TimerHandlerVo) : void
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = 0;
         trace("timer",TimerManager.ins.currTimer,param2.overTimeMs);
         morn.customs.tests.TestTimerCount.ins.start();
         var _loc3_:int = param1.width;
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc6_ = param1.height;
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc4_ = uint(param1.getPixel(_loc7_,_loc5_));
               _loc4_ = uint(_loc4_ - _loc7_ * _loc5_);
               _loc5_++;
            }
            _loc7_++;
         }
      }
   }
}
