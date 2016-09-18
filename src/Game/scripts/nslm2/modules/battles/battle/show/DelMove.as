package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import com.greensock.TweenLite;
   
   public class DelMove extends ShowBase
   {
      
      public static var UP_DOWN:int = 0;
      
      public static var FORWARD_BACKWARD:int = 1;
       
      
      public function DelMove()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc3_:* = param1.avatarBody;
         if(param2.hasOwnProperty("type") && param2.type == FORWARD_BACKWARD)
         {
            _loc3_ = param1;
         }
         TweenLite.killTweensOf(_loc3_,false,{
            "x":true,
            "y":true,
            "z":true
         });
      }
   }
}
