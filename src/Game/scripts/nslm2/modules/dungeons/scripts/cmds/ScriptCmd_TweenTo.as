package nslm2.modules.dungeons.scripts.cmds
{
   import flash.utils.Dictionary;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import nslm2.modules.dungeons.scripts.TweenToData;
   import nslm2.utils.RTools;
   
   public class ScriptCmd_TweenTo extends ScriptCmdBase
   {
       
      
      public var targetArr:Array;
      
      public var tweenDict:Dictionary;
      
      public function ScriptCmd_TweenTo()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         var _loc9_:int = 0;
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         super.onStart(param1);
         targetArr = this.findEleArr();
         tweenDict = new Dictionary();
         var _loc6_:int = 0;
         var _loc8_:int = targetArr.length;
         _loc9_ = 0;
         while(_loc9_ < _loc8_)
         {
            _loc7_ = targetArr[_loc9_];
            if(_loc7_)
            {
               _loc3_ = new Point();
               if(this.vo.x != 0)
               {
                  _loc3_.x = this.vo.x;
               }
               else if(this.vo.offX != 0)
               {
                  _loc3_.x = _loc7_.x + this.vo.offX;
               }
               if(this.vo.y != 0)
               {
                  _loc3_.y = this.vo.y;
               }
               else if(this.vo.offY != 0)
               {
                  _loc3_.y = _loc7_.y + this.vo.offY;
               }
               if(this.vo.speed > 0)
               {
                  _loc5_ = MathUtil.disWith2Point(new Point(_loc3_.x,_loc3_.y),new Point(_loc7_.x,_loc7_.y));
                  _loc4_ = _loc5_ / this.vo.speed * 1000;
                  _loc2_ = new TweenToData();
                  _loc6_ = Math.max(_loc6_,_loc4_);
                  _loc2_ = new TweenToData();
                  _loc2_.aimXY = _loc3_.clone();
                  _loc2_.oriXY = new Point(_loc7_.x,_loc7_.y);
                  _loc2_.target = _loc7_;
                  _loc2_.totalFrame = RTools.msToFrame(_loc4_);
                  tweenDict[_loc7_] = _loc2_;
               }
               else if(this.vo.time > 0)
               {
                  _loc6_ = this.vo.time;
                  _loc2_ = new TweenToData();
                  _loc2_.aimXY = _loc3_.clone();
                  _loc2_.oriXY = new Point(_loc7_.x,_loc7_.y);
                  _loc2_.target = _loc7_;
                  _loc2_.totalFrame = RTools.msToFrame(this.vo.time);
                  tweenDict[_loc7_] = _loc2_;
               }
               else
               {
                  _loc7_.x = _loc3_.x;
                  _loc7_.y = _loc3_.y;
               }
            }
            _loc9_++;
         }
         this.vo.time = _loc6_;
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         super.onStep(param1);
         var _loc3_:int = targetArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = tweenDict[targetArr[_loc4_]];
            if(_loc2_)
            {
               _loc2_.countXY(this.runFrame);
            }
            _loc4_++;
         }
         this.checkEnd();
      }
      
      override public function onEnd() : void
      {
         this.tweenDict = null;
         this.targetArr = null;
         super.onEnd();
      }
   }
}
