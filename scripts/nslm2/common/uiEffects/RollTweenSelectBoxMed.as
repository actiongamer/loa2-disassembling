package nslm2.common.uiEffects
{
   import com.mz.core.mediators.RollMediator;
   import flash.display.DisplayObject;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   
   public class RollTweenSelectBoxMed extends RollMediator
   {
       
      
      private var selectBox:DisplayObject;
      
      public function RollTweenSelectBoxMed(param1:DisplayObject, param2:DisplayObject)
      {
         super(param1,rollHandler);
         this.selectBox = param2;
         this.selectBox.alpha = 0;
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(selectBox,0.6,{
               "alpha":1,
               "ease":Cubic.easeOut
            });
         }
         else
         {
            TweenLite.to(selectBox,0.4,{
               "alpha":0,
               "ease":Cubic.easeOut
            });
         }
      }
      
      override public function set actived(param1:Boolean) : void
      {
         .super.actived = param1;
         if(actived == false)
         {
            TweenLite.killTweensOf(this.selectBox);
         }
      }
   }
}
