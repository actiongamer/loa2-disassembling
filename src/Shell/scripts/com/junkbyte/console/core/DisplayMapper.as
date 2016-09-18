package com.junkbyte.console.core
{
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import com.junkbyte.console.Console;
   
   public class DisplayMapper extends ConsoleCore
   {
       
      
      public function DisplayMapper(param1:Console)
      {
         super(param1);
      }
      
      public function map(param1:DisplayObjectContainer, param2:uint = 0) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:DisplayObject = null;
         var _loc11_:DisplayObjectContainer = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:DisplayObject = null;
         var _loc15_:String = null;
         var _loc16_:uint = 0;
         var _loc17_:String = null;
         if(!param1)
         {
            report("It is not a DisplayObjectContainer",10);
            return;
         }
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         _loc3_.push(param1);
         while(_loc4_ < _loc3_.length)
         {
            _loc10_ = _loc3_[_loc4_];
            if(_loc10_ is DisplayObjectContainer)
            {
               _loc11_ = _loc10_ as DisplayObjectContainer;
               _loc12_ = _loc11_.numChildren;
               _loc13_ = 0;
               while(_loc13_ < _loc12_)
               {
                  _loc14_ = _loc11_.getChildAt(_loc13_);
                  _loc3_.splice(_loc4_ + _loc13_ + 1,0,_loc14_);
                  _loc13_++;
               }
            }
            _loc4_++;
         }
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc7_:Array = new Array();
         for(_loc9_ in _loc3_)
         {
            _loc10_ = _loc3_[_loc9_];
            if(_loc6_)
            {
               if(_loc6_ is DisplayObjectContainer && (_loc6_ as DisplayObjectContainer).contains(_loc10_))
               {
                  _loc5_++;
                  _loc7_.push(_loc10_.name);
               }
               else
               {
                  while(_loc6_)
                  {
                     _loc6_ = _loc6_.parent;
                     if(_loc6_ is DisplayObjectContainer)
                     {
                        if(_loc5_ > 0)
                        {
                           _loc7_.pop();
                           _loc5_--;
                        }
                        if((_loc6_ as DisplayObjectContainer).contains(_loc10_))
                        {
                           _loc5_++;
                           _loc7_.push(_loc10_.name);
                           break;
                        }
                     }
                  }
               }
            }
            _loc15_ = "";
            _loc13_ = 0;
            while(_loc13_ < _loc5_)
            {
               _loc15_ = _loc15_ + (_loc13_ == _loc5_ - 1?" ∟ ":" - ");
               _loc13_++;
            }
            if(param2 <= 0 || _loc5_ <= param2)
            {
               _loc8_ = false;
               _loc16_ = console.links.setLogRef(_loc10_);
               _loc17_ = _loc10_.name;
               if(_loc16_)
               {
                  _loc17_ = "<a href=\'event:cl_" + _loc16_ + "\'>" + _loc17_ + "</a>";
               }
               if(_loc10_ is DisplayObjectContainer)
               {
                  _loc17_ = "<b>" + _loc17_ + "</b>";
               }
               else
               {
                  _loc17_ = "<i>" + _loc17_ + "</i>";
               }
               _loc15_ = _loc15_ + (_loc17_ + " " + console.links.makeRefTyped(_loc10_));
               report(_loc15_,_loc10_ is DisplayObjectContainer?5:2);
            }
            else if(!_loc8_)
            {
               _loc8_ = true;
               report(_loc15_ + "...",5);
            }
            _loc6_ = _loc10_;
         }
         report(param1.name + ":" + console.links.makeRefTyped(param1) + " has " + (_loc3_.length - 1) + " children/sub-children.",10);
         report("Click on the name to return a reference to the child clip.",-2);
      }
   }
}
