package morn.core.utils
{
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Graphics;
   
   public class BitmapUtils
   {
      
      private static var m:Matrix = new Matrix();
      
      private static var newRect:Rectangle = new Rectangle();
      
      private static var clipRect:Rectangle = new Rectangle();
      
      private static var grid:Rectangle = new Rectangle();
      
      private static var destPoint:Point = new Point();
       
      
      public function BitmapUtils()
      {
         super();
      }
      
      public static function repeadBmd(param1:BitmapData, param2:int, param3:int) : BitmapData
      {
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         if(param1.width == param2 && param1.height == param3)
         {
            return param1;
         }
         param2 = param2 > 1?param2:1;
         param3 = param3 > 1?param3:1;
         var _loc5_:BitmapData = new BitmapData(param2,param3,param1.transparent,0);
         var _loc4_:int = Math.ceil(param2 / param1.width);
         _loc8_ = 0;
         while(_loc8_ < _loc4_)
         {
            _loc7_ = Math.ceil(param3 / param1.height);
            _loc6_ = 0;
            while(_loc6_ < _loc7_)
            {
               _loc5_.copyPixels(param1,new Rectangle(0,0,param1.width,param1.height),new Point(_loc8_ * param1.width,_loc6_ * param1.height));
               _loc6_++;
            }
            _loc8_++;
         }
         return _loc5_;
      }
      
      public static function scale9Bmd(param1:BitmapData, param2:Array, param3:int, param4:int) : BitmapData
      {
         var _loc16_:Boolean = false;
         var _loc14_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc11_:int = 0;
         var _loc17_:* = null;
         if(param1.width == param3 && param1.height == param4)
         {
            return param1;
         }
         param3 = param3 > 1?param3:1;
         param4 = param4 > 1?param4:1;
         var _loc8_:int = int(param2[0]) + int(param2[2]);
         var _loc15_:int = int(param2[1]) + int(param2[3]);
         var _loc5_:BitmapData = new BitmapData(param3,param4,param1.transparent,0);
         var _loc10_:Shape = new Shape();
         var _loc6_:Graphics = _loc10_.graphics;
         if(param3 > _loc8_ && param4 > _loc15_)
         {
            _loc16_ = param2.length > 4 && param2[4] == 1;
            setRect(grid,param2[0],param2[1],param1.width - param2[0] - param2[2],param1.height - param2[1] - param2[3]);
            _loc14_ = [0,grid.top,grid.bottom,param1.height];
            _loc7_ = [0,grid.left,grid.right,param1.width];
            _loc9_ = [0,grid.top,param4 - (param1.height - grid.bottom),param4];
            _loc12_ = [0,grid.left,param3 - (param1.width - grid.right),param3];
            _loc13_ = 0;
            while(_loc13_ < 3)
            {
               _loc11_ = 0;
               while(_loc11_ < 3)
               {
                  setRect(newRect,_loc7_[_loc13_],_loc14_[_loc11_],_loc7_[_loc13_ + 1] - _loc7_[_loc13_],_loc14_[_loc11_ + 1] - _loc14_[_loc11_]);
                  setRect(clipRect,_loc12_[_loc13_],_loc9_[_loc11_],_loc12_[_loc13_ + 1] - _loc12_[_loc13_],_loc9_[_loc11_ + 1] - _loc9_[_loc11_]);
                  m.identity();
                  m.a = clipRect.width / newRect.width;
                  m.d = clipRect.height / newRect.height;
                  m.tx = clipRect.x - newRect.x * m.a;
                  m.ty = clipRect.y - newRect.y * m.d;
                  if(!_loc16_ || _loc13_ != 1 && _loc11_ != 1)
                  {
                     _loc5_.draw(param1,m,null,null,clipRect,true);
                  }
                  else if(newRect.width != 0 && newRect.height != 0)
                  {
                     _loc17_ = new BitmapData(newRect.width,newRect.height,param1.transparent,0);
                     _loc17_.copyPixels(param1,newRect,destPoint);
                     _loc6_.clear();
                     _loc6_.beginBitmapFill(_loc17_);
                     _loc6_.drawRect(0,0,clipRect.width,clipRect.height);
                     _loc6_.endFill();
                     m.identity();
                     m.tx = clipRect.x;
                     m.ty = clipRect.y;
                     _loc5_.draw(_loc10_,m,null,null,clipRect,true);
                     _loc6_.clear();
                     _loc17_.dispose();
                  }
                  _loc11_++;
               }
               _loc13_++;
            }
         }
         else
         {
            m.identity();
            m.scale(param3 / param1.width,param4 / param1.height);
            setRect(grid,0,0,param3,param4);
            _loc5_.draw(param1,m,null,null,grid,true);
         }
         return _loc5_;
      }
      
      public static function setRect(param1:Rectangle, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : Rectangle
      {
         param1.x = param2;
         param1.y = param3;
         param1.width = param4;
         param1.height = param5;
         return param1;
      }
      
      public static function createClips(param1:BitmapData, param2:int, param3:int) : Vector.<BitmapData>
      {
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc9_:Vector.<BitmapData> = new Vector.<BitmapData>();
         var _loc7_:int = Math.max(param1.width / param2,1);
         var _loc5_:int = Math.max(param1.height / param3,1);
         var _loc4_:Point = new Point();
         _loc10_ = 0;
         while(_loc10_ < param3)
         {
            _loc8_ = 0;
            while(_loc8_ < param2)
            {
               _loc6_ = new BitmapData(_loc7_,_loc5_);
               _loc6_.copyPixels(param1,new Rectangle(_loc8_ * _loc7_,_loc10_ * _loc5_,_loc7_,_loc5_),_loc4_);
               _loc9_.push(_loc6_);
               _loc8_++;
            }
            _loc10_++;
         }
         return _loc9_;
      }
      
      public static function transparentCut(param1:BitmapData) : BitmapData
      {
         var _loc3_:Rectangle = param1.getColorBoundsRect(4278190080,0,false);
         if(_loc3_.width == 0 || _loc3_.height == 0)
         {
            return null;
         }
         var _loc2_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         _loc2_.copyPixels(param1,_loc3_,new Point());
         return _loc2_;
      }
   }
}
