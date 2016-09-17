package morn.customs.components
{
   import morn.core.components.VBox;
   import morn.core.components.Component;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   
   public class VBoxTween extends VBox
   {
       
      
      public var isTween:Boolean = false;
      
      public function VBoxTween()
      {
         super();
      }
      
      public function countItems(param1:Boolean = true) : void
      {
         this.isTween = param1;
         this.changeItems();
         this.isTween = false;
      }
      
      override protected function changeItemY(param1:Component, param2:Number) : int
      {
         if(param1.visible)
         {
            if(isTween)
            {
               TweenLite.to(param1,0.4,{
                  "y":param2,
                  "ease":Cubic.easeOut
               });
               return param2 + param1.displayHeight + _space;
            }
            return super.changeItemY(param1,param2);
         }
         return param2;
      }
   }
}
