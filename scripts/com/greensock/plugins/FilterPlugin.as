package com.greensock.plugins
{
   import flash.filters.BitmapFilter;
   import com.greensock.TweenLite;
   import flash.filters.BlurFilter;
   
   public class FilterPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      protected var _target:Object;
      
      protected var _type:Class;
      
      protected var _filter:BitmapFilter;
      
      protected var _index:int;
      
      protected var _remove:Boolean;
      
      private var _tween:TweenLite;
      
      public function FilterPlugin(param1:String = "", param2:Number = 0)
      {
         super(param1,param2);
      }
      
      protected function _initFilter(param1:*, param2:Object, param3:TweenLite, param4:Class, param5:BitmapFilter, param6:Array) : Boolean
      {
         var _loc8_:* = null;
         var _loc11_:int = 0;
         var _loc7_:* = null;
         _target = param1;
         _tween = param3;
         _type = param4;
         var _loc9_:Array = _target.filters;
         var _loc10_:Object = param2 is BitmapFilter?{}:param2;
         if(_loc10_.index != null)
         {
            _index = _loc10_.index;
         }
         else
         {
            _index = _loc9_.length;
            if(_loc10_.addFilter != true)
            {
               do
               {
                  _index = _index - 1;
               }
               while(_index - 1 > -1 && !(_loc9_[_index] is _type));
               
            }
         }
         if(_index < 0 || !(_loc9_[_index] is _type))
         {
            if(_index < 0)
            {
               _index = _loc9_.length;
            }
            if(_index > _loc9_.length)
            {
               _loc11_ = _loc9_.length - 1;
               while(true)
               {
                  _loc11_++;
                  if(_loc11_ >= _index)
                  {
                     break;
                  }
                  _loc9_[_loc11_] = new BlurFilter(0,0,1);
               }
            }
            _loc9_[_index] = param5;
            _target.filters = _loc9_;
         }
         _filter = _loc9_[_index];
         _remove = _loc10_.remove == true;
         _loc11_ = param6.length;
         while(true)
         {
            _loc11_--;
            if(_loc11_ <= -1)
            {
               break;
            }
            _loc8_ = param6[_loc11_];
            if(_loc8_ in param2 && _filter[_loc8_] != param2[_loc8_])
            {
               if(_loc8_ == "color" || _loc8_ == "highlightColor" || _loc8_ == "shadowColor")
               {
                  _loc7_ = new HexColorsPlugin();
                  _loc7_._initColor(_filter,_loc8_,param2[_loc8_]);
                  _addTween(_loc7_,"setRatio",0,1,_propName);
               }
               else if(_loc8_ == "quality" || _loc8_ == "inner" || _loc8_ == "knockout" || _loc8_ == "hideObject")
               {
                  _filter[_loc8_] = param2[_loc8_];
               }
               else
               {
                  _addTween(_filter,_loc8_,_filter[_loc8_],param2[_loc8_],_propName);
               }
            }
         }
         return true;
      }
      
      override public function setRatio(param1:Number) : void
      {
         super.setRatio(param1);
         var _loc2_:Array = _target.filters;
         if(!(_loc2_[_index] is _type))
         {
            _index = _loc2_.length;
            do
            {
               _index = _index - 1;
            }
            while(_index - 1 > -1 && !(_loc2_[_index] is _type));
            
            if(_index == -1)
            {
               _index = _loc2_.length;
            }
         }
         if(param1 == 1 && _remove && _tween._time == _tween._duration && _tween.data != "isFromStart")
         {
            if(_index < _loc2_.length)
            {
               _loc2_.splice(_index,1);
            }
         }
         else
         {
            _loc2_[_index] = _filter;
         }
         _target.filters = _loc2_;
      }
   }
}
