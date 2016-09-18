package nslm2.modules.cultivates.lotteryHeroModules
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Image;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class LotteryHeroLightCtrl implements IDispose
   {
       
      
      private var _light:Image;
      
      private var _mask:Image;
      
      public function LotteryHeroLightCtrl(param1:Image, param2:Image)
      {
         super();
         _light = param1;
         _mask = param2;
         _light.mask = _mask;
         TimerManager.ins.doOnce(1000,doTween);
      }
      
      public function doTween() : void
      {
         TweenLite.to(this._light,1.4,{
            "x":LHConsts.LOTTERY_LIGHT_ENDPOINT.x,
            "y":LHConsts.LOTTERY_LIGHT_ENDPOINT.y,
            "onComplete":tweenCpl
         });
      }
      
      public function tweenCpl() : void
      {
         _light.x = LHConsts.LOTTERY_LIGHT_INITPOINT.x;
         _light.y = LHConsts.LOTTERY_LIGHT_INITPOINT.y;
         TimerManager.ins.doOnce(3000,doTween);
      }
      
      public function dispose() : void
      {
         TweenLite.killTweensOf(this._light);
         TimerManager.ins.clearTimer(doTween);
      }
   }
}
