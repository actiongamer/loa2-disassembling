package com.game.shared
{
   import com.game.shared.motion.model.MotionSpeedTarget;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.game.shared.motion.viewMotion.MotionLine;
   import com.game.shared.motion.viewMotion.MotionLineFixTime;
   import com.game.shared.motion.viewMotion.MotionGravityView;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.geom.Point;
   
   public class EffectConst
   {
       
      
      public function EffectConst()
      {
         super();
      }
      
      public static function getFlyAnim(param1:DisplayObject, param2:Object, param3:Function = null, param4:Array = null, param5:DisplayObjectContainer = null, param6:Object = null) : MotionSpeedTarget
      {
         var _loc7_:* = null;
         var _loc8_:Number = NaN;
         if(param5 == null)
         {
            param5 = ModuleMgr.ins.topEffectLayer;
         }
         if(param6 == null || param6 == "line")
         {
            _loc7_ = new MotionLine(param1,param2);
            param5.addChild(param1);
         }
         else if(param6 == "LINE_FIX_TIME")
         {
            _loc7_ = new MotionLineFixTime(param1,param2);
            param5.addChild(param1);
         }
         else if(param6 == "gravity")
         {
            _loc8_ = Math.random() * 3.14159265358979 * 2 - 3.14159265358979;
            _loc7_ = new MotionGravityView(param1,param2,param5,_loc8_,400 + Math.random() * 300,1000,1000);
         }
         if(_loc7_)
         {
            _loc7_.setCallBack(param3,param4);
         }
         return _loc7_;
      }
      
      public static function playShineEff(param1:*) : void
      {
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.setAnchor(0.5,0.5).init(1000107,1,"all",false,1,0);
         ModuleMgr.ins.topEffectLayer.addChild(_loc2_);
         var _loc3_:Point = ModuleMgr.ins.toGlobalPoi(param1);
         if(param1 is DisplayObject)
         {
            _loc3_.x = _loc3_.x + (param1 as DisplayObject).width / 2;
            _loc3_.y = _loc3_.y + (param1 as DisplayObject).height / 2;
         }
         _loc2_.x = _loc3_.x;
         _loc2_.y = _loc3_.y;
      }
      
      public static function playLiHuaEff(param1:*, param2:int = 1) : void
      {
         var _loc3_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc3_.setAnchor(0.5,0.5).init(90000000,1,"all",false,1,0);
         ModuleMgr.ins.topEffectLayer.addChild(_loc3_);
         var _loc4_:Point = ModuleMgr.ins.toGlobalPoi(param1);
         if(param1 is DisplayObject)
         {
            _loc4_.x = _loc4_.x + (param1 as DisplayObject).width / 2;
            _loc4_.y = _loc4_.y + (param1 as DisplayObject).height / 2;
         }
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         var _loc5_:* = param2;
         _loc3_.scaleY = _loc5_;
         _loc3_.scaleX = _loc5_;
      }
   }
}
