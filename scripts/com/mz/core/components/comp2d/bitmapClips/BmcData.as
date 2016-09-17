package com.mz.core.components.comp2d.bitmapClips
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import com.greensock.TweenLite;
   
   public class BmcData
   {
      
      private static const eventTypeArr:Array = ["Skill_AttackCheck_Event","dispose_event","complete"];
       
      
      private var isDispose:Boolean = false;
      
      public var mc:MovieClip;
      
      public var totalFrames:int = 0;
      
      public var blendMode:String;
      
      private var bitmapFrameList:Array;
      
      private var eventGrid:Object;
      
      private var praseFrameCount:int = 0;
      
      public var key:String;
      
      public var cite0_cb:Function;
      
      private var _citeCount:int = 0;
      
      public function BmcData(param1:MovieClip)
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         eventGrid = {};
         super();
         bitmapFrameList = [];
         mc = BmcUtil.distillMovieClip(param1);
         totalFrames = BmcUtil.countTotalFrames(mc);
         blendMode = BmcUtil.distillBlendMode(mc);
         var _loc3_:int = eventTypeArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = eventTypeArr[_loc4_];
            mc.removeEventListener(_loc2_,eventHandler);
            mc.addEventListener(_loc2_,eventHandler);
            _loc4_++;
         }
      }
      
      public function getFrame(param1:int) : BmcFrame
      {
         var _loc2_:BmcFrame = this.bitmapFrameList[param1 - 1];
         if(!_loc2_)
         {
            if(mc == null)
            {
               return null;
            }
            _loc2_ = BmcUtil.parseFrame(mc,param1);
            praseFrameCount = Number(praseFrameCount) + 1;
            if(praseFrameCount == this.totalFrames)
            {
               disposeMc();
            }
            if(_loc2_)
            {
               this.bitmapFrameList[param1 - 1] = _loc2_;
            }
            else
            {
               return null;
            }
         }
         return _loc2_;
      }
      
      private function eventHandler(param1:Event) : void
      {
         var _loc2_:BmcEventVo = new BmcEventVo();
         _loc2_.frame = mc.currentFrame;
         _loc2_.eventType = param1.type;
         eventGrid[mc.currentFrame] = _loc2_;
      }
      
      public function getEventVo(param1:int) : BmcEventVo
      {
         if(eventGrid.hasOwnProperty(param1))
         {
            return eventGrid[param1];
         }
         return null;
      }
      
      public function dispose() : void
      {
         if(isDispose == false)
         {
            isDispose = true;
            var _loc3_:int = 0;
            var _loc2_:* = bitmapFrameList;
            for each(var _loc1_ in bitmapFrameList)
            {
               if(_loc1_)
               {
                  _loc1_.dispose();
               }
            }
            bitmapFrameList = null;
            this.eventGrid = null;
            this.disposeMc();
            cite0_cb = null;
         }
      }
      
      private function disposeMc() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(mc)
         {
            _loc2_ = eventTypeArr.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = eventTypeArr[_loc3_];
               mc.removeEventListener(_loc1_,eventHandler);
               _loc3_++;
            }
            mc.stop();
            mc.removeChildren();
         }
         this.mc = null;
      }
      
      public function get citeCount() : int
      {
         return _citeCount;
      }
      
      public function addCite() : void
      {
         _citeCount = Number(_citeCount) + 1;
         TweenLite.killDelayedCallsTo(onCite0);
      }
      
      public function subCite() : void
      {
         _citeCount = Number(_citeCount) - 1;
         if(_citeCount == 0)
         {
            TweenLite.delayedCall(2,onCite0);
         }
         else if(_citeCount < 0)
         {
            throw new Error("_citeCount can not be less 0");
         }
      }
      
      private function onCite0() : void
      {
         if(cite0_cb != null)
         {
            cite0_cb(key,this);
            cite0_cb = null;
         }
      }
   }
}
