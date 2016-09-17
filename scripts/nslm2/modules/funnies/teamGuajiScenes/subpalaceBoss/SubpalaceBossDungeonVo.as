package nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss
{
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class SubpalaceBossDungeonVo extends DungeonVo
   {
       
      
      private var stage_id:int;
      
      private var npcGroupId:int;
      
      public function SubpalaceBossDungeonVo(param1:int, param2:int)
      {
         stage_id = param1;
         npcGroupId = param2;
         super(param1);
      }
      
      override public function get stcStageVo() : StcStageVo
      {
         return StcMgr.ins.getStageVo(stage_id);
      }
      
      override public function monsterGroupId(param1:int) : int
      {
         var _loc2_:int = 0;
         if(!int(param1))
         {
            _loc2_ = npcGroupId;
         }
         return _loc2_;
      }
   }
}
