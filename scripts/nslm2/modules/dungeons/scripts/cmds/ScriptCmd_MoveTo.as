package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.modules.fightPlayer.UnitView;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   
   public class ScriptCmd_MoveTo extends ScriptCmdBase
   {
       
      
      public var unitArr:Array;
      
      public function ScriptCmd_MoveTo()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         var _loc8_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         super.onStart(param1);
         unitArr = this.findEleArr();
         var _loc6_:int = 0;
         var _loc7_:int = unitArr.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc2_ = unitArr[_loc8_];
            if(_loc2_)
            {
               _loc3_ = this.parseAimXY(_loc2_.vo,this.vo.x,this.vo.y);
               if(this.vo.speed > 0)
               {
                  _loc5_ = MathUtil.disWith2Point(new Point(_loc3_.x,_loc3_.y),_loc2_.vo.xy);
                  _loc4_ = _loc5_ / this.vo.speed * 1000;
                  _loc6_ = Math.max(_loc6_,_loc4_);
                  _loc2_.moveTo(new Point(_loc3_.x,_loc3_.y),_loc4_);
               }
               else
               {
                  _loc2_.xy = new Point(_loc3_.x,_loc3_.y);
               }
            }
            _loc8_++;
         }
         this.vo.time = _loc6_;
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         super.onStep(param1);
         var _loc3_:int = unitArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = unitArr[_loc4_];
            _loc2_.onFrame(param1);
            _loc4_++;
         }
         this.checkEndTimer();
      }
      
      override public function onEnd() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = unitArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = unitArr[_loc3_];
            _loc1_.onFree(true);
            _loc3_++;
         }
         super.onEnd();
      }
   }
}
