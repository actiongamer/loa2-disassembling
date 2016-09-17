package com.game.shared.motion.viewMotion
{
   import com.game.shared.motion.model.MotionGravity;
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.uiEffects.FlyTarget;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class MotionGravityView extends MotionGravity
   {
       
      
      protected var _container:DisplayObjectContainer;
      
      protected var _view:DisplayObject;
      
      protected var _target:Object;
      
      private var _offset:Point;
      
      public function MotionGravityView(param1:DisplayObject, param2:Object, param3:DisplayObjectContainer, param4:Number, param5:Number = 900, param6:Number = 500, param7:uint = 1000, param8:Number = 1.5, param9:Point = null)
      {
         _view = param1;
         _target = param2;
         _container = param3;
         _offset = param9;
         super(param1.x,param1.y,param4,param5,param6,param7,param8);
      }
      
      override public function onMotionStart() : void
      {
         super.onMotionStart();
         _container.addChild(_view);
      }
      
      override protected function onMotionEndHandle() : void
      {
         DisplayUtils.removeSelf(_view);
      }
      
      override public function motioning(param1:int) : void
      {
         super.motioning(param1);
         _view.x = x;
         _view.y = y;
      }
      
      override protected function getTargetLoca() : Point
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(_target is FlyTarget)
         {
            if((_target as FlyTarget).target == null)
            {
               return new Point(0,0);
            }
            _loc1_ = ModuleMgr.ins.toGlobalPoi((_target as FlyTarget).target).add((_target as FlyTarget).offset);
         }
         else
         {
            _loc1_ = (_target as DisplayObject).localToGlobal(new Point());
         }
         if(_loc1_)
         {
            _loc2_ = _view.parent.globalToLocal(_loc1_);
         }
         if(_loc2_ && _offset)
         {
            _loc2_.x = _loc2_.x + _offset.x;
            _loc2_.y = _loc2_.y + _offset.y;
         }
         return _loc2_;
      }
   }
}
