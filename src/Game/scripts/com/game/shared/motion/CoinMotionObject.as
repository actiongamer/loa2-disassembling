package com.game.shared.motion
{
   import com.game.shared.motion.viewMotion.MotionGravityView;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class CoinMotionObject extends MotionGravityView
   {
       
      
      private var _loaderMc:BmcSpriteSheet;
      
      public function CoinMotionObject(param1:BmcSpriteSheet, param2:Object, param3:Sprite, param4:Number, param5:Number = 900, param6:Number = 500, param7:uint = 1000, param8:Number = 1.5, param9:Point = null)
      {
         _loaderMc = param1;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      override protected function onMotionEndHandle() : void
      {
         if(_loaderMc)
         {
            _loaderMc.dispose();
            _loaderMc = null;
         }
      }
   }
}
