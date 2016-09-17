package nslm2.modules.dungeons
{
   import nslm2.mgrs.stcMgrs.vos.StcEliteStageInvadeVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   
   public class EliteDungeonVo extends DungeonVo
   {
       
      
      public function EliteDungeonVo(param1:int)
      {
         super(param1);
      }
      
      public function get stcEliteStageVo() : StcEliteStageInvadeVo
      {
         return StcMgr.ins.getEliteStageInvadeVo(this.dungeonId);
      }
      
      override public function get stcStageVo() : StcStageVo
      {
         if(stcEliteStageVo)
         {
            return StcMgr.ins.getStageVo(this.stcEliteStageVo.stage_id);
         }
         return null;
      }
      
      override public function monsterGroupId(param1:int) : int
      {
         var _loc2_:int = 0;
         if(!int(param1))
         {
            _loc2_ = this.stcEliteStageVo.npc_group_id;
         }
         return _loc2_;
      }
   }
}
