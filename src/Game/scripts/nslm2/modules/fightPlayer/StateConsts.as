package nslm2.modules.fightPlayer
{
   public class StateConsts
   {
      
      public static const FREE:int = 1;
      
      public static const MOVE:int = 21;
      
      public static const SKILL:int = 3;
      
      public static const MOVE_BACK:int = 22;
      
      public static const BTEAKED:int = 41;
      
      public static const DEAD:int = 44;
      
      public static const ROUND_COMPLETE:int = 5;
      
      public static const WIN:int = 66;
      
      private static var _stateNames:Object;
      
      private static var _actionNames:Object;
       
      
      public function StateConsts()
      {
         super();
      }
      
      public static function stateName(param1:int) : String
      {
         if(_stateNames == null)
         {
            _stateNames = {};
            _stateNames[1] = "待命";
            _stateNames[21] = "移动";
            _stateNames[3] = "技能";
            _stateNames[22] = "返回";
            _stateNames[5] = "已行动";
            _stateNames[41] = "被打断";
            _stateNames[44] = "死亡";
         }
         return _stateNames[param1];
      }
      
      public static function actionName(param1:int) : String
      {
         if(_actionNames == null)
         {
            _actionNames = {};
            _actionNames[1] = "std_2";
            _actionNames[21] = "run";
            _actionNames[3] = "skill_1";
            _actionNames[22] = "run";
            _actionNames[41] = "hurt_1";
            _actionNames[5] = "std_2";
            _actionNames[44] = "die";
         }
         return _actionNames[param1];
      }
   }
}
