package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import com.greensock.TweenLite;
   
   public class BodyFade extends ShowBase
   {
       
      
      public function BodyFade()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         caster = param1;
         param = param2;
         onFadeUpdte = function(param1:AvatarBody3D):void
         {
            if(caster.unitView.shadow)
            {
               caster.unitView.shadow.alpha = param1.alpha;
            }
         };
         onBodyFade = function(param1:AvatarBody3D):void
         {
            param1.alpha = 1;
            param1.visible = false;
            param1.effectsVisible = false;
            if(caster.unitView.shadow)
            {
               caster.unitView.shadow.alpha = 1;
               caster.unitView.shadow.visible = false;
            }
         };
         var abody:AvatarBody3D = caster.avatarBody;
         var battleFps:Number = 40;
         var dd:Number = param.dur * (1 / battleFps);
         TweenLite.to(abody,dd,{
            "alpha":0,
            "useFrames":false,
            "onUpdate":onFadeUpdte,
            "onUpdateParams":[abody],
            "onComplete":onBodyFade,
            "onCompleteParams":[abody]
         });
      }
   }
}
