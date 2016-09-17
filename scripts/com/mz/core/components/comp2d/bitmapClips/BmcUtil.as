package com.mz.core.components.comp2d.bitmapClips
{
   import flash.display.MovieClip;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class BmcUtil
   {
       
      
      public function BmcUtil()
      {
         super();
      }
      
      public static function distillBlendMode(param1:MovieClip) : String
      {
         var _loc2_:* = null;
         if(param1.blendMode != "normal")
         {
            return param1.blendMode;
         }
         if(param1.numChildren == 1)
         {
            _loc2_ = param1.getChildAt(0);
            if(_loc2_.blendMode != "normal")
            {
               return _loc2_.blendMode;
            }
            if(_loc2_ is MovieClip)
            {
               return distillBlendMode(_loc2_ as MovieClip);
            }
            return "normal";
         }
         return "normal";
      }
      
      public static function countTotalFrames(param1:MovieClip) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.totalFrames;
         if(_loc3_ > 1)
         {
            return _loc3_;
         }
         _loc4_ = 1;
         _loc5_ = param1.numChildren;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = param1.getChildAt(_loc6_) as MovieClip;
            if(_loc2_)
            {
               _loc4_ = Math.max(countTotalFrames(_loc2_),_loc4_);
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      public static function distillMovieClip(param1:MovieClip) : MovieClip
      {
         var _loc2_:* = null;
         if(param1.totalFrames == 1 && param1.numChildren == 1)
         {
            _loc2_ = param1.getChildAt(0) as MovieClip;
            if(_loc2_ != null)
            {
               return distillMovieClip(_loc2_);
            }
            return param1;
         }
         return param1;
      }
      
      public static function parseFrame(param1:MovieClip, param2:int) : BmcFrame
      {
         var _loc4_:* = null;
         param1.gotoAndStop(param2);
         var _loc7_:Rectangle = param1.getRect(param1);
         if(_loc7_.height == 0 || _loc7_.width == 0)
         {
            return null;
         }
         roundRect(_loc7_);
         _loc4_ = new BitmapData(_loc7_.width,_loc7_.height,true,16777215);
         _loc4_.draw(param1,new Matrix(1,0,0,1,-_loc7_.x,-_loc7_.y));
         var _loc6_:Rectangle = _loc4_.getColorBoundsRect(4278190080,0,false);
         if(_loc6_.width == 0 || _loc6_.height == 0)
         {
            return null;
         }
         var _loc5_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         _loc5_.copyPixels(_loc4_,_loc6_,new Point());
         _loc7_.x = _loc7_.x + _loc6_.x;
         _loc7_.y = _loc7_.y + _loc6_.y;
         var _loc3_:BmcFrame = new BmcFrame();
         _loc3_.bmd = _loc5_;
         _loc3_.rx = -_loc7_.x;
         _loc3_.ry = -_loc7_.y;
         return _loc3_;
      }
      
      private static function roundRect(param1:Rectangle) : void
      {
         param1.x = Math.floor(param1.x);
         param1.y = Math.floor(param1.y);
         param1.width = Math.ceil(param1.width);
         param1.height = Math.ceil(param1.height);
      }
   }
}
