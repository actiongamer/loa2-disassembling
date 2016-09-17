package morn.core.components
{
   public class VBox extends LayoutBox
   {
      
      public static const NONE:String = "none";
      
      public static const LEFT:String = "left";
      
      public static const CENTER:String = "center";
      
      public static const RIGHT:String = "right";
       
      
      public function VBox()
      {
         super();
      }
      
      override protected function changeItems() : void
      {
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = [];
         var _loc4_:* = 0;
         _loc6_ = 0;
         _loc3_ = numChildren;
         while(_loc6_ < _loc3_)
         {
            _loc2_ = getChildAt(_loc6_) as Component;
            if(_loc2_)
            {
               _loc1_.push(_loc2_);
               _loc4_ = Number(Math.max(_loc4_,_loc2_.displayWidth));
            }
            _loc6_++;
         }
         var _loc5_:* = 0;
         var _loc8_:int = 0;
         var _loc7_:* = _loc1_;
         for each(_loc2_ in _loc1_)
         {
            _maxY = _loc5_;
            _loc5_ = Number(changeItemY(_loc2_,_loc5_));
            if(_align == "left")
            {
               _loc2_.x = 0;
            }
            else if(_align == "center")
            {
               _loc2_.x = (_loc4_ - _loc2_.displayWidth) * 0.5;
            }
            else if(_align == "right")
            {
               _loc2_.x = _loc4_ - _loc2_.displayWidth;
            }
         }
         changeSize();
      }
      
      protected function changeItemY(param1:Component, param2:Number) : int
      {
         param1.y = param2;
         return param2 + param1.displayHeight + _space;
      }
   }
}
