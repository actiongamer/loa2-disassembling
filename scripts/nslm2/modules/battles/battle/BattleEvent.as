package nslm2.modules.battles.battle
{
   import flash.events.Event;
   
   public class BattleEvent extends Event
   {
      
      public static const ACTION_READY:String = "ACTION_READY";
      
      public static const FIGHT_COMPLETE:String = "FIGHT_COMPLETE";
      
      public static const FIGHT_PLAYER_DIE:String = "FIGHT_PLAYER_DIE";
      
      public static const FIGHT_RESULT_RETURN:String = "FIGHT_IMMEDIATELY_FINISH";
      
      public static const FIGHT_NEW_TURN_BEGIN:String = "FIGHT_NEW_TURN_BEGIN";
      
      public static const FIGHT_DEFENDER_GET_DAMAGE:String = "FIGHT_DEFENDER_GET_DAMAGE";
      
      public static const FIGHT_REFRESH_FIRE_BTN:String = "FIGHT_REFRESH_FIRE_BTN";
      
      public static const FIGHT_ADD_KILL_RAGE:String = "FIGHT_ADD_KILL_RAGE";
      
      public static const FIGHT_ABORT:String = "FIGHT_ABORT";
      
      public static const FIGHT_REPLAY_COMPLETE:String = "FIGHT_REPLAY_COMPLETE";
       
      
      public var data:Object;
      
      public function BattleEvent(param1:String, param2:Object = null, param3:Boolean = false, param4:Boolean = false)
      {
         this.data = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new BattleEvent(this.type,this.data,this.bubbles,this.cancelable);
      }
   }
}
