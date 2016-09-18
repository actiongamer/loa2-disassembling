package com.mz.core.utils2.reflects
{
   import flash.display.DisplayObject;
   import flash.system.ApplicationDomain;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import flash.utils.getQualifiedClassName;
   
   public class ReflectUtil
   {
       
      
      public function ReflectUtil()
      {
         super();
      }
      
      public static function createDisplayInstance(param1:String, param2:ApplicationDomain = null) : DisplayObject
      {
         return createInstance(param1,param2) as DisplayObject;
      }
      
      public static function createDisplayObjectSmart(param1:String) : DisplayObject
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:Object = ReflectUtil.createInstance(param1);
         if(_loc3_ is BitmapData)
         {
            _loc2_ = new Bitmap(_loc3_ as BitmapData);
            _loc4_ = _loc2_;
         }
         else
         {
            _loc4_ = _loc3_ as DisplayObject;
         }
         return _loc4_;
      }
      
      public static function createDisplaySmart_fromClass(param1:Class) : DisplayObject
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:Object = new param1();
         if(_loc3_ is BitmapData)
         {
            _loc2_ = new Bitmap(_loc3_ as BitmapData);
            _loc4_ = _loc2_;
         }
         else
         {
            _loc4_ = _loc3_ as DisplayObject;
         }
         return _loc4_;
      }
      
      public static function createDisplayObjectBitmap(param1:String) : Bitmap
      {
         var _loc4_:DisplayObject = createDisplayInstance(param1);
         var _loc2_:BitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
         _loc2_.draw(_loc4_);
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         return _loc3_;
      }
      
      public static function createInstance(param1:String, param2:ApplicationDomain = null) : *
      {
         var _loc3_:Class = getClass(param1,param2);
         if(_loc3_ != null)
         {
            return new _loc3_();
         }
         return null;
      }
      
      public static function createBitmapDataInstance(param1:String, param2:ApplicationDomain = null) : *
      {
         var _loc3_:Class = getClass(param1,param2);
         if(_loc3_ != null)
         {
            return new _loc3_(0,0);
         }
         return null;
      }
      
      public static function hasClass(param1:String, param2:ApplicationDomain = null) : Boolean
      {
         if(param2 == null)
         {
            param2 = ApplicationDomain.currentDomain;
         }
         if(param2.hasDefinition(param1))
         {
            return true;
         }
         return false;
      }
      
      public static function getClass(param1:String, param2:ApplicationDomain = null) : Class
      {
         if(param2 == null)
         {
            param2 = ApplicationDomain.currentDomain;
         }
         var _loc3_:Class = param2.getDefinition(param1) as Class;
         return _loc3_;
      }
      
      public static function getClassByOb(param1:Object, param2:ApplicationDomain = null) : Class
      {
         var _loc3_:String = getClassNameWithDot(param1);
         return getClass(_loc3_,param2);
      }
      
      public static function getClassName(param1:Object) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return _loc2_;
      }
      
      public static function getClassNameWithDot(param1:Object) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return _loc2_.replace("::",".");
      }
      
      public static function getShortClassName(param1:*) : String
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            _loc2_ = "null";
         }
         else if(param1 is String)
         {
            _loc2_ = param1 as String;
         }
         else
         {
            _loc2_ = getQualifiedClassName(param1);
            _loc2_ = _loc2_.split("::").pop();
         }
         return _loc2_;
      }
      
      public static function getPackageName(param1:*) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return _loc2_.split("::").shift();
      }
   }
}
