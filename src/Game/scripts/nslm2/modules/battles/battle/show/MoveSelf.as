package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import com.greensock.easing.Ease;
   import flash.geom.Point;
   import com.greensock.easing.Sine;
   import com.greensock.easing.Linear;
   import com.greensock.TweenLite;
   import nslm2.modules.battles.battle.FPUtil;
   
   public class MoveSelf extends ShowBase
   {
      
      public static const NONE:int = 0;
      
      public static const EASEOUT:int = 1;
      
      public static const EASEIN:int = 2;
       
      
      public function MoveSelf()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         caster = param1;
         param = param2;
         updateShadowPos = function():void
         {
            if(caster && caster.unitView && caster.unitView.shadow)
            {
               caster.unitView.shadow.z = caster.avatarBody.z;
            }
         };
         if(caster.unitVo)
         {
            var _loc4_:* = param.ease;
            if(1 !== _loc4_)
            {
               if(2 !== _loc4_)
               {
                  if(0 !== _loc4_)
                  {
                     var ease:Ease = Linear.easeNone;
                  }
                  else
                  {
                     ease = Linear.easeNone;
                  }
               }
               else
               {
                  ease = Sine.easeIn;
               }
            }
            else
            {
               ease = Sine.easeOut;
            }
            var ori:int = 1;
            var np:Point = new Point(param.x * ori,param.y);
            TweenLite.to(caster.avatarBody,FPUtil.fixFrame(param.dur),{
               "z":np.x,
               "y":np.y,
               "useFrames":false,
               "ease":ease,
               "onUpdate":updateShadowPos
            });
         }
      }
   }
}
