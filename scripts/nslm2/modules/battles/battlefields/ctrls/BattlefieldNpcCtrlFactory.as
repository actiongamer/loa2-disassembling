package nslm2.modules.battles.battlefields.ctrls
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   
   public class BattlefieldNpcCtrlFactory
   {
       
      
      public function BattlefieldNpcCtrlFactory()
      {
         super();
      }
      
      public static function getCtrl(param1:StcStageNpcRelationVo) : SceneNpcCtrlBase
      {
         var _loc2_:int = param1.display_npc % 100;
         switch(int(_loc2_) - 1)
         {
            case 0:
            case 1:
               return new BattlefieldResCtrl();
            default:
            default:
            default:
            case 5:
            case 6:
               return new SceneNpcCtrlBase();
            case 7:
            case 8:
               return new BattleFieldRebornPointCtr();
            case 9:
               return new BattlefieldMonsterCtr();
         }
      }
   }
}
