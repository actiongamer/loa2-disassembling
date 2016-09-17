package nslm2.modules.battles.PeakSports.control
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   
   public class PeakSportsNpcControllFactory
   {
       
      
      public function PeakSportsNpcControllFactory()
      {
         super();
      }
      
      public static function getCtrl(param1:StcStageNpcRelationVo) : SceneNpcCtrlBase
      {
         var _loc2_:int = param1.display_npc % 100;
         switch(int(_loc2_) - 4)
         {
            case 0:
            case 1:
               return new PeakSportsRebornPointControl();
            case 2:
               return new PeakSportsResControl();
         }
      }
   }
}
