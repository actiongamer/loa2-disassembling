package nslm2.common.uiEffects
{
   import com.mz.core.utils2.task.TaskBase;
   import morn.core.components.Image;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.foundations.mainToolBar.MainBottomIconModule;
   import flash.geom.Point;
   import flash.display.DisplayObject;
   import com.game.shared.motion.core.MotionScript;
   import com.game.shared.motion.model.MotionSpeedTarget;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.game.shared.EffectConst;
   import com.mz.core.utils.MathUtil;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import com.game.plot.script.ScriptEvent;
   import com.mz.core.configs.ClientConfig;
   
   public class IconFlyEff extends TaskBase
   {
       
      
      protected var flyDsp:DisplayObject;
      
      public var fromPoi;
      
      public var toPoi;
      
      public var animType:String;
      
      public var saveFromPoint:Point;
      
      protected var _flyAnim:MotionScript;
      
      protected var _fly:MotionSpeedTarget;
      
      public var flyParam:Object;
      
      private var delayExec:int;
      
      private var scaleTo:Number;
      
      public var speed:Number;
      
      public function IconFlyEff(param1:*, param2:*, param3:*, param4:String = "line")
      {
         speed = ClientConfig.frameRate * 20;
         super();
         if(param3 == null)
         {
            throw new Error();
         }
         flyDsp = param1;
         fromPoi = param2;
         toPoi = param3;
         this.animType = param4;
      }
      
      public static function copyImage(param1:Image) : Image
      {
         var _loc2_:Image = new Image(param1.skin);
         _loc2_.width = param1.width;
         _loc2_.height = param1.height;
         return _loc2_;
      }
      
      public static function createFlyTo(param1:Image, param2:*) : IconFlyEff
      {
         var _loc3_:Image = IconFlyEff.copyImage(param1);
         return new IconFlyEff(_loc3_,param1,param2);
      }
      
      public static function createFlyTo_saveFromPoint(param1:Image, param2:*) : IconFlyEff
      {
         var _loc4_:Image = IconFlyEff.copyImage(param1);
         var _loc3_:IconFlyEff = new IconFlyEff(_loc4_,param1,param2);
         _loc3_.saveFromPoint = ModuleMgr.ins.toGlobalPoi(param1);
         return _loc3_;
      }
      
      public static function createFlyToBag(param1:Image) : IconFlyEff
      {
         var _loc2_:* = new FlyTarget((GlobalRef.bottomModuleBtns as MainBottomIconModule).flyToIcon,new Point(30,30));
         return createFlyTo(param1,_loc2_).set_scaleTo(0.4).addHandlers(flyCpl_jump) as IconFlyEff;
      }
      
      public static function flyCpl_jump(param1:IconFlyEff) : void
      {
         var _loc2_:FlyTarget = param1.toPoi as FlyTarget;
         ArriveTickEff.createIns(_loc2_.target as DisplayObject).start();
      }
      
      public function set_flyParam(param1:Object) : void
      {
         this.flyParam = param1;
      }
      
      public function set_delayExec(param1:int) : IconFlyEff
      {
         this.delayExec = param1;
         return this;
      }
      
      public function set_scaleTo(param1:Number = 0.01) : IconFlyEff
      {
         this.scaleTo = param1;
         return this;
      }
      
      override public function exec() : void
      {
         if(delayExec > 0)
         {
            TimerManager.ins.doOnce(delayExec,_exec);
         }
         else
         {
            _exec();
         }
      }
      
      private function _exec() : void
      {
         var _loc1_:* = null;
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.isStop)
         {
            return;
         }
         super.exec();
         if(flyDsp)
         {
            stopFly();
            if(saveFromPoint == null)
            {
               _loc1_ = ModuleMgr.ins.toGlobalPoi(fromPoi);
            }
            else
            {
               _loc1_ = saveFromPoint;
            }
            flyDsp.x = _loc1_.x;
            flyDsp.y = _loc1_.y;
            _fly = EffectConst.getFlyAnim(flyDsp,toPoi,null,null,null,animType);
            _fly.setParam(this.flyParam);
            _flyAnim = new MotionScript(_fly);
            onFlyMontionCreate();
            _flyAnim.play();
            if(isNaN(this.scaleTo) == false)
            {
               _loc3_ = MathUtil.disWith2Point(_loc1_,ModuleMgr.ins.toGlobalPoi(toPoi));
               _loc2_ = _loc3_ / speed;
               TweenLite.to(flyDsp,_loc2_,{
                  "delay":0.2,
                  "scale":scaleTo
               });
            }
         }
         else
         {
            this.onComplete();
         }
      }
      
      public function forceStop() : void
      {
         if(this.isStop)
         {
            return;
         }
         stopFly();
         DisplayUtils.removeSelf(flyDsp);
         super.stop();
      }
      
      public function set_speed(param1:Number) : IconFlyEff
      {
         this.speed = param1;
         return this;
      }
      
      protected function onFlyMontionCreate() : void
      {
         _flyAnim.addEventListener("script_over",flyComplete);
      }
      
      protected function onFlyMontionDispose() : void
      {
         _flyAnim.removeEventListener("script_over",flyComplete);
         DisplayUtils.removeSelf(flyDsp);
      }
      
      public function get flying() : Boolean
      {
         return _flyAnim && _flyAnim.playing;
      }
      
      protected function flyComplete(param1:ScriptEvent) : void
      {
         stopFly();
         this.onComplete();
      }
      
      protected function stopFly() : void
      {
         TimerManager.ins.clearTimer(_exec);
         if(_flyAnim)
         {
            _flyAnim.stop();
            onFlyMontionDispose();
            _flyAnim.dispose();
            _flyAnim = null;
         }
      }
   }
}
