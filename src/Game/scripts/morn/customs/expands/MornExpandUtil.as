package morn.customs.expands
{
   import flash.utils.getQualifiedClassName;
   import morn.core.components.View;
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import morn.core.components.Button;
   import morn.core.components.Component;
   import morn.core.components.ProgressBar;
   import morn.core.components.Image;
   import morn.core.components.Group;
   import morn.core.components.Styles;
   import morn.core.components.ISelect;
   
   public class MornExpandUtil
   {
       
      
      public function MornExpandUtil()
      {
         super();
      }
      
      public static function registerCustomComponents(param1:Array) : void
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Array = [];
         _loc6_ = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param1[_loc7_];
            _loc2_ = getQualifiedClassName(_loc5_);
            _loc3_ = _loc2_.split("::")[1];
            View.registerComponent(_loc3_,_loc5_);
            _loc7_++;
         }
      }
      
      public static function registerViewRuntime(param1:Array) : void
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Array = [];
         _loc6_ = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param1[_loc7_];
            _loc2_ = getQualifiedClassName(_loc5_);
            _loc3_ = _loc2_.split("::")[1];
            View.registerViewRuntime(_loc3_,_loc5_);
            _loc7_++;
         }
      }
      
      public static function addHandlerForBtnAll(param1:DisplayObjectContainer, param2:Function, param3:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.numChildren;
         _loc6_ = _loc5_ - 1;
         while(_loc6_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc6_);
            if(_loc4_ is Button)
            {
               if(param3 || (_loc4_ as Button).clickHandler == null)
               {
                  (_loc4_ as Button).clickHandler = param2;
               }
            }
            else if(_loc4_ is DisplayObjectContainer)
            {
               addHandlerForBtnAll(_loc4_ as DisplayObjectContainer,param2);
            }
            _loc6_--;
         }
      }
      
      public static function setCenter(param1:Component, param2:int = 0, param3:int = 0) : void
      {
         param1.centerX = param2;
         param1.centerY = param3;
      }
      
      public static function setLayout(param1:Component, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
      {
         param1.left = param2;
         param1.top = param3;
         param1.right = param4;
         param1.bottom = param5;
      }
      
      public static function countProgressBarWidth(param1:ProgressBar, param2:Number, param3:Image) : void
      {
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param1.sizeGrid)
         {
            _loc5_ = param1.sizeGrid.split(",");
            _loc6_ = _loc5_[0];
            _loc7_ = _loc5_[2];
            _loc4_ = param1.width - _loc6_ - _loc7_;
            _loc8_ = _loc4_ * param2;
            countProgressBarWidth2(param1,_loc6_ + _loc7_ + _loc8_,param3);
            param3.visible = param3.width > _loc6_ + _loc7_;
         }
         else
         {
            countProgressBarWidth2(param1,param1.width * param2,param3);
         }
      }
      
      private static function countProgressBarWidth2(param1:ProgressBar, param2:Number, param3:Image) : void
      {
         var _loc4_:* = null;
         if(param1.marginGrid)
         {
            _loc4_ = param1.marginGrid.split(",");
            param2 = param2 * ((param1.width - _loc4_[0] - _loc4_[2]) / param1.width);
            if(param1.alignRight)
            {
               param3.x = param1.width - param2 - _loc4_[2];
            }
            else
            {
               param3.x = _loc4_[0];
            }
         }
         else if(param1.alignRight)
         {
            param3.x = param1.width - param2;
         }
         else
         {
            param3.x = 0;
         }
         param3.width = param2;
      }
      
      public static function setGroupStateFilters(param1:Group, param2:Array = null) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         if(param2 == null)
         {
            param2 = Styles.tabButtonStateFilters;
         }
         var _loc4_:int = param1.items.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1.items[_loc5_];
            if(_loc3_ is Button)
            {
               (_loc3_ as Button).stateFilters = param2;
            }
            _loc5_++;
         }
      }
      
      public static function switchChildrenVisible(param1:Component, param2:Boolean, param3:String = null, param4:Array = null) : void
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         if(param3 == null)
         {
            param3 = "VISIBLE_KEY_DEFAULT";
         }
         var _loc6_:int = param1.numChildren;
         _loc7_ = _loc6_ - 1;
         while(_loc7_ >= 0)
         {
            _loc5_ = param1.getChildAt(_loc7_);
            if(!(param4 && param4.indexOf(_loc5_) > -1))
            {
               if(_loc5_ is Component)
               {
                  (_loc5_ as Component).setVisibleList(param3,param2);
               }
               else
               {
                  _loc5_.visible = param2;
               }
            }
            _loc7_--;
         }
      }
   }
}
