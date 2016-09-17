package nslm2.modules.battles.pvp
{
   public class PvpBattleSceneConfigVo
   {
      
      public static const STCSTAGEID:String = "stcStageId";
      
      public static const TEAM:String = "team";
      
      public static const RIGHTGROUPID:String = "rightGroupId";
       
      
      public var mapId:int;
      
      public var playerArr:Array;
      
      public var isAttack:int;
      
      private var _sceneCameraKind:int;
      
      public function PvpBattleSceneConfigVo(param1:int, param2:Array, param3:Boolean)
      {
         super();
         this.mapId = param1;
         playerArr = param2;
         isAttack = !!param3?1:0;
      }
      
      public function get isBossScene() : Boolean
      {
         return false;
      }
      
      public function get sceneCameraKind() : int
      {
         return 1;
      }
   }
}
