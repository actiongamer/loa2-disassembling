package com.spriteSheet
{
   import morn.core.components.Component;
   import com.mz.core.interFace.IDispose;
   import flash.utils.Dictionary;
   import org.specter3d.utils.LifePool;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import com.spriteSheet.vos.Animation;
   import flash.geom.Point;
   import morn.core.managers.parseImgMgrs.ParseImgMgr;
   import morn.core.handlers.Handler;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils.DisplayUtils;
   
   public class SpriteSheet extends Component implements IDispose
   {
      
      private static var _bmdGlobalCache:Dictionary;
      
      private static var _lifePool:LifePool;
      
      private static var _callbackDic:Dictionary;
      
      private static const LIFE:int = 20000;
       
      
      private var mPlaying:Boolean;
      
      private var mCurFrame:uint;
      
      private var mCanvas:Bitmap;
      
      private var mActionName:String;
      
      private var mAnimation:Animation;
      
      private var _startFrame:int;
      
      private var _endFrame:int;
      
      private var _endHandler;
      
      private var _autoDispose:Boolean;
      
      private var _data:com.spriteSheet.SpriteSheetData;
      
      private var _uid:String;
      
      private var _bmdDic:Dictionary;
      
      private var _bmdNum:int;
      
      public function SpriteSheet(param1:String, param2:com.spriteSheet.SpriteSheetData)
      {
         super();
         mActionName = "";
         _uid = param1;
         _data = param2;
         if(_lifePool == null)
         {
            _lifePool = new LifePool(disposeSheet);
         }
         if(_bmdGlobalCache == null)
         {
            _bmdGlobalCache = new Dictionary();
         }
         if(_callbackDic == null)
         {
            _callbackDic = new Dictionary();
         }
      }
      
      private static function parseImgHandler(param1:String, param2:BitmapData) : void
      {
         var _loc4_:Vector.<Function> = _callbackDic[param1];
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            _loc3_(param1,param2);
         }
      }
      
      private function disposeSheet(param1:String) : void
      {
         var _loc2_:BitmapData = _bmdGlobalCache[param1];
         if(_loc2_)
         {
            _loc2_.dispose();
         }
      }
      
      public function get centor() : Point
      {
         return mAnimation.center;
      }
      
      public function setAction(param1:String = "all", param2:int = 30, param3:Boolean = true, param4:int = 1) : void
      {
         if(param1 == mActionName)
         {
            return;
         }
         if(mCanvas)
         {
            removeChild(mCanvas);
            mCanvas.bitmapData.dispose();
         }
         if(mAnimation)
         {
            mAnimation.dispose();
         }
         mActionName = param1;
         mCurFrame = 0;
         var _loc5_:Vector.<SpriteFrame> = new Vector.<SpriteFrame>();
         if(mActionName == "all")
         {
            _loc5_ = _data.frames;
         }
         else
         {
            var _loc8_:int = 0;
            var _loc7_:* = _data.frames;
            for each(var _loc6_ in _data.frames)
            {
               if(_loc6_.id.indexOf(param1) != -1)
               {
                  _loc5_.push(_loc6_);
               }
            }
         }
         mAnimation = new Animation(param1,_loc5_,param2,param3,param4);
         mCanvas = new Bitmap();
         mCanvas.x = mAnimation.center.x;
         mCanvas.y = mAnimation.center.y;
         mCanvas.smoothing = true;
         addChild(mCanvas);
         _bmdDic = new Dictionary();
         parseBmd();
      }
      
      private function parseBmd() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:int = _data.byteArrayVec.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _uid + String.fromCharCode(1) + String(_loc5_);
            _loc1_ = _bmdGlobalCache[_loc2_];
            if(_loc1_)
            {
               _bmdDic[_loc2_] = _loc1_.clone();
               _lifePool.remove(_loc2_);
            }
            else
            {
               _loc3_ = _callbackDic[_loc2_];
               if(_loc3_ == null)
               {
                  _loc3_ = new Vector.<Function>();
                  _callbackDic[_loc2_] = new Vector.<Function>();
                  _loc3_.push(parseImgDone);
                  ParseImgMgr.ins.add(_loc2_,_data.byteArrayVec[_loc5_],new Handler(parseImgHandler,[_loc2_]));
               }
               else
               {
                  _loc3_.push(parseImgDone);
               }
            }
            _loc5_++;
         }
      }
      
      private function parseImgDone(param1:String, param2:BitmapData) : void
      {
         if(param2)
         {
            _bmdGlobalCache[param1] = param2;
            if(this.isDisposed)
            {
               _lifePool.put(param1);
               return;
            }
            _bmdDic[param1] = param2.clone();
            _lifePool.remove(param1);
            return;
         }
      }
      
      private function get currentSheetID() : String
      {
         return _uid + String.fromCharCode(1) + String(mCurFrame);
      }
      
      public function get isPlaying() : Boolean
      {
         return mPlaying;
      }
      
      public function play() : void
      {
         if(mActionName == "")
         {
            return;
         }
         mPlaying = true;
         TimerManager.ins.doLoop(1000 * mAnimation.delay,update);
      }
      
      private function updateCanvas() : void
      {
         var _loc1_:BitmapData = _bmdDic[currentSheetID];
         var _loc2_:SpriteFrame = _data.frames[mCurFrame];
         if(_loc1_)
         {
            mCanvas.x = _loc2_.offX;
            mCanvas.y = _loc2_.offY;
            mCanvas.bitmapData = _loc1_;
         }
      }
      
      public function stop() : void
      {
         mPlaying = false;
         TimerManager.ins.clearTimer(update);
      }
      
      public function gotoAndPlay(param1:uint, param2:int = 1, param3:int = 0, param4:* = null, param5:Boolean = true) : void
      {
         mCurFrame = param1 - 1;
         _startFrame = param2 - 1;
         if(param3 == 0)
         {
            _endFrame = mAnimation.arFrames.length - 1;
         }
         else
         {
            _endFrame = param3 - 1;
         }
         _endHandler = param4;
         _autoDispose = param5;
         if(mCurFrame >= mAnimation.arFrames.length)
         {
            mCurFrame = mAnimation.arFrames.length - 1;
         }
         play();
      }
      
      public function gotoAndStop(param1:uint) : void
      {
         stop();
         mCurFrame = param1;
         if(mCurFrame >= mAnimation.arFrames.length)
         {
            mCurFrame = mAnimation.arFrames.length - 1;
         }
         updateCanvas();
      }
      
      public function get currenFrame() : uint
      {
         return mCurFrame;
      }
      
      public function get actionName() : String
      {
         return mActionName;
      }
      
      private function update(param1:uint) : void
      {
         mCurFrame = Number(mCurFrame) + 1;
         if(mCurFrame >= Math.min(_endFrame + 1,mAnimation.arFrames.length))
         {
            mAnimation.loopedCnt++;
            if(mAnimation.alwaysLoop)
            {
               mCurFrame = _startFrame;
            }
            else
            {
               if(mAnimation.needLoopCnt - mAnimation.loopedCnt > 0)
               {
                  mCurFrame = _startFrame;
                  updateCanvas();
                  return;
               }
               TimerManager.ins.clearTimer(update);
               mPlaying = false;
               mAnimation.loopedCnt = 0;
               if(_endHandler)
               {
                  Handler.execute(this._endHandler);
               }
               if(_autoDispose)
               {
                  this.dispose();
               }
               return;
            }
         }
         updateCanvas();
      }
      
      public function get oriWidth() : Number
      {
         return _data.oriWidth;
      }
      
      public function get oriHeight() : Number
      {
         return _data.oriHeight;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.isDisposed)
         {
            return;
         }
         TimerManager.ins.clearTimer(update);
         if(mCanvas)
         {
            DisplayUtils.removeSelf(mCanvas);
         }
         if(mAnimation)
         {
            mAnimation.dispose();
            mAnimation = null;
         }
         if(_data)
         {
            _data = null;
         }
         if(_bmdDic)
         {
            var _loc4_:int = 0;
            var _loc3_:* = _bmdDic;
            for(var _loc2_ in _bmdDic)
            {
               _loc1_ = _bmdDic[_loc2_];
               _loc1_.dispose();
               _lifePool.put(_loc2_,20000);
            }
            _bmdDic = null;
         }
         super.dispose();
      }
   }
}
