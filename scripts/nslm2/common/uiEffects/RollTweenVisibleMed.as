package nslm2.common.uiEffects
{
   import com.mz.core.mediators.RollMediator;
   import nslm2.utils.TweenProxy;
   import com.greensock.TweenLite;
   import flash.display.InteractiveObject;
   import flash.display.DisplayObject;
   
   public class RollTweenVisibleMed extends RollMediator
   {
       
      
      protected var tweenProxy:TweenProxy;
      
      public function RollTweenVisibleMed(param1:InteractiveObject, param2:DisplayObject = null)
      {
         super(param1,rollHandler);
         if(param2 == null)
         {
            param2 = param1;
         }
         this.tweenProxy = new TweenProxy(param2);
         param2.alpha = 0;
      }
      
      protected function rollHandler(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(this.tweenProxy,0.3,{"alpha":1});
         }
         else
         {
            TweenLite.to(this.tweenProxy,0.3,{"alpha":0});
         }
      }
   }
}
