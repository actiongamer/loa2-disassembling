package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import nslm2.modules.fightPlayer.UnitView;
   import com.greensock.TweenLite;
   
   public class BodyShow extends ShowBase
   {
       
      
      public function BodyShow()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc4_:AvatarBody3D = param1.avatarBody;
         var _loc3_:UnitView = param1.unitView;
         TweenLite.killTweensOf(_loc4_);
         _loc4_.visible = true;
         if(_loc3_.shadow)
         {
            _loc3_.shadow.visible = true;
            _loc3_.shadow.alpha = 1;
         }
         _loc4_.alpha = 1;
      }
   }
}
