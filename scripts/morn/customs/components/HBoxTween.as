package morn.customs.components
{
   import morn.core.components.HBox;
   import morn.core.components.Component;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   
   public class HBoxTween extends HBox
   {
       
      
      public var isTween:Boolean = false;
      
      public function HBoxTween()
      {
         super();
      }
      
      public function countItems(param1:Boolean = true) : void
      {
         this.isTween = param1;
         this.changeItems();
         this.isTween = false;
      }
      
      override protected function changeItemX(param1:Component, param2:Number) : int
      {
         if(param1.visible)
         {
            if(isTween)
            {
               TweenLite.to(param1,0.4,{
                  "x":param2,
                  "ease":Cubic.easeOut
               });
               return param2 + param1.displayWidth + _space;
            }
            return super.changeItemX(param1,param2);
         }
         return param2;
      }
   }
}
