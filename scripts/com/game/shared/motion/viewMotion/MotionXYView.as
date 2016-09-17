package com.game.shared.motion.viewMotion
{
   import com.game.shared.motion.model.MotionXY;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class MotionXYView extends MotionXY
   {
       
      
      protected var _view:DisplayObject;
      
      protected var _target:Object;
      
      public function MotionXYView(param1:DisplayObject, param2:Object)
      {
         _view = param1;
         _target = param2;
         super(_view.x,_view.y);
      }
      
      override public function setLoca(param1:Number, param2:Number) : void
      {
         super.setLoca(param1,param2);
         _view.x = param1;
         _view.y = param2;
      }
      
      override protected function getTargetLoca() : Point
      {
         return ModuleMgr.ins.toGlobalPoi(_target);
      }
   }
}
