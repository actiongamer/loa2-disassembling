package com.mz.core.utils
{
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import com.mz.core.interFace.ICannotDispose;
   import com.mz.core.interFace.IDispose;
   import flash.display.Loader;
   import flash.display.Bitmap;
   import flash.geom.Point;
   import flash.display.Sprite;
   import flash.display.InteractiveObject;
   import morn.core.utils.ObjectUtils;
   import flash.display.Shape;
   import flash.geom.Rectangle;
   import morn.core.utils.StringUtils;
   import flash.utils.getQualifiedClassName;
   import morn.core.handlers.Handler;
   
   public class DisplayUtils
   {
      
      public static const PROP_XYWH:Array = ["x","y","width","height"];
      
      public static const PROP_XY:Array = ["x","y"];
      
      public static const PROP_XYW:Array = ["x","y","width"];
      
      public static const PROP_WH:Array = ["width","height"];
       
      
      public function DisplayUtils()
      {
         super();
      }
      
      public static function getAlpha(param1:uint) : Number
      {
         return ((param1 & 4278190080) >>> 24) / 255;
      }
      
      public static function disposeChildren(param1:DisplayObjectContainer) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = param1.numChildren;
         var _loc2_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1.getChildAt(_loc5_);
            _loc2_.push(_loc3_);
            _loc5_++;
         }
         _loc4_ = _loc2_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc2_[_loc5_];
            if(_loc3_ is ICannotDispose)
            {
               (_loc3_ as ICannotDispose).disposeHandler();
            }
            else
            {
               if(_loc3_ is IDispose)
               {
                  IDispose(_loc3_).dispose();
               }
               else if(_loc3_ is Loader)
               {
                  Loader(_loc3_).unloadAndStop(false);
               }
               else if(_loc3_ is Bitmap)
               {
                  Bitmap(_loc3_).bitmapData = null;
               }
               if(_loc3_ is DisplayObjectContainer)
               {
                  if((_loc3_ as DisplayObjectContainer).numChildren > 0)
                  {
                     DisplayUtils.disposeChildren(_loc3_ as DisplayObjectContainer);
                  }
               }
            }
            _loc5_++;
         }
         param1.removeChildren();
      }
      
      public static function removeSelf(param1:DisplayObject) : void
      {
         if(param1 && param1.parent)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public static function changeRotationByPoint(param1:Number, param2:Number, param3:Point) : Point
      {
         var _loc7_:Number = MathUtil.ro(param3.x,param3.y);
         var _loc6_:Point = MathUtil.pointInCircle(param1 + _loc7_,param3.length);
         var _loc4_:Point = MathUtil.pointInCircle(param1 + param2 + _loc7_,param3.length);
         var _loc5_:Point = new Point();
         _loc5_.x = _loc6_.x - _loc4_.x;
         _loc5_.y = _loc6_.y - _loc4_.y;
         return _loc5_;
      }
      
      public static function childrenOfContainer(param1:DisplayObjectContainer) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:int = param1.numChildren;
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push(param1.getChildAt(_loc4_));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function globarCenter(param1:DisplayObject) : Point
      {
         return param1.localToGlobal(new Point(param1.width / 2,param1.height / 2));
      }
      
      public static function localToTarget(param1:DisplayObject, param2:DisplayObjectContainer, param3:Point = null) : Point
      {
         if(param3 == null)
         {
            param3 = new Point(0,0);
         }
         var _loc4_:Point = param1.localToGlobal(param3);
         if(param2 == null)
         {
            return _loc4_;
         }
         return param2.globalToLocal(_loc4_);
      }
      
      public static function findChildrenMatchingClass(param1:DisplayObjectContainer, param2:Class) : *
      {
         var _loc7_:int = 0;
         var _loc4_:* = undefined;
         var _loc6_:int = 0;
         var _loc3_:* = undefined;
         var _loc5_:int = param1.numChildren;
         _loc7_ = _loc5_ - 1;
         while(_loc7_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc7_);
            if(_loc4_ is param2)
            {
               return _loc4_;
            }
            _loc7_--;
         }
         _loc6_ = _loc5_ - 1;
         while(_loc6_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc6_);
            if(_loc4_ is DisplayObjectContainer)
            {
               _loc3_ = findChildrenMatchingClass(_loc4_,param2);
               if(_loc3_)
               {
                  return _loc3_;
               }
            }
            _loc6_--;
         }
         return null;
      }
      
      public static function checkParentAllVisibleFalse(param1:DisplayObject) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if(param1.visible == false)
         {
            return true;
         }
         if(param1.parent != null)
         {
            return checkParentAllVisibleFalse(param1.parent);
         }
         return false;
      }
      
      public static function findParentMatchingClass(param1:DisplayObject, param2:Class) : *
      {
         if(param1.parent == null)
         {
            return null;
         }
         if(param1.parent is param2)
         {
            return param1.parent;
         }
         return findParentMatchingClass(param1.parent,param2);
      }
      
      public static function checkIsParent(param1:DisplayObject, param2:DisplayObject) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if(param1 == param2)
         {
            return true;
         }
         return checkIsParent(param1.parent,param2);
      }
      
      public static function drawTestRect(param1:Sprite, param2:Number, param3:Number) : void
      {
         param1.graphics.lineStyle(2,16776960,0.6);
         param1.graphics.beginFill(10027263,0.63);
         param1.graphics.drawRect(0,0,param2,param3);
         param1.graphics.endFill();
      }
      
      public static function mouseEnabled(param1:InteractiveObject, param2:Boolean) : void
      {
         if(param1)
         {
            param1.mouseEnabled = param2;
            if(param1 is DisplayObjectContainer)
            {
               (param1 as DisplayObjectContainer).mouseChildren = param2;
            }
         }
      }
      
      public static function removeAllOfContainer(param1:DisplayObjectContainer, param2:Array = null, param3:Array = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         if(param2 == null && param3 == null)
         {
            while(param1.numChildren)
            {
               param1.removeChildAt(0);
            }
         }
         else
         {
            _loc5_ = param1.numChildren;
            _loc6_ = _loc5_ - 1;
            while(_loc6_ >= 0)
            {
               _loc4_ = param1.getChildAt(_loc6_);
               if(param2 != null)
               {
                  if(param2.indexOf(_loc4_.name) == -1)
                  {
                     if(param1.contains(_loc4_))
                     {
                        param1.removeChild(_loc4_);
                     }
                  }
               }
               if(param3 != null)
               {
                  if(param3.indexOf(_loc4_) == -1)
                  {
                     if(param1.contains(_loc4_))
                     {
                        param1.removeChild(_loc4_);
                     }
                  }
               }
               _loc6_--;
            }
         }
      }
      
      public static function addDisplayObject(param1:DisplayObject, param2:DisplayObject, param3:Array = null) : void
      {
         var _loc4_:DisplayObjectContainer = param1.parent;
         _loc4_.addChildAt(param2,_loc4_.getChildIndex(param1) + 1);
         if(param3 == null)
         {
            param3 = PROP_XY;
         }
         ObjectUtils.copyParams(param1,param2,param3);
      }
      
      public static function replaceDisplayObject(param1:DisplayObject, param2:DisplayObject, param3:Array = null) : void
      {
         var _loc4_:DisplayObjectContainer = param1.parent;
         _loc4_.addChildAt(param2,_loc4_.getChildIndex(param1));
         _loc4_.removeChild(param1);
         if(param3 == null)
         {
            param3 = PROP_XY;
         }
         ObjectUtils.copyParams(param1,param2,param3);
      }
      
      public static function removeClassOfContainer(param1:DisplayObjectContainer, param2:Class) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param1.numChildren;
         _loc5_ = _loc4_ - 1;
         while(_loc5_ >= 0)
         {
            _loc3_ = param1.getChildAt(_loc5_);
            if(_loc3_ is param2)
            {
               param1.removeChild(_loc3_);
            }
            _loc5_--;
         }
      }
      
      public static function removeShapeOfContainer(param1:DisplayObjectContainer) : void
      {
         removeClassOfContainer(param1,Shape);
      }
      
      public static function addChildFromGlobal(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         var _loc3_:Point = localToTarget(param2,param1);
         param1.addChild(param2);
         param2.x = _loc3_.x;
         param2.y = _loc3_.y;
      }
      
      public static function addChildAbove(param1:DisplayObject, param2:DisplayObject) : void
      {
         if(param1.parent == param2.parent)
         {
            if(param1.parent.getChildIndex(param1) < param2.parent.getChildIndex(param2))
            {
               param2.parent.addChildAt(param1,param2.parent.getChildIndex(param2));
            }
            else
            {
               param2.parent.addChildAt(param1,param2.parent.getChildIndex(param2) + 1);
            }
         }
         else
         {
            param2.parent.addChildAt(param1,param2.parent.getChildIndex(param2) + 1);
         }
      }
      
      public static function addChildBelow(param1:DisplayObject, param2:DisplayObject) : void
      {
         if(param1.parent == param2.parent)
         {
            if(param1.parent.getChildIndex(param1) < param2.parent.getChildIndex(param2))
            {
               param2.parent.addChildAt(param1,param2.parent.getChildIndex(param2) - 1);
            }
            else
            {
               param2.parent.addChildAt(param1,param2.parent.getChildIndex(param2));
            }
         }
         else
         {
            param2.parent.addChildAt(param1,param2.parent.getChildIndex(param2));
         }
      }
      
      public static function scaleRatioAndAlignCenter(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean = false) : Rectangle
      {
         var _loc6_:Number = param1 / param2;
         var _loc8_:Number = param3 / param4;
         var _loc7_:Rectangle = new Rectangle();
         _loc7_.width = param1;
         _loc7_.height = param2;
         if(_loc7_.width > param3)
         {
            _loc7_.width = param3;
            _loc7_.height = _loc7_.width / _loc6_;
         }
         else if(param5 && _loc6_ >= _loc8_)
         {
            _loc7_.width = param3;
            _loc7_.height = _loc7_.width / _loc6_;
         }
         if(_loc7_.height > param4)
         {
            _loc7_.height = param4;
            _loc7_.width = _loc7_.height * _loc6_;
         }
         else if(param5 && _loc6_ < _loc8_)
         {
            _loc7_.height = param4;
            _loc7_.width = _loc7_.height * _loc6_;
         }
         _loc7_.x = (param3 - _loc7_.width) / 2;
         _loc7_.y = (param4 - _loc7_.height) / 2;
         return _loc7_;
      }
      
      public static function scaleToSizeWithPoi(param1:Rectangle, param2:Point, param3:Point, param4:Boolean = false) : Point
      {
         var _loc5_:Point = new Point(param2.x / param1.width,param2.x / param1.height);
         return scaleWithPoi(param1,_loc5_,param3,param4);
      }
      
      public static function scaleWithPoi(param1:Rectangle, param2:Point, param3:Point, param4:Boolean = false) : Point
      {
         var _loc5_:Point = new Point(param3.x * param2.x,param3.y * param2.y);
         var _loc6_:Point = new Point(param1.x - (_loc5_.x - param3.x),param1.y - (_loc5_.y - param3.y));
         if(param4)
         {
            _loc6_.x = MathUtil.maxMin(_loc6_.x,0,param1.width - param1.width * param2.x);
            _loc6_.y = MathUtil.maxMin(_loc6_.y,0,param1.height - param1.height * param2.y);
         }
         return _loc6_;
      }
      
      public static function alignCenter(param1:DisplayObject, param2:Number, param3:Number, param4:Number = NaN, param5:Number = NaN) : void
      {
         if(isNaN(param4))
         {
            param4 = param1.width;
         }
         if(isNaN(param5))
         {
            param5 = param1.height;
         }
         param1.x = (param2 - param4) / 2;
         param1.y = (param3 - param5) / 2;
      }
      
      public static function tabEnableFalse(param1:DisplayObject) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 is InteractiveObject)
         {
            (param1 as InteractiveObject).tabEnabled = false;
            if(param1 is DisplayObjectContainer)
            {
               (param1 as DisplayObjectContainer).tabChildren = false;
               _loc2_ = (param1 as DisplayObjectContainer).numChildren;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  tabEnableFalse((param1 as DisplayObjectContainer).getChildAt(_loc3_));
                  _loc3_++;
               }
            }
         }
      }
      
      public static function debug_chiildrenTree(param1:DisplayObject, param2:Array = null) : String
      {
         var _loc3_:String = "=========debug_chiildrenTree Start=========";
         _loc3_ = _loc3_ + __debug_chiildrenTree(param1,param2);
         _loc3_ = _loc3_ + "\n=========debug_chiildrenTree End=========";
         return _loc3_;
      }
      
      private static function __debug_chiildrenTree(param1:DisplayObject, param2:Array = null, param3:int = 0, param4:int = 0) : String
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         if(param1 != null)
         {
            _loc6_ = "\n" + StringUtils.fillWithSameStr("-",param3) + "[Index:" + param3 + "_" + param4 + "]";
            _loc6_ = _loc6_ + __debug_display(param1,param2);
            if(param1 is DisplayObjectContainer)
            {
               param3 = param3 + 1;
               _loc5_ = param1 as DisplayObjectContainer;
               _loc7_ = _loc5_.numChildren;
               _loc8_ = 0;
               while(_loc8_ < _loc7_)
               {
                  param1 = _loc5_.getChildAt(_loc8_);
                  _loc6_ = _loc6_ + __debug_chiildrenTree(param1,param2,param3,_loc8_);
                  _loc8_++;
               }
            }
            return _loc6_;
         }
         return "";
      }
      
      public static function debug_parentTree(param1:DisplayObject, param2:Array = null) : String
      {
         var _loc3_:String = "=========debug_parentTree Start=========";
         _loc3_ = _loc3_ + __debug_parentTree(param1,param2,1);
         _loc3_ = _loc3_ + "\n=========debug_parentTree End=========";
         return _loc3_;
      }
      
      private static function __debug_parentTree(param1:DisplayObject, param2:Array = null, param3:int = 0) : String
      {
         var _loc4_:* = null;
         if(param1 != null)
         {
            _loc4_ = "\n[Index:" + param3 + "]";
            _loc4_ = _loc4_ + __debug_display(param1,param2);
            return _loc4_ + __debug_parentTree(param1.parent,param2,param3 + 1);
         }
         return "";
      }
      
      private static function __debug_display(param1:DisplayObject, param2:Array = null) : String
      {
         var _loc3_:String = "";
         _loc3_ = _loc3_ + (idInParent(param1) + " Name:" + param1.name + " Class:" + getQualifiedClassName(param1) + " " + param1);
         _loc3_ = _loc3_ + ObjectUtils.__debugVars(param1,param2);
         return _loc3_;
      }
      
      private static function idInParent(param1:DisplayObject) : String
      {
         if(param1.parent)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.parent;
            for(var _loc2_ in param1.parent)
            {
               if(param1.parent[_loc2_] == param1)
               {
                  return _loc2_;
               }
            }
         }
         return "NoId";
      }
      
      public static function loopChildren(param1:DisplayObjectContainer, param2:*) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param1.numChildren;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1.getChildAt(_loc5_);
            Handler.execute(param2,[_loc3_]);
            _loc5_++;
         }
      }
      
      public function interpolateColors(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc8_:Number = 1 - param3;
         var _loc4_:uint = Math.round((param1 >>> 16 & 255) * param3 + (param2 >>> 16 & 255) * _loc8_);
         var _loc6_:uint = Math.round((param1 >>> 8 & 255) * param3 + (param2 >>> 8 & 255) * _loc8_);
         var _loc5_:uint = Math.round((param1 & 255) * param3 + (param2 & 255) * _loc8_);
         var _loc7_:uint = Math.round((param1 >>> 24 & 255) * param3 + (param2 >>> 24 & 255) * _loc8_);
         return _loc7_ << 24 | _loc4_ << 16 | _loc6_ << 8 | _loc5_;
      }
   }
}
